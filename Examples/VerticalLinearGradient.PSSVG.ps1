#requires -Module PSSVG

=<svg> -Content @(
    =<svg.defs> @(
        =<svg.LinearGradient> -Id myGradient -Content @(
            =<svg.stop> -Offset '10%' -Stopcolor gold
            =<svg.stop> -Offset '95%' -Stopcolor red
        ) -X1 0 -X2 0 -Y1 0% -Y2 100%
    )
    =<svg.rect> -Fill 'url(#myGradient)' -Width 100 -Height 100
) -viewbox 0,0,100,100 -OutputPath (Join-Path $PSScriptRoot VerticalLinearGradient.svg)
