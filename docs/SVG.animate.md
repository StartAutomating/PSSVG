
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
    =&lt;svg.rect&gt; -Width 10 -Height 10 (
        =&lt;svg.animate&gt; -AttributeName rx -Values &quot;0;5;0&quot; -Dur &quot;10s&quot; -RepeatCount indefinite
    ) -Fill &#39;#4488ff&#39;
)
```

#### EXAMPLE 2
```PowerShell
-Content @(
    =&lt;svg.circle&gt; -cx 50 -cy 50 -r 50 -Fill red @(
        =&lt;svg.animate&gt; -AttributeName fill -dur 10s -Values &#39;red;orange;yellow;green;blue;indigo;violet;red&#39; -RepeatCount indefinite -begin 1s
        =&lt;svg.animate&gt; -AttributeName stroke -dur 10s -Values &#39;orange;yellow;green;blue;indigo;violet;red;orange&#39; -RepeatCount indefinite -begin 1s
    ) -Stroke orange
)  -ViewBox 0,0,100,100
```

#### EXAMPLE 3
```PowerShell
-Content @(
    =&lt;svg.circle&gt; -cx 50 -cy 50 -r 50 -Fill red @(
        =&lt;svg.animate&gt; -AttributeName fill -dur 10s -Values &#39;red;orange;yellow;green;blue;indigo;violet;red&#39; -RepeatCount indefinite -begin 1s
        =&lt;svg.animate&gt; -AttributeName stroke -dur 10s -Values &#39;orange;yellow;green;blue;indigo;violet;red;orange&#39; -RepeatCount indefinite -begin 1s
    ) -Stroke orange
)  -ViewBox 0,0,100,100
```

#### EXAMPLE 4
```PowerShell
@(
    $animationSettings = @{
        Dur = &#39;2s&#39;
        RepeatCount=&#39;indefinite&#39;
    }
    =&lt;svg.circle&gt; -CX 25 -CY 25 -r 10 -Fill &#39;#4488ff&#39; @(
        =&lt;svg.animate&gt; -values &#39;1;10;1&#39; -AttributeName r @animationSettings
    )
    =&lt;svg.rect&gt; -X 0 -Y 50 -Width 50 -Height 50 -Fill &#39;#4488ff&#39; @(
        =&lt;svg.animate&gt; -values &#39;0;50;0&#39; -AttributeName width @animationSettings
        =&lt;svg.animate&gt; -values &#39;50;0;50&#39; -AttributeName height @animationSettings
    )
    =&lt;svg.ellipse&gt; -Cx 25 -Cy 100 -Rx 10 -Ry 5 -Fill &#39;#4488ff&#39; @(
        =&lt;svg.animate&gt; -values &#39;10;1;10&#39; -AttributeName rx @animationSettings
        =&lt;svg.animate&gt; -values &#39;5;10;5&#39; -AttributeName ry @animationSettings
    )
) -ViewBox 0, 0, 100, 150
```

#### EXAMPLE 5
```PowerShell
@(
    $animationSettings = @{
        Dur = &#39;2s&#39;
        RepeatCount=&#39;indefinite&#39;
    }
    =&lt;svg.circle&gt; -CX 25 -CY 25 -r 10 -Fill &#39;#4488ff&#39; @(
        =&lt;svg.animate&gt; -values &#39;1;10;1&#39; -AttributeName r @animationSettings
    )
    =&lt;svg.rect&gt; -X 0 -Y 50 -Width 50 -Height 50 -Fill &#39;#4488ff&#39; @(
        =&lt;svg.animate&gt; -values &#39;0;50;0&#39; -AttributeName width @animationSettings
        =&lt;svg.animate&gt; -values &#39;50;0;50&#39; -AttributeName height @animationSettings
    )
    =&lt;svg.ellipse&gt; -Cx 25 -Cy 100 -Rx 10 -Ry 5 -Fill &#39;#4488ff&#39; @(
        =&lt;svg.animate&gt; -values &#39;10;1;10&#39; -AttributeName rx @animationSettings
        =&lt;svg.animate&gt; -values &#39;5;10;5&#39; -AttributeName ry @animationSettings
    )
) -ViewBox 0, 0, 100, 150
```

#### EXAMPLE 6
```PowerShell
@(
    $animationSettings = @{
        Dur = &#39;2s&#39;
        RepeatCount=&#39;indefinite&#39;
    }
    =&lt;svg.circle&gt; -CX 25 -CY 25 -r 10 -Fill &#39;#4488ff&#39; @(
        =&lt;svg.animate&gt; -values &#39;1;10;1&#39; -AttributeName r @animationSettings
    )
    =&lt;svg.rect&gt; -X 0 -Y 50 -Width 50 -Height 50 -Fill &#39;#4488ff&#39; @(
        =&lt;svg.animate&gt; -values &#39;0;50;0&#39; -AttributeName width @animationSettings
        =&lt;svg.animate&gt; -values &#39;50;0;50&#39; -AttributeName height @animationSettings
    )
    =&lt;svg.ellipse&gt; -Cx 25 -Cy 100 -Rx 10 -Ry 5 -Fill &#39;#4488ff&#39; @(
        =&lt;svg.animate&gt; -values &#39;10;1;10&#39; -AttributeName rx @animationSettings
        =&lt;svg.animate&gt; -values &#39;5;10;5&#39; -AttributeName ry @animationSettings
    )
) -ViewBox 0, 0, 100, 150
```

#### EXAMPLE 7
```PowerShell
@(
    $animationSettings = @{
        Dur = &#39;2s&#39;
        RepeatCount=&#39;indefinite&#39;
    }
    =&lt;svg.circle&gt; -CX 25 -CY 25 -r 10 -Fill &#39;#4488ff&#39; @(
        =&lt;svg.animate&gt; -values &#39;1;10;1&#39; -AttributeName r @animationSettings
    )
    =&lt;svg.rect&gt; -X 0 -Y 50 -Width 50 -Height 50 -Fill &#39;#4488ff&#39; @(
        =&lt;svg.animate&gt; -values &#39;0;50;0&#39; -AttributeName width @animationSettings
        =&lt;svg.animate&gt; -values &#39;50;0;50&#39; -AttributeName height @animationSettings
    )
    =&lt;svg.ellipse&gt; -Cx 25 -Cy 100 -Rx 10 -Ry 5 -Fill &#39;#4488ff&#39; @(
        =&lt;svg.animate&gt; -values &#39;10;1;10&#39; -AttributeName rx @animationSettings
        =&lt;svg.animate&gt; -values &#39;5;10;5&#39; -AttributeName ry @animationSettings
    )
) -ViewBox 0, 0, 100, 150
```

#### EXAMPLE 8
```PowerShell
@(
    $animationSettings = @{
        Dur = &#39;2s&#39;
        RepeatCount=&#39;indefinite&#39;
    }
    =&lt;svg.circle&gt; -CX 25 -CY 25 -r 10 -Fill &#39;#4488ff&#39; @(
        =&lt;svg.animate&gt; -values &#39;1;10;1&#39; -AttributeName r @animationSettings
    )
    =&lt;svg.rect&gt; -X 0 -Y 50 -Width 50 -Height 50 -Fill &#39;#4488ff&#39; @(
        =&lt;svg.animate&gt; -values &#39;0;50;0&#39; -AttributeName width @animationSettings
        =&lt;svg.animate&gt; -values &#39;50;0;50&#39; -AttributeName height @animationSettings
    )
    =&lt;svg.ellipse&gt; -Cx 25 -Cy 100 -Rx 10 -Ry 5 -Fill &#39;#4488ff&#39; @(
        =&lt;svg.animate&gt; -values &#39;10;1;10&#39; -AttributeName rx @animationSettings
        =&lt;svg.animate&gt; -values &#39;5;10;5&#39; -AttributeName ry @animationSettings
    )
) -ViewBox 0, 0, 100, 150
```

#### EXAMPLE 9
```PowerShell
$bpm = 104
```
$animateDuration = "$([Math]::Round(1/($bpm / 60), 4))s"
$animateSplat = @{
    Dur = $animateDuration
    RepeatDur = "indefinite"
}

$Color = "#4488ff"

=<svg> -ViewBox 400, 400 -Fill black @(
    =<svg.pattern> -Width .25 -Height .25 @(
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
    =<svg.rect> -Width 400 -Height 400 -Fill "url(#fillPattern)" -X 0 -Y 0
)
#### EXAMPLE 10
```PowerShell
$bpm = 104
```
$animateDuration = "$([Math]::Round(1/($bpm / 60), 4))s"
$animateSplat = @{
    Dur = $animateDuration
    RepeatDur = "indefinite"
}

$Color = "#4488ff"

=<svg> -ViewBox 400, 400 -Fill black @(
    =<svg.pattern> -Width .25 -Height .25 @(
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
    =<svg.rect> -Width 400 -Height 400 -Fill "url(#fillPattern)" -X 0 -Y 0
)
#### EXAMPLE 11
```PowerShell
$bpm = 104
```
$animateDuration = "$([Math]::Round(1/($bpm / 60), 4))s"
$animateSplat = @{
    Dur = $animateDuration
    RepeatDur = "indefinite"
}

$Color = "#4488ff"

=<svg> -ViewBox 400, 400 -Fill black @(
    =<svg.pattern> -Width .25 -Height .25 @(
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
    =<svg.rect> -Width 400 -Height 400 -Fill "url(#fillPattern)" -X 0 -Y 0
)
#### EXAMPLE 12
```PowerShell
$bpm = 104
```
$animateDuration = "$([Math]::Round(1/($bpm / 60), 4))s"
$animateSplat = @{
    Dur = $animateDuration
    RepeatDur = "indefinite"
}

$Color = "#4488ff"

=<svg> -ViewBox 400, 400 -Fill black @(
    =<svg.pattern> -Width .25 -Height .25 @(
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
    =<svg.rect> -Width 400 -Height 400 -Fill "url(#fillPattern)" -X 0 -Y 0
)
#### EXAMPLE 13
```PowerShell
$bpm = 104
```
$animateDuration = "$([Math]::Round(1/($bpm / 60), 4))s"
$animateSplat = @{
    Dur = $animateDuration
    RepeatDur = "indefinite"
}

$Color = "#4488ff"

=<svg> -ViewBox 400, 400 -Fill black @(
    =<svg.pattern> -Width .25 -Height .25 @(
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
    =<svg.rect> -Width 400 -Height 400 -Fill "url(#fillPattern)" -X 0 -Y 0
)
#### EXAMPLE 14
```PowerShell
$bpm = 104
```
$animateDuration = "$([Math]::Round(1/($bpm / 60), 4))s"
$animateSplat = @{
    Dur = $animateDuration
    RepeatDur = "indefinite"
}

$Color = "#4488ff"

=<svg> -ViewBox 400, 400 -Fill black @(
    =<svg.pattern> -Width .25 -Height .25 @(
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
    =<svg.rect> -Width 400 -Height 400 -Fill "url(#fillPattern)" -X 0 -Y 0
)
#### EXAMPLE 15
```PowerShell
$bpm = 104
```
$animateDuration = "$([Math]::Round(1/($bpm / 60), 4))s"
$animateSplat = @{
    Dur = $animateDuration
    RepeatDur = "indefinite"
}

$Color = "#4488ff"

=<svg> -ViewBox 400, 400 -Fill black @(
    =<svg.pattern> -Width .25 -Height .25 @(
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
    =<svg.rect> -Width 400 -Height 400 -Fill "url(#fillPattern)" -X 0 -Y 0
)
#### EXAMPLE 16
```PowerShell
$bpm = 104
```
$animateDuration = "$([Math]::Round(1/($bpm / 60), 4))s"
$animateSplat = @{
    Dur = $animateDuration
    RepeatDur = "indefinite"
}

$Color = "#4488ff"

=<svg> -ViewBox 400, 400 -Fill black @(
    =<svg.pattern> -Width .25 -Height .25 @(
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
    =<svg.rect> -Width 400 -Height 400 -Fill "url(#fillPattern)" -X 0 -Y 0
)
#### EXAMPLE 17
```PowerShell
$bpm = 104
```
$animateDuration = "$([Math]::Round(1/($bpm / 60), 4))s"
$animateSplat = @{
    Dur = $animateDuration
    RepeatDur = "indefinite"
}

$Color = "#4488ff"

=<svg> -ViewBox 400, 400 -Fill black @(
    =<svg.pattern> -Width .25 -Height .25 @(
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
    =<svg.rect> -Width 400 -Height 400 -Fill "url(#fillPattern)" -X 0 -Y 0
)
#### EXAMPLE 18
```PowerShell
$bpm = 104
```
$animateDuration = "$([Math]::Round(1/($bpm / 60), 4))s"
$animateSplat = @{
    Dur = $animateDuration
    RepeatDur = "indefinite"
}

$Color = "#4488ff"

=<svg> -ViewBox 400, 400 -Fill black @(
    =<svg.pattern> -Width .25 -Height .25 @(
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
    =<svg.rect> -Width 400 -Height 400 -Fill "url(#fillPattern)" -X 0 -Y 0
)
#### EXAMPLE 19
```PowerShell
$bpm = 104
```
$animateDuration = "$([Math]::Round(1/($bpm / 60), 4))s"
$animateSplat = @{
    Dur = $animateDuration
    RepeatDur = "indefinite"
}

$Color = "#4488ff"

=<svg> -ViewBox 400, 400 -Fill black @(
    =<svg.pattern> -Width .25 -Height .25 @(
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
    =<svg.rect> -Width 400 -Height 400 -Fill "url(#fillPattern)" -X 0 -Y 0
)
#### EXAMPLE 20
```PowerShell
$bpm = 104
```
$animateDuration = "$([Math]::Round(1/($bpm / 60), 4))s"
$animateSplat = @{
    Dur = $animateDuration
    RepeatDur = "indefinite"
}

$Color = "#4488ff"

=<svg> -ViewBox 400, 400 -Fill black @(
    =<svg.pattern> -Width .25 -Height .25 @(
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
    =<svg.rect> -Width 400 -Height 400 -Fill "url(#fillPattern)" -X 0 -Y 0
)
#### EXAMPLE 21
```PowerShell
$bpm = 104
```
$animateDuration = "$([Math]::Round(1/($bpm / 60), 4))s"
$animateSplat = @{
    Dur = $animateDuration
    RepeatDur = "indefinite"
}

$Color = "#4488ff"

=<svg> -ViewBox 400, 400 -Fill black @(
    =<svg.pattern> -Width .25 -Height .25 @(
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
    =<svg.rect> -Width 400 -Height 400 -Fill "url(#fillPattern)" -X 0 -Y 0
)
#### EXAMPLE 22
```PowerShell
$bpm = 104
```
$animateDuration = "$([Math]::Round(1/($bpm / 60), 4))s"
$animateSplat = @{
    Dur = $animateDuration
    RepeatDur = "indefinite"
}

$Color = "#4488ff"

=<svg> -ViewBox 400, 400 -Fill black @(
    =<svg.pattern> -Width .25 -Height .25 @(
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
    =<svg.rect> -Width 400 -Height 400 -Fill "url(#fillPattern)" -X 0 -Y 0
)
#### EXAMPLE 23
```PowerShell
$bpm = 104
```
$animateDuration = "$([Math]::Round(1/($bpm / 60), 4))s"
$animateSplat = @{
    Dur = $animateDuration
    RepeatDur = "indefinite"
}

$Color = "#4488ff"

=<svg> -ViewBox 400, 400 -Fill black @(
    =<svg.pattern> -Width .25 -Height .25 @(
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
    =<svg.rect> -Width 400 -Height 400 -Fill "url(#fillPattern)" -X 0 -Y 0
)
#### EXAMPLE 24
```PowerShell
$bpm = 104
```
$animateDuration = "$([Math]::Round(1/($bpm / 60), 4))s"
$animateSplat = @{
    Dur = $animateDuration
    RepeatDur = "indefinite"
}

$Color = "#4488ff"

=<svg> -ViewBox 400, 400 -Fill black @(
    =<svg.pattern> -Width .25 -Height .25 @(
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
    =<svg.rect> -Width 400 -Height 400 -Fill "url(#fillPattern)" -X 0 -Y 0
)
#### EXAMPLE 25
```PowerShell
$bpm = 104
```
$animateDuration = "$([Math]::Round(1/($bpm / 60), 4))s"
$animateSplat = @{
    Dur = $animateDuration
    RepeatDur = "indefinite"
}

$Color = "#4488ff"

=<svg> -ViewBox 400, 400 -Fill black @(
    =<svg.pattern> -Width .25 -Height .25 @(
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
    =<svg.rect> -Width 400 -Height 400 -Fill "url(#fillPattern)" -X 0 -Y 0
)
#### EXAMPLE 26
```PowerShell
$bpm = 104
```
$animateDuration = "$([Math]::Round(1/($bpm / 60), 4))s"
$animateSplat = @{
    Dur = $animateDuration
    RepeatDur = "indefinite"
}

$Color = "#4488ff"

=<svg> -ViewBox 400, 400 -Fill black @(
    =<svg.pattern> -Width .25 -Height .25 @(
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
    =<svg.rect> -Width 400 -Height 400 -Fill "url(#fillPattern)" -X 0 -Y 0
)
#### EXAMPLE 27
```PowerShell
$bpm = 104
```
$animateDuration = "$([Math]::Round(1/($bpm / 60), 4))s"
$animateSplat = @{
    Dur = $animateDuration
    RepeatDur = "indefinite"
}

$Color = "#4488ff"

=<svg> -ViewBox 400, 400 -Fill black @(
    =<svg.pattern> -Width .25 -Height .25 @(
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
    =<svg.rect> -Width 400 -Height 400 -Fill "url(#fillPattern)" -X 0 -Y 0
)
#### EXAMPLE 28
```PowerShell
$bpm = 104
```
$animateDuration = "$([Math]::Round(1/($bpm / 60), 4))s"
$animateSplat = @{
    Dur = $animateDuration
    RepeatDur = "indefinite"
}

$Color = "#4488ff"

=<svg> -ViewBox 400, 400 -Fill black @(
    =<svg.pattern> -Width .25 -Height .25 @(
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
    =<svg.rect> -Width 400 -Height 400 -Fill "url(#fillPattern)" -X 0 -Y 0
)
#### EXAMPLE 29
```PowerShell
$bpm = 104
```
$animateDuration = "$([Math]::Round(1/($bpm / 60), 4))s"
$animateSplat = @{
    Dur = $animateDuration
    RepeatDur = "indefinite"
}

$Color = "#4488ff"

=<svg> -ViewBox 400, 400 -Fill black @(
    =<svg.pattern> -Width .25 -Height .25 @(
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
    =<svg.rect> -Width 400 -Height 400 -Fill "url(#fillPattern)" -X 0 -Y 0
)
#### EXAMPLE 30
```PowerShell
$bpm = 104
```
$animateDuration = "$([Math]::Round(1/($bpm / 60), 4))s"
$animateSplat = @{
    Dur = $animateDuration
    RepeatDur = "indefinite"
}

$Color = "#4488ff"

=<svg> -ViewBox 400, 400 -Fill black @(
    =<svg.pattern> -Width .25 -Height .25 @(
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
    =<svg.rect> -Width 400 -Height 400 -Fill "url(#fillPattern)" -X 0 -Y 0
)
#### EXAMPLE 31
```PowerShell
$bpm = 104
```
$animateDuration = "$([Math]::Round(1/($bpm / 60), 4))s"
$animateSplat = @{
    Dur = $animateDuration
    RepeatDur = "indefinite"
}

$Color = "#4488ff"

=<svg> -ViewBox 400, 400 -Fill black @(
    =<svg.pattern> -Width .25 -Height .25 @(
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
    =<svg.rect> -Width 400 -Height 400 -Fill "url(#fillPattern)" -X 0 -Y 0
)
#### EXAMPLE 32
```PowerShell
$bpm = 104
```
$animateDuration = "$([Math]::Round(1/($bpm / 60), 4))s"
$animateSplat = @{
    Dur = $animateDuration
    RepeatDur = "indefinite"
}

$Color = "#4488ff"

=<svg> -ViewBox 400, 400 -Fill black @(
    =<svg.pattern> -Width .25 -Height .25 @(
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
    =<svg.rect> -Width 400 -Height 400 -Fill "url(#fillPattern)" -X 0 -Y 0
)
#### EXAMPLE 33
```PowerShell
$bpm = 104
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
    =&lt;svg.g&gt; -Content @(
        =&lt;svg.text&gt; -Y &quot;50%&quot; -X &quot;50%&quot; -DominantBaseline middle -TextAnchor middle -Text &quot;Fading in&quot; -Fill &#39;#4488ff&#39;
```
# If you only want to fade in once, remove the -RepeatCount
        =<svg.animate> -Values '0;1' -AttributeName opacity -Begin '0s' -End '1s' -Dur '1s' -RepeatCount 'indefinite'
    )
)
#### EXAMPLE 35
```PowerShell
-Content @(
    =&lt;svg.defs&gt; @(
        =&lt;svg.LinearGradient&gt; -Id myGradient -Content @(
            =&lt;svg.stop&gt; -Stopcolor gold @(
                =&lt;svg.animate&gt; -AttributeName offset -Values &#39;.1;.99;.1&#39; -Dur 5s -RepeatCount indefinite
            )
            =&lt;svg.stop&gt; -Stopcolor red @(
                =&lt;svg.animate&gt; -AttributeName offset -Values &#39;100;0;100&#39; -Dur 5s -RepeatCount indefinite
            )
        )
    )
    =&lt;svg.rect&gt; -Fill &#39;url(#myGradient)&#39; -x 0 -Y 0 -Width 100 -Height 100
) -ViewBox &#39;0 0 100 100&#39;
```

#### EXAMPLE 36
```PowerShell
-Content @(
    =&lt;svg.defs&gt; @(
        =&lt;svg.LinearGradient&gt; -Id myGradient -Content @(
            =&lt;svg.stop&gt; -Stopcolor gold @(
                =&lt;svg.animate&gt; -AttributeName offset -Values &#39;.1;.99;.1&#39; -Dur 5s -RepeatCount indefinite
            )
            =&lt;svg.stop&gt; -Stopcolor red @(
                =&lt;svg.animate&gt; -AttributeName offset -Values &#39;100;0;100&#39; -Dur 5s -RepeatCount indefinite
            )
        )
    )
    =&lt;svg.rect&gt; -Fill &#39;url(#myGradient)&#39; -x 0 -Y 0 -Width 100 -Height 100
) -ViewBox &#39;0 0 100 100&#39;
```

#### EXAMPLE 37
```PowerShell
$colors = @(&#39;red&#39;,&#39;green&#39;,&#39;blue&#39;)
=&lt;svg&gt; @(
    foreach ($n in 1..10) {
        $n10 = $n * 10
        =&lt;svg.rect&gt; -X $n10 -Y $n10 -Width $n10 -Height $n10 -Style @{
            fill   = $colors[$n % $colors.Length]
            stroke = $colors[($n + 1) % $colors.Length]
        } @(
            =&lt;svg.animate&gt; -AttributeName rx -Values &quot;0;50;0&quot; -Dur &quot;10s&quot; -RepeatCount indefinite
            =&lt;svg.animate&gt; -AttributeName x -Values &quot;$($n10);$(200 - $n10/2);$($n10);&quot; -Dur &quot;10s&quot; -RepeatCount indefinite
        )
    }
)
```

#### EXAMPLE 38
```PowerShell
$colors = @(&#39;red&#39;,&#39;green&#39;,&#39;blue&#39;)
=&lt;svg&gt; @(
    foreach ($n in 1..10) {
        $n10 = $n * 10
        =&lt;svg.rect&gt; -X $n10 -Y $n10 -Width $n10 -Height $n10 -Style @{
            fill   = $colors[$n % $colors.Length]
            stroke = $colors[($n + 1) % $colors.Length]
        } @(
            =&lt;svg.animate&gt; -AttributeName rx -Values &quot;0;50;0&quot; -Dur &quot;10s&quot; -RepeatCount indefinite
            =&lt;svg.animate&gt; -AttributeName x -Values &quot;$($n10);$(200 - $n10/2);$($n10);&quot; -Dur &quot;10s&quot; -RepeatCount indefinite
        )
    }
)
```

#### EXAMPLE 39
```PowerShell
-Content @(
    =&lt;svg.polygon&gt; -Points &quot;25,50 50,75 75,50 50,25&quot; -Fill &#39;#4488ff&#39; @(
        =&lt;svg.animate&gt; -AttributeName points -to &quot;0,0 0,100 100,100, 100,0&quot; -Dur 2s -Id morph1 -Begin &#39;0s;morph2.end&#39; -AttributeType XML
        =&lt;svg.animate&gt; -AttributeName opacity -Values &#39;0&#39; -Dur &#39;0.0s&#39; -Begin &#39;morph1.end&#39; -AttributeType XML
        =&lt;svg.animate&gt; -AttributeName opacity -Values &#39;1&#39; -Dur &#39;0.0s&#39; -Begin &#39;morph1.end&#39; -AttributeType XML
    )
    =&lt;svg.polygon&gt; -Points &quot;0,0 0,100 100,100, 100,0&quot; -Fill &#39;#4488ff&#39; @(
        =&lt;svg.animate&gt; -AttributeName opacity -Values &#39;1&#39; -Dur &#39;0.0s&#39; -Begin &#39;morph1.end&#39; -AttributeType XML
        =&lt;svg.animate&gt; -AttributeName points -to &quot;25,50 50,75 75,50 50,25&quot; -Dur 2s -Id morph2 -Begin &#39;morph1.end&#39; -AttributeType XML
        =&lt;svg.animate&gt; -AttributeName opacity -Values &#39;0&#39; -Dur &#39;0.0s&#39; -Begin &#39;morph2.end&#39; -AttributeType XML
    ) -Opacity 0
```
) -ViewBox 100,100
#### EXAMPLE 40
```PowerShell
-Content @(
    =&lt;svg.polygon&gt; -Points &quot;25,50 50,75 75,50 50,25&quot; -Fill &#39;#4488ff&#39; @(
        =&lt;svg.animate&gt; -AttributeName points -to &quot;0,0 0,100 100,100, 100,0&quot; -Dur 2s -Id morph1 -Begin &#39;0s;morph2.end&#39; -AttributeType XML
        =&lt;svg.animate&gt; -AttributeName opacity -Values &#39;0&#39; -Dur &#39;0.0s&#39; -Begin &#39;morph1.end&#39; -AttributeType XML
        =&lt;svg.animate&gt; -AttributeName opacity -Values &#39;1&#39; -Dur &#39;0.0s&#39; -Begin &#39;morph1.end&#39; -AttributeType XML
    )
    =&lt;svg.polygon&gt; -Points &quot;0,0 0,100 100,100, 100,0&quot; -Fill &#39;#4488ff&#39; @(
        =&lt;svg.animate&gt; -AttributeName opacity -Values &#39;1&#39; -Dur &#39;0.0s&#39; -Begin &#39;morph1.end&#39; -AttributeType XML
        =&lt;svg.animate&gt; -AttributeName points -to &quot;25,50 50,75 75,50 50,25&quot; -Dur 2s -Id morph2 -Begin &#39;morph1.end&#39; -AttributeType XML
        =&lt;svg.animate&gt; -AttributeName opacity -Values &#39;0&#39; -Dur &#39;0.0s&#39; -Begin &#39;morph2.end&#39; -AttributeType XML
    ) -Opacity 0
```
) -ViewBox 100,100
#### EXAMPLE 41
```PowerShell
-Content @(
    =&lt;svg.polygon&gt; -Points &quot;25,50 50,75 75,50 50,25&quot; -Fill &#39;#4488ff&#39; @(
        =&lt;svg.animate&gt; -AttributeName points -to &quot;0,0 0,100 100,100, 100,0&quot; -Dur 2s -Id morph1 -Begin &#39;0s;morph2.end&#39; -AttributeType XML
        =&lt;svg.animate&gt; -AttributeName opacity -Values &#39;0&#39; -Dur &#39;0.0s&#39; -Begin &#39;morph1.end&#39; -AttributeType XML
        =&lt;svg.animate&gt; -AttributeName opacity -Values &#39;1&#39; -Dur &#39;0.0s&#39; -Begin &#39;morph1.end&#39; -AttributeType XML
    )
    =&lt;svg.polygon&gt; -Points &quot;0,0 0,100 100,100, 100,0&quot; -Fill &#39;#4488ff&#39; @(
        =&lt;svg.animate&gt; -AttributeName opacity -Values &#39;1&#39; -Dur &#39;0.0s&#39; -Begin &#39;morph1.end&#39; -AttributeType XML
        =&lt;svg.animate&gt; -AttributeName points -to &quot;25,50 50,75 75,50 50,25&quot; -Dur 2s -Id morph2 -Begin &#39;morph1.end&#39; -AttributeType XML
        =&lt;svg.animate&gt; -AttributeName opacity -Values &#39;0&#39; -Dur &#39;0.0s&#39; -Begin &#39;morph2.end&#39; -AttributeType XML
    ) -Opacity 0
```
) -ViewBox 100,100
#### EXAMPLE 42
```PowerShell
-Content @(
    =&lt;svg.polygon&gt; -Points &quot;25,50 50,75 75,50 50,25&quot; -Fill &#39;#4488ff&#39; @(
        =&lt;svg.animate&gt; -AttributeName points -to &quot;0,0 0,100 100,100, 100,0&quot; -Dur 2s -Id morph1 -Begin &#39;0s;morph2.end&#39; -AttributeType XML
        =&lt;svg.animate&gt; -AttributeName opacity -Values &#39;0&#39; -Dur &#39;0.0s&#39; -Begin &#39;morph1.end&#39; -AttributeType XML
        =&lt;svg.animate&gt; -AttributeName opacity -Values &#39;1&#39; -Dur &#39;0.0s&#39; -Begin &#39;morph1.end&#39; -AttributeType XML
    )
    =&lt;svg.polygon&gt; -Points &quot;0,0 0,100 100,100, 100,0&quot; -Fill &#39;#4488ff&#39; @(
        =&lt;svg.animate&gt; -AttributeName opacity -Values &#39;1&#39; -Dur &#39;0.0s&#39; -Begin &#39;morph1.end&#39; -AttributeType XML
        =&lt;svg.animate&gt; -AttributeName points -to &quot;25,50 50,75 75,50 50,25&quot; -Dur 2s -Id morph2 -Begin &#39;morph1.end&#39; -AttributeType XML
        =&lt;svg.animate&gt; -AttributeName opacity -Values &#39;0&#39; -Dur &#39;0.0s&#39; -Begin &#39;morph2.end&#39; -AttributeType XML
    ) -Opacity 0
```
) -ViewBox 100,100
#### EXAMPLE 43
```PowerShell
-Content @(
    =&lt;svg.polygon&gt; -Points &quot;25,50 50,75 75,50 50,25&quot; -Fill &#39;#4488ff&#39; @(
        =&lt;svg.animate&gt; -AttributeName points -to &quot;0,0 0,100 100,100, 100,0&quot; -Dur 2s -Id morph1 -Begin &#39;0s;morph2.end&#39; -AttributeType XML
        =&lt;svg.animate&gt; -AttributeName opacity -Values &#39;0&#39; -Dur &#39;0.0s&#39; -Begin &#39;morph1.end&#39; -AttributeType XML
        =&lt;svg.animate&gt; -AttributeName opacity -Values &#39;1&#39; -Dur &#39;0.0s&#39; -Begin &#39;morph1.end&#39; -AttributeType XML
    )
    =&lt;svg.polygon&gt; -Points &quot;0,0 0,100 100,100, 100,0&quot; -Fill &#39;#4488ff&#39; @(
        =&lt;svg.animate&gt; -AttributeName opacity -Values &#39;1&#39; -Dur &#39;0.0s&#39; -Begin &#39;morph1.end&#39; -AttributeType XML
        =&lt;svg.animate&gt; -AttributeName points -to &quot;25,50 50,75 75,50 50,25&quot; -Dur 2s -Id morph2 -Begin &#39;morph1.end&#39; -AttributeType XML
        =&lt;svg.animate&gt; -AttributeName opacity -Values &#39;0&#39; -Dur &#39;0.0s&#39; -Begin &#39;morph2.end&#39; -AttributeType XML
    ) -Opacity 0
```
) -ViewBox 100,100
#### EXAMPLE 44
```PowerShell
-Content @(
    =&lt;svg.polygon&gt; -Points &quot;25,50 50,75 75,50 50,25&quot; -Fill &#39;#4488ff&#39; @(
        =&lt;svg.animate&gt; -AttributeName points -to &quot;0,0 0,100 100,100, 100,0&quot; -Dur 2s -Id morph1 -Begin &#39;0s;morph2.end&#39; -AttributeType XML
        =&lt;svg.animate&gt; -AttributeName opacity -Values &#39;0&#39; -Dur &#39;0.0s&#39; -Begin &#39;morph1.end&#39; -AttributeType XML
        =&lt;svg.animate&gt; -AttributeName opacity -Values &#39;1&#39; -Dur &#39;0.0s&#39; -Begin &#39;morph1.end&#39; -AttributeType XML
    )
    =&lt;svg.polygon&gt; -Points &quot;0,0 0,100 100,100, 100,0&quot; -Fill &#39;#4488ff&#39; @(
        =&lt;svg.animate&gt; -AttributeName opacity -Values &#39;1&#39; -Dur &#39;0.0s&#39; -Begin &#39;morph1.end&#39; -AttributeType XML
        =&lt;svg.animate&gt; -AttributeName points -to &quot;25,50 50,75 75,50 50,25&quot; -Dur 2s -Id morph2 -Begin &#39;morph1.end&#39; -AttributeType XML
        =&lt;svg.animate&gt; -AttributeName opacity -Values &#39;0&#39; -Dur &#39;0.0s&#39; -Begin &#39;morph2.end&#39; -AttributeType XML
    ) -Opacity 0
```
) -ViewBox 100,100
#### EXAMPLE 45
```PowerShell
-Content @(
    =&lt;svg.defs&gt; @(
        =&lt;svg.LinearGradient&gt; -Id myGradient -Content @(
            =&lt;svg.stop&gt; -Offset &#39;10%&#39; -Stopcolor transparent
            =&lt;svg.stop&gt; -Offset &#39;95%&#39; -Stopcolor &#39;#4488ff&#39;
            =&lt;svg.animate&gt; -AttributeName y1 -From 0 -To 1 -Id animateY1 -Fill freeze -Dur &#39;3s&#39;
            =&lt;svg.animate&gt; -AttributeName y2 -Dur &quot;3s&quot; -From 1 -to 0 -Id &#39;animateY2&#39; -Fill freeze -Begin &#39;animateY1.end&#39;
            =&lt;svg.animate&gt; -AttributeName x1 -Values &#39;1;0&#39; -Dur &#39;3s&#39; -Begin &#39;animateY2.end&#39; -Fill freeze -Id animateX1
            =&lt;svg.animate&gt; -AttributeName x2 -Values &#39;0;1&#39; -Dur &#39;3s&#39; -Begin &#39;animateX1.end&#39; -Fill freeze
        ) -X1 100% -X2 0 -Y1 0% -Y2 100%
```
)
    =<svg.rect> -Fill 'url(#myGradient)' -Width 100 -Height 100
) -viewbox 0,0,100,100
#### EXAMPLE 46
```PowerShell
-Content @(
    =&lt;svg.defs&gt; @(
        =&lt;svg.LinearGradient&gt; -Id myGradient -Content @(
            =&lt;svg.stop&gt; -Offset &#39;10%&#39; -Stopcolor transparent
            =&lt;svg.stop&gt; -Offset &#39;95%&#39; -Stopcolor &#39;#4488ff&#39;
            =&lt;svg.animate&gt; -AttributeName y1 -From 0 -To 1 -Id animateY1 -Fill freeze -Dur &#39;3s&#39;
            =&lt;svg.animate&gt; -AttributeName y2 -Dur &quot;3s&quot; -From 1 -to 0 -Id &#39;animateY2&#39; -Fill freeze -Begin &#39;animateY1.end&#39;
            =&lt;svg.animate&gt; -AttributeName x1 -Values &#39;1;0&#39; -Dur &#39;3s&#39; -Begin &#39;animateY2.end&#39; -Fill freeze -Id animateX1
            =&lt;svg.animate&gt; -AttributeName x2 -Values &#39;0;1&#39; -Dur &#39;3s&#39; -Begin &#39;animateX1.end&#39; -Fill freeze
        ) -X1 100% -X2 0 -Y1 0% -Y2 100%
```
)
    =<svg.rect> -Fill 'url(#myGradient)' -Width 100 -Height 100
) -viewbox 0,0,100,100
#### EXAMPLE 47
```PowerShell
-Content @(
    =&lt;svg.defs&gt; @(
        =&lt;svg.LinearGradient&gt; -Id myGradient -Content @(
            =&lt;svg.stop&gt; -Offset &#39;10%&#39; -Stopcolor transparent
            =&lt;svg.stop&gt; -Offset &#39;95%&#39; -Stopcolor &#39;#4488ff&#39;
            =&lt;svg.animate&gt; -AttributeName y1 -From 0 -To 1 -Id animateY1 -Fill freeze -Dur &#39;3s&#39;
            =&lt;svg.animate&gt; -AttributeName y2 -Dur &quot;3s&quot; -From 1 -to 0 -Id &#39;animateY2&#39; -Fill freeze -Begin &#39;animateY1.end&#39;
            =&lt;svg.animate&gt; -AttributeName x1 -Values &#39;1;0&#39; -Dur &#39;3s&#39; -Begin &#39;animateY2.end&#39; -Fill freeze -Id animateX1
            =&lt;svg.animate&gt; -AttributeName x2 -Values &#39;0;1&#39; -Dur &#39;3s&#39; -Begin &#39;animateX1.end&#39; -Fill freeze
        ) -X1 100% -X2 0 -Y1 0% -Y2 100%
```
)
    =<svg.rect> -Fill 'url(#myGradient)' -Width 100 -Height 100
) -viewbox 0,0,100,100
#### EXAMPLE 48
```PowerShell
-Content @(
    =&lt;svg.defs&gt; @(
        =&lt;svg.LinearGradient&gt; -Id myGradient -Content @(
            =&lt;svg.stop&gt; -Offset &#39;10%&#39; -Stopcolor transparent
            =&lt;svg.stop&gt; -Offset &#39;95%&#39; -Stopcolor &#39;#4488ff&#39;
            =&lt;svg.animate&gt; -AttributeName y1 -From 0 -To 1 -Id animateY1 -Fill freeze -Dur &#39;3s&#39;
            =&lt;svg.animate&gt; -AttributeName y2 -Dur &quot;3s&quot; -From 1 -to 0 -Id &#39;animateY2&#39; -Fill freeze -Begin &#39;animateY1.end&#39;
            =&lt;svg.animate&gt; -AttributeName x1 -Values &#39;1;0&#39; -Dur &#39;3s&#39; -Begin &#39;animateY2.end&#39; -Fill freeze -Id animateX1
            =&lt;svg.animate&gt; -AttributeName x2 -Values &#39;0;1&#39; -Dur &#39;3s&#39; -Begin &#39;animateX1.end&#39; -Fill freeze
        ) -X1 100% -X2 0 -Y1 0% -Y2 100%
```
)
    =<svg.rect> -Fill 'url(#myGradient)' -Width 100 -Height 100
) -viewbox 0,0,100,100
#### EXAMPLE 49
```PowerShell
-Content @(
    =&lt;svg.defs&gt; @(
        =&lt;svg.radialGradient&gt; -Id myGradient -Content @(
            =&lt;svg.stop&gt; -Offset &#39;1%&#39; -Stopcolor gold @(
                =&lt;svg.animate&gt; -AttributeName offset -Values &#39;.1;.99;.1&#39; -Dur 5s -RepeatCount indefinite
            )
            =&lt;svg.stop&gt; -Offset &#39;100%&#39; -Stopcolor red
        )
    )
    =&lt;svg.circle&gt; -Fill &#39;url(#myGradient)&#39; -Cx 50 -Cy 50 -R 35
) -ViewBox &#39;0 0 100 100&#39;
```

---
### Parameters
#### **Content**

The Contents of the animate element



> **Type**: ```[Object]```

> **Required**: false

> **Position**: 1

> **PipelineInput**:true (ByPropertyName)



---
#### **Data**

A dictionary containing data.  This data will be embedded in data- attributes.



> **Type**: ```[IDictionary]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)



---
#### **Attribute**

A dictionary of attributes.  This can set any attribute not exposed in other parameters.



> **Type**: ```[IDictionary]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)



---
#### **Href**

The **`href`** attribute defines a link to a resource as a reference [URL](https://developer.mozilla.org/en-US/docs/Web/SVG/Content_type#url). The exact meaning of that link depends on the context of each element using it.

> **Note:** Specifications before SVG 2 defined an xlink:href attribute, which is now rendered obsolete by the `href` attribute. If you need to support earlier browser versions, the deprecated `xlink:href` attribute can be used as a fallback in addition to the `href` attribute, e.g. `<use href="some-id" xlink:href="some-id x="5" y="5" />`.



> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)



---
#### **AttributeType**

The **`attributeType`** attribute specifies the namespace in which the target attribute and its associated values are defined.



> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)



---
#### **AttributeName**

The **`attributeName`** attribute indicates the name of the CSS property or attribute of the target element that is going to be changed during an animation.



> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)



---
#### **Begin**

The **`begin`** attribute defines when an animation should begin or when an element should be discarded.

The attribute value is a semicolon separated list of values. The interpretation of a list of start times is detailed in the SMIL specification in ["Evaluation of begin and end time lists"](https://developer.mozilla.orghttps://www.w3.org/TR/2001/REC-smil-animation-20010904/#Timing-EvaluationOfBeginEndTimeLists). Each individual value can be one of the following : `<offset-value>`, `<syncbase-value>`, `<event-value>`, `<repeat-value>`, `<accessKey-value>`, `<wallclock-sync-value>` or the keyword `indefinite`.



> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)



---
#### **Dur**

The **`dur`** attribute indicates the simple duration of an animation.



> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)



---
#### **End**

The **`end`** attribute defines an end value for the animation that can constrain the active duration.



> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)



---
#### **Min**

The **`min`** attribute specifies the minimum value of the active animation duration.



> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)



---
#### **Max**

The **`max`** attribute specifies the maximum value of the active animation duration.



> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)



---
#### **Restart**

The **`restart`** attribute specifies whether or not an animation can restart.



> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)



---
#### **RepeatCount**

The **`repeatCount`** attribute indicates the number of times an animation will take place.



> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)



---
#### **RepeatDur**

The **`repeatDur`** attribute specifies the total duration for repeating an animation.



> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)



---
#### **Fill**

The **`fill`** attribute has two different meanings. For shapes and text it's a presentation attribute that defines the color (_or any SVG paint servers like gradients or patterns_) used to paint the element; for animation it defines the final state of the animation.



> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)



---
#### **CalcMode**

The **`calcMode`** attribute specifies the interpolation mode for the animation.

The default mode is `linear`, however if the attribute does not support linear interpolation (e.g. for strings), the `calcMode` attribute is ignored and discrete interpolation is used.



> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)



---
#### **Values**

The `values` attribute has different meanings, depending upon the context where it's used, either it defines a sequence of values used over the course of an animation, or it's a list of numbers for a color matrix, which is interpreted differently depending on the type of color change to be performed.



> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)



---
#### **KeyTimes**

The **`keyTimes`** attribute represents a list of time values used to control the pacing of the animation.

Each time in the list corresponds to a value in the values attribute list, and defines when the value is used in the animation. Each time value in the `keyTimes` list is specified as a floating point value between 0 and 1 (inclusive), representing a proportional offset into the duration of the animation element.



> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)



---
#### **KeySplines**

The **`keySplines`** attribute defines a set of [Bézier curve](https://developer.mozilla.org/en-US/docs/Glossary/Bezier_curve) control points associated with the keyTimes list, defining a cubic Bézier function that controls interval pacing.

This attribute is ignored unless the calcMode attribute is set to `spline`.

If there are any errors in the keySplines specification (bad values, too many or too few values), the animation will not occur.



> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)



---
#### **From**

The **`from`** attribute indicates the initial value of the attribute that will be modified during the animation.

When used with the to attribute, the animation will change the modified attribute from the `from` value to the `to` value. When used with the by attribute, the animation will change the attribute relatively from the `from` value by the value specified in `by`.



> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)



---
#### **To**

The **`to`** attribute indicates the final value of the attribute that will be modified during the animation.

The value of the attribute will change between the from attribute value and this value.



> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)



---
#### **By**

The **`by`** attribute specifies a relative offset value for an attribute that will be modified during an animation.

The starting value for the attribute is either indicated by specifying it as value for the attribute given in the attributeName or the from attribute.



> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)



---
#### **Additive**

The **`additive`** attribute controls whether or not an animation is additive.

It is frequently useful to define animation as an offset or delta to an attribute's value, rather than as absolute values.



> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)



---
#### **Accumulate**

The **`accumulate`** attribute controls whether or not an animation is cumulative.

It is frequently useful for repeated animations to build upon the previous results, accumulating with each iteration. This attribute said to the animation if the value is added to the previous animated attribute's value on each iteration.



> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)



---
#### **Id**

The **`id`** attribute assigns a unique name to an element.

You can use this attribute with any SVG element.



> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)



---
#### **Lang**

The **`lang`** attribute specifies the primary language used in contents and attributes containing text content of particular elements.

There is also an xml:lang attribute (with namespace). If both of them are defined, the one with namespace is used and the one without is ignored.

In SVG 1.1 there was a `lang` attribute defined with a different meaning and only applying to glyph elements. That attribute specified a list of languages according to {{RFC(5646, "Tags for Identifying Languages (also known as BCP 47)")}}. The glyph was meant to be used if the `xml:lang` attribute exactly matched one of the languages given in the value of this parameter, or if the `xml:lang` attribute exactly equaled a prefix of one of the languages given in the value of this parameter such that the first tag character following the prefix was "-".

You can use this attribute with any SVG element.



> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)



---
#### **Tabindex**

The **`tabindex`** attribute allows you to control whether an element is focusable and to define the relative order of the element for the purposes of sequential focus navigation.

You can use this attribute with any SVG element.



> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)



---
#### **XmlBase**

The **`xml:base`** attribute specifies a base IRI other than the base IRI of the document or external entity.

You can use this attribute with any SVG element.



> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)



---
#### **XmlLang**

The **`xml:lang`** attribute specifies the primary language used in contents and attributes containing text content of particular elements.

It is a universal attribute allowed in all XML dialects to mark up the natural human language that an element contains.

There is also a lang attribute (without namespace). If both of them are defined, the one with namespace is used and the one without is ignored.

You can use this attribute with any SVG element.



> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)



---
#### **XmlSpace**

SVG supports the built-in XML **`xml:space`** attribute to handle whitespace characters inside elements. Child elements inside an element may also have an `xml:space` attribute that overrides the parent's one.

> **Note:** Instead of using the `xml:space` attribute, use the white-space CSS property.

This attribute influences how browsers parse text content and therefore changes the way the DOM is built. Therefore, changing this attribute's value through the DOM API may have no effect.

You can use this attribute with any SVG element.



> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)



---
#### **Class**

« [SVG Attribute reference home](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute)

Assigns a class name or set of class names to an element. You may assign the same class name or names to any number of elements, however, multiple class names must be separated by whitespace characters.

An element's class name serves two key roles:

* As a style sheet selector, for when an author assigns style information to a set of elements.
* For general use by the browser.

You can use this class to style SVG content using CSS.



> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)



---
#### **Style**

The **`style`** attribute allows to style an element using CSS declarations. It functions identically to [the `style` attribute in HTML](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/style).

You can use this attribute with any SVG element.



> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)



---
### Syntax
```PowerShell
SVG.animate [[-Content] &lt;Object&gt;] [-Data &lt;IDictionary&gt;] [-Attribute &lt;IDictionary&gt;] [-Href &lt;Object&gt;] [-AttributeType &lt;Object&gt;] [-AttributeName &lt;Object&gt;] [-Begin &lt;Object&gt;] [-Dur &lt;Object&gt;] [-End &lt;Object&gt;] [-Min &lt;Object&gt;] [-Max &lt;Object&gt;] [-Restart &lt;Object&gt;] [-RepeatCount &lt;Object&gt;] [-RepeatDur &lt;Object&gt;] [-Fill &lt;Object&gt;] [-CalcMode &lt;Object&gt;] [-Values &lt;Object&gt;] [-KeyTimes &lt;Object&gt;] [-KeySplines &lt;Object&gt;] [-From &lt;Object&gt;] [-To &lt;Object&gt;] [-By &lt;Object&gt;] [-Additive &lt;Object&gt;] [-Accumulate &lt;Object&gt;] [-Id &lt;Object&gt;] [-Lang &lt;Object&gt;] [-Tabindex &lt;Object&gt;] [-XmlBase &lt;Object&gt;] [-XmlLang &lt;Object&gt;] [-XmlSpace &lt;Object&gt;] [-Class &lt;Object&gt;] [-Style &lt;Object&gt;] [&lt;CommonParameters&gt;]
```
---


