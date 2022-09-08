#require -Module PSSVG

=<svg> -ViewBox 0,0,200,200 @(
    =<svg.circle> -Fill "red" -Cx 100 -Cy 50 -r 5
    =<svg.circle> -Fill "green" -cx 100 -cy 100 -r 10
    =<svg.circle> -Fill "blue" -cx 100 -cy 150 -Stroke "cyan" -Strokewidth 1 -r 20
) -OutputPath (Join-Path $PSScriptRoot Circles.svg)

