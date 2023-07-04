$bpm = 128

$animateDuration = "$([Math]::Round((60/$bpm)*2, 4))s"
$animateSplat = [Ordered]@{
    Dur = $animateDuration
    RepeatDur = "indefinite"
}

$Scale = 8

$patternSize = 1/$scale

$Color = "#4488ff"

SVG -ViewBox 800, 800 @(
    SVG.pattern -Width $patternSize -Height $patternSize @(
        SVG.polygon -Points "0,0, 100,100, 0,100" @(
            SVG.animate -AttributeName points -to "100,100 0,0 100,0" -AttributeType XML @animateSplat
        )  -Fill $color -Stroke $color                
    ) -id fillPattern
    SVG.rect -Width 800 -Height 800 -Fill "url(#fillPattern)" -X 0 -Y 0
) -OutputPath (Join-Path $PSScriptRoot .\BPMTriangleMorph.svg) -Style @{'background-color'='black'}