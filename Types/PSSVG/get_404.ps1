SVG -ViewBox 900 @(
    
    SVG.Octagon -Stroke '#4488ff' -Radius (
        400
    ) -CenterX 450 -CenterY 450 -Fill transparent -Rotate (
        360/16
    ) -StrokeWidth 0.5%    
    
    SVG.Text -X 50% -Y 50% -DominantBaseline 'middle' -AlignmentBaseline 'middle' -TextAnchor 'middle' -Fontsize 100 -Fill '#4488ff' -Content @(
        (SVG.tspan -Content '404').OuterXml
        SVG.Animate -AttributeName 'font-size' -Values '100;110;100' -Dur '1s' -RepeatCount 'indefinite'
    )
)
