function SVG.LinePath
{
    <#
    .SYNOPSIS
        Draws an SVG Line Path.
    .DESCRIPTION
        Draws a line in SVG Path Syntax.
    .EXAMPLE
        svg -Viewbox 100, 100 (
            svg.LinePath -Start 50 -End 75 -Stroke black
        ) -OutputPath .\Line1.svg
    .EXAMPLE
        svg -Viewbox 60, 60 (
            svg.LinePath -Start 10 -Horizontal -End 50 -Stroke black -Fill transparent |
                svg.LinePath -Vertical -End 50 |
                svg.LinePath -Horizontal -End 10 |
                svg.LinePath -Vertical -End 10 -Close
        ) -OutputPath .\LineBox.svg
    .EXAMPLE
        svg -Viewbox 100 (    
            svg.LinePath -Start 50 -End 10 -Angle 45 -Stroke black -Fill transparent |
                svg.LinePath -End 10 -Angle -45 -Stroke black -Fill transparent |
                svg.LinePath -End 15 -Angle 50 -Stroke black -Fill transparent |
                svg.LinePath -End 15 -Angle -50 -Stroke black -Fill transparent
        ) -OutputPath .\ZigZagLinePath.svg
    .LINK
        SVG.Path
    #>    
    [inherit('SVG.path', Dynamic, Abstract)]
    [Alias('SVG.LinedPath','=<SVG.LinedPath>')]
    param(
    # The Starting point of the arc.
    # If only one value is provided, it will be used as the X and Y coordinate.
    [vbn()]
    [double[]]
    $Start,

    # If set, will draw a horizontal line.
    # Only the first -End point will be evaluated.
    [vbn()]
    [switch]
    $Horizontal,

    # If set, will draw a vertical line.
    # -LineLength must also be provided.
    [vbn()]
    [switch]
    $Vertical,

    # If set, will close the path.
    [vbn()]
    [switch]
    $Close,

    # The end point of the line, or it's length.
    # If this is provided without `-Angle`, a line will be drawn to this point.
    # If this is provided with `-Angle`, a line of this `-Distance` be drawn.
    [vbn()]
    [Alias('Distance')]
    [double[]]
    $End,

    # An optional angle.
    # If an `-Angle` is provided and `-End` is a single number, it will be treated as a `-Distance`.
    [vbn()]
    [double]
    $Angle
    )

    process {
        $existingPath = ''
        if ($PSBoundParameters.D) {
            $existingPath = $PSBoundParameters.D + ' '
        }
        if ($_ -eq $PSBoundParameters.Content) {
            $null = $PSBoundParameters.Remove('Content')
        }
        $linePath = @(
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
            } else {
                $startPoint = @($_.D -split '\s' -match '[\d\.]+')[-1..-2] -as [double[]]
            }
            if ($Vertical) {
                "V $(if ($end) { $end[0] } else { 0 })"
            }
            elseif ($Horizontal) {
                "H $(if ($end) { $end[0] } else { 0 })"
            }
            elseif ($End) {                                
                if ($end.Length -gt 2) {
                    for ($endIndex = 0 ; $endIndex -lt $end.Length; $endIndex += 2) {
                        "L"
                        $end[$endIndex]
                        if ($null -ne $end[$endIndex + 1]) {
                            $end[$endIndex + 1]
                        } else {
                            $end[$endIndex]
                        }
                    }
                }
                elseif ($end.Length -eq 2) {
                    "L"
                    $end
                } elseif ($end.Length -eq 1) {
                    if ($PSBoundParameters['Angle']) {
                        if ($startPoint) {
                            0.0 + $startPoint[0] + ($end[0] * [math]::round([math]::sin($angle * [Math]::PI/180),15))
                            0.0 + $startPoint[1] + ($end[0] * [math]::round([math]::cos($angle * [Math]::PI/180),15))
                        } 
                        else
                        {
                            $end[0] * [math]::round([math]::sin($angle * [Math]::PI/180),15)
                            $end[0] * [math]::round([math]::cos($angle * [Math]::PI/180),15)
                        } 
                    } else {
                    "L"
                    $end * 2
                    }
                }
                
            }

            if ($Close) {
                "Z"
            }
                        
        ) -join ' '
        
        $PSBoundParameters['D'] = $existingPath + $linePath
        $baseSplat = [Ordered]@{}
        foreach ($k in $PSBoundParameters.Keys) {
            if ($baseCommand.Parameters[$k]) {
                $baseSplat[$k]  = $PSBoundParameters[$k]
            }
        }
        
        SVG.Path @baseSplat
    }
}


