function SVG.animate {

<#
.Synopsis
    Creates SVG animate elements
.Description
    The SVG **`<animate>`** element provides a way to animate an attribute of an element over time.
.Example
    SVG -ViewBox 0,0,10,10 (
        SVG.rect -Width 10 -Height 10 (
            SVG.animate -AttributeName rx -Values "0;5;0" -Dur "10s" -RepeatCount indefinite
        ) -Fill '#4488ff'
    )
.Example
    SVG -Content @(
        SVG.circle -cx 50 -cy 50 -r 50 -Fill red @(
            SVG.animate -AttributeName fill -dur 10s -Values 'red;orange;yellow;green;blue;indigo;violet;red' -RepeatCount indefinite -begin 1s
            SVG.animate -AttributeName stroke -dur 10s -Values 'orange;yellow;green;blue;indigo;violet;red;orange' -RepeatCount indefinite -begin 1s
        ) -Stroke orange
    )  -ViewBox 0,0,100,100
.Example
    SVG -Content @(
        SVG.circle -cx 50 -cy 50 -r 50 -Fill red @(
            SVG.animate -AttributeName fill -dur 10s -Values 'red;orange;yellow;green;blue;indigo;violet;red' -RepeatCount indefinite -begin 1s
            SVG.animate -AttributeName stroke -dur 10s -Values 'orange;yellow;green;blue;indigo;violet;red;orange' -RepeatCount indefinite -begin 1s
        ) -Stroke orange
    )  -ViewBox 0,0,100,100
.Example
    SVG @(
        $animationSettings = [Ordered]@{
            Dur  = '2s'
            RepeatCount = 'indefinite'
        }
        SVG.circle -CX 25 -CY 25 -r 10 -Fill '#4488ff' @(
            SVG.animate -values '1;10;1' -AttributeName r @animationSettings
        )
        SVG.rect -X 0 -Y 50 -Width 50 -Height 50 -Fill '#4488ff' @(
            SVG.animate -values '0;50;0' -AttributeName width @animationSettings
            SVG.animate -values '50;0;50' -AttributeName height @animationSettings
        )
        SVG.ellipse -Cx 25 -Cy 100 -Rx 10 -Ry 5 -Fill '#4488ff' @(
            SVG.animate -values '10;1;10' -AttributeName rx @animationSettings
            SVG.animate -values '5;10;5' -AttributeName ry @animationSettings
        )
    ) -ViewBox 0, 0, 100, 150
.Example
    SVG @(
        $animationSettings = [Ordered]@{
            Dur  = '2s'
            RepeatCount = 'indefinite'
        }
        SVG.circle -CX 25 -CY 25 -r 10 -Fill '#4488ff' @(
            SVG.animate -values '1;10;1' -AttributeName r @animationSettings
        )
        SVG.rect -X 0 -Y 50 -Width 50 -Height 50 -Fill '#4488ff' @(
            SVG.animate -values '0;50;0' -AttributeName width @animationSettings
            SVG.animate -values '50;0;50' -AttributeName height @animationSettings
        )
        SVG.ellipse -Cx 25 -Cy 100 -Rx 10 -Ry 5 -Fill '#4488ff' @(
            SVG.animate -values '10;1;10' -AttributeName rx @animationSettings
            SVG.animate -values '5;10;5' -AttributeName ry @animationSettings
        )
    ) -ViewBox 0, 0, 100, 150
.Example
    SVG @(
        $animationSettings = [Ordered]@{
            Dur  = '2s'
            RepeatCount = 'indefinite'
        }
        SVG.circle -CX 25 -CY 25 -r 10 -Fill '#4488ff' @(
            SVG.animate -values '1;10;1' -AttributeName r @animationSettings
        )
        SVG.rect -X 0 -Y 50 -Width 50 -Height 50 -Fill '#4488ff' @(
            SVG.animate -values '0;50;0' -AttributeName width @animationSettings
            SVG.animate -values '50;0;50' -AttributeName height @animationSettings
        )
        SVG.ellipse -Cx 25 -Cy 100 -Rx 10 -Ry 5 -Fill '#4488ff' @(
            SVG.animate -values '10;1;10' -AttributeName rx @animationSettings
            SVG.animate -values '5;10;5' -AttributeName ry @animationSettings
        )
    ) -ViewBox 0, 0, 100, 150
.Example
    SVG @(
        $animationSettings = [Ordered]@{
            Dur  = '2s'
            RepeatCount = 'indefinite'
        }
        SVG.circle -CX 25 -CY 25 -r 10 -Fill '#4488ff' @(
            SVG.animate -values '1;10;1' -AttributeName r @animationSettings
        )
        SVG.rect -X 0 -Y 50 -Width 50 -Height 50 -Fill '#4488ff' @(
            SVG.animate -values '0;50;0' -AttributeName width @animationSettings
            SVG.animate -values '50;0;50' -AttributeName height @animationSettings
        )
        SVG.ellipse -Cx 25 -Cy 100 -Rx 10 -Ry 5 -Fill '#4488ff' @(
            SVG.animate -values '10;1;10' -AttributeName rx @animationSettings
            SVG.animate -values '5;10;5' -AttributeName ry @animationSettings
        )
    ) -ViewBox 0, 0, 100, 150
.Example
    SVG @(
        $animationSettings = [Ordered]@{
            Dur  = '2s'
            RepeatCount = 'indefinite'
        }
        SVG.circle -CX 25 -CY 25 -r 10 -Fill '#4488ff' @(
            SVG.animate -values '1;10;1' -AttributeName r @animationSettings
        )
        SVG.rect -X 0 -Y 50 -Width 50 -Height 50 -Fill '#4488ff' @(
            SVG.animate -values '0;50;0' -AttributeName width @animationSettings
            SVG.animate -values '50;0;50' -AttributeName height @animationSettings
        )
        SVG.ellipse -Cx 25 -Cy 100 -Rx 10 -Ry 5 -Fill '#4488ff' @(
            SVG.animate -values '10;1;10' -AttributeName rx @animationSettings
            SVG.animate -values '5;10;5' -AttributeName ry @animationSettings
        )
    ) -ViewBox 0, 0, 100, 150
.Example
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
    )
.Example
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
    )
.Example
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
    )
.Example
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
    )
.Example
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
    )
.Example
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
    )
.Example
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
    )
.Example
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
    )
.Example
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
    )
.Example
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
    )
.Example
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
    )
.Example
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
    )
.Example
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
    )
.Example
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
    )
.Example
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
    )
.Example
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
    )
.Example
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
    )
.Example
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
    )
.Example
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
    )
.Example
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
    )
.Example
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
    )
.Example
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
    )
.Example
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
    )
.Example
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
    )
.Example
    $bpm = 70
    
    $animateDuration = "$([Math]::Round(1/($bpm / 60), 4))s"
    $animateSplat = [Ordered]@{
        Dur = $animateDuration
        RepeatDur = "indefinite"
    }
    
    $Scale = 4
    
    $patternSize = 1/$scale
    
    $Color = "#4488ff"
    
    SVG -ViewBox 800, 800 @(
        SVG.pattern -Width $patternSize -Height $patternSize @(
            SVG.polygon -Points "10,10, 10,90, 50,50, 90,10 90,90" @(
                SVG.animate -AttributeName points -to "0,0 100,0 100,100, 0,100 0,0" -AttributeType XML @animateSplat
            )  -Fill $color -Stroke $color
        ) -id fillPattern
        SVG.rect -Width 800 -Height 800 -Fill "url(#fillPattern)" -X 0 -Y 0
    )
.Example
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
    )
.Example
    $AnimationTimeframe = [Ordered]@{
        Dur = '2s'
        RepeatCount = 'indefinite'
    }
    
    SVG -viewBox 1920,1080 -Content @(
        SVG.filter -id 'noise1' -x '0' -y '0' -width '100%' -height '100%' -Content @(
            SVG.feTurbulence -baseFrequency '0.025' @(
                SVG.animate -AttributeName numOctaves -Values '1;6;12' @AnimationTimeframe
                SVG.animate -AttributeName seed -Values '0;5;0' @AnimationTimeframe
            ) -NumOctaves 4 -Type fractalNoise
            SVG.feGaussianBlur -stdDeviation 0.9 @(
                SVG.animate -AttributeName stdDeviation -Values '1.1;3.3;1.1' @AnimationTimeframe
            )
            SVG.feBlend -In 'SourceGraphic' -Mode color-burn
        )
        SVG.rect -x '0' -y '0' -width 100% -height 100% -style 'filter: url(#noise1);' -Fill '#4488ff' -Opacity .4
    )
.Example
    $AnimationTimeframe = [Ordered]@{
        Dur = '2s'
        RepeatCount = 'indefinite'
    }
    
    SVG -viewBox 1920,1080 -Content @(
        SVG.filter -id 'noise1' -x '0' -y '0' -width '100%' -height '100%' -Content @(
            SVG.feTurbulence -baseFrequency '0.025' @(
                SVG.animate -AttributeName numOctaves -Values '1;6;12' @AnimationTimeframe
                SVG.animate -AttributeName seed -Values '0;5;0' @AnimationTimeframe
            ) -NumOctaves 4 -Type fractalNoise
            SVG.feGaussianBlur -stdDeviation 0.9 @(
                SVG.animate -AttributeName stdDeviation -Values '1.1;3.3;1.1' @AnimationTimeframe
            )
            SVG.feBlend -In 'SourceGraphic' -Mode color-burn
        )
        SVG.rect -x '0' -y '0' -width 100% -height 100% -style 'filter: url(#noise1);' -Fill '#4488ff' -Opacity .4
    )
.Example
    $AnimationTimeframe = [Ordered]@{
        Dur = '2s'
        RepeatCount = 'indefinite'
    }
    
    SVG -viewBox 1920,1080 -Content @(
        SVG.filter -id 'noise1' -x '0' -y '0' -width '100%' -height '100%' -Content @(
            SVG.feTurbulence -baseFrequency '0.025' @(
                SVG.animate -AttributeName numOctaves -Values '1;6;12' @AnimationTimeframe
                SVG.animate -AttributeName seed -Values '0;5;0' @AnimationTimeframe
            ) -NumOctaves 4 -Type fractalNoise
            SVG.feGaussianBlur -stdDeviation 0.9 @(
                SVG.animate -AttributeName stdDeviation -Values '1.1;3.3;1.1' @AnimationTimeframe
            )
            SVG.feBlend -In 'SourceGraphic' -Mode color-burn
        )
        SVG.rect -x '0' -y '0' -width 100% -height 100% -style 'filter: url(#noise1);' -Fill '#4488ff' -Opacity .4
    )
.Example
    svg -ViewBox 0,0,100,100 -Content (
        svg.g -Content @(
            svg.text -Y "50%" -X "50%" -DominantBaseline middle -TextAnchor middle -Text "Fading in" -Fill '#4488ff'
    
            # If you only want to fade in once, remove the -RepeatCount
            svg.animate -Values '0;1' -AttributeName opacity -Begin '0s' -End '1s' -Dur '1s' -RepeatCount 'indefinite'
        )
    )
.Example
    svg -Content @(
        svg.defs @(
            svg.LinearGradient -Id myGradient -Content @(
                svg.stop -Stopcolor gold @(
                    svg.animate -AttributeName offset -Values '.1;.99;.1' -Dur 5s -RepeatCount indefinite
                )
                svg.stop -Stopcolor red @(
                    svg.animate -AttributeName offset -Values '100;0;100' -Dur 5s -RepeatCount indefinite
                )
            )
        )
        svg.rect -Fill 'url(#myGradient)' -x 0 -Y 0 -Width 100 -Height 100
    ) -ViewBox '0 0 100 100'
.Example
    svg -Content @(
        svg.defs @(
            svg.LinearGradient -Id myGradient -Content @(
                svg.stop -Stopcolor gold @(
                    svg.animate -AttributeName offset -Values '.1;.99;.1' -Dur 5s -RepeatCount indefinite
                )
                svg.stop -Stopcolor red @(
                    svg.animate -AttributeName offset -Values '100;0;100' -Dur 5s -RepeatCount indefinite
                )
            )
        )
        svg.rect -Fill 'url(#myGradient)' -x 0 -Y 0 -Width 100 -Height 100
    ) -ViewBox '0 0 100 100'
.Example
    $colors = @('red','green','blue')
    svg @(
        foreach ($n in 1..10) {
            $n10 = $n * 10
            svg.rect -X $n10 -Y $n10 -Width $n10 -Height $n10 -Style ([Ordered]@{
                fill   = $colors[$n % $colors.Length]
                stroke = $colors[($n + 1) % $colors.Length]
            }) @(
                svg.animate -AttributeName rx -Values "0;50;0" -Dur "10s" -RepeatCount indefinite
                svg.animate -AttributeName x -Values "$($n10);$(200 - $n10/2);$($n10);" -Dur "10s" -RepeatCount indefinite
            )
        }
    )
.Example
    $colors = @('red','green','blue')
    svg @(
        foreach ($n in 1..10) {
            $n10 = $n * 10
            svg.rect -X $n10 -Y $n10 -Width $n10 -Height $n10 -Style ([Ordered]@{
                fill   = $colors[$n % $colors.Length]
                stroke = $colors[($n + 1) % $colors.Length]
            }) @(
                svg.animate -AttributeName rx -Values "0;50;0" -Dur "10s" -RepeatCount indefinite
                svg.animate -AttributeName x -Values "$($n10);$(200 - $n10/2);$($n10);" -Dur "10s" -RepeatCount indefinite
            )
        }
    )
.Example
    svg -Content @(
        svg.polygon -Points "25,50 50,75 75,50 50,25" -Fill '#4488ff' @(
            svg.animate -AttributeName points -Values "25,50 50,75 75,50 50,25;0,0 0,100 100,100, 100,0; 25,50 50,75 75,50 50,25" -Dur 2s -Id morph1 -RepeatCount 'indefinite' -AttributeType XML
        )
    ) -ViewBox 100,100
.Example
    svg -ViewBox 100 -Content @(
        $splat = [Ordered]@{PointCount=6;CenterX=50;CenterY=50;Radius=50;fill='Transparent';Stroke='#4488ff'}
        SVG.Star @splat @(
            SVG.animate -AttributeName d -Values $(
                @(
                @(SVG.ConvexPolygon @splat).D;@(SVG.ConvexPolygon @splat -Rotate 90).D;@(SVG.ConvexPolygon @splat).D
                ) -join ';'
            ) -Dur 10s -RepeatCount 'indefinite'
        )
    )
.Example
    svg -Content @(
        svg.defs @(
            svg.LinearGradient -Id myGradient -Content @(
                svg.stop -Offset '10%' -Stopcolor transparent
                svg.stop -Offset '95%' -Stopcolor '#4488ff'
                svg.animate -AttributeName y1 -From 0 -To 1 -Id animateY1 -Fill freeze -Dur '3s'
                svg.animate -AttributeName y2 -Dur "3s" -From 1 -to 0 -Id 'animateY2' -Fill freeze -Begin 'animateY1.end'
                svg.animate -AttributeName x1 -Values '1;0' -Dur '3s' -Begin 'animateY2.end' -Fill freeze -Id animateX1
                svg.animate -AttributeName x2 -Values '0;1' -Dur '3s' -Begin 'animateX1.end' -Fill freeze
            ) -X1 100% -X2 0 -Y1 0% -Y2 100%
    
    
        )
        svg.rect -Fill 'url(#myGradient)' -Width 100 -Height 100
    ) -viewbox 0,0,100,100
.Example
    svg -Content @(
        svg.defs @(
            svg.LinearGradient -Id myGradient -Content @(
                svg.stop -Offset '10%' -Stopcolor transparent
                svg.stop -Offset '95%' -Stopcolor '#4488ff'
                svg.animate -AttributeName y1 -From 0 -To 1 -Id animateY1 -Fill freeze -Dur '3s'
                svg.animate -AttributeName y2 -Dur "3s" -From 1 -to 0 -Id 'animateY2' -Fill freeze -Begin 'animateY1.end'
                svg.animate -AttributeName x1 -Values '1;0' -Dur '3s' -Begin 'animateY2.end' -Fill freeze -Id animateX1
                svg.animate -AttributeName x2 -Values '0;1' -Dur '3s' -Begin 'animateX1.end' -Fill freeze
            ) -X1 100% -X2 0 -Y1 0% -Y2 100%
    
    
        )
        svg.rect -Fill 'url(#myGradient)' -Width 100 -Height 100
    ) -viewbox 0,0,100,100
.Example
    svg -Content @(
        svg.defs @(
            svg.LinearGradient -Id myGradient -Content @(
                svg.stop -Offset '10%' -Stopcolor transparent
                svg.stop -Offset '95%' -Stopcolor '#4488ff'
                svg.animate -AttributeName y1 -From 0 -To 1 -Id animateY1 -Fill freeze -Dur '3s'
                svg.animate -AttributeName y2 -Dur "3s" -From 1 -to 0 -Id 'animateY2' -Fill freeze -Begin 'animateY1.end'
                svg.animate -AttributeName x1 -Values '1;0' -Dur '3s' -Begin 'animateY2.end' -Fill freeze -Id animateX1
                svg.animate -AttributeName x2 -Values '0;1' -Dur '3s' -Begin 'animateX1.end' -Fill freeze
            ) -X1 100% -X2 0 -Y1 0% -Y2 100%
    
    
        )
        svg.rect -Fill 'url(#myGradient)' -Width 100 -Height 100
    ) -viewbox 0,0,100,100
.Example
    svg -Content @(
        svg.defs @(
            svg.LinearGradient -Id myGradient -Content @(
                svg.stop -Offset '10%' -Stopcolor transparent
                svg.stop -Offset '95%' -Stopcolor '#4488ff'
                svg.animate -AttributeName y1 -From 0 -To 1 -Id animateY1 -Fill freeze -Dur '3s'
                svg.animate -AttributeName y2 -Dur "3s" -From 1 -to 0 -Id 'animateY2' -Fill freeze -Begin 'animateY1.end'
                svg.animate -AttributeName x1 -Values '1;0' -Dur '3s' -Begin 'animateY2.end' -Fill freeze -Id animateX1
                svg.animate -AttributeName x2 -Values '0;1' -Dur '3s' -Begin 'animateX1.end' -Fill freeze
            ) -X1 100% -X2 0 -Y1 0% -Y2 100%
    
    
        )
        svg.rect -Fill 'url(#myGradient)' -Width 100 -Height 100
    ) -viewbox 0,0,100,100
.Example
    svg @(
        svg.filter -id dropShadow @(
            svg.feDropShadow -dx 0.5 -dy 0.75 -StdDeviation 0 @(
                svg.animate -AttributeName dx -Values '.5;-.5;.5' -Dur 1s -RepeatCount 'indefinite'
            )
            svg.feMerge @(
                svg.feMergeNode
                svg.feMergeNode -In 'SourceGraphic'
            )
        )
    
        svg.text "
    Moving Shadows
    " -TextAnchor middle -DominantBaseline middle -Fill '#4488ff' -FontSize 16 -X 50% -Y 50% -Filter 'url(#dropShadow)'
    ) -ViewBox 0,0,300,100
.Example
    svg -Content @(
        svg.defs @(
            svg.radialGradient -Id myGradient -Content @(
                svg.stop -Offset '1%' -Stopcolor gold @(
                    svg.animate -AttributeName offset -Values '.1;.99;.1' -Dur 5s -RepeatCount indefinite
                )
                svg.stop -Offset '100%' -Stopcolor red
            )
        )
        svg.circle -Fill 'url(#myGradient)' -Cx 50 -Cy 50 -R 35
    ) -ViewBox '0 0 100 100'
.Example
    param(
    # The number of repetitions
    [int]$RepeatCount = 80,
    # The Center X coordinate of the shape
    [float]$CenterX  = 100,
    # The Center Y coordinate of the shape
    [float]$CenterY  = 100,
    # The radius coordinate of the shape.  This will decrease by 1/RepeatCount each time.
    [float]$Radius   = 100,
    # The number of sides.  A file will be generated for each unique value provided.
    [int[]]$SideCount  = 3..6,
    # The total rotation of the innermost element,
    $TotalRotation  = 180,
    # The total duration of any animations.
    [timespan]$duration = '00:00:03.75',
    # A palette of colors to alternate thru
    [string[]]$Color = @('#112244','#224488',"#4488ff"),
    # The type of the shape. (either Star or ConvexPolygon)
    [ValidateSet("Star", "ConvexPolygon")]
    [string]
    $ShapeType = 'ConvexPolygon',
    
    # If set, will animate opacity between a low and high point, depending on the radius.
    [switch]
    $AnimateOpacity
    )
    
    
    $shapeCommand = $ExecutionContext.SessionState.InvokeCommand.GetCommand("SVG.$ShapeType", "Function")
    
    foreach ($Sides in $SideCount) {
        $Splat = [Ordered]@{
            SideCount = $Sides
            Fill = 'transparent'
            CenterX = $CenterX
            CenterY = $CenterY
        }
    
        SVG -ViewBox (($CenterX * 2), ($CenterY * 2)) @(
            0..($RepeatCount -1) |
                & $shapeCommand @Splat -Rotate {
                        $_ * ($totalRotation / $RepeatCount)
                } -Radius {
                    $Radius - (
                        $_ * ($Radius / $RepeatCount)
                    )
                } -Stroke {
                    $Color[$_ % $color.Length]
                } -Children {
                    $toRotation =  $(360 * ([Math]::Ceiling(($_ + 1)/10)))
                    SVG.animateTransform -From "0 $centerX $centerY" -To "$toRotation $centerX $centerY" -Dur $duration -AttributeName transform -Type 'rotate' -RepeatCount 'indefinite'
                    $lowOpacity = [double]($_)/$RepeatCount
                    $highOpacity = 1.0 - [double]($_)/$RepeatCount
                    if ($AnimateOpacity) {
                        SVG.animate -AttributeName opacity -Values "$highOpacity;$lowOpacity;$highOpacity" -Dur $dur -RepeatCount 'indefinite'
                    }
                }
        )
.Example
    svg @(
        svg.ConvexPolygon -SideCount 8 -Rotate (360/16) -Fill '#dd0000' -Stroke white -CenterX 100 -CenterY 100 -Radius 100
    
        svg.text -X 50% -Y 50% -DominantBaseline 'middle' -TextAnchor 'middle' -FontSize 64 -FontFamily sans-serif -Fill white @(
            svg.tspan -Content "STOP" -Id stop
            svg.animate -Values '64;66;64' -Dur 5s -AttributeName font-size -RepeatDur 'indefinite'
        )
    
        svg.text -X 50% -Y 65% -DominantBaseline 'middle' -TextAnchor 'middle' -FontSize 12 -FontFamily sans-serif -Fill white -Content @(
            svg.tspan -Content "USING" -Id using
            svg.animate -Values '12;13;12' -Dur 5s -AttributeName font-size -RepeatDur 'indefinite'
    
        )
    
        svg.text -X 50% -Y 80% -DominantBaseline 'middle' -TextAnchor 'middle' -FontSize 32 -FontFamily sans-serif -Fill white -Content @(
            svg.tspan -Content "GIFS" -Id gif
            svg.animate -Values '28;30;28' -Dur 5s -AttributeName font-size -RepeatDur 'indefinite'
        )
    ) -ViewBox 200,200
.Example
    svg @(
        svg.ConvexPolygon -SideCount 8 -Rotate (360/16) -Fill '#dd0000' -Stroke white -CenterX 100 -CenterY 100 -Radius 100
    
        svg.text -X 50% -Y 50% -DominantBaseline 'middle' -TextAnchor 'middle' -FontSize 64 -FontFamily sans-serif -Fill white @(
            svg.tspan -Content "STOP" -Id stop
            svg.animate -Values '64;66;64' -Dur 5s -AttributeName font-size -RepeatDur 'indefinite'
        )
    
        svg.text -X 50% -Y 65% -DominantBaseline 'middle' -TextAnchor 'middle' -FontSize 12 -FontFamily sans-serif -Fill white -Content @(
            svg.tspan -Content "USING" -Id using
            svg.animate -Values '12;13;12' -Dur 5s -AttributeName font-size -RepeatDur 'indefinite'
    
        )
    
        svg.text -X 50% -Y 80% -DominantBaseline 'middle' -TextAnchor 'middle' -FontSize 32 -FontFamily sans-serif -Fill white -Content @(
            svg.tspan -Content "GIFS" -Id gif
            svg.animate -Values '28;30;28' -Dur 5s -AttributeName font-size -RepeatDur 'indefinite'
        )
    ) -ViewBox 200,200
.Example
    svg @(
        svg.ConvexPolygon -SideCount 8 -Rotate (360/16) -Fill '#dd0000' -Stroke white -CenterX 100 -CenterY 100 -Radius 100
    
        svg.text -X 50% -Y 50% -DominantBaseline 'middle' -TextAnchor 'middle' -FontSize 64 -FontFamily sans-serif -Fill white @(
            svg.tspan -Content "STOP" -Id stop
            svg.animate -Values '64;66;64' -Dur 5s -AttributeName font-size -RepeatDur 'indefinite'
        )
    
        svg.text -X 50% -Y 65% -DominantBaseline 'middle' -TextAnchor 'middle' -FontSize 12 -FontFamily sans-serif -Fill white -Content @(
            svg.tspan -Content "USING" -Id using
            svg.animate -Values '12;13;12' -Dur 5s -AttributeName font-size -RepeatDur 'indefinite'
    
        )
    
        svg.text -X 50% -Y 80% -DominantBaseline 'middle' -TextAnchor 'middle' -FontSize 32 -FontFamily sans-serif -Fill white -Content @(
            svg.tspan -Content "GIFS" -Id gif
            svg.animate -Values '28;30;28' -Dur 5s -AttributeName font-size -RepeatDur 'indefinite'
        )
    ) -ViewBox 200,200
.Example
    svg @(
        svg.ConvexPolygon -SideCount 8 -Rotate (360/16) -Fill '#4488ff' -Stroke '#4488ff' -CenterX 100 -CenterY 100 -Radius 50
        SVG.animate -AttributeName viewBox -Values "0 0 200 200; 50 50 100 100; 0 0 200 200" -RepeatCount 'indefinite' -Dur 3.9
    ) -ViewBox 200,200
.Link
    https://pssvg.start-automating.com/SVG.animate
.Link
    https://developer.mozilla.org/en-US/web/svg/element/animate/
.Link
    Write-SVG
#>
[Reflection.AssemblyMetadata('SVG.ElementName', 'animate')]
[CmdletBinding(PositionalBinding=$false)]
[OutputType([Xml.XmlElement])]
param(
# The Contents of the animate element
[Parameter(Position=0,ValueFromPipeline,ValueFromPipelineByPropertyName)]
[Alias('InputObject','Text', 'InnerText', 'Contents')]
$Content,
# A dictionary containing data.  This data will be embedded in data- attributes.
[Parameter(ValueFromPipelineByPropertyName)]
[Alias('DataAttribute','DataAttributes')]
[Collections.IDictionary]
$Data,
# A dictionary or object containing event handlers.
# Each key or property name will be the name of the event
# Each value will be the handler.
[Parameter(ValueFromPipelineByPropertyName)]
$On,
# A dictionary of attributes.  This can set any attribute not exposed in other parameters.
[Parameter(ValueFromPipelineByPropertyName)]
[Alias('SVGAttributes','SVGAttribute')]
[Collections.IDictionary]
$Attribute = [Ordered]@{},
# A comment that will appear before the element.
[Parameter(ValueFromPipelineByPropertyName)]
[Alias('Comments')]
[String]
$Comment,
<#
If provided, will decorate outputted objects with a typename.
This can allow for custom formatting and extended types.        
If nothing was provided, each output will be decorated with it's ElementName.
#>
[Parameter(ValueFromPipelineByPropertyName)]
[Alias('PSTypeName','PSTypeNames','TypeName','TypeNames','Decoration','Decorations')]
[String]
$Decorate,
# One or more child elements.  These will be treated as if they were content.
[Parameter(ValueFromPipelineByPropertyName)]
[Alias('Child')]
[Management.Automation.PSObject]
$Children,
# The **`href`** attribute defines a link to a resource as a reference [URL](https://developer.mozilla.org/en-US/docs/Web/SVG/Content_type#url). The exact meaning of that link depends on the context of each element using it.
# 
# > **Note:** Specifications before SVG 2 defined an xlink:href attribute, which is now rendered obsolete by the `href` attribute. If you need to support earlier browser versions, the deprecated `xlink:href` attribute can be used as a fallback in addition to the `href` attribute, e.g. `<use href="some-id" xlink:href="some-id" x="5" y="5" />`.
# 
# 
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','href')]
[Reflection.AssemblyMetaData('SVG.Value', '<url>')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'False')]
[PSObject]
$Href,
# The **`attributeType`** attribute specifies the namespace in which the target attribute and its associated values are defined.
# 
# 
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','attributeType')]
[Reflection.AssemblyMetaData('SVG.Deprecated',$true)]
[Reflection.AssemblyMetaData('SVG.Value', 'CSS | XML | auto')]
[ArgumentCompleter({
    param ( $commandName,$parameterName,$wordToComplete,$commandAst,$fakeBoundParameters )    

    $validSet = 'CSS','XML','auto'
    if ($wordToComplete) {        
        $toComplete = $wordToComplete -replace "^'" -replace "'$"
        return @($validSet -like "$toComplete*" -replace '^', "'" -replace '$',"'")
    } else {
        return @($validSet -replace '^', "'" -replace '$',"'")
    }
})]
[Reflection.AssemblyMetaData('SVG.Default value', 'auto')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'False')]
[PSObject]
$AttributeType,
# The **`attributeName`** attribute indicates the name of the CSS property or attribute of the target element that is going to be changed during an animation.
# 
# 
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','attributeName')]
[Reflection.AssemblyMetaData('SVG.Value', '<name>')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'False')]
[PSObject]
$AttributeName,
# The **`begin`** attribute defines when an animation should begin.
# 
# The attribute value is a semicolon separated list of values. The interpretation of a list of start times is detailed in the SMIL specification in ["Evaluation of begin and end time lists"](https://developer.mozilla.orghttps://www.w3.org/TR/2001/REC-smil-animation-20010904/#Timing-EvaluationOfBeginEndTimeLists). Each individual value can be one of the following: `<offset-value>`, `<syncbase-value>`, `<event-value>`, `<repeat-value>`, `<accessKey-value>`, `<wallclock-sync-value>` or the keyword `indefinite`.
# 
# 
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','begin')]
[Reflection.AssemblyMetaData('SVG.Value', '<begin-value-list>')]
[Reflection.AssemblyMetaData('SVG.Default value', '0s')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'False')]
[PSObject]
$Begin,
# The **`dur`** attribute indicates the simple duration of an animation.
# 
# 
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','dur')]
[Reflection.AssemblyMetaData('SVG.Value', '<clock-value> | media | indefinite')]
[ArgumentCompleter({
    param ( $commandName,$parameterName,$wordToComplete,$commandAst,$fakeBoundParameters )    

    $validSet = '<clock-value>','media','indefinite'
    if ($wordToComplete) {        
        $toComplete = $wordToComplete -replace "^'" -replace "'$"
        return @($validSet -like "$toComplete*" -replace '^', "'" -replace '$',"'")
    } else {
        return @($validSet -replace '^', "'" -replace '$',"'")
    }
})]
[Reflection.AssemblyMetaData('SVG.Default value', 'indefinite')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'False')]
[Alias('Duration')]
[PSObject]
$Dur,
# The **`end`** attribute defines an end value for the animation that can constrain the active duration.
# 
# 
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','end')]
[Reflection.AssemblyMetaData('SVG.Value', '<end-value-list>')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'False')]
[PSObject]
$End,
# The **`min`** attribute specifies the minimum value of the active animation duration.
# 
# 
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','min')]
[Reflection.AssemblyMetaData('SVG.Value', '<clock-value>')]
[Reflection.AssemblyMetaData('SVG.Default value', '0')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'False')]
[PSObject]
$Min,
# The **`max`** attribute specifies the maximum value of the active animation duration.
# 
# 
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','max')]
[Reflection.AssemblyMetaData('SVG.Value', '<clock-value>')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'False')]
[PSObject]
$Max,
# The **`restart`** attribute specifies whether or not an animation can restart.
# 
# 
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','restart')]
[Reflection.AssemblyMetaData('SVG.Value', 'always | whenNotActive | never')]
[ArgumentCompleter({
    param ( $commandName,$parameterName,$wordToComplete,$commandAst,$fakeBoundParameters )    

    $validSet = 'always','whenNotActive','never'
    if ($wordToComplete) {        
        $toComplete = $wordToComplete -replace "^'" -replace "'$"
        return @($validSet -like "$toComplete*" -replace '^', "'" -replace '$',"'")
    } else {
        return @($validSet -replace '^', "'" -replace '$',"'")
    }
})]
[Reflection.AssemblyMetaData('SVG.Default value', 'always')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'False')]
[PSObject]
$Restart,
# The **`repeatCount`** attribute indicates the number of times an animation will take place.
# 
# 
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','repeatCount')]
[Reflection.AssemblyMetaData('SVG.Value', '{{cssxref("number")}} | indefinite')]
[ValidatePattern('(?>indefinite|\d+)')]
[ArgumentCompleter({
    param ( $commandName,$parameterName,$wordToComplete,$commandAst,$fakeBoundParameters )    

    $validSet = '<number>','indefinite'
    if ($wordToComplete) {        
        $toComplete = $wordToComplete -replace "^'" -replace "'$"
        return @($validSet -like "$toComplete*" -replace '^', "'" -replace '$',"'")
    } else {
        return @($validSet -replace '^', "'" -replace '$',"'")
    }
})]
[Reflection.AssemblyMetaData('SVG.Animatable', 'False')]
[PSObject]
$RepeatCount,
# The **`repeatDur`** attribute specifies the total duration for repeating an animation.
# 
# 
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','repeatDur')]
[Reflection.AssemblyMetaData('SVG.Value', '<clock-value> | indefinite')]
[ArgumentCompleter({
    param ( $commandName,$parameterName,$wordToComplete,$commandAst,$fakeBoundParameters )    

    $validSet = '<clock-value>','indefinite'
    if ($wordToComplete) {        
        $toComplete = $wordToComplete -replace "^'" -replace "'$"
        return @($validSet -like "$toComplete*" -replace '^', "'" -replace '$',"'")
    } else {
        return @($validSet -replace '^', "'" -replace '$',"'")
    }
})]
[Reflection.AssemblyMetaData('SVG.Default values', 'None')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'False')]
[PSObject]
$RepeatDur,
# The **`fill`** attribute has two different meanings. For shapes and text it's a presentation attribute that defines the color (_or any SVG paint servers like gradients or patterns_) used to paint the element; for animation it defines the final state of the animation.
# 
# 
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','fill')]
[Reflection.AssemblyMetaData('SVG.Value', 'freeze (Keep the state of the last animation frame) | remove (Keep the state of the first animation frame)')]
[ArgumentCompleter({
    param ( $commandName,$parameterName,$wordToComplete,$commandAst,$fakeBoundParameters )    

    $validSet = 'freeze (Keep the state of the last animation frame)','remove (Keep the state of the first animation frame)'
    if ($wordToComplete) {        
        $toComplete = $wordToComplete -replace "^'" -replace "'$"
        return @($validSet -like "$toComplete*" -replace '^', "'" -replace '$',"'")
    } else {
        return @($validSet -replace '^', "'" -replace '$',"'")
    }
})]
[Reflection.AssemblyMetaData('SVG.Default value', 'remove')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'False')]
[PSObject]
$Fill,
# The **`calcMode`** attribute specifies the interpolation mode for the animation.
# 
# The default mode is `linear`, however if the attribute does not support linear interpolation (e.g. for strings), the `calcMode` attribute is ignored and discrete interpolation is used.
# 
# 
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','calcMode')]
[Reflection.AssemblyMetaData('SVG.Value', 'discrete | linear | paced | spline')]
[ArgumentCompleter({
    param ( $commandName,$parameterName,$wordToComplete,$commandAst,$fakeBoundParameters )    

    $validSet = 'discrete','linear','paced','spline'
    if ($wordToComplete) {        
        $toComplete = $wordToComplete -replace "^'" -replace "'$"
        return @($validSet -like "$toComplete*" -replace '^', "'" -replace '$',"'")
    } else {
        return @($validSet -replace '^', "'" -replace '$',"'")
    }
})]
[Reflection.AssemblyMetaData('SVG.Default value', 'linear')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'False')]
[PSObject]
$CalcMode,
# The `values` attribute has different meanings, depending upon the context where it's used, either it defines a sequence of values used over the course of an animation, or it's a list of numbers for a color matrix, which is interpreted differently depending on the type of color change to be performed.
# 
# 
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','values')]
[Reflection.AssemblyMetaData('SVG.Value', '<list-of-values>')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'False')]
[PSObject]
$Values,
# The **`keyTimes`** attribute represents a list of time values used to control the pacing of the animation.
# 
# Each time in the list corresponds to a value in the values attribute list, and defines when the value is used in the animation. Each time value in the `keyTimes` list is specified as a floating point value between 0 and 1 (inclusive), representing a proportional offset into the duration of the animation element.
# 
# 
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','keyTimes')]
[Reflection.AssemblyMetaData('SVG.Value', '{{cssxref("number")}} [ ; {{cssxref("number")}} ]* ;?')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'False')]
[PSObject]
$KeyTimes,
# The **`keySplines`** attribute defines a set of [Bézier curve](https://developer.mozilla.org/en-US/docs/Glossary/Bezier_curve) control points associated with the keyTimes list, defining a cubic Bézier function that controls interval pacing.
# 
# This attribute is ignored unless the calcMode attribute is set to `spline`.
# 
# If there are any errors in the keySplines specification (bad values, too many or too few values), the animation will not occur.
# 
# 
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','keySplines')]
[Reflection.AssemblyMetaData('SVG.Value', '<control-point> [ ;<control-point> ]* ;?')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'False')]
[PSObject]
$KeySplines,
# The **`from`** attribute indicates the initial value of the attribute that will be modified during the animation.
# 
# When used with the to attribute, the animation will change the modified attribute from the `from` value to the `to` value. When used with the by attribute, the animation will change the attribute relatively from the `from` value by the value specified in `by`.
# 
# 
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','from')]
[Reflection.AssemblyMetaData('SVG.Value', 'See below')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'False')]
[PSObject]
$From,
# The **`to`** attribute indicates the final value of the attribute that will be modified during the animation.
# 
# The value of the attribute will change between the from attribute value and this value.
# 
# 
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','to')]
[Reflection.AssemblyMetaData('SVG.Value', '<value>')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'False')]
[PSObject]
$To,
# The **`by`** attribute specifies a relative offset value for an attribute that will be modified during an animation.
# 
# The starting value for the attribute is either indicated by specifying it as value for the attribute given in the attributeName or the from attribute.
# 
# 
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','by')]
[Reflection.AssemblyMetaData('SVG.Value', 'See below')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'False')]
[PSObject]
$By,
# The **`additive`** attribute controls whether or not an animation is additive.
# 
# It is frequently useful to define animation as an offset or delta to an attribute's value, rather than as absolute values.
# 
# 
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','additive')]
[Reflection.AssemblyMetaData('SVG.Value', 'replace | sum')]
[ArgumentCompleter({
    param ( $commandName,$parameterName,$wordToComplete,$commandAst,$fakeBoundParameters )    

    $validSet = 'replace','sum'
    if ($wordToComplete) {        
        $toComplete = $wordToComplete -replace "^'" -replace "'$"
        return @($validSet -like "$toComplete*" -replace '^', "'" -replace '$',"'")
    } else {
        return @($validSet -replace '^', "'" -replace '$',"'")
    }
})]
[Reflection.AssemblyMetaData('SVG.Default value', 'replace')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'False')]
[PSObject]
$Additive,
# The **`accumulate`** attribute controls whether or not an animation is cumulative.
# 
# It is frequently useful for repeated animations to build upon the previous results, accumulating with each iteration. This attribute said to the animation if the value is added to the previous animated attribute's value on each iteration.
# 
# 
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','accumulate')]
[Reflection.AssemblyMetaData('SVG.Value', 'none | sum')]
[ArgumentCompleter({
    param ( $commandName,$parameterName,$wordToComplete,$commandAst,$fakeBoundParameters )    

    $validSet = 'none','sum'
    if ($wordToComplete) {        
        $toComplete = $wordToComplete -replace "^'" -replace "'$"
        return @($validSet -like "$toComplete*" -replace '^', "'" -replace '$',"'")
    } else {
        return @($validSet -replace '^', "'" -replace '$',"'")
    }
})]
[Reflection.AssemblyMetaData('SVG.Animatable', 'False')]
[PSObject]
$Accumulate,
# The **`id`** attribute assigns a unique name to an element.
# 
# You can use this attribute with any SVG element.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','id')]
[Reflection.AssemblyMetaData('SVG.Value', '<id>')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'False')]
[PSObject]
$Id,
# The **`lang`** attribute specifies the primary language used in contents and attributes containing text content of particular elements.
# 
# There is also an xml:lang attribute (with namespace). If both of them are defined, the one with namespace is used and the one without is ignored.
# 
# In SVG 1.1 there was a `lang` attribute defined with a different meaning and only applying to glyph elements. That attribute specified a list of languages according to {{RFC(5646, "Tags for Identifying Languages (also known as BCP 47)")}}. The glyph was meant to be used if the `xml:lang` attribute exactly matched one of the languages given in the value of this parameter, or if the `xml:lang` attribute exactly equaled a prefix of one of the languages given in the value of this parameter such that the first tag character following the prefix was "-".
# 
# You can use this attribute with any SVG element.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','lang')]
[Reflection.AssemblyMetaData('SVG.Value', '<language-tag>')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'False')]
[PSObject]
$Lang,
# The **`tabindex`** attribute allows you to control whether an element is focusable and to define the relative order of the element for the purposes of sequential focus navigation.
# 
# You can use this attribute with any SVG element.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','tabindex')]
[Reflection.AssemblyMetaData('SVG.Value', 'valid integer')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'False')]
[PSObject]
$Tabindex,
# The **`xml:base`** attribute specifies a base IRI other than the base IRI of the document or external entity.
# 
# You can use this attribute with any SVG element.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','xml:base')]
[Reflection.AssemblyMetaData('SVG.Deprecated',$true)]
[Reflection.AssemblyMetaData('SVG.Value', '<iri>')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'False')]
[PSObject]
$XmlBase,
# The **`xml:lang`** attribute specifies the primary language used in contents and attributes containing text content of particular elements.
# 
# It is a universal attribute allowed in all XML dialects to mark up the natural human language that an element contains.
# 
# There is also a lang attribute (without namespace). If both of them are defined, the one with namespace is used and the one without is ignored.
# 
# You can use this attribute with any SVG element.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','xml:lang')]
[Reflection.AssemblyMetaData('SVG.Deprecated',$true)]
[Reflection.AssemblyMetaData('SVG.Value', '<language-tag>')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'False')]
[PSObject]
$XmlLang,
# SVG supports the built-in XML **`xml:space`** attribute to handle whitespace characters inside elements. Child elements inside an element may also have an `xml:space` attribute that overrides the parent's one.
# 
# > **Note:** Instead of using the `xml:space` attribute, use the white-space CSS property.
# 
# This attribute influences how browsers parse text content and therefore changes the way the DOM is built. Therefore, changing this attribute's value through the DOM API may have no effect.
# 
# You can use this attribute with any SVG element.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','xml:space')]
[Reflection.AssemblyMetaData('SVG.Deprecated',$true)]
[Reflection.AssemblyMetaData('SVG.Value', 'default | preserve')]
[ArgumentCompleter({
    param ( $commandName,$parameterName,$wordToComplete,$commandAst,$fakeBoundParameters )    

    $validSet = 'default','preserve'
    if ($wordToComplete) {        
        $toComplete = $wordToComplete -replace "^'" -replace "'$"
        return @($validSet -like "$toComplete*" -replace '^', "'" -replace '$',"'")
    } else {
        return @($validSet -replace '^', "'" -replace '$',"'")
    }
})]
[Reflection.AssemblyMetaData('SVG.Default value', 'default')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'False')]
[PSObject]
$XmlSpace,
# « [SVG Attribute reference home](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute)
# 
# Assigns a class name or set of class names to an element. You may assign the same class name or names to any number of elements, however, multiple class names must be separated by whitespace characters.
# 
# An element's class name serves two key roles:
# 
# - As a style sheet selector, for when an author assigns style information to a set of elements.
# - For general use by the browser.
# 
# You can use this class to style SVG content using CSS.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','class')]
[Reflection.AssemblyMetaData('SVG.Categories', 'None')]
[Reflection.AssemblyMetaData('SVG.Value', '<list-of-class-names>')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'True')]
[Reflection.AssemblyMetaData('SVG.Normative document', 'SVG 1.1 (2nd Edition): The class attribute')]
[PSObject]
$Class,
# The **`style`** attribute allows to style an element using CSS declarations. It functions identically to [the `style` attribute in HTML](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/style).
# 
# You can use this attribute with any SVG element.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','style')]
[Reflection.AssemblyMetaData('SVG.Value', '<style>')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'False')]
[PSObject]
$Style
)


process {

        # Copy the bound parameters
        $paramCopy = [Ordered]@{} + $PSBoundParameters
        # and get a reference to yourself.
        $myCmd = $MyInvocation.MyCommand

        # Use that self-reference to determine the element name.
        $elementName = foreach ($myAttr in $myCmd.ScriptBlock.Attributes) {
            if ($myAttr.Key -eq 'SVG.ElementName') {
                $myAttr.Value
                break
            }
        }
        # If we could not determine this, return.
        if (-not $elementName) { return }

        # If there were no keys found in -Attribute
        if (-not $attribute[$paramCopy.Keys]) {
            $attribute += $paramCopy # merge the values by adding hashtables.
        } else {
            # Otherwise copy into -Attribute one-by-one.
            foreach ($pc in $paramCopy.GetEnumerator()) {
                $attribute[$pc.Key] = $pc.Value
            }
        }

        # All commands will call Write-SVG.  Prepare a splat.
        $writeSvgSplat = @{
            ElementName = $elementName
            Attribute   = $attribute
        }

        # If content was provided
        if ($null -ne $content) {
            # put it into the splat.
            $writeSvgSplat.Content = $content
        }

        # If comments were provided
        if ($comment) {
            # put it into the splat.
            $writeSvgSplat.Comment = $comment
        }

        # If any children were provided
        if ($children) {
            # put them in the splat.
            $writeSvgSplat.Children = $children
        }

        # If we provided an -OutputPath
        if ($paramCopy['OutputPath']) {
            # put it into the splat.
            $writeSvgSplat.OutputPath = $paramCopy['OutputPath']
        }

        # If we provided any -Data attributes
        if ($data) {
            # put it into the splat.
            $writeSvgSplat.Data = $data
        }

        # If we provided any -On events
        if ($on) {
            # put it into the splat.
            $writeSvgSplat.On = $on
        }

        . Write-SVG @writeSvgSplat
    
}


} 

