SVG -Content @(
    SVG.defs -Content @(
        
        SVG.pattern -id 'HexagonPattern' -patternUnits 'userSpaceOnUse' -width '174' -height '200' -patternTransform 'scale(.5)' -Content @(
            SVG.Hexagon -CenterX 87 -CenterY 100 -Radius 100 -Fill transparent -Stroke '#4488ff' -Comment "A hexagon with a" -Class 'foreground-fill'
        ) -Comment "A faint hexagon Pattern, rendered 4x at a base scale of 174 by 200"
    )
    $hugeSize = 20000

    SVG.rect -width "$hugeSize%" -height "$hugeSize%" -fill 'url(#HexagonPattern)'
) -OutputPath (Join-Path $PSScriptRoot "HexagonPattern.svg")
