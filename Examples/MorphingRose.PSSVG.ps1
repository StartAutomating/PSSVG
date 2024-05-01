#requires -Module PSSVG

param(
# The radius of each rose.
[double[]]
$Radius = @(50, 45),

# The rotation of each rose.
[double[]]
$Rotate = @(0,0),

# The duration of the animation.
[timespan]
$Duration = '00:00:01.66',

# The frequency of each rose.
[double[]]
$Frequency = @(3,5),

# The spin start and end.
[double[]]
$Spin = @(0,360)
)
$r1, $r2, $null = $radius
$f1, $f2, $null = $Frequency
$rot1, $rot2, $null = $Rotate
$spin1, $spin2, $null = $Spin
svg -ViewBox 100 -Content @(

    $splat = [Ordered]@{Frequency=$f1;CenterX=$r1;CenterY=$r1;Radius=$r1;Stroke='#4488ff';Rotate=$rot1}
    $Splat2 = [Ordered]@{Frequency=$f2;CenterX=$r1;CenterY=$r1;Radius=$r2;Stroke='#4488ff';Rotate=$rot2}
    SVG.Rose @splat -Content @(
        SVG.animate -AttributeName d -Values $(
            @(
            @(SVG.Rose @splat).D;@(SVG.Rose @splat2).D;@(SVG.Rose @splat).D
            ) -join ';'
        ) -Dur $Duration -RepeatCount 'indefinite'
        SVG.animateTransform -From "$spin1 $r1 $r1" -To "$spin2 $r1 $r1" -Dur $duration -AttributeName transform -Type 'rotate' -RepeatCount 'indefinite'
    )
) -OutputPath (Join-Path $PSScriptRoot MorphingRose.svg)
