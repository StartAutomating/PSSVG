SVG.animate
-----------
### Synopsis
Creates SVG animate elements

---
### Description

The SVG **`<animate>`** element provides a way to animate an attribute of an element over time.

---
### Related Links
* [https://pssvg.start-automating.com/SVG.animate](https://pssvg.start-automating.com/SVG.animate)



* [https://developer.mozilla.org/en-US/web/svg/element/animate/](https://developer.mozilla.org/en-US/web/svg/element/animate/)



* [Write-SVG](Write-SVG.md)



---
### Examples
#### EXAMPLE 1
```PowerShell
-ViewBox 0,0,10,10 (
    =<svg.rect> -Width 10 -Height 10 (
        =<svg.animate> -AttributeName rx -Values "0;5;0" -Dur "10s" -RepeatCount indefinite
    ) -Fill '#4488ff'
)
```

#### EXAMPLE 2
```PowerShell
-Content @(
    =<svg.circle> -cx 50 -cy 50 -r 50 -Fill red @(
        =<svg.animate> -AttributeName fill -dur 10s -Values 'red;orange;yellow;green;blue;indigo;violet;red' -RepeatCount indefinite -begin 1s
        =<svg.animate> -AttributeName stroke -dur 10s -Values 'orange;yellow;green;blue;indigo;violet;red;orange' -RepeatCount indefinite -begin 1s
    ) -Stroke orange
)  -ViewBox 0,0,100,100
```

#### EXAMPLE 3
```PowerShell
-Content @(
    =<svg.circle> -cx 50 -cy 50 -r 50 -Fill red @(
        =<svg.animate> -AttributeName fill -dur 10s -Values 'red;orange;yellow;green;blue;indigo;violet;red' -RepeatCount indefinite -begin 1s
        =<svg.animate> -AttributeName stroke -dur 10s -Values 'orange;yellow;green;blue;indigo;violet;red;orange' -RepeatCount indefinite -begin 1s
    ) -Stroke orange
)  -ViewBox 0,0,100,100
```

#### EXAMPLE 4
```PowerShell
@(
    $animationSettings = @{
        Dur = '2s'
        RepeatCount='indefinite'
    }
    =<svg.circle> -CX 25 -CY 25 -r 10 -Fill '#4488ff' @(
        =<svg.animate> -values '1;10;1' -AttributeName r @animationSettings
    )
    =<svg.rect> -X 0 -Y 50 -Width 50 -Height 50 -Fill '#4488ff' @(
        =<svg.animate> -values '0;50;0' -AttributeName width @animationSettings
        =<svg.animate> -values '50;0;50' -AttributeName height @animationSettings
    )
    =<svg.ellipse> -Cx 25 -Cy 100 -Rx 10 -Ry 5 -Fill '#4488ff' @(
        =<svg.animate> -values '10;1;10' -AttributeName rx @animationSettings
        =<svg.animate> -values '5;10;5' -AttributeName ry @animationSettings
    )
) -ViewBox 0, 0, 100, 150
```

#### EXAMPLE 5
```PowerShell
@(
    $animationSettings = @{
        Dur = '2s'
        RepeatCount='indefinite'
    }
    =<svg.circle> -CX 25 -CY 25 -r 10 -Fill '#4488ff' @(
        =<svg.animate> -values '1;10;1' -AttributeName r @animationSettings
    )
    =<svg.rect> -X 0 -Y 50 -Width 50 -Height 50 -Fill '#4488ff' @(
        =<svg.animate> -values '0;50;0' -AttributeName width @animationSettings
        =<svg.animate> -values '50;0;50' -AttributeName height @animationSettings
    )
    =<svg.ellipse> -Cx 25 -Cy 100 -Rx 10 -Ry 5 -Fill '#4488ff' @(
        =<svg.animate> -values '10;1;10' -AttributeName rx @animationSettings
        =<svg.animate> -values '5;10;5' -AttributeName ry @animationSettings
    )
) -ViewBox 0, 0, 100, 150
```

#### EXAMPLE 6
```PowerShell
@(
    $animationSettings = @{
        Dur = '2s'
        RepeatCount='indefinite'
    }
    =<svg.circle> -CX 25 -CY 25 -r 10 -Fill '#4488ff' @(
        =<svg.animate> -values '1;10;1' -AttributeName r @animationSettings
    )
    =<svg.rect> -X 0 -Y 50 -Width 50 -Height 50 -Fill '#4488ff' @(
        =<svg.animate> -values '0;50;0' -AttributeName width @animationSettings
        =<svg.animate> -values '50;0;50' -AttributeName height @animationSettings
    )
    =<svg.ellipse> -Cx 25 -Cy 100 -Rx 10 -Ry 5 -Fill '#4488ff' @(
        =<svg.animate> -values '10;1;10' -AttributeName rx @animationSettings
        =<svg.animate> -values '5;10;5' -AttributeName ry @animationSettings
    )
) -ViewBox 0, 0, 100, 150
```

#### EXAMPLE 7
```PowerShell
@(
    $animationSettings = @{
        Dur = '2s'
        RepeatCount='indefinite'
    }
    =<svg.circle> -CX 25 -CY 25 -r 10 -Fill '#4488ff' @(
        =<svg.animate> -values '1;10;1' -AttributeName r @animationSettings
    )
    =<svg.rect> -X 0 -Y 50 -Width 50 -Height 50 -Fill '#4488ff' @(
        =<svg.animate> -values '0;50;0' -AttributeName width @animationSettings
        =<svg.animate> -values '50;0;50' -AttributeName height @animationSettings
    )
    =<svg.ellipse> -Cx 25 -Cy 100 -Rx 10 -Ry 5 -Fill '#4488ff' @(
        =<svg.animate> -values '10;1;10' -AttributeName rx @animationSettings
        =<svg.animate> -values '5;10;5' -AttributeName ry @animationSettings
    )
) -ViewBox 0, 0, 100, 150
```

#### EXAMPLE 8
```PowerShell
@(
    $animationSettings = @{
        Dur = '2s'
        RepeatCount='indefinite'
    }
    =<svg.circle> -CX 25 -CY 25 -r 10 -Fill '#4488ff' @(
        =<svg.animate> -values '1;10;1' -AttributeName r @animationSettings
    )
    =<svg.rect> -X 0 -Y 50 -Width 50 -Height 50 -Fill '#4488ff' @(
        =<svg.animate> -values '0;50;0' -AttributeName width @animationSettings
        =<svg.animate> -values '50;0;50' -AttributeName height @animationSettings
    )
    =<svg.ellipse> -Cx 25 -Cy 100 -Rx 10 -Ry 5 -Fill '#4488ff' @(
        =<svg.animate> -values '10;1;10' -AttributeName rx @animationSettings
        =<svg.animate> -values '5;10;5' -AttributeName ry @animationSettings
    )
) -ViewBox 0, 0, 100, 150
```

#### EXAMPLE 9
```PowerShell
$bpm = 90
```
$animateDuration = "$([Math]::Round(1/($bpm / 60), 4))s"
$animateSplat = @{
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
)
#### EXAMPLE 10
```PowerShell
$bpm = 90
```
$animateDuration = "$([Math]::Round(1/($bpm / 60), 4))s"
$animateSplat = @{
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
)
#### EXAMPLE 11
```PowerShell
$bpm = 90
```
$animateDuration = "$([Math]::Round(1/($bpm / 60), 4))s"
$animateSplat = @{
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
)
#### EXAMPLE 12
```PowerShell
$bpm = 90
```
$animateDuration = "$([Math]::Round(1/($bpm / 60), 4))s"
$animateSplat = @{
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
)
#### EXAMPLE 13
```PowerShell
$bpm = 90
```
$animateDuration = "$([Math]::Round(1/($bpm / 60), 4))s"
$animateSplat = @{
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
)
#### EXAMPLE 14
```PowerShell
$bpm = 90
```
$animateDuration = "$([Math]::Round(1/($bpm / 60), 4))s"
$animateSplat = @{
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
)
#### EXAMPLE 15
```PowerShell
$bpm = 90
```
$animateDuration = "$([Math]::Round(1/($bpm / 60), 4))s"
$animateSplat = @{
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
)
#### EXAMPLE 16
```PowerShell
$bpm = 90
```
$animateDuration = "$([Math]::Round(1/($bpm / 60), 4))s"
$animateSplat = @{
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
)
#### EXAMPLE 17
```PowerShell
$bpm = 90
```
$animateDuration = "$([Math]::Round(1/($bpm / 60), 4))s"
$animateSplat = @{
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
)
#### EXAMPLE 18
```PowerShell
$bpm = 90
```
$animateDuration = "$([Math]::Round(1/($bpm / 60), 4))s"
$animateSplat = @{
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
)
#### EXAMPLE 19
```PowerShell
$bpm = 90
```
$animateDuration = "$([Math]::Round(1/($bpm / 60), 4))s"
$animateSplat = @{
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
)
#### EXAMPLE 20
```PowerShell
$bpm = 90
```
$animateDuration = "$([Math]::Round(1/($bpm / 60), 4))s"
$animateSplat = @{
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
)
#### EXAMPLE 21
```PowerShell
$bpm = 90
```
$animateDuration = "$([Math]::Round(1/($bpm / 60), 4))s"
$animateSplat = @{
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
)
#### EXAMPLE 22
```PowerShell
$bpm = 90
```
$animateDuration = "$([Math]::Round(1/($bpm / 60), 4))s"
$animateSplat = @{
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
)
#### EXAMPLE 23
```PowerShell
$bpm = 90
```
$animateDuration = "$([Math]::Round(1/($bpm / 60), 4))s"
$animateSplat = @{
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
)
#### EXAMPLE 24
```PowerShell
$bpm = 90
```
$animateDuration = "$([Math]::Round(1/($bpm / 60), 4))s"
$animateSplat = @{
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
)
#### EXAMPLE 25
```PowerShell
$bpm = 90
```
$animateDuration = "$([Math]::Round(1/($bpm / 60), 4))s"
$animateSplat = @{
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
)
#### EXAMPLE 26
```PowerShell
$bpm = 90
```
$animateDuration = "$([Math]::Round(1/($bpm / 60), 4))s"
$animateSplat = @{
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
)
#### EXAMPLE 27
```PowerShell
$bpm = 90
```
$animateDuration = "$([Math]::Round(1/($bpm / 60), 4))s"
$animateSplat = @{
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
)
#### EXAMPLE 28
```PowerShell
$bpm = 90
```
$animateDuration = "$([Math]::Round(1/($bpm / 60), 4))s"
$animateSplat = @{
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
)
#### EXAMPLE 29
```PowerShell
$bpm = 90
```
$animateDuration = "$([Math]::Round(1/($bpm / 60), 4))s"
$animateSplat = @{
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
)
#### EXAMPLE 30
```PowerShell
$bpm = 90
```
$animateDuration = "$([Math]::Round(1/($bpm / 60), 4))s"
$animateSplat = @{
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
)
#### EXAMPLE 31
```PowerShell
$bpm = 90
```
$animateDuration = "$([Math]::Round(1/($bpm / 60), 4))s"
$animateSplat = @{
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
)
#### EXAMPLE 32
```PowerShell
$bpm = 90
```
$animateDuration = "$([Math]::Round(1/($bpm / 60), 4))s"
$animateSplat = @{
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
)
#### EXAMPLE 33
```PowerShell
$bpm = 70
```
$animateDuration = "$([Math]::Round(1/($bpm / 60), 4))s"
$animateSplat = @{
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
)
#### EXAMPLE 34
```PowerShell
-ViewBox 0,0,100,100 -Content (
    =<svg.g> -Content @(
        =<svg.text> -Y "50%" -X "50%" -DominantBaseline middle -TextAnchor middle -Text "Fading in" -Fill '#4488ff'
```
# If you only want to fade in once, remove the -RepeatCount
        =<svg.animate> -Values '0;1' -AttributeName opacity -Begin '0s' -End '1s' -Dur '1s' -RepeatCount 'indefinite'
    )
)
#### EXAMPLE 35
```PowerShell
-Content @(
    =<svg.defs> @(
        =<svg.LinearGradient> -Id myGradient -Content @(
            =<svg.stop> -Stopcolor gold @(
                =<svg.animate> -AttributeName offset -Values '.1;.99;.1' -Dur 5s -RepeatCount indefinite
            )
            =<svg.stop> -Stopcolor red @(
                =<svg.animate> -AttributeName offset -Values '100;0;100' -Dur 5s -RepeatCount indefinite
            )
        )
    )
    =<svg.rect> -Fill 'url(#myGradient)' -x 0 -Y 0 -Width 100 -Height 100
) -ViewBox '0 0 100 100'
```

#### EXAMPLE 36
```PowerShell
-Content @(
    =<svg.defs> @(
        =<svg.LinearGradient> -Id myGradient -Content @(
            =<svg.stop> -Stopcolor gold @(
                =<svg.animate> -AttributeName offset -Values '.1;.99;.1' -Dur 5s -RepeatCount indefinite
            )
            =<svg.stop> -Stopcolor red @(
                =<svg.animate> -AttributeName offset -Values '100;0;100' -Dur 5s -RepeatCount indefinite
            )
        )
    )
    =<svg.rect> -Fill 'url(#myGradient)' -x 0 -Y 0 -Width 100 -Height 100
) -ViewBox '0 0 100 100'
```

#### EXAMPLE 37
```PowerShell
$colors = @('red','green','blue')
=<svg> @(
    foreach ($n in 1..10) {
        $n10 = $n * 10
        =<svg.rect> -X $n10 -Y $n10 -Width $n10 -Height $n10 -Style @{
            fill   = $colors[$n % $colors.Length]
            stroke = $colors[($n + 1) % $colors.Length]
        } @(
            =<svg.animate> -AttributeName rx -Values "0;50;0" -Dur "10s" -RepeatCount indefinite
            =<svg.animate> -AttributeName x -Values "$($n10);$(200 - $n10/2);$($n10);" -Dur "10s" -RepeatCount indefinite
        )
    }
)
```

#### EXAMPLE 38
```PowerShell
$colors = @('red','green','blue')
=<svg> @(
    foreach ($n in 1..10) {
        $n10 = $n * 10
        =<svg.rect> -X $n10 -Y $n10 -Width $n10 -Height $n10 -Style @{
            fill   = $colors[$n % $colors.Length]
            stroke = $colors[($n + 1) % $colors.Length]
        } @(
            =<svg.animate> -AttributeName rx -Values "0;50;0" -Dur "10s" -RepeatCount indefinite
            =<svg.animate> -AttributeName x -Values "$($n10);$(200 - $n10/2);$($n10);" -Dur "10s" -RepeatCount indefinite
        )
    }
)
```

#### EXAMPLE 39
```PowerShell
-Content @(
    =<svg.polygon> -Points "25,50 50,75 75,50 50,25" -Fill '#4488ff' @(
        =<svg.animate> -AttributeName points -to "0,0 0,100 100,100, 100,0" -Dur 2s -Id morph1 -Begin '0s;morph2.end' -AttributeType XML
        =<svg.animate> -AttributeName opacity -Values '0' -Dur '0.0s' -Begin 'morph1.end' -AttributeType XML
        =<svg.animate> -AttributeName opacity -Values '1' -Dur '0.0s' -Begin 'morph1.end' -AttributeType XML
    )
    =<svg.polygon> -Points "0,0 0,100 100,100, 100,0" -Fill '#4488ff' @(
        =<svg.animate> -AttributeName opacity -Values '1' -Dur '0.0s' -Begin 'morph1.end' -AttributeType XML
        =<svg.animate> -AttributeName points -to "25,50 50,75 75,50 50,25" -Dur 2s -Id morph2 -Begin 'morph1.end' -AttributeType XML
        =<svg.animate> -AttributeName opacity -Values '0' -Dur '0.0s' -Begin 'morph2.end' -AttributeType XML
    ) -Opacity 0
```
) -ViewBox 100,100
#### EXAMPLE 40
```PowerShell
-Content @(
    =<svg.polygon> -Points "25,50 50,75 75,50 50,25" -Fill '#4488ff' @(
        =<svg.animate> -AttributeName points -to "0,0 0,100 100,100, 100,0" -Dur 2s -Id morph1 -Begin '0s;morph2.end' -AttributeType XML
        =<svg.animate> -AttributeName opacity -Values '0' -Dur '0.0s' -Begin 'morph1.end' -AttributeType XML
        =<svg.animate> -AttributeName opacity -Values '1' -Dur '0.0s' -Begin 'morph1.end' -AttributeType XML
    )
    =<svg.polygon> -Points "0,0 0,100 100,100, 100,0" -Fill '#4488ff' @(
        =<svg.animate> -AttributeName opacity -Values '1' -Dur '0.0s' -Begin 'morph1.end' -AttributeType XML
        =<svg.animate> -AttributeName points -to "25,50 50,75 75,50 50,25" -Dur 2s -Id morph2 -Begin 'morph1.end' -AttributeType XML
        =<svg.animate> -AttributeName opacity -Values '0' -Dur '0.0s' -Begin 'morph2.end' -AttributeType XML
    ) -Opacity 0
```
) -ViewBox 100,100
#### EXAMPLE 41
```PowerShell
-Content @(
    =<svg.polygon> -Points "25,50 50,75 75,50 50,25" -Fill '#4488ff' @(
        =<svg.animate> -AttributeName points -to "0,0 0,100 100,100, 100,0" -Dur 2s -Id morph1 -Begin '0s;morph2.end' -AttributeType XML
        =<svg.animate> -AttributeName opacity -Values '0' -Dur '0.0s' -Begin 'morph1.end' -AttributeType XML
        =<svg.animate> -AttributeName opacity -Values '1' -Dur '0.0s' -Begin 'morph1.end' -AttributeType XML
    )
    =<svg.polygon> -Points "0,0 0,100 100,100, 100,0" -Fill '#4488ff' @(
        =<svg.animate> -AttributeName opacity -Values '1' -Dur '0.0s' -Begin 'morph1.end' -AttributeType XML
        =<svg.animate> -AttributeName points -to "25,50 50,75 75,50 50,25" -Dur 2s -Id morph2 -Begin 'morph1.end' -AttributeType XML
        =<svg.animate> -AttributeName opacity -Values '0' -Dur '0.0s' -Begin 'morph2.end' -AttributeType XML
    ) -Opacity 0
```
) -ViewBox 100,100
#### EXAMPLE 42
```PowerShell
-Content @(
    =<svg.polygon> -Points "25,50 50,75 75,50 50,25" -Fill '#4488ff' @(
        =<svg.animate> -AttributeName points -to "0,0 0,100 100,100, 100,0" -Dur 2s -Id morph1 -Begin '0s;morph2.end' -AttributeType XML
        =<svg.animate> -AttributeName opacity -Values '0' -Dur '0.0s' -Begin 'morph1.end' -AttributeType XML
        =<svg.animate> -AttributeName opacity -Values '1' -Dur '0.0s' -Begin 'morph1.end' -AttributeType XML
    )
    =<svg.polygon> -Points "0,0 0,100 100,100, 100,0" -Fill '#4488ff' @(
        =<svg.animate> -AttributeName opacity -Values '1' -Dur '0.0s' -Begin 'morph1.end' -AttributeType XML
        =<svg.animate> -AttributeName points -to "25,50 50,75 75,50 50,25" -Dur 2s -Id morph2 -Begin 'morph1.end' -AttributeType XML
        =<svg.animate> -AttributeName opacity -Values '0' -Dur '0.0s' -Begin 'morph2.end' -AttributeType XML
    ) -Opacity 0
```
) -ViewBox 100,100
#### EXAMPLE 43
```PowerShell
-Content @(
    =<svg.polygon> -Points "25,50 50,75 75,50 50,25" -Fill '#4488ff' @(
        =<svg.animate> -AttributeName points -to "0,0 0,100 100,100, 100,0" -Dur 2s -Id morph1 -Begin '0s;morph2.end' -AttributeType XML
        =<svg.animate> -AttributeName opacity -Values '0' -Dur '0.0s' -Begin 'morph1.end' -AttributeType XML
        =<svg.animate> -AttributeName opacity -Values '1' -Dur '0.0s' -Begin 'morph1.end' -AttributeType XML
    )
    =<svg.polygon> -Points "0,0 0,100 100,100, 100,0" -Fill '#4488ff' @(
        =<svg.animate> -AttributeName opacity -Values '1' -Dur '0.0s' -Begin 'morph1.end' -AttributeType XML
        =<svg.animate> -AttributeName points -to "25,50 50,75 75,50 50,25" -Dur 2s -Id morph2 -Begin 'morph1.end' -AttributeType XML
        =<svg.animate> -AttributeName opacity -Values '0' -Dur '0.0s' -Begin 'morph2.end' -AttributeType XML
    ) -Opacity 0
```
) -ViewBox 100,100
#### EXAMPLE 44
```PowerShell
-Content @(
    =<svg.polygon> -Points "25,50 50,75 75,50 50,25" -Fill '#4488ff' @(
        =<svg.animate> -AttributeName points -to "0,0 0,100 100,100, 100,0" -Dur 2s -Id morph1 -Begin '0s;morph2.end' -AttributeType XML
        =<svg.animate> -AttributeName opacity -Values '0' -Dur '0.0s' -Begin 'morph1.end' -AttributeType XML
        =<svg.animate> -AttributeName opacity -Values '1' -Dur '0.0s' -Begin 'morph1.end' -AttributeType XML
    )
    =<svg.polygon> -Points "0,0 0,100 100,100, 100,0" -Fill '#4488ff' @(
        =<svg.animate> -AttributeName opacity -Values '1' -Dur '0.0s' -Begin 'morph1.end' -AttributeType XML
        =<svg.animate> -AttributeName points -to "25,50 50,75 75,50 50,25" -Dur 2s -Id morph2 -Begin 'morph1.end' -AttributeType XML
        =<svg.animate> -AttributeName opacity -Values '0' -Dur '0.0s' -Begin 'morph2.end' -AttributeType XML
    ) -Opacity 0
```
) -ViewBox 100,100
#### EXAMPLE 45
```PowerShell
-Content @(
    =<svg.defs> @(
        =<svg.LinearGradient> -Id myGradient -Content @(
            =<svg.stop> -Offset '10%' -Stopcolor transparent
            =<svg.stop> -Offset '95%' -Stopcolor '#4488ff'
            =<svg.animate> -AttributeName y1 -From 0 -To 1 -Id animateY1 -Fill freeze -Dur '3s'
            =<svg.animate> -AttributeName y2 -Dur "3s" -From 1 -to 0 -Id 'animateY2' -Fill freeze -Begin 'animateY1.end'
            =<svg.animate> -AttributeName x1 -Values '1;0' -Dur '3s' -Begin 'animateY2.end' -Fill freeze -Id animateX1
            =<svg.animate> -AttributeName x2 -Values '0;1' -Dur '3s' -Begin 'animateX1.end' -Fill freeze
        ) -X1 100% -X2 0 -Y1 0% -Y2 100%
```
)
    =<svg.rect> -Fill 'url(#myGradient)' -Width 100 -Height 100
) -viewbox 0,0,100,100
#### EXAMPLE 46
```PowerShell
-Content @(
    =<svg.defs> @(
        =<svg.LinearGradient> -Id myGradient -Content @(
            =<svg.stop> -Offset '10%' -Stopcolor transparent
            =<svg.stop> -Offset '95%' -Stopcolor '#4488ff'
            =<svg.animate> -AttributeName y1 -From 0 -To 1 -Id animateY1 -Fill freeze -Dur '3s'
            =<svg.animate> -AttributeName y2 -Dur "3s" -From 1 -to 0 -Id 'animateY2' -Fill freeze -Begin 'animateY1.end'
            =<svg.animate> -AttributeName x1 -Values '1;0' -Dur '3s' -Begin 'animateY2.end' -Fill freeze -Id animateX1
            =<svg.animate> -AttributeName x2 -Values '0;1' -Dur '3s' -Begin 'animateX1.end' -Fill freeze
        ) -X1 100% -X2 0 -Y1 0% -Y2 100%
```
)
    =<svg.rect> -Fill 'url(#myGradient)' -Width 100 -Height 100
) -viewbox 0,0,100,100
#### EXAMPLE 47
```PowerShell
-Content @(
    =<svg.defs> @(
        =<svg.LinearGradient> -Id myGradient -Content @(
            =<svg.stop> -Offset '10%' -Stopcolor transparent
            =<svg.stop> -Offset '95%' -Stopcolor '#4488ff'
            =<svg.animate> -AttributeName y1 -From 0 -To 1 -Id animateY1 -Fill freeze -Dur '3s'
            =<svg.animate> -AttributeName y2 -Dur "3s" -From 1 -to 0 -Id 'animateY2' -Fill freeze -Begin 'animateY1.end'
            =<svg.animate> -AttributeName x1 -Values '1;0' -Dur '3s' -Begin 'animateY2.end' -Fill freeze -Id animateX1
            =<svg.animate> -AttributeName x2 -Values '0;1' -Dur '3s' -Begin 'animateX1.end' -Fill freeze
        ) -X1 100% -X2 0 -Y1 0% -Y2 100%
```
)
    =<svg.rect> -Fill 'url(#myGradient)' -Width 100 -Height 100
) -viewbox 0,0,100,100
#### EXAMPLE 48
```PowerShell
-Content @(
    =<svg.defs> @(
        =<svg.LinearGradient> -Id myGradient -Content @(
            =<svg.stop> -Offset '10%' -Stopcolor transparent
            =<svg.stop> -Offset '95%' -Stopcolor '#4488ff'
            =<svg.animate> -AttributeName y1 -From 0 -To 1 -Id animateY1 -Fill freeze -Dur '3s'
            =<svg.animate> -AttributeName y2 -Dur "3s" -From 1 -to 0 -Id 'animateY2' -Fill freeze -Begin 'animateY1.end'
            =<svg.animate> -AttributeName x1 -Values '1;0' -Dur '3s' -Begin 'animateY2.end' -Fill freeze -Id animateX1
            =<svg.animate> -AttributeName x2 -Values '0;1' -Dur '3s' -Begin 'animateX1.end' -Fill freeze
        ) -X1 100% -X2 0 -Y1 0% -Y2 100%
```
)
    =<svg.rect> -Fill 'url(#myGradient)' -Width 100 -Height 100
) -viewbox 0,0,100,100
#### EXAMPLE 49
```PowerShell
-Content @(
    =<svg.defs> @(
        =<svg.radialGradient> -Id myGradient -Content @(
            =<svg.stop> -Offset '1%' -Stopcolor gold @(
                =<svg.animate> -AttributeName offset -Values '.1;.99;.1' -Dur 5s -RepeatCount indefinite
            )
            =<svg.stop> -Offset '100%' -Stopcolor red
        )
    )
    =<svg.circle> -Fill 'url(#myGradient)' -Cx 50 -Cy 50 -R 35
) -ViewBox '0 0 100 100'
```

---
### Parameters
#### **Content**

The Contents of the animate element






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Object]`|false   |1       |true (ByPropertyName)|



---
#### **Data**

A dictionary containing data.  This data will be embedded in data- attributes.






|Type           |Required|Position|PipelineInput        |
|---------------|--------|--------|---------------------|
|`[IDictionary]`|false   |named   |true (ByPropertyName)|



---
#### **Attribute**

A dictionary of attributes.  This can set any attribute not exposed in other parameters.






|Type           |Required|Position|PipelineInput        |
|---------------|--------|--------|---------------------|
|`[IDictionary]`|false   |named   |true (ByPropertyName)|



---
#### **Href**

The **`href`** attribute defines a link to a resource as a reference [URL](https://developer.mozilla.org/en-US/docs/Web/SVG/Content_type#url). The exact meaning of that link depends on the context of each element using it.

> **Note:** Specifications before SVG 2 defined an xlink:href attribute, which is now rendered obsolete by the `href` attribute. If you need to support earlier browser versions, the deprecated `xlink:href` attribute can be used as a fallback in addition to the `href` attribute, e.g. `<use href="some-id" xlink:href="some-id" x="5" y="5" />`.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Object]`|false   |named   |true (ByPropertyName)|



---
#### **AttributeType**

The **`attributeType`** attribute specifies the namespace in which the target attribute and its associated values are defined.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Object]`|false   |named   |true (ByPropertyName)|



---
#### **AttributeName**

The **`attributeName`** attribute indicates the name of the CSS property or attribute of the target element that is going to be changed during an animation.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Object]`|false   |named   |true (ByPropertyName)|



---
#### **Begin**

The **`begin`** attribute defines when an animation should begin or when an element should be discarded.

The attribute value is a semicolon separated list of values. The interpretation of a list of start times is detailed in the SMIL specification in ["Evaluation of begin and end time lists"](https://developer.mozilla.orghttps://www.w3.org/TR/2001/REC-smil-animation-20010904/#Timing-EvaluationOfBeginEndTimeLists). Each individual value can be one of the following: `<offset-value>`, `<syncbase-value>`, `<event-value>`, `<repeat-value>`, `<accessKey-value>`, `<wallclock-sync-value>` or the keyword `indefinite`.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Object]`|false   |named   |true (ByPropertyName)|



---
#### **Dur**

The **`dur`** attribute indicates the simple duration of an animation.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Object]`|false   |named   |true (ByPropertyName)|



---
#### **End**

The **`end`** attribute defines an end value for the animation that can constrain the active duration.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Object]`|false   |named   |true (ByPropertyName)|



---
#### **Min**

The **`min`** attribute specifies the minimum value of the active animation duration.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Object]`|false   |named   |true (ByPropertyName)|



---
#### **Max**

The **`max`** attribute specifies the maximum value of the active animation duration.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Object]`|false   |named   |true (ByPropertyName)|



---
#### **Restart**

The **`restart`** attribute specifies whether or not an animation can restart.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Object]`|false   |named   |true (ByPropertyName)|



---
#### **RepeatCount**

The **`repeatCount`** attribute indicates the number of times an animation will take place.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Object]`|false   |named   |true (ByPropertyName)|



---
#### **RepeatDur**

The **`repeatDur`** attribute specifies the total duration for repeating an animation.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Object]`|false   |named   |true (ByPropertyName)|



---
#### **Fill**

The **`fill`** attribute has two different meanings. For shapes and text it's a presentation attribute that defines the color (_or any SVG paint servers like gradients or patterns_) used to paint the element; for animation it defines the final state of the animation.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Object]`|false   |named   |true (ByPropertyName)|



---
#### **CalcMode**

The **`calcMode`** attribute specifies the interpolation mode for the animation.

The default mode is `linear`, however if the attribute does not support linear interpolation (e.g. for strings), the `calcMode` attribute is ignored and discrete interpolation is used.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Object]`|false   |named   |true (ByPropertyName)|



---
#### **Values**

The `values` attribute has different meanings, depending upon the context where it's used, either it defines a sequence of values used over the course of an animation, or it's a list of numbers for a color matrix, which is interpreted differently depending on the type of color change to be performed.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Object]`|false   |named   |true (ByPropertyName)|



---
#### **KeyTimes**

The **`keyTimes`** attribute represents a list of time values used to control the pacing of the animation.

Each time in the list corresponds to a value in the values attribute list, and defines when the value is used in the animation. Each time value in the `keyTimes` list is specified as a floating point value between 0 and 1 (inclusive), representing a proportional offset into the duration of the animation element.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Object]`|false   |named   |true (ByPropertyName)|



---
#### **KeySplines**

The **`keySplines`** attribute defines a set of [Bézier curve](https://developer.mozilla.org/en-US/docs/Glossary/Bezier_curve) control points associated with the keyTimes list, defining a cubic Bézier function that controls interval pacing.

This attribute is ignored unless the calcMode attribute is set to `spline`.

If there are any errors in the keySplines specification (bad values, too many or too few values), the animation will not occur.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Object]`|false   |named   |true (ByPropertyName)|



---
#### **From**

The **`from`** attribute indicates the initial value of the attribute that will be modified during the animation.

When used with the to attribute, the animation will change the modified attribute from the `from` value to the `to` value. When used with the by attribute, the animation will change the attribute relatively from the `from` value by the value specified in `by`.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Object]`|false   |named   |true (ByPropertyName)|



---
#### **To**

The **`to`** attribute indicates the final value of the attribute that will be modified during the animation.

The value of the attribute will change between the from attribute value and this value.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Object]`|false   |named   |true (ByPropertyName)|



---
#### **By**

The **`by`** attribute specifies a relative offset value for an attribute that will be modified during an animation.

The starting value for the attribute is either indicated by specifying it as value for the attribute given in the attributeName or the from attribute.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Object]`|false   |named   |true (ByPropertyName)|



---
#### **Additive**

The **`additive`** attribute controls whether or not an animation is additive.

It is frequently useful to define animation as an offset or delta to an attribute's value, rather than as absolute values.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Object]`|false   |named   |true (ByPropertyName)|



---
#### **Accumulate**

The **`accumulate`** attribute controls whether or not an animation is cumulative.

It is frequently useful for repeated animations to build upon the previous results, accumulating with each iteration. This attribute said to the animation if the value is added to the previous animated attribute's value on each iteration.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Object]`|false   |named   |true (ByPropertyName)|



---
#### **Id**

The **`id`** attribute assigns a unique name to an element.

You can use this attribute with any SVG element.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Object]`|false   |named   |true (ByPropertyName)|



---
#### **Lang**

The **`lang`** attribute specifies the primary language used in contents and attributes containing text content of particular elements.

There is also an xml:lang attribute (with namespace). If both of them are defined, the one with namespace is used and the one without is ignored.

In SVG 1.1 there was a `lang` attribute defined with a different meaning and only applying to glyph elements. That attribute specified a list of languages according to {{RFC(5646, "Tags for Identifying Languages (also known as BCP 47)")}}. The glyph was meant to be used if the `xml:lang` attribute exactly matched one of the languages given in the value of this parameter, or if the `xml:lang` attribute exactly equaled a prefix of one of the languages given in the value of this parameter such that the first tag character following the prefix was "-".

You can use this attribute with any SVG element.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Object]`|false   |named   |true (ByPropertyName)|



---
#### **Tabindex**

The **`tabindex`** attribute allows you to control whether an element is focusable and to define the relative order of the element for the purposes of sequential focus navigation.

You can use this attribute with any SVG element.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Object]`|false   |named   |true (ByPropertyName)|



---
#### **XmlBase**

The **`xml:base`** attribute specifies a base IRI other than the base IRI of the document or external entity.

You can use this attribute with any SVG element.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Object]`|false   |named   |true (ByPropertyName)|



---
#### **XmlLang**

The **`xml:lang`** attribute specifies the primary language used in contents and attributes containing text content of particular elements.

It is a universal attribute allowed in all XML dialects to mark up the natural human language that an element contains.

There is also a lang attribute (without namespace). If both of them are defined, the one with namespace is used and the one without is ignored.

You can use this attribute with any SVG element.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Object]`|false   |named   |true (ByPropertyName)|



---
#### **XmlSpace**

SVG supports the built-in XML **`xml:space`** attribute to handle whitespace characters inside elements. Child elements inside an element may also have an `xml:space` attribute that overrides the parent's one.

> **Note:** Instead of using the `xml:space` attribute, use the white-space CSS property.

This attribute influences how browsers parse text content and therefore changes the way the DOM is built. Therefore, changing this attribute's value through the DOM API may have no effect.

You can use this attribute with any SVG element.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Object]`|false   |named   |true (ByPropertyName)|



---
#### **Class**

« [SVG Attribute reference home](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute)

Assigns a class name or set of class names to an element. You may assign the same class name or names to any number of elements, however, multiple class names must be separated by whitespace characters.

An element's class name serves two key roles:

* As a style sheet selector, for when an author assigns style information to a set of elements.
* For general use by the browser.

You can use this class to style SVG content using CSS.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Object]`|false   |named   |true (ByPropertyName)|



---
#### **Style**

The **`style`** attribute allows to style an element using CSS declarations. It functions identically to [the `style` attribute in HTML](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/style).

You can use this attribute with any SVG element.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Object]`|false   |named   |true (ByPropertyName)|



---
### Outputs
* [Xml.XmlElement](https://learn.microsoft.com/en-us/dotnet/api/System.Xml.XmlElement)




---
### Syntax
```PowerShell
SVG.animate [[-Content] <Object>] [-Data <IDictionary>] [-Attribute <IDictionary>] [-Href <Object>] [-AttributeType <Object>] [-AttributeName <Object>] [-Begin <Object>] [-Dur <Object>] [-End <Object>] [-Min <Object>] [-Max <Object>] [-Restart <Object>] [-RepeatCount <Object>] [-RepeatDur <Object>] [-Fill <Object>] [-CalcMode <Object>] [-Values <Object>] [-KeyTimes <Object>] [-KeySplines <Object>] [-From <Object>] [-To <Object>] [-By <Object>] [-Additive <Object>] [-Accumulate <Object>] [-Id <Object>] [-Lang <Object>] [-Tabindex <Object>] [-XmlBase <Object>] [-XmlLang <Object>] [-XmlSpace <Object>] [-Class <Object>] [-Style <Object>] [<CommonParameters>]
```
---
