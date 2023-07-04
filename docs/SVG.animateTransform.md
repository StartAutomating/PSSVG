SVG.animateTransform
--------------------




### Synopsis
Creates SVG animateTransform elements



---


### Description

The `animateTransform` element animates a transformation attribute on its target element, thereby allowing animations to control translation, scaling, rotation, and/or skewing.



---


### Related Links
* [https://pssvg.start-automating.com/SVG.animateTransform](https://pssvg.start-automating.com/SVG.animateTransform)



* [https://developer.mozilla.org/en-US/web/svg/element/animatetransform/](https://developer.mozilla.org/en-US/web/svg/element/animatetransform/)



* [Write-SVG](Write-SVG.md)





---


### Examples
#### EXAMPLE 1
```PowerShell
$path = "M20,50 C20,-50 180,150 180,50 C180-50 20,150 20,50 z"
SVG -viewBox "0 0 200 100" @(
    SVG.path -d $path -Fill none -Stroke lightgrey
    SVG.circle -r 5 -Fill red (
        SVG.animateMotion -Dur 10s -RepeatCount 'indefinite' -Path $path
    )
    SVG.rect -Width 2 -Height 2 -X -1 -Y -1 -Fill blue @(
        SVG.animateMotion -Dur 10s -RepeatCount 'indefinite' -Path $path
        SVG.animateTransform -AttributeName transform -From "0 0 0"  -To "360 0 0" -dur "5s" -RepeatCount indefinite -AttributeType xml -type rotate
    )
)
```

#### EXAMPLE 2
```PowerShell
svg -ViewBox 0, 0, 250, 200 -Content @(
    svg.defs (
        svg.pattern -id star -ViewBox 0,0, 10, 10 -Width 10% -Height 10% @(
            svg.polygon -Points "0,0", "2,5", "0,10", "5,8", "10,10","8,5", "10,0", "5,2" @(
                svg.animateTransform -AttributeName transform -From "0 5 5"  -To "360 5 5" -dur "5s" -RepeatCount indefinite -AttributeType xml -type rotate
            ) -Fill '#4488ff'
        )
    )
    svg.circle -cx 50 -cy 100 -r 50 -Fill 'url(#star)'
    svg.circle -cx 180 -cy 100 -r 50 -Fill 'none' -StrokeWidth 20 -Stroke 'url(#star)' -Content @(
        svg.animateTransform -AttributeName transform -From "0 180 100"  -To "360 180 100" -dur "5s" -RepeatCount indefinite -AttributeType xml -type rotate
    )
)
```

#### EXAMPLE 3
```PowerShell
svg -ViewBox 0, 0, 250, 200 -Content @(
    svg.defs (
        svg.pattern -id star -ViewBox 0,0, 10, 10 -Width 10% -Height 10% @(
            svg.polygon -Points "0,0", "2,5", "0,10", "5,8", "10,10","8,5", "10,0", "5,2" @(
                svg.animateTransform -AttributeName transform -From "0 5 5"  -To "360 5 5" -dur "5s" -RepeatCount indefinite -AttributeType xml -type rotate
            ) -Fill '#4488ff'
        )
    )
    svg.circle -cx 50 -cy 100 -r 50 -Fill 'url(#star)'
    svg.circle -cx 180 -cy 100 -r 50 -Fill 'none' -StrokeWidth 20 -Stroke 'url(#star)' -Content @(
        svg.animateTransform -AttributeName transform -From "0 180 100"  -To "360 180 100" -dur "5s" -RepeatCount indefinite -AttributeType xml -type rotate
    )
)
```

#### EXAMPLE 4
```PowerShell
svg -ViewBox 0, 0, 100, 100 -Content @(
    svg.defs @(
        svg.pattern -id star -ViewBox 0,0, 10, 10 -Width 10% -Height 10% @(
            svg.polygon -Points "0,0", "2,5", "0,10", "5,8", "10,10","8,5", "10,0", "5,2" @(
                svg.animateTransform -AttributeName transform -From "0 5 5"  -To "360 5 5" -dur "5s" -RepeatCount indefinite -AttributeType xml -type rotate -
            ) -Fill white
        )
        svg.mask (
            svg.circle -Fill 'url(#star)' -r 50 -cx 50 -cy 50
        ) -Id myMask
        svg.radialGradient @(
            svg.stop -Offset '25%' -StopColor 'red'
            svg.stop -Offset '50%' -StopColor 'green'
            svg.stop -Offset '75%' -StopColor 'blue'
        ) -id myGradient
    )
    svg.circle -cx 50 -cy 50 -r 50 -Fill 'url(#myGradient)' -Mask 'url(#myMask)'
)
```

#### EXAMPLE 5
```PowerShell
param(
# The number of repetitions
[int]$RepeatCount = 80,
# The Center X coordinate of the shape
[float]$CenterX  = 100,
# The Center Y coordinate of the shape
[float]$CenterY  = 100,
# The radius coordinate of the shape.  This will decrease by 1/RepeatCount each time.
[float]$Radius   = 100,
# The number of sides
$SideCount  = 3,
# The total rotation of the innermost element,
$TotalRotation  = 180,
# The total duration of any animations.
[timespan]$duration = '00:00:03.75',
# A palette of colors to alternate thru
[string[]]$colors = @('#112244','#224488',"#4488ff"),
# The type of the shape. (either Star or ConvexPolygon)
[ValidateSet("Star", "ConvexPolygon")]
[string]
$ShapeType = 'ConvexPolygon',
```
# If set, will animate opacity between a low and high point, depending on the radius.
[switch]
$AnimateOpacity
)

$Splat = [Ordered]@{
    SideCount = $SideCount
    Fill = 'transparent'
    CenterX = $CenterX
    CenterY = $CenterY
}

$shapeCommand = $ExecutionContext.SessionState.InvokeCommand.GetCommand("SVG.$ShapeType", "Function")
SVG -ViewBox (($CenterX * 2), ($CenterY * 2)) @(
    SVG.rect -Width 1000% -Height 1000% -X -500% -Y -500% -Fill 'black'

    0..($RepeatCount -1) |
        . $shapeCommand @Splat -Rotate {
                $_ * ($totalRotation / $RepeatCount)
        } -Radius {
            $Radius - (
                $_ * ($Radius / $RepeatCount)
            )
        } -Stroke {
            $colors[$_ % $colors.Length]
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
#### EXAMPLE 6
```PowerShell
[Timespan]$RotateEvery = '00:00:10'
```
@(foreach ($n in 15, 636, 741, 901) {
    New-Object PSObject -Property @{
        Theta = [MATH]::PI * $n
        N =  $n
    }
}) | ForEach-Object {
    $n = $_.N
    svg -content (
        $_ | svg.Spiral -Stroke '#4488ff' -Content @(
            if ($RotateEvery.TotalSeconds) {
                svg.animatetransform -AttributeName transform -From "0 250 250"  -To "360 250 250" -dur "$($RotateEvery.TotalSeconds)s" -RepeatCount indefinite -AttributeType xml -type rotate
            }
        )
    ) -ViewBox 0,0,500,500
#### EXAMPLE 7
```PowerShell
foreach ($n in 5..12) {
```
svg -ViewBox 2,2 @(
    svg.Star -PointCount $n  -Fill 'transparent' -Stroke '#4488ff' -StrokeWidth 0.01
)
#### EXAMPLE 8
```PowerShell
foreach ($n in 5..12) {
```
svg -ViewBox 2,2 @(
    svg.Star -PointCount $n  -Fill 'transparent' -Stroke '#4488ff' -StrokeWidth 0.01
)
#### EXAMPLE 9
```PowerShell
foreach ($n in 5..12) {
```
svg -ViewBox 2,2 @(
    svg.Star -PointCount $n  -Fill 'transparent' -Stroke '#4488ff' -StrokeWidth 0.01
)
#### EXAMPLE 10
```PowerShell
foreach ($n in 5..12) {
```
svg -ViewBox 2,2 @(
    svg.Star -PointCount $n  -Fill 'transparent' -Stroke '#4488ff' -StrokeWidth 0.01
)
#### EXAMPLE 11
```PowerShell
foreach ($n in 5..12) {
```
svg -ViewBox 2,2 @(
    svg.Star -PointCount $n  -Fill 'transparent' -Stroke '#4488ff' -StrokeWidth 0.01
)
#### EXAMPLE 12
```PowerShell
foreach ($n in 5..12) {
```
svg -ViewBox 2,2 @(
    svg.Star -PointCount $n  -Fill 'transparent' -Stroke '#4488ff' -StrokeWidth 0.01
)
#### EXAMPLE 13
```PowerShell
$Radius = 35
$Center = 50
$RotateEvery = [Timespan]::FromSeconds(1.5)
svg -ViewBox 0,0, ($center * 2), ($center * 2) @(
    svg.circle -Fill transparent -Stroke '#4488ff' -Cx $center -Cy $center -R 35
    svg.line -Stroke '#4488ff' -X1 $center -x2 ($center + $radius) -Y1 $center -Y2 $center @(
        svg.animatetransform -AttributeName transform -From "0 $center $center"  -To "360 $center $center" -dur "$($RotateEvery.TotalSeconds)s" -RepeatCount indefinite -AttributeType xml -type rotate
    ) -Opacity 0.8
)
```

#### EXAMPLE 14
```PowerShell
SVG -ViewBox 1.986,1 -Content @(
    $g = (1.986 * .4) / 12
    $e = (7/13)/10
```
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
#### EXAMPLE 15
```PowerShell
SVG -ViewBox 1.986,1 -Content @(
    $g = (1.986 * .4) / 12
    $e = (7/13)/10
```
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
#### EXAMPLE 16
```PowerShell
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
```
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
#### EXAMPLE 17
```PowerShell
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
```
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


---


### Parameters
#### **Content**

The Contents of the animateTransform element






|Type      |Required|Position|PipelineInput                 |Aliases                                        |
|----------|--------|--------|------------------------------|-----------------------------------------------|
|`[Object]`|false   |1       |true (ByValue, ByPropertyName)|InputObject<br/>Text<br/>InnerText<br/>Contents|



#### **Data**

A dictionary containing data.  This data will be embedded in data- attributes.






|Type           |Required|Position|PipelineInput        |Aliases                         |
|---------------|--------|--------|---------------------|--------------------------------|
|`[IDictionary]`|false   |named   |true (ByPropertyName)|DataAttribute<br/>DataAttributes|



#### **On**

A dictionary or object containing event handlers.
Each key or property name will be the name of the event
Each value will be the handler.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Object]`|false   |named   |true (ByPropertyName)|



#### **Attribute**

A dictionary of attributes.  This can set any attribute not exposed in other parameters.






|Type           |Required|Position|PipelineInput        |Aliases                       |
|---------------|--------|--------|---------------------|------------------------------|
|`[IDictionary]`|false   |named   |true (ByPropertyName)|SVGAttributes<br/>SVGAttribute|



#### **Comment**

A comment that will appear before the element.






|Type      |Required|Position|PipelineInput        |Aliases |
|----------|--------|--------|---------------------|--------|
|`[String]`|false   |named   |true (ByPropertyName)|Comments|



#### **Children**

One or more child elements.  These will be treated as if they were content.






|Type        |Required|Position|PipelineInput        |Aliases|
|------------|--------|--------|---------------------|-------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|Child  |



#### **By**

The **`by`** attribute specifies a relative offset value for an attribute that will be modified during an animation.

The starting value for the attribute is either indicated by specifying it as value for the attribute given in the attributeName or the from attribute.






|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|



#### **From**

The **`from`** attribute indicates the initial value of the attribute that will be modified during the animation.

When used with the to attribute, the animation will change the modified attribute from the `from` value to the `to` value. When used with the by attribute, the animation will change the attribute relatively from the `from` value by the value specified in `by`.






|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|



#### **To**

The **`to`** attribute indicates the final value of the attribute that will be modified during the animation.

The value of the attribute will change between the from attribute value and this value.






|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|



#### **Type**




|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|



#### **RequiredFeatures**

The **`requiredFeatures`** attribute takes a list of feature strings, with the individual strings separated by white space. It determines whether or not all of the named features are supported by the browser; if all of them are supported, the attribute evaluates to `true` end the element is rendered; otherwise, the attribute evaluates to `false` and the current element and its children are skipped and thus will not be rendered. This provides a way to design SVG that gracefully falls back when features aren't available.

If the attribute is not present, then its implicit evaluated value is `true`. If a null string or empty string value is given to attribute `requiredFeatures`, the attribute is evaluate to `false`.

`requiredFeatures` is often used in conjunction with the switch element. If `requiredFeatures` is used in other situations, it represents a simple switch on the given element whether to render the element or not.






|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|



#### **SystemLanguage**

The **`systemLanguage`** attribute represents a list of supported language tags. This list is matched against the language defined in the user preferences.






|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|



#### **Id**

The **`id`** attribute assigns a unique name to an element.

You can use this attribute with any SVG element.






|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|



#### **Lang**

The **`lang`** attribute specifies the primary language used in contents and attributes containing text content of particular elements.

There is also an xml:lang attribute (with namespace). If both of them are defined, the one with namespace is used and the one without is ignored.

In SVG 1.1 there was a `lang` attribute defined with a different meaning and only applying to glyph elements. That attribute specified a list of languages according to {{RFC(5646, "Tags for Identifying Languages (also known as BCP 47)")}}. The glyph was meant to be used if the `xml:lang` attribute exactly matched one of the languages given in the value of this parameter, or if the `xml:lang` attribute exactly equaled a prefix of one of the languages given in the value of this parameter such that the first tag character following the prefix was "-".

You can use this attribute with any SVG element.






|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|



#### **Tabindex**

The **`tabindex`** attribute allows you to control whether an element is focusable and to define the relative order of the element for the purposes of sequential focus navigation.

You can use this attribute with any SVG element.






|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|



#### **XmlBase**

The **`xml:base`** attribute specifies a base IRI other than the base IRI of the document or external entity.

You can use this attribute with any SVG element.






|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|



#### **XmlLang**

The **`xml:lang`** attribute specifies the primary language used in contents and attributes containing text content of particular elements.

It is a universal attribute allowed in all XML dialects to mark up the natural human language that an element contains.

There is also a lang attribute (without namespace). If both of them are defined, the one with namespace is used and the one without is ignored.

You can use this attribute with any SVG element.






|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|



#### **XmlSpace**

SVG supports the built-in XML **`xml:space`** attribute to handle whitespace characters inside elements. Child elements inside an element may also have an `xml:space` attribute that overrides the parent's one.

> **Note:** Instead of using the `xml:space` attribute, use the white-space CSS property.

This attribute influences how browsers parse text content and therefore changes the way the DOM is built. Therefore, changing this attribute's value through the DOM API may have no effect.

You can use this attribute with any SVG element.






|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|



#### **XlinkHref**

The **`xlink:href`** attribute defines a reference to a resource as a reference [IRI](https://developer.mozilla.org/en-US/docs/Web/SVG/Content_type#iri). The exact meaning of that link depends on the context of each element using it.

> **Note:** SVG 2 removed the need for the `xlink` namespace, so instead of `xlink:href` you should use href. If you need to support earlier browser versions, the deprecated `xlink:href` attribute can be used as a fallback in addition to the `href` attribute, e.g. `<use href="some-id" xlink:href="some-id" x="5" y="5" />`.






|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|



#### **XlinkType**

The **`xlink:type`** attribute identifies the type of XLink being used. In SVG, only simple links are available.






|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|



#### **XlinkArcrole**

The **`xlink:arcrole`** attribute specifies a contextual role for the element and corresponds to the [RDF Primer](https://developer.mozilla.orghttps://www.w3.org/TR/rdf-primer/) notion of a property.

This contextual role can differ from the meaning of the resource when taken outside the context of this particular arc. For example, a resource might generically represent a "person," but in the context of a particular arc it might have the role of "mother" and in the context of a different arc it might have the role of "daughter."






|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|



#### **XlinkTitle**

The **`xlink:title`** attribute is used to describe the meaning of a link or resource in a human-readable fashion.

The use of this information is highly dependent on the type of processing being done. It may be used, for example, to make titles available to applications used by visually impaired users, or to create a table of links, or to present help text that appears when a user lets a mouse pointer hover over a starting resource.

> **Note:** New content should use a title child element rather than a `xlink:title` attribute.






|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|



#### **XlinkShow**

The **`xlink:show`** attribute indicates how a linked resource should be opened and is meant for XLink-aware processors. In case of a conflict, the target attribute has priority, since it can express a wider range of values.






|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|



#### **AttributeType**

The **`attributeType`** attribute specifies the namespace in which the target attribute and its associated values are defined.






|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|



#### **AttributeName**

The **`attributeName`** attribute indicates the name of the CSS property or attribute of the target element that is going to be changed during an animation.






|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|



#### **Begin**

The **`begin`** attribute defines when an animation should begin.

The attribute value is a semicolon separated list of values. The interpretation of a list of start times is detailed in the SMIL specification in ["Evaluation of begin and end time lists"](https://developer.mozilla.orghttps://www.w3.org/TR/2001/REC-smil-animation-20010904/#timing-evaluationofbeginendtimelists). Each individual value can be one of the following: `<offset-value>`, `<syncbase-value>`, `<event-value>`, `<repeat-value>`, `<accessKey-value>`, `<wallclock-sync-value>` or the keyword `indefinite`.






|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|



#### **Dur**

The **`dur`** attribute indicates the simple duration of an animation.






|Type        |Required|Position|PipelineInput        |Aliases |
|------------|--------|--------|---------------------|--------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|Duration|



#### **End**

The **`end`** attribute defines an end value for the animation that can constrain the active duration.






|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|



#### **Min**

The **`min`** attribute specifies the minimum value of the active animation duration.






|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|



#### **Max**

The **`max`** attribute specifies the maximum value of the active animation duration.






|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|



#### **Restart**

The **`restart`** attribute specifies whether or not an animation can restart.






|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|



#### **RepeatCount**

The **`repeatCount`** attribute indicates the number of times an animation will take place.






|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|



#### **RepeatDur**

The **`repeatDur`** attribute specifies the total duration for repeating an animation.






|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|



#### **Fill**

The **`fill`** attribute has two different meanings. For shapes and text it's a presentation attribute that defines the color (_or any SVG paint servers like gradients or patterns_) used to paint the element; for animation it defines the final state of the animation.






|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|



#### **CalcMode**

The **`calcMode`** attribute specifies the interpolation mode for the animation.

The default mode is `linear`, however if the attribute does not support linear interpolation (e.g. for strings), the `calcMode` attribute is ignored and discrete interpolation is used.






|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|



#### **Values**

The `values` attribute has different meanings, depending upon the context where it's used, either it defines a sequence of values used over the course of an animation, or it's a list of numbers for a color matrix, which is interpreted differently depending on the type of color change to be performed.






|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|



#### **KeyTimes**

The **`keyTimes`** attribute represents a list of time values used to control the pacing of the animation.

Each time in the list corresponds to a value in the values attribute list, and defines when the value is used in the animation. Each time value in the `keyTimes` list is specified as a floating point value between 0 and 1 (inclusive), representing a proportional offset into the duration of the animation element.






|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|



#### **KeySplines**

The **`keySplines`** attribute defines a set of [Bézier curve](https://developer.mozilla.org/en-US/docs/Glossary/Bezier_curve) control points associated with the keyTimes list, defining a cubic Bézier function that controls interval pacing.

This attribute is ignored unless the calcMode attribute is set to `spline`.

If there are any errors in the keySplines specification (bad values, too many or too few values), the animation will not occur.






|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|



#### **Additive**

The **`additive`** attribute controls whether or not an animation is additive.

It is frequently useful to define animation as an offset or delta to an attribute's value, rather than as absolute values.






|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|



#### **Accumulate**

The **`accumulate`** attribute controls whether or not an animation is cumulative.

It is frequently useful for repeated animations to build upon the previous results, accumulating with each iteration. This attribute said to the animation if the value is added to the previous animated attribute's value on each iteration.






|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|





---


### Outputs
* [Xml.XmlElement](https://learn.microsoft.com/en-us/dotnet/api/System.Xml.XmlElement)






---


### Syntax
```PowerShell
SVG.animateTransform [[-Content] <Object>] [-Data <IDictionary>] [-On <Object>] [-Attribute <IDictionary>] [-Comment <String>] [-Children <PSObject>] [-By <PSObject>] [-From <PSObject>] [-To <PSObject>] [-Type <PSObject>] [-RequiredFeatures <PSObject>] [-SystemLanguage <PSObject>] [-Id <PSObject>] [-Lang <PSObject>] [-Tabindex <PSObject>] [-XmlBase <PSObject>] [-XmlLang <PSObject>] [-XmlSpace <PSObject>] [-XlinkHref <PSObject>] [-XlinkType <PSObject>] [-XlinkArcrole <PSObject>] [-XlinkTitle <PSObject>] [-XlinkShow <PSObject>] [-AttributeType <PSObject>] [-AttributeName <PSObject>] [-Begin <PSObject>] [-Dur <PSObject>] [-End <PSObject>] [-Min <PSObject>] [-Max <PSObject>] [-Restart <PSObject>] [-RepeatCount <PSObject>] [-RepeatDur <PSObject>] [-Fill <PSObject>] [-CalcMode <PSObject>] [-Values <PSObject>] [-KeyTimes <PSObject>] [-KeySplines <PSObject>] [-Additive <PSObject>] [-Accumulate <PSObject>] [<CommonParameters>]
```
