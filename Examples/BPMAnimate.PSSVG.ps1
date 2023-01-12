$bpm = 90

$animateDuration = "$([Math]::Round(1/($bpm / 60), 4))s"
$animateSplat = [Ordered]@{
    Dur = $animateDuration
    RepeatDur = "indefinite"
}

$Color = "#4488ff"

SVG -ViewBox 200, 200 -Fill black @(
    SVG.pattern -Width .5 -Height .5 @(
        SVG.rect -Width 0 -Height 0 -X 25 -Y 25 @(
            SVG.animate -AttributeName width -Values '0;50' @animateSplat
            SVG.animate -AttributeName height -Values '0;50' @animateSplat
            SVG.animate -AttributeName x -Values '25;0' @animateSplat
            SVG.animate -AttributeName y -Values '25;0' @animateSplat
            SVG.animate -AttributeName opacity -From 0 -To 1 @animateSplat
            SVG.animate -AttributeName rx -Values "0;5;0" @animateSplat
        ) -Fill $color -Id TopLeft
        
        SVG.rect -Width 0 -Height 0 -X 75 -Y 25 @(
            SVG.animate -AttributeName width -Values '50;0' @animateSplat
            SVG.animate -AttributeName height -Values '50;0' @animateSplat
            SVG.animate -AttributeName x -Values '50;75' @animateSplat
            SVG.animate -AttributeName y -From 0 -To 25 @animateSplat
            SVG.animate -AttributeName opacity -From 1 -To 0 @animateSplat
            SVG.animate -AttributeName rx -Values "0;5;0" @animateSplat
        ) -Fill $Color -Id TopRight   
        
        SVG.rect -Width 0 -Height 0 -X 75 -Y 75 @(
            SVG.animate -AttributeName width -Values '0;50' @animateSplat
            SVG.animate -AttributeName height -Values '0;50' @animateSplat
            SVG.animate -AttributeName x -Values '75;50' @animateSplat
            SVG.animate -AttributeName y -Values '75;50' @animateSplat
            SVG.animate -AttributeName opacity -From 0 -To 1 @animateSplat
            SVG.animate -AttributeName rx -Values "0;5;0" @animateSplat
        ) -Fill $color -Id BottomRight
        
        SVG.rect -Width 0 -Height 0 -X 25 -Y 75 @(
            SVG.animate -AttributeName width -Values '50;0' @animateSplat
            SVG.animate -AttributeName height -Values '50;0' @animateSplat
            SVG.animate -AttributeName y -Values '50;75' @animateSplat
            SVG.animate -AttributeName x -From 0 -To 25 @animateSplat
            SVG.animate -AttributeName opacity -From 1 -To 0 @animateSplat
            SVG.animate -AttributeName rx -Values "0;5;0" @animateSplat        
        ) -Fill $Color -Id TopRight
    ) -id fillPattern
    SVG.rect -Width 200 -Height 200 -Fill "url(#fillPattern)" -X 0 -Y 0
) -OutputPath (Join-Path $PSScriptRoot .\BPMAnimate.svg) -Style @{'background-color'='black'}
