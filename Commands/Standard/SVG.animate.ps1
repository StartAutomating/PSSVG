function SVG.animate {

<#
.Synopsis
    Creates SVG animate elements
.Description
    The SVG **`<animate>`** element provides a way to animate an attribute of an element over time.
.Example
    param(
    [string]
    $Fill = '#4488ff',
    
    # The duration of the animation.
    [Timespan]
    $Duration = "00:00:10"
    )
    
    SVG -ViewBox 0,0,10,10 (
        SVG.rect -Width 10 -Height 10 @(
            SVG.animate -AttributeName rx -Values "0;5;0" -Dur "$($duration.TotalSeconds)s" -RepeatCount indefinite
            SVG.animate -AttributeName ry -Values "0;5;0" -Dur "$($duration.TotalSeconds)s" -RepeatCount indefinite
        ) -Fill $Fill
    )
.Example
    param(
    [string]
    $Fill = '#4488ff',
    
    # The duration of the animation.
    [Timespan]
    $Duration = "00:00:10"
    )
    
    SVG -ViewBox 0,0,10,10 (
        SVG.rect -Width 10 -Height 10 @(
            SVG.animate -AttributeName rx -Values "0;5;0" -Dur "$($duration.TotalSeconds)s" -RepeatCount indefinite
            SVG.animate -AttributeName ry -Values "0;5;0" -Dur "$($duration.TotalSeconds)s" -RepeatCount indefinite
        ) -Fill $Fill
    )
.Example
    param(
    # The fill color of the circle
    [string[]]$Fill = @('red','orange','yellow','green','blue','indigo','violet','red'),
    # The stroke color of the circle
    [string[]]$Stroke = @('orange','yellow','green','blue','indigo','violet','red','orange'),
    
    # The duration of the animation.
    [Timespan]
    $Duration = "00:00:10",
    
    # The stroke thickness of the circle
    [int[]]
    $strokeThickness = @(1,2,3,4,5,6,7,8,9,10)
    )
    
    SVG -Content @(
        SVG.circle -cx 50 -cy 50 -r 50 -Fill red @(
            SVG.animate -AttributeName fill -dur $($Duration.TotalSeconds) -Values ($Fill -join ';') -RepeatCount indefinite
            SVG.animate -AttributeName stroke -dur $($Duration.TotalSeconds) -Values ($Stroke -join ';') -RepeatCount indefinite
            SVG.animate -AttributeName stroke-thickness -Dur $($Duration.TotalSeconds) -Values ($strokeThickness -join ';') -RepeatCount indefinite
        ) -Stroke orange
    )  -ViewBox 0,0,100,100
.Example
    param(
    # The fill color of the circle
    [string[]]$Fill = @('red','orange','yellow','green','blue','indigo','violet','red'),
    # The stroke color of the circle
    [string[]]$Stroke = @('orange','yellow','green','blue','indigo','violet','red','orange'),
    
    # The duration of the animation.
    [Timespan]
    $Duration = "00:00:10",
    
    # The stroke thickness of the circle
    [int[]]
    $strokeThickness = @(1,2,3,4,5,6,7,8,9,10)
    )
    
    SVG -Content @(
        SVG.circle -cx 50 -cy 50 -r 50 -Fill red @(
            SVG.animate -AttributeName fill -dur $($Duration.TotalSeconds) -Values ($Fill -join ';') -RepeatCount indefinite
            SVG.animate -AttributeName stroke -dur $($Duration.TotalSeconds) -Values ($Stroke -join ';') -RepeatCount indefinite
            SVG.animate -AttributeName stroke-thickness -Dur $($Duration.TotalSeconds) -Values ($strokeThickness -join ';') -RepeatCount indefinite
        ) -Stroke orange
    )  -ViewBox 0,0,100,100
.Example
    param(
    # The fill color of the circle
    [string[]]$Fill = @('red','orange','yellow','green','blue','indigo','violet','red'),
    # The stroke color of the circle
    [string[]]$Stroke = @('orange','yellow','green','blue','indigo','violet','red','orange'),
    
    # The duration of the animation.
    [Timespan]
    $Duration = "00:00:10",
    
    # The stroke thickness of the circle
    [int[]]
    $strokeThickness = @(1,2,3,4,5,6,7,8,9,10)
    )
    
    SVG -Content @(
        SVG.circle -cx 50 -cy 50 -r 50 -Fill red @(
            SVG.animate -AttributeName fill -dur $($Duration.TotalSeconds) -Values ($Fill -join ';') -RepeatCount indefinite
            SVG.animate -AttributeName stroke -dur $($Duration.TotalSeconds) -Values ($Stroke -join ';') -RepeatCount indefinite
            SVG.animate -AttributeName stroke-thickness -Dur $($Duration.TotalSeconds) -Values ($strokeThickness -join ';') -RepeatCount indefinite
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
    param(
    [Alias('BPM')]
    [double]
    $BeatsPerMinute = 90
    )
    
    $bpm = $BeatsPerMinute
    $animateDuration = "$([Math]::Round(1/($bpm / 90), 4))s"
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
    param(
    [Alias('BPM')]
    [double]
    $BeatsPerMinute = 90
    )
    
    $bpm = $BeatsPerMinute
    $animateDuration = "$([Math]::Round(1/($bpm / 90), 4))s"
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
    param(
    [Alias('BPM')]
    [double]
    $BeatsPerMinute = 90
    )
    
    $bpm = $BeatsPerMinute
    $animateDuration = "$([Math]::Round(1/($bpm / 90), 4))s"
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
    param(
    [Alias('BPM')]
    [double]
    $BeatsPerMinute = 90
    )
    
    $bpm = $BeatsPerMinute
    $animateDuration = "$([Math]::Round(1/($bpm / 90), 4))s"
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
    param(
    [Alias('BPM')]
    [double]
    $BeatsPerMinute = 90
    )
    
    $bpm = $BeatsPerMinute
    $animateDuration = "$([Math]::Round(1/($bpm / 90), 4))s"
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
    param(
    [Alias('BPM')]
    [double]
    $BeatsPerMinute = 90
    )
    
    $bpm = $BeatsPerMinute
    $animateDuration = "$([Math]::Round(1/($bpm / 90), 4))s"
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
    param(
    [Alias('BPM')]
    [double]
    $BeatsPerMinute = 90
    )
    
    $bpm = $BeatsPerMinute
    $animateDuration = "$([Math]::Round(1/($bpm / 90), 4))s"
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
    param(
    [Alias('BPM')]
    [double]
    $BeatsPerMinute = 90
    )
    
    $bpm = $BeatsPerMinute
    $animateDuration = "$([Math]::Round(1/($bpm / 90), 4))s"
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
    param(
    [Alias('BPM')]
    [double]
    $BeatsPerMinute = 90
    )
    
    $bpm = $BeatsPerMinute
    $animateDuration = "$([Math]::Round(1/($bpm / 90), 4))s"
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
    param(
    [Alias('BPM')]
    [double]
    $BeatsPerMinute = 90
    )
    
    $bpm = $BeatsPerMinute
    $animateDuration = "$([Math]::Round(1/($bpm / 90), 4))s"
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
    param(
    [Alias('BPM')]
    [double]
    $BeatsPerMinute = 90
    )
    
    $bpm = $BeatsPerMinute
    $animateDuration = "$([Math]::Round(1/($bpm / 90), 4))s"
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
    param(
    [Alias('BPM')]
    [double]
    $BeatsPerMinute = 90
    )
    
    $bpm = $BeatsPerMinute
    $animateDuration = "$([Math]::Round(1/($bpm / 90), 4))s"
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
    param(
    [Alias('BPM')]
    [double]
    $BeatsPerMinute = 90
    )
    
    $bpm = $BeatsPerMinute
    $animateDuration = "$([Math]::Round(1/($bpm / 90), 4))s"
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
    param(
    [Alias('BPM')]
    [double]
    $BeatsPerMinute = 90
    )
    
    $bpm = $BeatsPerMinute
    $animateDuration = "$([Math]::Round(1/($bpm / 90), 4))s"
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
    param(
    [Alias('BPM')]
    [double]
    $BeatsPerMinute = 90
    )
    
    $bpm = $BeatsPerMinute
    $animateDuration = "$([Math]::Round(1/($bpm / 90), 4))s"
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
    param(
    [Alias('BPM')]
    [double]
    $BeatsPerMinute = 90
    )
    
    $bpm = $BeatsPerMinute
    $animateDuration = "$([Math]::Round(1/($bpm / 90), 4))s"
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
    param(
    [Alias('BPM')]
    [double]
    $BeatsPerMinute = 90
    )
    
    $bpm = $BeatsPerMinute
    $animateDuration = "$([Math]::Round(1/($bpm / 90), 4))s"
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
    param(
    [Alias('BPM')]
    [double]
    $BeatsPerMinute = 90
    )
    
    $bpm = $BeatsPerMinute
    $animateDuration = "$([Math]::Round(1/($bpm / 90), 4))s"
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
    param(
    [Alias('BPM')]
    [double]
    $BeatsPerMinute = 90
    )
    
    $bpm = $BeatsPerMinute
    $animateDuration = "$([Math]::Round(1/($bpm / 90), 4))s"
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
    param(
    [Alias('BPM')]
    [double]
    $BeatsPerMinute = 90
    )
    
    $bpm = $BeatsPerMinute
    $animateDuration = "$([Math]::Round(1/($bpm / 90), 4))s"
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
    param(
    [Alias('BPM')]
    [double]
    $BeatsPerMinute = 90
    )
    
    $bpm = $BeatsPerMinute
    $animateDuration = "$([Math]::Round(1/($bpm / 90), 4))s"
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
    param(
    [Alias('BPM')]
    [double]
    $BeatsPerMinute = 90
    )
    
    $bpm = $BeatsPerMinute
    $animateDuration = "$([Math]::Round(1/($bpm / 90), 4))s"
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
    param(
    [Alias('BPM')]
    [double]
    $BeatsPerMinute = 90
    )
    
    $bpm = $BeatsPerMinute
    $animateDuration = "$([Math]::Round(1/($bpm / 90), 4))s"
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
    param(
    [Alias('BPM')]
    [double]
    $BeatsPerMinute = 90
    )
    
    $bpm = $BeatsPerMinute
    $animateDuration = "$([Math]::Round(1/($bpm / 90), 4))s"
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
    )
.Example
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
    param(
    # The Message to display
    [string]
    $Message = "Fading in",
    
    # The fill color of the text
    [string]
    $Fill = '#4488ff',
    
    # One or more CSS classes to apply to the text
    [string[]]
    $Class,
    
    # The font size of the text
    [string]
    $FontSize = "26em",
    
    # The duration of the animation.
    [Timespan]
    $Duration = "00:00:02",
    
    [string]
    $RepeatCount = 'indefinite'
    )
    
    svg -ViewBox 0,0,1920,1080 -Content (
        svg.g -Content @(
            svg.text -Y "50%" -X "50%" -DominantBaseline middle -TextAnchor middle -Text $Message -Fill $fill -Class $Class -fontSize $FontSize
    
            # If you only want to fade in once, remove the -RepeatCount
            svg.animate -Values '0;1' -AttributeName opacity -Begin '0s' -End "$($Duration.TotalSeconds)" -Dur "$($duration.TotalSeconds)s" -RepeatCount $RepeatCount
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
    param(
    [Alias('Color','Colour','Colours')]
    [string[]]
    $colors = @('red','green','blue'),
    
    [timespan]
    $Duration = '00:00:10'
    )
    
    svg @(
        foreach ($n in 1..10) {
            $n10 = $n * 10
            svg.rect -X $n10 -Y $n10 -Width $n10 -Height $n10 -Style ([Ordered]@{
                fill   = $colors[$n % $colors.Length]
                stroke = $colors[($n + 1) % $colors.Length]
            }) @(
                svg.animate -AttributeName rx -Values "0;50;0" -Dur $Duration -RepeatCount indefinite
                svg.animate -AttributeName x -Values "$($n10);$(200 - $n10/2);$($n10);" -Dur $Duration -RepeatCount indefinite
            )
        }
    )
.Example
    param(
    [Alias('Color','Colour','Colours')]
    [string[]]
    $colors = @('red','green','blue'),
    
    [timespan]
    $Duration = '00:00:10'
    )
    
    svg @(
        foreach ($n in 1..10) {
            $n10 = $n * 10
            svg.rect -X $n10 -Y $n10 -Width $n10 -Height $n10 -Style ([Ordered]@{
                fill   = $colors[$n % $colors.Length]
                stroke = $colors[($n + 1) % $colors.Length]
            }) @(
                svg.animate -AttributeName rx -Values "0;50;0" -Dur $Duration -RepeatCount indefinite
                svg.animate -AttributeName x -Values "$($n10);$(200 - $n10/2);$($n10);" -Dur $Duration -RepeatCount indefinite
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
    param(
    # The radius of each rose.
    [double[]]
    $Radius = @(50, 45),
    
    # The rotation of each rose.
    [double[]]
    $Rotate = @(0,0),
    
    # The duration of the animation.
    [timespan]
    $Duration = '00:00:01.66',
    
    # The frequency of each rose.
    [double[]]
    $Frequency = @(3,5),
    
    # The spin start and end.
    [double[]]
    $Spin = @(0,360)
    )
    $r1, $r2, $null = $radius
    $f1, $f2, $null = $Frequency
    $rot1, $rot2, $null = $Rotate
    $spin1, $spin2, $null = $Spin
    svg -ViewBox ($r1 * 2) -Content @(
    
        $splat = [Ordered]@{Frequency=$f1;CenterX=$r1;CenterY=$r1;Radius=$r1;Stroke='#4488ff';Rotate=$rot1}
        $Splat2 = [Ordered]@{Frequency=$f2;CenterX=$r1;CenterY=$r1;Radius=$r2;Stroke='#4488ff';Rotate=$rot2}
        SVG.Rose @splat -Content @(
            SVG.animate -AttributeName d -Values $(
                @(
                @(SVG.Rose @splat).D;@(SVG.Rose @splat2).D;@(SVG.Rose @splat).D
                ) -join ';'
            ) -Dur $Duration -RepeatCount 'indefinite'
            SVG.animateTransform -From "$spin1 $r1 $r1" -To "$spin2 $r1 $r1" -Dur $duration -AttributeName transform -Type 'rotate' -RepeatCount 'indefinite'
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
    param(
    [string]
    $Fill = '#4488ff',
    
    [string[]]
    $Class,
    
    [timespan]
    $Duration = '00:00:02.5',
    
    [double[]]
    $ShadowX = @(0.5, -.5, 0.5),
    
    [double[]]
    $ShadowY = @(0.75, -.75, 0.75)
    )
    
    svg @(
        svg.filter -id dropShadow @(
            svg.feDropShadow -dx $ShadowX[0] -dy $ShadowY[0] -StdDeviation 0 @(
                svg.animate -AttributeName dx -Values $($ShadowX -join ';') -Dur $Duration -RepeatCount 'indefinite'
                svg.animate -AttributeName dY -Values $($Shadowy -join ';') -Dur $Duration -RepeatCount 'indefinite'
            )
            svg.feMerge @(
                svg.feMergeNode
                svg.feMergeNode -In 'SourceGraphic'
            )
        )
    
        svg.text "
    Moving Shadows
    " -TextAnchor middle -DominantBaseline middle -Fill $fill -Class $Class -FontSize 16 -X 50% -Y 50% -Filter 'url(#dropShadow)'
    ) -ViewBox 0,0,300,100
.Example
    param(
    [string]
    $Fill = '#4488ff',
    
    [string[]]
    $Class,
    
    [timespan]
    $Duration = '00:00:02.5',
    
    [double[]]
    $ShadowX = @(0.5, -.5, 0.5),
    
    [double[]]
    $ShadowY = @(0.75, -.75, 0.75)
    )
    
    svg @(
        svg.filter -id dropShadow @(
            svg.feDropShadow -dx $ShadowX[0] -dy $ShadowY[0] -StdDeviation 0 @(
                svg.animate -AttributeName dx -Values $($ShadowX -join ';') -Dur $Duration -RepeatCount 'indefinite'
                svg.animate -AttributeName dY -Values $($Shadowy -join ';') -Dur $Duration -RepeatCount 'indefinite'
            )
            svg.feMerge @(
                svg.feMergeNode
                svg.feMergeNode -In 'SourceGraphic'
            )
        )
    
        svg.text "
    Moving Shadows
    " -TextAnchor middle -DominantBaseline middle -Fill $fill -Class $Class -FontSize 16 -X 50% -Y 50% -Filter 'url(#dropShadow)'
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
    [float]$TotalRotation  = 180,
    # The total duration of any animations.
    [timespan]$duration = '00:00:03.75',
    # A palette of colors to alternate thru
    [string[]]$Color = @('#112244','#224488',"#4488ff"),
    # The type of the shape. (either Star, ConvexPolygon, or Rose)
    [ValidateSet("Star", "ConvexPolygon", "Rose")]
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
[PSObject]
$On,
# The slot attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Alias("SlotName")]
[string]
$Slot,
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
$Children
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

        if ($slot) {
            $writeSvgSplat.Slot = $slot
        }

        . Write-SVG @writeSvgSplat
    
}


} 

