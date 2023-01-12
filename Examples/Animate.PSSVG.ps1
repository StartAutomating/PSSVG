#requires -Module PSSVG

SVG -ViewBox 0,0,10,10 (
    SVG.rect -Width 10 -Height 10 (
        SVG.animate -AttributeName rx -Values "0;5;0" -Dur "10s" -RepeatCount indefinite
    ) -Fill '#4488ff'
) -OutputPath (Join-Path $psScriptRoot Animate.svg)

