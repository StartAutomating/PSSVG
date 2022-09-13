#requires -Module PSSVG

=<svg> -Content @(
    =<svg.defs> @(
        =<svg.radialGradient> -Id myGradient -Content @(
            =<svg.stop> -Offset '1%' -Stopcolor gold @(
                =<svg.animate> -AttributeName offset -Values '.1;.99;.1' -Dur 5s -RepeatCount indefinite
            )
            =<svg.stop> -Offset '100%' -Stopcolor red
        )
    )
    =<svg.circle> -Fill 'url(#myGradient)' -Cx 50 -Cy 50 -R 35    
) -ViewBox '0 0 100 100' -OutputPath (Join-Path $PSScriptRoot RadialGradientAnimated.svg)
