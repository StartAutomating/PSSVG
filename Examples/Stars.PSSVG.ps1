#requires -Module PSSVG

foreach ($n in 5..12) {


=<svg> -ViewBox 2,2 @(
    =<svg.Star> -PointCount $n  -Fill '#4488ff' -Stroke 'white' -StrokeWidth 0.01
) -OutputPath (Join-Path $PSScriptRoot .\Stars$n.svg)

}

$RotateEvery = [timespan]'00:00:02'

=<svg> -ViewBox 100, 100 @(
    =<svg.defs> @(
        =<svg.marker> @(
            =<svg.Star> -CenterX 5 -CenterY 5 -Radius 5 -PointCount 12 -fill '#4488ff' @(
                =<svg.animatetransform> -AttributeName transform -From "360 5 5"  -To "0 5 5" -dur "$($RotateEvery.TotalSeconds * 4)s" -RepeatCount indefinite -AttributeType xml -type rotate
            )
        ) -MarkerHeight 5 -MarkerWidth 5 -ViewBox 10,10 -RefX 5 -RefY 5 -Id marker1

        =<svg.marker> @(
            =<svg.Star> -CenterX 5 -CenterY 5 -Radius 5 -PointCount 10 -fill '#4488ff' @(
                =<svg.animatetransform> -AttributeName transform -From "0 5 5"  -To "360 5 5" -dur "$($RotateEvery.TotalSeconds * 4)s" -RepeatCount indefinite -AttributeType xml -type rotate
            )
        ) -MarkerHeight 2.5 -MarkerWidth 2.5 -ViewBox 10,10 -RefX 5 -RefY 5 -Id marker2
    )
    =<svg.Star> -PointCount 11 -Stroke '#4488ff' -StrokeWidth 1.1 -Content @(
        =<svg.animatetransform> -AttributeName transform -From "0 50 50"  -To "360 50 50" -dur "$($RotateEvery.TotalSeconds * 4)s" -RepeatCount indefinite -AttributeType xml -type rotate
    ) -Radius 50 -CenterX 50 -CenterY 50 -Fill transparent -MarkerStart 'url(#marker1)' -MarkerEnd 'url(#marker1)' -MarkerMid 'url(#marker1)'
    =<svg.Star> -PointCount 9 -Stroke '#4488ff' -StrokeWidth 1 -Content @(
        =<svg.animatetransform> -AttributeName transform -From "360 50 50"  -To "0 50 50" -dur "$($RotateEvery.TotalSeconds * 2)s" -RepeatCount indefinite -AttributeType xml -type rotate
    ) -Radius 30 -CenterX 50 -CenterY 50 -Fill transparent -MarkerStart 'url(#marker2)' -MarkerEnd 'url(#marker2)' -MarkerMid 'url(#marker2)'

    =<svg.Star> -PointCount 7 -Stroke '#4488ff' -StrokeWidth .5 -Content @(
        =<svg.animatetransform> -AttributeName transform -From "0 50 50"  -To "360 50 50" -dur "$($RotateEvery.TotalSeconds)s" -RepeatCount indefinite -AttributeType xml -type rotate
    ) -Radius 10 -CenterX 50 -CenterY 50 -Fill transparent

    =<svg.Star> -PointCount 5 -Stroke '#4488ff' -StrokeWidth .25 -Content @(
        =<svg.animatetransform> -AttributeName transform -From "360 50 50"  -To "0 50 50" -dur "$($RotateEvery.TotalSeconds / 2)s" -RepeatCount indefinite -AttributeType xml -type rotate
    ) -Radius 5 -CenterX 50 -CenterY 50 -Fill transparent

) -OutputPath (Join-Path $PSScriptRoot .\Stars.svg)

