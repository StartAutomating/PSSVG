#requires -Module PSSVG

SVG -ViewBox 0,0,200,200 @(
    SVG.circle -Fill "red" -Cx 100 -Cy 50 -r 5
    SVG.circle -Fill "green" -cx 100 -cy 100 -r 10
    SVG.circle -Fill "blue" -cx 100 -cy 150 -Stroke "cyan" -Strokewidth 1 -r 20
) -OutputPath (Join-Path $PSScriptRoot Circles.svg)

