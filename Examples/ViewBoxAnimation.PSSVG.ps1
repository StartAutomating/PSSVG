svg @(
    svg.ConvexPolygon -SideCount 8 -Rotate (360/16) -Fill '#4488ff' -Stroke '#4488ff' -CenterX 100 -CenterY 100 -Radius 50
    SVG.animate -AttributeName viewBox -Values "0 0 200 200; 50 50 100 100; 0 0 200 200" -RepeatCount 'indefinite' -Dur 3.9
) -ViewBox 200,200 -OutputPath (Join-Path $PSScriptRoot .\ViewBoxAnimation.svg)
