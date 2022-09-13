#requires -Module PSSVG

=<svg> -ViewBox 0,0,10,10 (
    =<svg.rect> -Width 10 -Height 10 (
        =<svg.animate> -AttributeName rx -Values "0;5;0" -Dur "10s" -RepeatCount indefinite
    ) -Fill '#4488ff'
) -OutputPath (Join-Path $psScriptRoot Animate.svg)

