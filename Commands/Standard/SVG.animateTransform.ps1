function SVG.animateTransform {
<#
.Synopsis
    Creates SVG animateTransform elements
.Description
    The `animateTransform` element animates a transformation attribute on its target element, thereby allowing animations to control translation, scaling, rotation, and/or skewing.
.Example
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
.Example
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
.Example
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
.Example
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
    [Timespan]$RotateEvery = '00:00:10'
    
    
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
.Example
    foreach ($n in 5..12) {
    
    
    svg -ViewBox 2,2 @(
        svg.Star -PointCount $n  -Fill 'transparent' -Stroke '#4488ff' -StrokeWidth 0.01
    )
.Example
    foreach ($n in 5..12) {
    
    
    svg -ViewBox 2,2 @(
        svg.Star -PointCount $n  -Fill 'transparent' -Stroke '#4488ff' -StrokeWidth 0.01
    )
.Example
    foreach ($n in 5..12) {
    
    
    svg -ViewBox 2,2 @(
        svg.Star -PointCount $n  -Fill 'transparent' -Stroke '#4488ff' -StrokeWidth 0.01
    )
.Example
    foreach ($n in 5..12) {
    
    
    svg -ViewBox 2,2 @(
        svg.Star -PointCount $n  -Fill 'transparent' -Stroke '#4488ff' -StrokeWidth 0.01
    )
.Example
    foreach ($n in 5..12) {
    
    
    svg -ViewBox 2,2 @(
        svg.Star -PointCount $n  -Fill 'transparent' -Stroke '#4488ff' -StrokeWidth 0.01
    )
.Example
    foreach ($n in 5..12) {
    
    
    svg -ViewBox 2,2 @(
        svg.Star -PointCount $n  -Fill 'transparent' -Stroke '#4488ff' -StrokeWidth 0.01
    )
.Example
    $Radius = 35
    $Center = 50
    $RotateEvery = [Timespan]::FromSeconds(1.5)
    svg -ViewBox 0,0, ($center * 2), ($center * 2) @(
        svg.circle -Fill transparent -Stroke '#4488ff' -Cx $center -Cy $center -R 35
        svg.line -Stroke '#4488ff' -X1 $center -x2 ($center + $radius) -Y1 $center -Y2 $center @(
            svg.animatetransform -AttributeName transform -From "0 $center $center"  -To "360 $center $center" -dur "$($RotateEvery.TotalSeconds)s" -RepeatCount indefinite -AttributeType xml -type rotate
        ) -Opacity 0.8
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
.Link
    https://pssvg.start-automating.com/SVG.animateTransform
.Link
    https://developer.mozilla.org/en-US/web/svg/element/animatetransform/
.Link
    Write-SVG
#>
[Reflection.AssemblyMetadata('SVG.ElementName', 'animateTransform')]
[CmdletBinding(PositionalBinding=$false)]
[OutputType([Xml.XmlElement])]
param(
# The Contents of the animateTransform element
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
# One or more child elements.  These will be treated as if they were content.
[Parameter(ValueFromPipelineByPropertyName)]
[Alias('Child')]
[Management.Automation.PSObject]
$Children,
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
# 
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','type')]
[Reflection.AssemblyMetaData('SVG.Categories', 'None')]
[Reflection.AssemblyMetaData('SVG.Value', 'translate | scale | rotate | skewX | skewY')]
[ArgumentCompleter({
    param ( $commandName,$parameterName,$wordToComplete,$commandAst,$fakeBoundParameters )    
    $validSet = 'translate','scale','rotate','skewX','skewY'
    if ($wordToComplete) {        
        $toComplete = $wordToComplete -replace "^'" -replace "'$"
        return @($validSet -like "$toComplete*" -replace '^', "'" -replace '$',"'")
    } else {
        return @($validSet -replace '^', "'" -replace '$',"'")
    }
})]
[Reflection.AssemblyMetaData('SVG.Animatable', 'False')]
[Reflection.AssemblyMetaData('SVG.Normative document', 'SVG 1.1 (2nd Edition)')]
[PSObject]
$Type,
# The **`requiredFeatures`** attribute takes a list of feature strings, with the individual strings separated by white space. It determines whether or not all of the named features are supported by the browser; if all of them are supported, the attribute evaluates to `true` end the element is rendered; otherwise, the attribute evaluates to `false` and the current element and its children are skipped and thus will not be rendered. This provides a way to design SVG that gracefully falls back when features aren't available.
# 
# If the attribute is not present, then its implicit evaluated value is `true`. If a null string or empty string value is given to attribute `requiredFeatures`, the attribute is evaluate to `false`.
# 
# `requiredFeatures` is often used in conjunction with the switch element. If `requiredFeatures` is used in other situations, it represents a simple switch on the given element whether to render the element or not.
# 
# 
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','requiredFeatures')]
[Reflection.AssemblyMetaData('SVG.Deprecated',$true)]
[Reflection.AssemblyMetaData('SVG.Value', '<list-of-features>')]
[Reflection.AssemblyMetaData('SVG.Default value', 'true if not defined, false if null or empty string as value')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'False')]
[PSObject]
$RequiredFeatures,
# The **`systemLanguage`** attribute represents a list of supported language tags. This list is matched against the language defined in the user preferences.
# 
# 
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','systemLanguage')]
[Reflection.AssemblyMetaData('SVG.Value', '<language-tags>')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'False')]
[PSObject]
$SystemLanguage,
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
# The **`xlink:href`** attribute defines a reference to a resource as a reference [IRI](https://developer.mozilla.org/en-US/docs/Web/SVG/Content_type#iri). The exact meaning of that link depends on the context of each element using it.
# 
# > **Note:** SVG 2 removed the need for the `xlink` namespace, so instead of `xlink:href` you should use href. If you need to support earlier browser versions, the deprecated `xlink:href` attribute can be used as a fallback in addition to the `href` attribute, e.g. `<use href="some-id" xlink:href="some-id" x="5" y="5" />`.
# 
# 
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','xlink:href')]
[Reflection.AssemblyMetaData('SVG.Deprecated',$true)]
[Reflection.AssemblyMetaData('SVG.Value', '<iri>')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'False')]
[PSObject]
$XlinkHref,
# The **`xlink:type`** attribute identifies the type of XLink being used. In SVG, only simple links are available.
# 
# 
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','xlink:type')]
[Reflection.AssemblyMetaData('SVG.Deprecated',$true)]
[Reflection.AssemblyMetaData('SVG.Value', 'simple')]
[Reflection.AssemblyMetaData('SVG.Default value', 'simple')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'False')]
[PSObject]
$XlinkType,
# The **`xlink:arcrole`** attribute specifies a contextual role for the element and corresponds to the [RDF Primer](https://developer.mozilla.orghttps://www.w3.org/TR/rdf-primer/) notion of a property.
# 
# This contextual role can differ from the meaning of the resource when taken outside the context of this particular arc. For example, a resource might generically represent a "person," but in the context of a particular arc it might have the role of "mother" and in the context of a different arc it might have the role of "daughter."
# 
# 
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','xlink:arcrole')]
[Reflection.AssemblyMetaData('SVG.Deprecated',$true)]
[Reflection.AssemblyMetaData('SVG.Value', '<iri>')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'False')]
[PSObject]
$XlinkArcrole,
# The **`xlink:title`** attribute is used to describe the meaning of a link or resource in a human-readable fashion.
# 
# The use of this information is highly dependent on the type of processing being done. It may be used, for example, to make titles available to applications used by visually impaired users, or to create a table of links, or to present help text that appears when a user lets a mouse pointer hover over a starting resource.
# 
# > **Note:** New content should use a title child element rather than a `xlink:title` attribute.
# 
# 
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','xlink:title')]
[Reflection.AssemblyMetaData('SVG.Deprecated',$true)]
[Reflection.AssemblyMetaData('SVG.Value', '<anything>')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'False')]
[PSObject]
$XlinkTitle,
# The **`xlink:show`** attribute indicates how a linked resource should be opened and is meant for XLink-aware processors. In case of a conflict, the target attribute has priority, since it can express a wider range of values.
# 
# 
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','xlink:show')]
[Reflection.AssemblyMetaData('SVG.Deprecated',$true)]
[Reflection.AssemblyMetaData('SVG.Value', 'new | replace | embed | other | none')]
[ArgumentCompleter({
    param ( $commandName,$parameterName,$wordToComplete,$commandAst,$fakeBoundParameters )    
    $validSet = 'new','replace','embed','other','none'
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
$XlinkShow,
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
$Accumulate
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

