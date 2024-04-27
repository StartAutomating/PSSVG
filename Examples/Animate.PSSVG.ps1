#requires -Module PSSVG
param(
[string]
$Fill = '#4488ff',

# The duration of the animation.
[Timespan]
$Duration = "00:00:10"
)

SVG -ViewBox 0,0,10,10 (
    SVG.rect -Width 10 -Height 10 @(
        SVG.animate -AttributeName rx -Values "0;5;0" -Dur "$($duration)s" -RepeatCount indefinite
        SVG.animate -AttributeName ry -Values "0;5;0" -Dur "$($duration)s" -RepeatCount indefinite
    ) -Fill $Fill
) -OutputPath (Join-Path $psScriptRoot Animate.svg)

