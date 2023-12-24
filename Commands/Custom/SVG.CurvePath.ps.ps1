function SVG.CurvePath
{
    <#
    .SYNOPSIS
        Draws an SVG curve.
    .DESCRIPTION
        Draws an SVG curve path.
    .EXAMPLE
        svg -Viewbox 50 @(
            svg.CurvePath -Start 10 -ControlPoint 15,5,20,40  -End 30 -fill transparent -stroke black
        ) -OutputPath .\Curve.svg
    .EXAMPLE
        svg -Viewbox 100 (    
            svg.CurvePath -Start 50 -End 10 -Angle 45 -Multiquadratic |
                svg.CurvePath -End 10 -Angle -45 -Multiquadratic |
                svg.CurvePath -End 20 -Angle 50 -Multiquadratic |
                svg.CurvePath -End 20 -Angle -50 -Stroke '#4488ff' -Fill transparent -Multiquadratic
        ) -OutputPath .\ZigZagCurvePath.svg
    .LINK
        SVG.Path
    #>    
    [inherit('SVG.path', Dynamic, Abstract)]
    [Alias('SVG.CurvedPath','=<SVG.CurvedPath>')]
    param(
    # One or two control points.
    # If two control points are provided, it will be assumed to be a Bezier curve.
    # If only one control point is provided, it will be assumed to be a Quadratic curve.    
    [vbn()]
    [double[]]
    $ControlPoint,

    # The start point of the curve.
    # If only one value is provided, it will be used as the X and Y coordinate.
    [vbn()]
    [double[]]
    $Start,

    # The end point of the curve.
    # If only one value is provided, it will be used as the X and Y coordinate.
    [vbn()]
    [Alias('Distance')]
    [double[]]
    $End,

    # An optional angle.
    # If an `-Angle` is provided and `-End` is a single number, it will be treated as a `-Distance`.
    [vbn()]
    [double]
    $Angle,

    # If set, will attempt to draw a smooth bezier curve.
    [vbn()]
    [switch]
    $Smooth,

    # If set, will draw a multi-quadratic line.
    # This can only be used if preceeded by another curve.
    [vbn()]
    [switch]
    $MultiQuadratic,

    # If set, will draw a quadratic bezier curve.
    # This is the default, as it only requires a single control point.
    [vbn()]
    [switch]
    $Quadratic,

    # If set, will close the path after this element.
    [vbn()]
    [switch]
    $Close
    )

    process {
        $existingPath = ''
        if ($PSBoundParameters.D) {
            $existingPath = $PSBoundParameters.D + ' '
        }

        if ($_ -eq $PSBoundParameters.Content) {
            $null = $PSBoundParameters.Remove('Content')
        }
        
        if ($ControlPoint.Length -eq 1) {
            $ControlPoint = $ControlPoint[0], $ControlPoint[0]
        }

        if ($ControlPoint.Length -gt 4) {
            Write-Error "Up to two control points can be provided"
            return
        }

        $curvePath = @(
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

            if ($ControlPoint.Length -ge 4) {
                "C" # Bezier curves have 2 control points
            } else {
                if ($Smooth) {
                    "S"
                }
                elseif ($Quadratic) {
                    "Q"
                } else {
                    "T"
                } 
            }
            
            for ($cpIndex =0 ; $cpIndex -lt $ControlPoint.Length; $cpIndex+=2 ) {
                $ControlPoint[$cpIndex]
                $ControlPoint[$cpIndex + 1]
                ","
            }            
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
        
        $PSBoundParameters['D'] = $existingPath + $curvePath
        $baseSplat = [Ordered]@{}
        foreach ($k in $PSBoundParameters.Keys) {
            if ($baseCommand.Parameters[$k]) {
                $baseSplat[$k]  = $PSBoundParameters[$k]
            }
        }
        
        SVG.Path @baseSplat
    }
}

