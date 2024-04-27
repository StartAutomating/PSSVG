#requires -Module PSSVG
param(
# The colors in the gradient
[string[]]
$Color = @('#4488ff','#224488'),

# The offsets in the gradient
[double[]]
$Offset = @(10,95)
)


svg -Content @(
    svg.defs @(
        svg.radialGradient -Id myGradient -Content @(
            for($n = 0; $n -lt $color.Length; $n++) {
                svg.stop -Offset "$($Offset[$n])%" -StopColor $color[$n]
            }
        )
    )
    svg.circle -Fill 'url(#myGradient)' -Cx 50 -Cy 50 -R 35    
) -ViewBox 0,0,100,100 -OutputPath (Join-Path $PSScriptRoot RadialGradient.svg)
