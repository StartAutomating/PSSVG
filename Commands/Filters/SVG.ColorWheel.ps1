[ValidatePattern('SVG\.ColorWheel')]
param()

function SVG.ColorWheel {
    <#
    
    .SYNOPSIS    
        Color Wheel Filter    
    .DESCRIPTION    
        Creates a color wheel filter in SVG.    
        This animates a hue rotation over time.    
    .EXAMPLE    
        SVG -ViewBox 200 @(    
            SVG.Defs @(    
                SVG.ColorWheel    
            )    
            SVG.Circle -R 100 -CX 100 -CY 100 -Fill 'red' -Filter 'url(#colorWheel)'    
        ) -OutputPath .\ColorWheel.svg    
    
    #>
        
    param(
    [Alias('Angle','A','HueRotate','HueRotateStart')]
    [double]
    $WheelStart = 0,

    [Alias('EndAngle','EndA','HueRotateEnd')]
    [double]
    $WheelEnd = 360,

    [Alias('Dur','D')]
    [timespan]
    $Duration = '00:00:04.2'
    )
    dynamicParam {
    $baseCommand = 
        if (-not $script:SVGfilter) {
            $script:SVGfilter = 
                $executionContext.SessionState.InvokeCommand.GetCommand('SVG.filter','Function')
            $script:SVGfilter
        } else {
            $script:SVGfilter
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
        $HueRotateFilter = @(            
            SVG.feColorMatrix -Type 'hueRotate' -In 'SourceGraphic' @(
                SVG.animate -AttributeName 'values' -Values "$WheelStart; $WheelEnd" -Dur '10s' -RepeatCount 'indefinite'
            )
        )
        if ($PSBoundParameters['Content']) {
            $PSBoundParameters['Content'] = $HueRotateFilter + $PSBoundParameters['Content']
        } else {
            $PSBoundParameters['Content'] = $HueRotateFilter
        }
        if (-not $PSBoundParameters['ID']) {
            $PSBoundParameters['ID'] = 'colorWheel'
        }        
        $null = $PSBoundParameters.Remove('WheelStart')
        $null = $PSBoundParameters.Remove('WheelEnd')
        $null = $PSBoundParameters.Remove('Duration')
        SVG.filter @PSBoundParameters
    
    }
}

