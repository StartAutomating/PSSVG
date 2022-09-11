
#requires -Module PSSVG

$colors = @('red','green','blue')
=<svg> @(
    foreach ($n in 1..10) {
        $n10 = $n * 10        
        =<svg.rect> -X $n10 -Y $n10 -Width $n10 -Height $n10 -Style @{
            fill   = $colors[$n % $colors.Length]
            stroke = $colors[($n + 1) % $colors.Length]
        } @(
            =<svg.animate> -AttributeName rx -Values "0;50;0" -Dur "10s" -RepeatCount indefinite
            =<svg.animate> -AttributeName x -Values "$($n10);$(200 - $n10/2);$($n10);" -Dur "10s" -RepeatCount indefinite 
        )
    }
) -OutputPath (Join-Path $PSScriptRoot .\ManyAnimatedRectangles.svg) 



