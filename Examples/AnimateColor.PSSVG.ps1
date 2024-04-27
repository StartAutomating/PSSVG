#requires -Module PSSVG

param(
# The fill color of the circle
[string[]]$Fill = @('red','orange','yellow','green','blue','indigo','violet','red'),
# The stroke color of the circle
[string[]]$Stroke = @('orange','yellow','green','blue','indigo','violet','red','orange'),

# The duration of the animation.
[Timespan]
$Duration = "00:00:10",

# The stroke thickness of the circle
[int[]]
$strokeThickness = @(1,2,3,4,5,6,7,8,9,10)
)

SVG -Content @(
    SVG.circle -cx 50 -cy 50 -r 50 -Fill red @(
        SVG.animate -AttributeName fill -dur $($Duration.TotalSeconds) -Values ($Fill -join ';') -RepeatCount indefinite
        SVG.animate -AttributeName stroke -dur $($Duration.TotalSeconds) -Values ($Stroke -join ';') -RepeatCount indefinite
        SVG.animate -AttributeName stroke-thickness -Dur $($Duration.TotalSeconds) -Values ($strokeThickness -join ';') -RepeatCount indefinite
    ) -Stroke orange    
)  -ViewBox 0,0,100,100 -OutputPath (Join-Path $psScriptRoot AnimateColor.svg)
