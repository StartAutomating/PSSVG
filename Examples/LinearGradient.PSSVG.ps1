#requires -Module PSSVG
param(    
[string[]]
$Color = @('gold','red'),

[double[]]
$Offset = @(10,95)
)
svg -Content @(
    svg.defs @(
        svg.LinearGradient -Id myGradient -Content @(
            for($n = 0; $n -lt $color.Length; $n++) {
                svg.stop -Offset "$($Offset[$n])%" -StopColor $color[$n]
            }            
        )
    )
    svg.circle -Fill 'url(#myGradient)' -Cx 50 -Cy 50 -R 35

) -viewbox 0,0,100,100 -OutputPath (Join-Path $PSScriptRoot LinearGradient.svg)
