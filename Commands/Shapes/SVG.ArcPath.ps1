function SVG.ArcPath {
    <#
    
    .SYNOPSIS    
        Draws an SVG arc.    
    .DESCRIPTION    
        Draws an SVG arc path.    
    .EXAMPLE    
        svg -Viewbox 100 (    
            svg.ArcPath -Start 50 -End 75 -Radius 25 -Large    
        ) -OutputPath .\arc-1.svg    
    .EXAMPLE    
        svg -Viewbox 100 (        
            svg.ArcPath -Start 50 -Radius 10 -End 10 -Angle 45  |    
                svg.ArcPath -End 10 -Radius 20 -Angle -45  |    
                svg.ArcPath -End 20 -Radius 30 -Angle 50  |    
                svg.ArcPath -End 20 -Radius 40 -Angle -50 -Stroke '#4488ff' -Fill transparent    
        ) -OutputPath .\ZigZagArcPath.svg    
    .LINK    
        SVG.Path    
    
    #>
                
    [Alias('SVG.ArcedPath','=<SVG.ArcedPath>')]
    param(
    # The Starting point of the arc.    
    # If only one value is provided, it will be used as the X and Y coordinate.    
    [Parameter(ValueFromPipelineByPropertyName)]
    [double[]]
    $Start,

    # The radius of the arc.    
    # If only one value is provided, it will be used as the X and Y coordinate.    
    [Parameter(ValueFromPipelineByPropertyName)]
    [double[]]
    $Radius,

    # The Arc Rotation along the X axis.    
    [Parameter(ValueFromPipelineByPropertyName)]
    [Alias('XAxisRotation')]
    $ArcRotation = 0,

    # If set, the arc will be considered a "Large arc"    
    [Parameter(ValueFromPipelineByPropertyName)]
    [Alias('IsLargeArc','LargeArc')]
    [switch]
    $Large,

    # If set, the arc will sweep the circle.    
    [Parameter(ValueFromPipelineByPropertyName)]
    [switch]
    $Sweep,

    # The end point of the arc.    
    # If only one value is provided without an `-Angle`, it will be used as the X and Y coordinate.    
    # If only one value is provided an an `-Angle` is provided, a single value will be treated as a `-Distance`.    
    [Parameter(ValueFromPipelineByPropertyName)]
    [Alias('Distance')]
    [double[]]
    $End,

    # An optional angle.    
    # If an `-Angle` is provided and `-End` is a single number, it will be treated as a `-Distance`.    
    [Parameter(ValueFromPipelineByPropertyName)]
    [double]
    $Angle,

    # If set, will close the path after this element.    
    [Parameter(ValueFromPipelineByPropertyName)]
    [switch]
    $Close
    )
    dynamicParam {
    $baseCommand = 
        if (-not $script:SVGpath) {
            $script:SVGpath = 
                $executionContext.SessionState.InvokeCommand.GetCommand('SVG.path','Function')
            $script:SVGpath
        } else {
            $script:SVGpath
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
        $existingPath = ''
        if ($PSBoundParameters.D) {
            $existingPath = $PSBoundParameters.D + ' '
        }
        if ($_ -eq $PSBoundParameters.Content) {
            $null = $PSBoundParameters.Remove('Content')
        }
        $arcPath = @(
            if ($psBoundParameters.Keys -eq 'Start') {
                "M"
                if ($start.Length -gt 2) {
                    Write-Error "-Start can only contain one or two values"
                    return
                }
                $startPoint = 
                    if ($start.Length -eq 2) {
                        $start[0],$start[1]
                    }
                    else {
                        $start[0],$start[0]
                    }
                $startPoint
            } elseif ($_.D) {
                $startPoint = @($_.D -split '\s' -match '[\d\.]+')[-1..-2] -as [double[]]
            }

            "A"
            if ($Radius.Length -gt 2) {
                Write-Error "-Radius can only contain one or two values"
                return
            } elseif ($Radius.Length -eq 2) {
                $Radius[0],$Radius[1]
            } elseif ($Radius.Length -eq 1) {
                $Radius[0],$Radius[0]
            } else {
                1,1
            }
            $ArcRotation
            if ($Large) { 1 } else { 0 }
            if ($Sweep) { 1 } else { 0 }
            if ($end.Length -gt 2) {
                Write-Error "-End can only contain one or two values."
                return
            }
            elseif ($end.Length -eq 2 ) {
                $End[0],$end[1]
            } elseif ($end.Length -eq 1) {
                if ($null -ne $psBoundParameters["Angle"]) {
                    if ($startPoint) {
                        $startPoint[0] + ($end[0] * [math]::round([math]::sin($angle * [Math]::PI/180),15))
                        $startPoint[1] + ($end[0] * [math]::round([math]::cos($angle * [Math]::PI/180),15))
                    } 
                    else
                    {
                        $end[0] * [math]::round([math]::sin($angle * [Math]::PI/180),15)
                        $end[0] * [math]::round([math]::cos($angle * [Math]::PI/180),15)
                    }                    
                } else {
                    $End[0],$end[0]
                }                
            } else {
                0, 0
            }

            if ($Close) {
                "Z"
            }
        ) -join ' '
        
        $PSBoundParameters['D'] = $existingPath + $arcPath
        $baseSplat = [Ordered]@{}
        foreach ($k in $PSBoundParameters.Keys) {
            if ($baseCommand.Parameters[$k]) {
                $baseSplat[$k]  = $PSBoundParameters[$k]
            }
        }
        
        SVG.Path @baseSplat
    
    }
}


