#requires -Module PSSVG

=<svg> -Content @(
    =<svg.defs> @(
        =<svg.LinearGradient> -Id myGradient -Content @(
            =<svg.stop> -Stopcolor gold @(
                =<svg.animate> -AttributeName offset -Values '.1;.99;.1' -Dur 5s -RepeatCount indefinite
            )
            =<svg.stop> -Stopcolor red @(
                =<svg.animate> -AttributeName offset -Values '100;0;100' -Dur 5s -RepeatCount indefinite
            )            
        )
    )
    =<svg.rect> -Fill 'url(#myGradient)' -x 0 -Y 0 -Width 100 -Height 100   
) -ViewBox '0 0 100 100' -OutputPath (Join-Path $PSScriptRoot LinearGradientAnimated.svg)
