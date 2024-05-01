param(
[Alias('BPM')]
[double]
$BeatsPerMinute = 70,

[int]
$scale = 4
)

$animateDuration = "$([Math]::Round(1/($BeatsPerMinute / 60), 4))s"
$animateSplat = [Ordered]@{
    Dur = $animateDuration
    RepeatDur = "indefinite"
}

$patternSize = 1/$scale

$Color = "#4488ff"

SVG -ViewBox 800, 800 @(
    SVG.pattern -Width $patternSize -Height $patternSize @(
        SVG.polygon -Points "10,10, 10,90, 50,50, 90,10 90,90" @(
            SVG.animate -AttributeName points -to "0,0 100,0 100,100, 0,100 0,0" -AttributeType XML @animateSplat
        )  -Fill $color -Stroke $color
    ) -id fillPattern
    SVG.rect -Width 800 -Height 800 -Fill "url(#fillPattern)" -X 0 -Y 0
) -OutputPath (Join-Path $PSScriptRoot .\BPMMorph.svg) -Style @{'background-color'='black'}