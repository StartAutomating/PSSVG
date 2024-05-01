#requires -Module PSSVG

param(
# The radius of the rose.
[double]
$Radius = 100,

# The frequency of the rose.
[double]
$Frequency = 2,

# The initial rotation of the rose.
[double]
$Rotate = 0,

# The number of revolutions to draw.
[double]
$RevolutionCount = 1,

# The stroke color of the rose.
[string]
$Color = '#4488ff'
)

SVG -ViewBox ($Radius * 2) @(
    SVG.Rose -Radius $Radius -Frequency $Frequency -RevolutionCount $RevolutionCount -Stroke $Color -CenterX $Radius -Rotate $Rotate
) -OutputPath (Join-Path $PSScriptRoot .\Rose.svg)
