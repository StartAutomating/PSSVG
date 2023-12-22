function Invoke-SVG {
    <#
    
    .SYNOPSIS    
        Invoke-SVG, Fractal Generation of SVG    
    .DESCRIPTION    
        Generates a SVG fractally by repeatedly invoking commands with slightly different parameters.    
    .EXAMPLE            
        SVG.Fractal -Command SVG.Star -RepeatCount 4 -Parameter @{        
            Stroke = 'black'        
            Fill = 'transparent'    
            Radius = 1        
            StrokeWidth = '0.1%'        
        } -Change @{        
            Radius = -0.1        
        } -Viewbox 3 -OutputPath .\Fractal1.svg        
    .EXAMPLE    
        SVG.Fractal -Command SVG.Star -RepeatCount 5 -Parameter @{        
            Stroke = 'black'        
            Fill = 'transparent'    
            Radius = 1        
            StrokeWidth = '0.1%'        
        } -Change @{        
            Radius = '/5'        
        } -Viewbox 3 -OutputPath .\Fractal2.svg    
    .EXAMPLE    
        SVG.Fractal -Command SVG.Star -RepeatCount 5 -Parameter @{        
            Stroke = 'black'        
            Fill = 'transparent'    
            Radius = 1        
            StrokeWidth = '0.1%'        
        } -Change @{        
            Radius = '*4/5'        
        } -Viewbox 3 -OutputPath .\Fractal3.svg    
    .EXAMPLE    
        SVG.Fractal -Command SVG.Pentagon -RepeatCount 5 -Parameter @{        
            Stroke = 'black'        
            Fill = 'transparent'    
            Radius = 1    
            StrokeWidth = '0.1%'    
            Rotate = 0    
        } -Change @{        
            Radius = '*4/5'    
            Rotate = 360/10    
        } -Viewbox 3 -OutputPath .\Fractal4.svg    
    .EXAMPLE    
        SVG.Fractal -Command SVG.Hexagon -RepeatCount 6 -Parameter @{        
            Stroke = 'black'        
            Fill = 'transparent'    
            Radius = 1    
            StrokeWidth = '0.1%'    
            Rotate = 0    
        } -Change @{        
            Radius = '/7/6'    
            Rotate = 360/12    
        } -Viewbox 3 -OutputPath .\Fractal5.svg    
    .EXAMPLE    
        SVG.Fractal -Command SVG.Octagon -RepeatCount 8 -Parameter @{        
            Stroke = 'black'        
            Fill = 'transparent'    
            Radius = 1    
            StrokeWidth = '0.1%'    
            Rotate = 0    
        } -Change @{        
            Radius = '/8/11'    
            Rotate = 360/16    
        } -Viewbox 3 -OutputPath .\Fractal8.svg        
    
    #>
            
    [Alias('SVG.Fractal')]    
    param(
    # The command for the fractal.    
    # This can be the name of a command within PSSVG, or a ScriptBlock.    
    [Parameter(ValueFromPipelineByPropertyName)]
    [string]
    $Command,

    # The number of times the command should be repeated.  By default, 1.    
    [Parameter(ValueFromPipelineByPropertyName)]
    [Alias('IterationCount','Repetions','Iterations')]
    [int]
    $RepeatCount = 1,

    # The parameters to the command.    
    [Parameter(ValueFromPipelineByPropertyName)]
    [Alias('Parameters')]
    [Collections.IDictionary]
    $Parameter,

    # Any changes to to the command parameters.    
    # Numeric values will be added    
    # Boolean values will be toggled    
    # Lists of values will be iterated over    
    # ScriptBlocks will be evaluated.    
    [Parameter(ValueFromPipelineByPropertyName)]
    [Alias('Changes')]
    [Collections.IDictionary]
    $Change
    )
    dynamicParam {
    $baseCommand = 
        if (-not $script:SVG) {
            $script:SVG = 
                $executionContext.SessionState.InvokeCommand.GetCommand('SVG','Alias')
            $script:SVG
        } else {
            $script:SVG
        }
    $IncludeParameter = @()
    $ExcludeParameter = @()


    $DynamicParameters = [Management.Automation.RuntimeDefinedParameterDictionary]::new()            
    :nextInputParameter foreach ($paramName in ([Management.Automation.CommandMetaData]$baseCommand).Parameters.Keys) {
        if ($ExcludeParameter) {
            foreach ($exclude in $ExcludeParameter) {
                if ($paramName -like $exclude) { continue nextInputParameter}
            }
        }
        if ($IncludeParameter) {
            $shouldInclude = 
                foreach ($include in $IncludeParameter) {
                    if ($paramName -like $include) { $true;break}
                }
            if (-not $shouldInclude) { continue nextInputParameter }
        }
        
        $DynamicParameters.Add($paramName, [Management.Automation.RuntimeDefinedParameter]::new(
            $baseCommand.Parameters[$paramName].Name,
            $baseCommand.Parameters[$paramName].ParameterType,
            $baseCommand.Parameters[$paramName].Attributes
        ))
    }
    $DynamicParameters

    }
        process {

        # Try to resolve the command
        $resolvedCmd = $null
        
        # If it is a known command in this module, use that
        if ($MyInvocation.MyCommand.Module.ExportedCommands -and $MyInvocation.MyCommand.Module.ExportedCommands[$command]) {
            $resolvedCmd = $MyInvocation.MyCommand.Module.ExportedCommands[$command]
        }
        else {
            # Otherwise, try to make it a scriptblock
            $CommandAsScriptBlock = try { [scriptblock]::Create($Command) } catch { $_ }
            if ($CommandAsScriptBlock -is [scriptblock]) {
                # and pop it into a temporary function in case we need it.
                $function:ThisFracal = $resolvedCmd = $CommandAsScriptBlock                    
            }
        }

        # If we could not resolve the command, return
        if (-not $resolvedCmd) { return }

        # Copy the splat to SVG
        $svgSplat = [Ordered]@{} + $PSBoundParameters
        # and strip off any parameters that are not SVG's
        foreach ($parameterName in 'Change','Parameter','RepeatCount','Command') {
            $svgSplat.Remove($parameterName)
        }
        

        # Capture any content
        $content = $svgSplat['Content']
        $svgSplat.Remove('Content')        
        $content = @(
            # and preprend it to our new content
            if ($content) {
                $content
            }            
            # For each iteration
            for ($iteration = 0 ; $iteration -lt $RepeatCount; $iteration++) {
                # call the command with the parameters
                & $resolvedCmd @Parameter
                # then walk over all changes to make after each iteration
                foreach ($keyToChange in $change.Keys) {
                    if ($Parameter.Contains($keyToChange)) {
                        switch ($Change[$keyToChange]) {
                        {$_ -is [int]}
                        {
                                                        # ints are added
                                                        $Parameter[$keyToChange] += $_
                                                    }
                        {$_ -is [double]}
                        {
                                                        # so are doubles
                                                        $Parameter[$keyToChange] += $_
                                                    }
                        {$_ -is [bool]}
                        {
                                                        # booleans toggle each iteration
                                                        $Parameter[$keyToChange] = -not $Parameter[$keyToChange]
                                                    }
                        {$_ -is [object[]]}
                        {
                                                        # arrays loop over each possibility
                                                        $Parameter[$keyToChange] = $_[$($iteration % $_.Length)]
                                                    }
                        {$_ -is [ScriptBlock]}
                        {
                                                        # script blocks are run
                                                        $Parameter[$keyToChange] = . $_
                                                    }
                        {$_ -is [string]}
                        {
                                                        # Strings are our last resort, and a bit more complicated
                                                        # We can accept a string that represents a multiplier or divisor
                                                        if ($_ -match '^(?<o>[/\*])\d') {
                        
                                                            $operator = $matches.o
                                                            $replaceOperator = $_ -replace '^[/\*]'
                                                            $changeFactor = 
                                                                if ($replaceOperator -match '\d+/\d+') {
                                                                    # We can even handle fractional values
                                                                    $numerator, $denominator = $replaceOperator -split '/' -as [double[]]
                                                                    $numerator/$denominator
                                                                } else {
                                                                    $replaceOperator -as [double]
                                                                }
                                                            
                                                            # assuming we had a non-zero factor
                                                            if ($changeFactor) {
                                                                # multiply or divide the parameter by it.
                                                                if ($operator -eq '*') {
                                                                    $Parameter[$keyToChange] *= $changeFactor
                                                                } else {
                                                                    $Parameter[$keyToChange] /= $changeFactor
                                                                }
                                                            }
                                                        }
                                                        elseif ($_ -match '(?<x>\d+)(?<pow>\*+)(?<y>\d+)') {
                                                            $x = $matches.x -as [int]
                                                            $y = $matches.y -as [int]
                                                            $pow = $matches.pow.Length
                            
                                                            [double[][]]@(
                                                                for ($yRow = 0; $yRow -lt $y; $yRow++) {
                                                                    @(for ($xRow = 0; $xRow -lt $x; $xRow++) {
                                                                        
                                                                    })
                                                                }
                                                            )
                                                        }
                                                    }
                        }
                    }
                } 
            }
        )
        SVG @svgSplat $content
    
    }
}

