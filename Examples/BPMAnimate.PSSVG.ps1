$bpm = 90

$animateDuration = "$([Math]::Round(1/($bpm / 60), 4))s"
$animateSplat = [Ordered]@{
    Dur = $animateDuration
    RepeatDur = "indefinite"
}

$Color = "#4488ff"

=<svg> -ViewBox 200, 200 -Fill black @(
    =<svg.pattern> -Width .5 -Height .5 @(
        =<svg.rect> -Width 0 -Height 0 -X 25 -Y 25 @(
            =<svg.animate> -AttributeName width -Values '0;50' @animateSplat
            =<svg.animate> -AttributeName height -Values '0;50' @animateSplat
            =<svg.animate> -AttributeName x -Values '25;0' @animateSplat
            =<svg.animate> -AttributeName y -Values '25;0' @animateSplat
            =<svg.animate> -AttributeName opacity -From 0 -To 1 @animateSplat
            =<svg.animate> -AttributeName rx -Values "0;5;0" @animateSplat
        ) -Fill $color -Id TopLeft
        
        =<svg.rect> -Width 0 -Height 0 -X 75 -Y 25 @(
            =<svg.animate> -AttributeName width -Values '50;0' @animateSplat
            =<svg.animate> -AttributeName height -Values '50;0' @animateSplat
            =<svg.animate> -AttributeName x -Values '50;75' @animateSplat
            =<svg.animate> -AttributeName y -From 0 -To 25 @animateSplat
            =<svg.animate> -AttributeName opacity -From 1 -To 0 @animateSplat
            =<svg.animate> -AttributeName rx -Values "0;5;0" @animateSplat
        ) -Fill $Color -Id TopRight   
        
        =<svg.rect> -Width 0 -Height 0 -X 75 -Y 75 @(
            =<svg.animate> -AttributeName width -Values '0;50' @animateSplat
            =<svg.animate> -AttributeName height -Values '0;50' @animateSplat
            =<svg.animate> -AttributeName x -Values '75;50' @animateSplat
            =<svg.animate> -AttributeName y -Values '75;50' @animateSplat
            =<svg.animate> -AttributeName opacity -From 0 -To 1 @animateSplat
            =<svg.animate> -AttributeName rx -Values "0;5;0" @animateSplat
        ) -Fill $color -Id BottomRight
        
        =<svg.rect> -Width 0 -Height 0 -X 25 -Y 75 @(
            =<svg.animate> -AttributeName width -Values '50;0' @animateSplat
            =<svg.animate> -AttributeName height -Values '50;0' @animateSplat
            =<svg.animate> -AttributeName y -Values '50;75' @animateSplat
            =<svg.animate> -AttributeName x -From 0 -To 25 @animateSplat
            =<svg.animate> -AttributeName opacity -From 1 -To 0 @animateSplat
            =<svg.animate> -AttributeName rx -Values "0;5;0" @animateSplat        
        ) -Fill $Color -Id TopRight
    ) -id fillPattern
    =<svg.rect> -Width 200 -Height 200 -Fill "url(#fillPattern)" -X 0 -Y 0
) -OutputPath (Join-Path $PSScriptRoot .\BPMAnimate.svg) -Style @{'background-color'='black'}
