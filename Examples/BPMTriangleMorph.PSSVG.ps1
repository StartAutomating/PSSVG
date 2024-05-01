#requires -Module PSSVG

param(
# The number of beats per minute
[double]
$BeatsPerMinute = 128,

# The number repetitions of the pattern
[ValidateRange(1,16)]
[int]
$Scale = 6
)

$bpm = $BeatsPerMinute

$animateDuration = "$([Math]::Round(1/($bpm / 60), 4))s"
$animateSplat = [Ordered]@{
    Dur = $animateDuration
    RepeatDur = "indefinite"
}

$patternSize = 1/$scale

$Color = "#4488ff"

SVG -ViewBox 800, 800 @(
    SVG.pattern -Width $patternSize -Height $patternSize @(
        SVG.polygon -Points "0,0, 100,100, 0,100" @(
            SVG.animate -AttributeName points -to "100,100 0,0 100,0" -AttributeType XML @animateSplat
        )  -Fill $color -Stroke $color
    ) -id fillPattern
    SVG.rect -Width 800 -Height 800 -Fill "url(#fillPattern)"
) -OutputPath (Join-Path $PSScriptRoot .\BPMTriangleMorph.svg) -Style @{'background-color'='black'}