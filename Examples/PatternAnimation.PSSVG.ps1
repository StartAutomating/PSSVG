#requires -Module PSSVG

=<svg> -ViewBox 0, 0, 250, 200 -Content @(
    =<svg.defs> (
        =<svg.pattern> -id star -ViewBox 0,0, 10, 10 -Width 10% -Height 10% @(
            =<svg.polygon> -Points "0,0", "2,5", "0,10", "5,8", "10,10","8,5", "10,0", "5,2" @(
                =<svg.animateTransform> -AttributeName transform -From "0 5 5"  -To "360 5 5" -dur "5s" -RepeatCount indefinite -AttributeType xml -type rotate
            ) -Fill '#4488ff'
        )
    )
    =<svg.circle> -cx 50 -cy 100 -r 50 -Fill 'url(#star)'
    =<svg.circle> -cx 180 -cy 100 -r 50 -Fill 'none' -StrokeWidth 20 -Stroke 'url(#star)' -Content @(
        =<svg.animateTransform> -AttributeName transform -From "0 180 100"  -To "360 180 100" -dur "5s" -RepeatCount indefinite -AttributeType xml -type rotate
    )
) -OutputPath (Join-Path $PSScriptRoot PatternAnimation.svg)