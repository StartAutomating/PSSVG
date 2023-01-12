#requires -Module PSSVG

SVG @(
    SVG.filter (
        SVG.feGaussianBlur -In 'SourceGraphic' -StdDeviation 5
    ) -id blurMe

    SVG.circle -Fill '#4488ff' -Filter 'url(#blurMe)' -R 50 -Cx 50 -Cy 50
) -ViewBox 100, 100 -OutputPath (Join-Path $PSScriptRoot .\Blur.svg)