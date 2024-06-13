function SVG.animateTransform  {
<#
.Synopsis
    Creates SVG animateTransform elements
.Description
    The `animateTransform` element animates a transformation attribute on its target element, thereby allowing animations to control translation, scaling, rotation, and/or skewing.
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
    param(
    [timespan]
    $Duration = '00:00:05'
    )
    svg -ViewBox 0, 0, 100, 100 -Content @(
        svg.defs @(
            svg.pattern -id star -ViewBox 0,0, 10, 10 -Width 10% -Height 10% @(
                svg.polygon -Points "0,0", "2,5", "0,10", "5,8", "10,10","8,5", "10,0", "5,2" @(
                    svg.animateTransform -AttributeName transform -From "0 5 5"  -To "360 5 5" -dur "$($Duration.TotalSeconds)s" -RepeatCount indefinite -AttributeType xml -type rotate
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
    param(
    # The radius of the circle
    [alias('r')]
    [double]
    $Radius = 35,
    
    # The center of the circle
    [alias('c')]
    [double]
    $Center = 50,
    
    # The color of the circle
    [alias('f')]
    [string]
    $Fill = 'transparent',
    
    # The color of the stroke
    [alias('s')]
    [string]
    $Stroke = '#4488ff',
    
    # The duration of the animation.
    [Timespan]
    [Alias('D','Duration','P','Period')]
    $RotateEvery = "00:00:01.5"
    )
    
    svg -ViewBox 0,0, ($center * 2), ($center * 2) @(
        svg.circle -Fill $fill -Stroke $Stroke -Cx $center -Cy $center -R $Radius
        svg.line -Stroke $Stroke -X1 $center -x2 ($center + $radius) -Y1 $center -Y2 $center @(
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
# 
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','by')]
[Reflection.AssemblyMetaData('SVG.Value', 'See below')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'False')]
[PSObject]
$By,
# 
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','from')]
[Reflection.AssemblyMetaData('SVG.Value', 'See below')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'False')]
[PSObject]
$From,
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
# The Eype attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Eype')]
[PSObject]
$Eype,
# The Vype attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Vype')]
[PSObject]
$Vype
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

