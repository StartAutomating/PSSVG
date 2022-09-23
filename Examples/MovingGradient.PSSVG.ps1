#requires -Module PSSVG

=<svg> -Content @(
    =<svg.defs> @(
        =<svg.LinearGradient> -Id myGradient -Content @(
            =<svg.stop> -Offset '10%' -Stopcolor transparent
            =<svg.stop> -Offset '95%' -Stopcolor '#4488ff'
            =<svg.animate> -AttributeName y1 -From 0 -To 1 -Id animateY1 -Fill freeze -Dur '3s'
            =<svg.animate> -AttributeName y2 -Dur "3s" -From 1 -to 0 -Id 'animateY2' -Fill freeze -Begin 'animateY1.end'
            =<svg.animate> -AttributeName x1 -Values '1;0' -Dur '3s' -Begin 'animateY2.end' -Fill freeze -Id animateX1
            =<svg.animate> -AttributeName x2 -Values '0;1' -Dur '3s' -Begin 'animateX1.end' -Fill freeze            
        ) -X1 100% -X2 0 -Y1 0% -Y2 100%
        
        
    )
    =<svg.rect> -Fill 'url(#myGradient)' -Width 100 -Height 100
) -viewbox 0,0,100,100 -OutputPath (Join-Path $PSScriptRoot MovingGradient.svg)
