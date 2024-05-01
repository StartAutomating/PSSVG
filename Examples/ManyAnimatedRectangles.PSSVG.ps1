
#requires -Module PSSVG
param(
[Alias('Color','Colour','Colours')]
[string[]]
$colors = @('red','green','blue'),

[timespan]
$Duration = '00:00:10'
)

svg @(
    foreach ($n in 1..10) {
        $n10 = $n * 10        
        svg.rect -X $n10 -Y $n10 -Width $n10 -Height $n10 -Style ([Ordered]@{
            fill   = $colors[$n % $colors.Length]
            stroke = $colors[($n + 1) % $colors.Length]
        }) @(
            svg.animate -AttributeName rx -Values "0;50;0" -Dur $Duration -RepeatCount indefinite
            svg.animate -AttributeName x -Values "$($n10);$(200 - $n10/2);$($n10);" -Dur $Duration -RepeatCount indefinite 
        )
    }
) -OutputPath (Join-Path $PSScriptRoot .\ManyAnimatedRectangles.svg) 



