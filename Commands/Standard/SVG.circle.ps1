function SVG.circle  {
<#
.Synopsis
    Creates SVG circle elements
.Description
    The **`<circle>`** [SVG](https://developer.mozilla.org/en-US/docs/Web/SVG) element is an [SVG basic shape](https://developer.mozilla.org/en-US/docs/Web/SVG/Tutorial/Basic_Shapes), used to draw circles based on a center point and a radius.
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
    SVG @(
        SVG.filter (
            SVG.feGaussianBlur -In 'SourceGraphic' -StdDeviation 5
        ) -id blurMe
    
        SVG.circle -Fill '#4488ff' -Filter 'url(#blurMe)' -R 50 -Cx 50 -Cy 50
    ) -ViewBox 100, 100
.Example
    SVG -ViewBox 0,0,200,200 @(
        SVG.circle -Fill "red" -Cx 100 -Cy 50 -r 5
        SVG.circle -Fill "green" -cx 100 -cy 100 -r 10
        SVG.circle -Fill "blue" -cx 100 -cy 150 -Stroke "cyan" -Strokewidth 1 -r 20
    )
.Example
    SVG -ViewBox 0,0,200,200 @(
        SVG.circle -Fill "red" -Cx 100 -Cy 50 -r 5
        SVG.circle -Fill "green" -cx 100 -cy 100 -r 10
        SVG.circle -Fill "blue" -cx 100 -cy 150 -Stroke "cyan" -Strokewidth 1 -r 20
    )
.Example
    SVG -ViewBox 0,0,200,200 @(
        SVG.circle -Fill "red" -Cx 100 -Cy 50 -r 5
        SVG.circle -Fill "green" -cx 100 -cy 100 -r 10
        SVG.circle -Fill "blue" -cx 100 -cy 150 -Stroke "cyan" -Strokewidth 1 -r 20
    )
.Example
    param(
    # The colors in the gradient
    [string[]]
    $Color = @('gold','red'),
    
    # The offsets in the gradient
    [double[]]
    $Offset = @(10,95)
    )
    svg -Content @(
        svg.defs @(
            svg.LinearGradient -Id myGradient -Content @(
                for($n = 0; $n -lt $color.Length; $n++) {
                    svg.stop -Offset "$($Offset[$n])%" -StopColor $color[$n]
                }
            )
        )
        svg.circle -Fill 'url(#myGradient)' -Cx 50 -Cy 50 -R 35
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
    # The colors in the gradient
    [string[]]
    $Color = @('#4488ff','#224488'),
    
    # The offsets in the gradient
    [double[]]
    $Offset = @(10,95)
    )
    
    
    svg -Content @(
        svg.defs @(
            svg.radialGradient -Id myGradient -Content @(
                for($n = 0; $n -lt $color.Length; $n++) {
                    svg.stop -Offset "$($Offset[$n])%" -StopColor $color[$n]
                }
            )
        )
        svg.circle -Fill 'url(#myGradient)' -Cx 50 -Cy 50 -R 35
    ) -ViewBox 0,0,100,100
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
.Link
    https://pssvg.start-automating.com/SVG.circle
.Link
    https://developer.mozilla.org/en-US/web/svg/element/circle/
.Link
    Write-SVG
#>
[Reflection.AssemblyMetadata('SVG.ElementName', 'circle')]
[CmdletBinding(PositionalBinding=$false)]
[OutputType([Xml.XmlElement])]
param(
# The Contents of the circle element
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
# The x-axis coordinate of the center of the circle.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','cx')]
[Reflection.AssemblyMetaData('SVG.Value', '{{cssxref("length-percentage")}}')]
[Reflection.AssemblyMetaData('SVG.Default value', '0')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'True')]
[PSObject]
$Cx,
# The y-axis coordinate of the center of the circle.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','cy')]
[Reflection.AssemblyMetaData('SVG.Value', '{{cssxref("length-percentage")}}')]
[Reflection.AssemblyMetaData('SVG.Default value', '0')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'True')]
[PSObject]
$Cy,
# The radius of the circle. A value lower or equal to zero disables rendering of the circle.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','r')]
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
$R,
# The total length for the circle's circumference, in user units.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','pathLength')]
[Reflection.AssemblyMetaData('SVG.Value', '<number>')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'True')]
[PSObject]
$PathLength,
# The CathLength attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','CathLength')]
[PSObject]
$CathLength,
# The SathLength attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','SathLength')]
[PSObject]
$SathLength,
# The EathLength attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','EathLength')]
[PSObject]
$EathLength,
# The TathLength attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','TathLength')]
[PSObject]
$TathLength
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

