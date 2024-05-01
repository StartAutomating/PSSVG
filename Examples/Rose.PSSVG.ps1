#requires -Module PSSVG

param(
# The radius of the rose.
[double]
$Radius,

# The frequency of the rose.
[double]
$Frequency,

# The number of revolutions to draw.
[double]
$RevolutionCount,

# The stroke color of the rose.
[string]
$Color
)

SVG -ViewBox ($Radius * 2) @(
    SVG.Rose -Radius $Radius -Frequency $Frequency -RevolutionCount $RevolutionCount -Stroke $Color -CenterX $Radius
) -OutputPath .\Rose.svg
