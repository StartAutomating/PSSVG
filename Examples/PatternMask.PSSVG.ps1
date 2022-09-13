
=<svg> -ViewBox 0, 0, 100, 100 -Content @(
    =<svg.defs> @(
        =<svg.pattern> -id star -ViewBox 0,0, 10, 10 -Width 10% -Height 10% @(
            =<svg.polygon> -Points "0,0", "2,5", "0,10", "5,8", "10,10","8,5", "10,0", "5,2" @(
                =<svg.animateTransform> -AttributeName transform -From "0 5 5"  -To "360 5 5" -dur "5s" -RepeatCount indefinite -AttributeType xml -type rotate -            
            ) -Fill white
        )
        =<svg.mask> (
            =<svg.circle> -Fill 'url(#star)' -r 50 -cx 50 -cy 50
        ) -Id myMask
        =<svg.radialGradient> @(
            =<svg.stop> -Offset '25%' -StopColor 'red'
            =<svg.stop> -Offset '50%' -StopColor 'green'
            =<svg.stop> -Offset '75%' -StopColor 'blue'
        ) -id myGradient        
    )
    =<svg.circle> -cx 50 -cy 50 -r 50 -Fill 'url(#myGradient)' -Mask 'url(#myMask)'
) -OutputPath (Join-Path $PSScriptRoot PatternMask.svg)