#requires -Module PSSVG

=<svg> @(
    =<svg.defs> @(
        =<svg.pattern> -Id 'SimplePattern' -Width .1 -Height .1 -Content @(
            =<svg.circle> -Cx 2.5 -Cy 2.5 -R .5 -Fill '#4488ff'            
            =<svg.line> -X1 0 -x2 5 -y1 2.5 -Y2 2.5 -Stroke '#4488ff' -StrokeWidth .1
            =<svg.line> -Y1 0 -Y2 5 -X1 2.5 -X2 2.5 -Stroke '#4488ff' -StrokeWidth .1
        )
    )
    =<svg.rect> -Fill 'url(#SimplePattern)' -Width 50 -Height 50 -Opacity .3
) -ViewBox 0,0,50,50 -OutputPath (Join-Path $psScriptRoot .\Pattern.svg)
