$bpm = 70

$animateDuration = "$([Math]::Round(1/($bpm / 60), 4))s"
$animateSplat = [Ordered]@{
    Dur = $animateDuration
    RepeatDur = "indefinite"
}

$Scale = 4

$patternSize = 1/$scale

$Color = "#4488ff"

=<svg> -ViewBox 800, 800 @(
    =<svg.pattern> -Width $patternSize -Height $patternSize @(
        =<svg.polygon> -Points "10,10, 10,90, 50,50, 90,10 90,90" @(
            =<svg.animate> -AttributeName points -to "0,0 100,0 100,100, 0,100 0,0" -AttributeType XML @animateSplat
        )  -Fill $color -Stroke $color
    ) -id fillPattern
    =<svg.rect> -Width 800 -Height 800 -Fill "url(#fillPattern)" -X 0 -Y 0
) -OutputPath (Join-Path $PSScriptRoot .\BPMMorph.svg) -Style @{'background-color'='black'}

