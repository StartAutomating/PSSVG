#requires -Module PSSVG

$colors = @('red','green','blue')
=<svg> @(
    foreach ($n in 1..10) {
        $n10 = $n * 10        
        =<svg.rect> -X $n10 -Y $n10 -Width $n10 -Height $n10 -Style ([Ordered]@{
            fill   = $colors[$n % $colors.Length]
            stroke = $colors[($n + 1) % $colors.Length]
        })
    }
) -OutputPath (Join-Path $PSScriptRoot ManyRectangles.svg)


