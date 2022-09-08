#requires -Module PSSVG

=<svg> -Content @(
    =<svg.defs> @(
        =<svg.LinearGradient> -Id myGradient -Content @(
            =<svg.stop> -Offset '10%' -Stopcolor gold @(
                =<svg.animate> -AttributeName Offset -Values '1;50;10' -Dur 2s -RepeatCount indefinite
            )
            =<svg.stop> -Offset '95%' -Stopcolor red @(
                =<svg.animate> -AttributeName Offset -Values '99;51;99' -Dur 5s -RepeatCount indefinite
            )
        )
    )
    =<svg.circle> -Fill 'url(#myGradient)' -Cx 50 -Cy 50 -R 35    
) -ViewBox '0 0 100 100' -OutputPath (Join-Path $PSScriptRoot LinearGradientAnimated.svg)
