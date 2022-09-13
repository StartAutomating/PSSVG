#requires -Module PSSVG

=<svg> @(    
    =<svg.circle> -CX 25 -CY 25 -r 10 -Fill '#4488ff'
    =<svg.rect> -X 0 -Y 50 -Width 20 -Height 20 -Fill '#4488ff'
    =<svg.ellipse> -Cx 25 -Cy 100 -Rx 10 -Ry 5 -Fill '#4488ff'
) -ViewBox 0, 0, 100, 200 -OutputPath (Join-Path $psScriptRoot Shapes.svg)
