
svg -ViewBox 100 -Content @(
    $splat = [Ordered]@{PointCount=6;CenterX=50;CenterY=50;Radius=50;fill='Transparent';Stroke='#4488ff'}
    SVG.Star @splat @(
        SVG.animate -AttributeName d -Values $(
            @(
            @(SVG.ConvexPolygon @splat).D;@(SVG.ConvexPolygon @splat -Rotate 90).D;@(SVG.ConvexPolygon @splat).D
            ) -join ';'
        ) -Dur 10s -RepeatCount 'indefinite'
    )
) -OutputPath (Join-Path $PSScriptRoot MorphingConvexPolygon.svg)
