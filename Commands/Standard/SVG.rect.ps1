function SVG.rect  {
<#
.Synopsis
    Creates SVG rect elements
.Description
    The **`<rect>`** element is a [basic SVG shape](https://developer.mozilla.org/en-US/docs/Web/SVG/Tutorial/Basic_Shapes) that draws rectangles, defined by their position, width, and height. The rectangles may have their corners rounded.
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
    [string]$AnimationPath = "M20,50 C20,-50 180,150 180,50 C180-50 20,150 20,50 z"
    )
    
    SVG -viewBox "0 0 200 100" @(
        SVG.path -d $AnimationPath -Fill none -Stroke lightgrey
        SVG.circle -r 5 -Fill red (
            SVG.animateMotion -Dur 10s -RepeatCount 'indefinite' -Path $AnimationPath
        )
        SVG.rect -Width 2 -Height 2 -X -1 -Y -1 -Fill blue @(
            SVG.animateMotion -Dur 10s -RepeatCount 'indefinite' -Path $AnimationPath
            SVG.animateTransform -AttributeName transform -From "0 0 0"  -To "360 0 0" -dur "5s" -RepeatCount indefinite -AttributeType xml -type rotate
        )
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
    #.SYNOPSIS
    #    Generates clouds using SVG
    #.DESCRIPTION
    #    Generates a cloud effect using fractal noise and blending modes.
    
    SVG -viewBox 1920, 1080 -Content @(
        SVG.filter -id 'noise1' -x '0' -y '0' -width '100%' -height '100%' -Content @(
            SVG.feTurbulence -baseFrequency '0.025' -Type 'fractalNoise' -NumOctaves 4
            SVG.feGaussianBlur -stdDeviation 0.9
            SVG.feBlend -In 'SourceGraphic' -Mode color-burn
        )
        SVG.rect -x '0' -y '0' -width 100% -height 100% -style 'filter: url(#noise1);' -Fill '#4488ff' -Opacity .2
    )
.Example
    param(
    # The scale of the pattern
    [double]
    $Scale = 0.75
    )
    SVG -Content @(
        SVG.defs -Content @(
    
            SVG.pattern -id 'HexagonPattern' -patternUnits 'userSpaceOnUse' -width '174' -height '200' -patternTransform "scale($Scale)" -Content @(
                SVG.Hexagon -CenterX 87 -CenterY 100 -Radius 100 -Fill transparent -Stroke '#4488ff' -Comment "A hexagon with a" -Class 'foreground-fill'
            ) -Comment "A faint hexagon Pattern, rendered 4x at a base scale of 174 by 200"
        )
        $hugeSize = 20000
    
        SVG.rect -width "$hugeSize%" -height "$hugeSize%" -fill 'url(#HexagonPattern)'
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
    $colors = @('red','green','blue')
    svg @(
        foreach ($n in 1..10) {
            $n10 = $n * 10
            svg.rect -X $n10 -Y $n10 -Width $n10 -Height $n10 -Style ([Ordered]@{
                fill   = $colors[$n % $colors.Length]
                stroke = $colors[($n + 1) % $colors.Length]
            })
        }
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
    svg @(
        svg.defs @(
            svg.pattern -Id 'SimplePattern' -Width .1 -Height .1 -Content @(
                svg.circle -Cx 2.5 -Cy 2.5 -R .5 -Fill '#4488ff'
                svg.line -X1 0 -x2 5 -y1 2.5 -Y2 2.5 -Stroke '#4488ff' -StrokeWidth .1
                svg.line -Y1 0 -Y2 5 -X1 2.5 -X2 2.5 -Stroke '#4488ff' -StrokeWidth .1
            )
        )
        svg.rect -Fill 'url(#SimplePattern)' -Width 50 -Height 50 -Opacity .3
    ) -ViewBox 0,0,50,50
.Example
    SVG -ViewBox 1.986,1 -Content @(
        $g = (1.986 * .4) / 12
        $e = (7/13)/10
    
        SVG.defs @(
            SVG.Star -PointCount 5 -Radius (1/13 * .4) -Fill white -CenterX 0 -CenterY 0 -Rotate 180 -Id Star -Comment "Each Star has a radius of 2/5ths a Bar."
        )
    
        SVG.title "American Flag"
    
        SVG.rect -Width 200% -Height 200% -x -50% -y -50% -Fill black
    
        1..13 |
            SVG.rect -Id {"bar$_"} -Fill {
                @("#FFFFFF", "#B22234")[$_ % 2]
            } -Width 100% -Height "$((1/13) * 100)%" -Y { "$((($_ -1)/13 * 100))%" } -Comment "Each Bar is 1/13th the height"
    
    
        SVG.rect -Fill "#3C3B6E" -Width 40% -Height "$((7/13 * 100))%" -X 0% -Y 0% -Id 'canton' -Comment "The Canton is 40% of the width and 7/13ths of the height"
    
        # Five rows of 6 stars
        1..30 |
            SVG.use -Id { "star$($_)" } -Href "#Star" -Comment "Five Rows of Six Stars" -Transform {
                $g = (1.986 * .4) / 12
                $e = (7/13)/10
                "translate($(
                    $g + ($g * 2 * ((($_ -1) % 6)))
                ) $(
                    $e + (
                        $e * 2 * (([Math]::Floor(($_ - 1)/ 6)))
                    )
                ))"
            }
    
        # Then interleaved with 4 rows of 5 stars
        1..20 |
            SVG.use -Id { "star$($_ + 30)" } -Href "#Star" -Width ($g/2) -Comment "Four Rows of Five Stars" -Children @(
                # SVG.animateTransform -Type 'translate' -From $($g/2) -To $($g/2) -RepeatCount 'indefinite' -Dur 1s -AttributeName transform
                # SVG.animateTransform -Type 'scale' -Values '.75;1.25;.75' -RepeatCount 'indefinite' -Dur ((60/128) * 2)s  -AttributeName transform -Additive 'sum'
            ) -Transform {
                $g = (1.986 * .4) / 12
                $e = (7/13)/10
                "translate($(
                    ($g * 2) + ($g * 2 * ((($_ -1) % 5)))
                ) $(
                    ($e * 2) + (
                        $e * 2 * (([Math]::Floor(($_ - 1)/ 5)))
                    )
                ))"
            }
    
    )
.Example
    SVG -ViewBox 1.986,1 -Content @(
        $g = (1.986 * .4) / 12
        $e = (7/13)/10
    
        SVG.defs @(
            SVG.Star -PointCount 5 -Radius (1/13 * .4) -Fill white -CenterX 0 -CenterY 0 -Rotate 180 -Id Star -Comment "Each Star has a radius of 2/5ths a Bar."
        )
    
        SVG.title "American Flag"
    
        SVG.rect -Width 200% -Height 200% -x -50% -y -50% -Fill black
    
        1..13 |
            SVG.rect -Id {"bar$_"} -Fill {
                @("#FFFFFF", "#B22234")[$_ % 2]
            } -Width 100% -Height "$((1/13) * 100)%" -Y { "$((($_ -1)/13 * 100))%" } -Comment "Each Bar is 1/13th the height"
    
    
        SVG.rect -Fill "#3C3B6E" -Width 40% -Height "$((7/13 * 100))%" -X 0% -Y 0% -Id 'canton' -Comment "The Canton is 40% of the width and 7/13ths of the height"
    
        # Five rows of 6 stars
        1..30 |
            SVG.use -Id { "star$($_)" } -Href "#Star" -Comment "Five Rows of Six Stars" -Transform {
                $g = (1.986 * .4) / 12
                $e = (7/13)/10
                "translate($(
                    $g + ($g * 2 * ((($_ -1) % 6)))
                ) $(
                    $e + (
                        $e * 2 * (([Math]::Floor(($_ - 1)/ 6)))
                    )
                ))"
            }
    
        # Then interleaved with 4 rows of 5 stars
        1..20 |
            SVG.use -Id { "star$($_ + 30)" } -Href "#Star" -Width ($g/2) -Comment "Four Rows of Five Stars" -Children @(
                # SVG.animateTransform -Type 'translate' -From $($g/2) -To $($g/2) -RepeatCount 'indefinite' -Dur 1s -AttributeName transform
                # SVG.animateTransform -Type 'scale' -Values '.75;1.25;.75' -RepeatCount 'indefinite' -Dur ((60/128) * 2)s  -AttributeName transform -Additive 'sum'
            ) -Transform {
                $g = (1.986 * .4) / 12
                $e = (7/13)/10
                "translate($(
                    ($g * 2) + ($g * 2 * ((($_ -1) % 5)))
                ) $(
                    ($e * 2) + (
                        $e * 2 * (([Math]::Floor(($_ - 1)/ 5)))
                    )
                ))"
            }
    
    )
.Example
    SVG -ViewBox 1.986,1 -Content @(
        $g = (1.986 * .4) / 12
        $e = (7/13)/10
    
        SVG.defs @(
            SVG.Star -PointCount 5 -Radius (1/13 * .4) -Fill white -CenterX 0 -CenterY 0 -Rotate 180 -Id Star -Comment "Each Star has a radius of 2/5ths a Bar."
        )
    
        SVG.title "American Flag"
    
        SVG.rect -Width 200% -Height 200% -x -50% -y -50% -Fill black
    
        1..13 |
            SVG.rect -Id {"bar$_"} -Fill {
                @("#FFFFFF", "#B22234")[$_ % 2]
            } -Width 100% -Height "$((1/13) * 100)%" -Y { "$((($_ -1)/13 * 100))%" } -Comment "Each Bar is 1/13th the height"
    
    
        SVG.rect -Fill "#3C3B6E" -Width 40% -Height "$((7/13 * 100))%" -X 0% -Y 0% -Id 'canton' -Comment "The Canton is 40% of the width and 7/13ths of the height"
    
        # Five rows of 6 stars
        1..30 |
            SVG.use -Id { "star$($_)" } -Href "#Star" -Comment "Five Rows of Six Stars" -Transform {
                $g = (1.986 * .4) / 12
                $e = (7/13)/10
                "translate($(
                    $g + ($g * 2 * ((($_ -1) % 6)))
                ) $(
                    $e + (
                        $e * 2 * (([Math]::Floor(($_ - 1)/ 6)))
                    )
                ))"
            }
    
        # Then interleaved with 4 rows of 5 stars
        1..20 |
            SVG.use -Id { "star$($_ + 30)" } -Href "#Star" -Width ($g/2) -Comment "Four Rows of Five Stars" -Children @(
                # SVG.animateTransform -Type 'translate' -From $($g/2) -To $($g/2) -RepeatCount 'indefinite' -Dur 1s -AttributeName transform
                # SVG.animateTransform -Type 'scale' -Values '.75;1.25;.75' -RepeatCount 'indefinite' -Dur ((60/128) * 2)s  -AttributeName transform -Additive 'sum'
            ) -Transform {
                $g = (1.986 * .4) / 12
                $e = (7/13)/10
                "translate($(
                    ($g * 2) + ($g * 2 * ((($_ -1) % 5)))
                ) $(
                    ($e * 2) + (
                        $e * 2 * (([Math]::Floor(($_ - 1)/ 5)))
                    )
                ))"
            }
    
    )
.Example
    param(
    # The smaller Star Size (as a ratio)
    [Alias('SmallerStarSize')]
    [double]
    $StarSizeSmall = .9,
    # The larger Star Size (as a ratio)
    [Alias('StarSizeBig','LargerStarSize')]
    [double]
    $StarSizeLarge = 1.1,
    # The duration of the animation, in seconds.
    # By default, two beats at 128 beats per minute.
    [Alias('Interval')]
    [double]
    $Duration = $((60/128) * 2)
    )
    
    
    SVG -ViewBox 1.986,1 -Content @(
        $g = (1.986 * .4) / 12
        $e = (7/13)/10
    
        SVG.defs @(
            SVG.Star -PointCount 5 -Radius (1/13 * .4) -Fill white -CenterX 0 -CenterY 0 -Rotate 180 -Id Star -Comment "Each Star has a radius of 2/5ths a Bar."
        )
    
        SVG.title "American Flag"
    
        SVG.rect -Width 200% -Height 200% -x -50% -y -50% -Fill black
    
        1..13 |
            SVG.rect -Id {"bar$_"} -Fill {
                @("#FFFFFF", "#B22234")[$_ % 2]
            } -Width 100% -Height "$((1/13) * 100)%" -Y { "$((($_ -1)/13 * 100))%" } -Comment "Each Bar is 1/13th the height"
    
    
        SVG.rect -Fill "#3C3B6E" -Width 40% -Height "$((7/13 * 100))%" -X 0% -Y 0% -Id 'canton' -Comment "The Canton is 40% of the width and 7/13ths of the height"
    
    
        # Five rows of 6 stars
        1..30 |
            SVG.use -Id { "star$($_)" } -Href "#Star" -Comment "Five Rows of Six Stars" -Transform {
                $g = (1.986 * .4) / 12
                $e = (7/13)/10
                "translate($(
                    $g + ($g * 2 * ((($_ -1) % 6)))
                ) $(
                    $e + (
                        $e * 2 * (([Math]::Floor(($_ - 1)/ 6)))
                    )
                ))"
            } -Children @(
                SVG.animateTransform -Type 'scale' -Values "$StarSizeLarge;$StarSizeSmall;$StarSizeLarge" -RepeatCount 'indefinite' -Dur $Duration  -AttributeName transform -Additive 'sum'
            )
    
        # Then interleaved with 4 rows of 5 stars
        1..20 |
            SVG.use -Id { "star$($_ + 30)" } -Href "#Star" -Width ($g/2) -Comment "Four Rows of Five Stars" -Children @(
                SVG.animateTransform -Type 'scale' -Values "$StarSizeSmall;$StarSizeLarge;$StarSizeSmall" -RepeatCount 'indefinite' -Dur $Duration  -AttributeName transform -Additive 'sum'
            ) -Transform {
                $g = (1.986 * .4) / 12
                $e = (7/13)/10
                "translate($(
                    ($g * 2) + ($g * 2 * ((($_ -1) % 5)))
                ) $(
                    ($e * 2) + (
                        $e * 2 * (([Math]::Floor(($_ - 1)/ 5)))
                    )
                ))"
            }
    
    )
.Example
    param(
    # The smaller Star Size (as a ratio)
    [Alias('SmallerStarSize')]
    [double]
    $StarSizeSmall = .9,
    # The larger Star Size (as a ratio)
    [Alias('StarSizeBig','LargerStarSize')]
    [double]
    $StarSizeLarge = 1.1,
    # The duration of the animation, in seconds.
    # By default, two beats at 128 beats per minute.
    [Alias('Interval')]
    [double]
    $Duration = $((60/128) * 2)
    )
    
    
    SVG -ViewBox 1.986,1 -Content @(
        $g = (1.986 * .4) / 12
        $e = (7/13)/10
    
        SVG.defs @(
            SVG.Star -PointCount 5 -Radius (1/13 * .4) -Fill white -CenterX 0 -CenterY 0 -Rotate 180 -Id Star -Comment "Each Star has a radius of 2/5ths a Bar."
        )
    
        SVG.title "American Flag"
    
        SVG.rect -Width 200% -Height 200% -x -50% -y -50% -Fill black
    
        1..13 |
            SVG.rect -Id {"bar$_"} -Fill {
                @("#FFFFFF", "#B22234")[$_ % 2]
            } -Width 100% -Height "$((1/13) * 100)%" -Y { "$((($_ -1)/13 * 100))%" } -Comment "Each Bar is 1/13th the height"
    
    
        SVG.rect -Fill "#3C3B6E" -Width 40% -Height "$((7/13 * 100))%" -X 0% -Y 0% -Id 'canton' -Comment "The Canton is 40% of the width and 7/13ths of the height"
    
    
        # Five rows of 6 stars
        1..30 |
            SVG.use -Id { "star$($_)" } -Href "#Star" -Comment "Five Rows of Six Stars" -Transform {
                $g = (1.986 * .4) / 12
                $e = (7/13)/10
                "translate($(
                    $g + ($g * 2 * ((($_ -1) % 6)))
                ) $(
                    $e + (
                        $e * 2 * (([Math]::Floor(($_ - 1)/ 6)))
                    )
                ))"
            } -Children @(
                SVG.animateTransform -Type 'scale' -Values "$StarSizeLarge;$StarSizeSmall;$StarSizeLarge" -RepeatCount 'indefinite' -Dur $Duration  -AttributeName transform -Additive 'sum'
            )
    
        # Then interleaved with 4 rows of 5 stars
        1..20 |
            SVG.use -Id { "star$($_ + 30)" } -Href "#Star" -Width ($g/2) -Comment "Four Rows of Five Stars" -Children @(
                SVG.animateTransform -Type 'scale' -Values "$StarSizeSmall;$StarSizeLarge;$StarSizeSmall" -RepeatCount 'indefinite' -Dur $Duration  -AttributeName transform -Additive 'sum'
            ) -Transform {
                $g = (1.986 * .4) / 12
                $e = (7/13)/10
                "translate($(
                    ($g * 2) + ($g * 2 * ((($_ -1) % 5)))
                ) $(
                    ($e * 2) + (
                        $e * 2 * (([Math]::Floor(($_ - 1)/ 5)))
                    )
                ))"
            }
    
    )
.Example
    param(
    # The smaller Star Size (as a ratio)
    [Alias('SmallerStarSize')]
    [double]
    $StarSizeSmall = .9,
    # The larger Star Size (as a ratio)
    [Alias('StarSizeBig','LargerStarSize')]
    [double]
    $StarSizeLarge = 1.1,
    # The duration of the animation, in seconds.
    # By default, two beats at 128 beats per minute.
    [Alias('Interval')]
    [double]
    $Duration = $((60/128) * 2)
    )
    
    
    SVG -ViewBox 1.986,1 -Content @(
        $g = (1.986 * .4) / 12
        $e = (7/13)/10
    
        SVG.defs @(
            SVG.Star -PointCount 5 -Radius (1/13 * .4) -Fill white -CenterX 0 -CenterY 0 -Rotate 180 -Id Star -Comment "Each Star has a radius of 2/5ths a Bar."
        )
    
        SVG.title "American Flag"
    
        SVG.rect -Width 200% -Height 200% -x -50% -y -50% -Fill black
    
        1..13 |
            SVG.rect -Id {"bar$_"} -Fill {
                @("#FFFFFF", "#B22234")[$_ % 2]
            } -Width 100% -Height "$((1/13) * 100)%" -Y { "$((($_ -1)/13 * 100))%" } -Comment "Each Bar is 1/13th the height"
    
    
        SVG.rect -Fill "#3C3B6E" -Width 40% -Height "$((7/13 * 100))%" -X 0% -Y 0% -Id 'canton' -Comment "The Canton is 40% of the width and 7/13ths of the height"
    
    
        # Five rows of 6 stars
        1..30 |
            SVG.use -Id { "star$($_)" } -Href "#Star" -Comment "Five Rows of Six Stars" -Transform {
                $g = (1.986 * .4) / 12
                $e = (7/13)/10
                "translate($(
                    $g + ($g * 2 * ((($_ -1) % 6)))
                ) $(
                    $e + (
                        $e * 2 * (([Math]::Floor(($_ - 1)/ 6)))
                    )
                ))"
            } -Children @(
                SVG.animateTransform -Type 'scale' -Values "$StarSizeLarge;$StarSizeSmall;$StarSizeLarge" -RepeatCount 'indefinite' -Dur $Duration  -AttributeName transform -Additive 'sum'
            )
    
        # Then interleaved with 4 rows of 5 stars
        1..20 |
            SVG.use -Id { "star$($_ + 30)" } -Href "#Star" -Width ($g/2) -Comment "Four Rows of Five Stars" -Children @(
                SVG.animateTransform -Type 'scale' -Values "$StarSizeSmall;$StarSizeLarge;$StarSizeSmall" -RepeatCount 'indefinite' -Dur $Duration  -AttributeName transform -Additive 'sum'
            ) -Transform {
                $g = (1.986 * .4) / 12
                $e = (7/13)/10
                "translate($(
                    ($g * 2) + ($g * 2 * ((($_ -1) % 5)))
                ) $(
                    ($e * 2) + (
                        $e * 2 * (([Math]::Floor(($_ - 1)/ 5)))
                    )
                ))"
            }
    
    )
.Example
    svg -Content @(
        svg.defs @(
            svg.LinearGradient -Id myGradient -Content @(
                svg.stop -Offset '10%' -Stopcolor gold
                svg.stop -Offset '95%' -Stopcolor red
            ) -X1 0 -X2 0 -Y1 0% -Y2 100%
        )
        svg.rect -Fill 'url(#myGradient)' -Width 100 -Height 100
    ) -viewbox 0,0,100,100
.Link
    https://pssvg.start-automating.com/SVG.rect
.Link
    https://developer.mozilla.org/en-US/web/svg/element/rect/
.Link
    Write-SVG
#>
[Reflection.AssemblyMetadata('SVG.ElementName', 'rect')]
[CmdletBinding(PositionalBinding=$false)]
[OutputType([Xml.XmlElement])]
param(
# The Contents of the rect element
[Parameter(Position=0,ValueFromPipeline,ValueFromPipelineByPropertyName)]
[Alias('InputObject','Text', 'InnerText', 'Contents')]
$Content,
# The element identifier.
[Parameter(ValueFromPipelineByPropertyName)]
[string]
$Id,
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
$Children,
# The x coordinate of the rect.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','x')]
[Reflection.AssemblyMetaData('SVG.Value', '<length> | <percentage>')]
[ValidatePattern('(?>|\d+)')]
[ArgumentCompleter({
    param ( $commandName,$parameterName,$wordToComplete,$commandAst,$fakeBoundParameters )    

    $validSet = '<length>','<percentage>'
    if ($wordToComplete) {        
        $toComplete = $wordToComplete -replace "^'" -replace "'$"
        return @($validSet -like "$toComplete*" -replace '^', "'" -replace '$',"'")
    } else {
        return @($validSet -replace '^', "'" -replace '$',"'")
    }
})]
[Reflection.AssemblyMetaData('SVG.Default value', '0')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'True')]
[PSObject]
$X,
# The y coordinate of the rect.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','y')]
[Reflection.AssemblyMetaData('SVG.Value', '<length> | <percentage>')]
[ValidatePattern('(?>|\d+)')]
[ArgumentCompleter({
    param ( $commandName,$parameterName,$wordToComplete,$commandAst,$fakeBoundParameters )    

    $validSet = '<length>','<percentage>'
    if ($wordToComplete) {        
        $toComplete = $wordToComplete -replace "^'" -replace "'$"
        return @($validSet -like "$toComplete*" -replace '^', "'" -replace '$',"'")
    } else {
        return @($validSet -replace '^', "'" -replace '$',"'")
    }
})]
[Reflection.AssemblyMetaData('SVG.Default value', '0')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'True')]
[PSObject]
$Y,
# The width of the rect.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','width')]
[Reflection.AssemblyMetaData('SVG.Value', 'auto | <length> | <percentage>')]
[ValidatePattern('(?>|\d+)')]
[ArgumentCompleter({
    param ( $commandName,$parameterName,$wordToComplete,$commandAst,$fakeBoundParameters )    

    $validSet = 'auto','<length>','<percentage>'
    if ($wordToComplete) {        
        $toComplete = $wordToComplete -replace "^'" -replace "'$"
        return @($validSet -like "$toComplete*" -replace '^', "'" -replace '$',"'")
    } else {
        return @($validSet -replace '^', "'" -replace '$',"'")
    }
})]
[Reflection.AssemblyMetaData('SVG.Default value', 'auto (treated as 0)')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'True')]
[PSObject]
$Width,
# The height of the rect.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','height')]
[Reflection.AssemblyMetaData('SVG.Value', 'auto | <length> | <percentage>')]
[ValidatePattern('(?>|\d+)')]
[ArgumentCompleter({
    param ( $commandName,$parameterName,$wordToComplete,$commandAst,$fakeBoundParameters )    

    $validSet = 'auto','<length>','<percentage>'
    if ($wordToComplete) {        
        $toComplete = $wordToComplete -replace "^'" -replace "'$"
        return @($validSet -like "$toComplete*" -replace '^', "'" -replace '$',"'")
    } else {
        return @($validSet -replace '^', "'" -replace '$',"'")
    }
})]
[Reflection.AssemblyMetaData('SVG.Default value', 'auto (treated as 0)')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'True')]
[PSObject]
$Height,
# The horizontal corner radius of the rect. Defaults to `ry` if it is specified.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','rx')]
[Reflection.AssemblyMetaData('SVG.Value', '<length> | <percentage> | auto')]
[ValidatePattern('(?>|\d+)')]
[ArgumentCompleter({
    param ( $commandName,$parameterName,$wordToComplete,$commandAst,$fakeBoundParameters )    

    $validSet = '<length>','<percentage>','auto'
    if ($wordToComplete) {        
        $toComplete = $wordToComplete -replace "^'" -replace "'$"
        return @($validSet -like "$toComplete*" -replace '^', "'" -replace '$',"'")
    } else {
        return @($validSet -replace '^', "'" -replace '$',"'")
    }
})]
[Reflection.AssemblyMetaData('SVG.Default value', 'auto')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'True')]
[PSObject]
$Rx,
# The vertical corner radius of the rect. Defaults to `rx` if it is specified.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','ry')]
[Reflection.AssemblyMetaData('SVG.Value', '<length> | <percentage> | auto')]
[ValidatePattern('(?>|\d+)')]
[ArgumentCompleter({
    param ( $commandName,$parameterName,$wordToComplete,$commandAst,$fakeBoundParameters )    

    $validSet = '<length>','<percentage>','auto'
    if ($wordToComplete) {        
        $toComplete = $wordToComplete -replace "^'" -replace "'$"
        return @($validSet -like "$toComplete*" -replace '^', "'" -replace '$',"'")
    } else {
        return @($validSet -replace '^', "'" -replace '$',"'")
    }
})]
[Reflection.AssemblyMetaData('SVG.Default value', 'auto')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'True')]
[PSObject]
$Ry,
# The total length of the rectangle's perimeter, in user units.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','pathLength')]
[Reflection.AssemblyMetaData('SVG.Value', '<number>')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'True')]
[PSObject]
$PathLength
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

        if ($paramCopy.Id) {
            $attribute.Id = $paramCopy.Id
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

