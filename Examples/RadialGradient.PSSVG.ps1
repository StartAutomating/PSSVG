#requires -Module PSSVG

=<svg> -Content @(
    =<svg.defs> @(
        =<svg.radialGradient> -Id myGradient -Content @(
            =<svg.stop> -Offset '10%' -Stopcolor gold
            =<svg.stop> -Offset '95%' -Stopcolor red
        )
    )
    =<svg.circle> -Fill 'url(#myGradient)' -Cx 50 -Cy 50 -R 35    
) -ViewBox 0,0,100,100 -OutputPath (Join-Path $PSScriptRoot RadialGradient.svg)
