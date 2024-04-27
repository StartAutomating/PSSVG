#requires -Module PSSVG

param(
# The radius of the circle
[alias('r')]
[double]
$Radius = 35,

# The center of the circle
[alias('c')]
[double]
$Center = 50,

# The color of the circle
[alias('f')]
[string]
$Fill = 'transparent',

# The color of the stroke
[alias('s')]
[string]
$Stroke = '#4488ff',

# The duration of the animation.
[Timespan]
[Alias('D','Duration','P','Period')]
$RotateEvery = "00:00:01.5"
)

svg -ViewBox 0,0, ($center * 2), ($center * 2) @(
    svg.circle -Fill $fill -Stroke $Stroke -Cx $center -Cy $center -R $Radius
    svg.line -Stroke $Stroke -X1 $center -x2 ($center + $radius) -Y1 $center -Y2 $center @(
        svg.animatetransform -AttributeName transform -From "0 $center $center"  -To "360 $center $center" -dur "$($RotateEvery.TotalSeconds)s" -RepeatCount indefinite -AttributeType xml -type rotate
    ) -Opacity 0.8
) -OutputPath (Join-Path $PSScriptRoot .\SweepCircle.svg)
