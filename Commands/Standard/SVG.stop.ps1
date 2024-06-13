function SVG.stop  {
<#
.Synopsis
    Creates SVG stop elements
.Description
    The SVG **`<stop>`** element defines a color and its position to use on a gradient. This element is always a child of a `linearGradient` or `radialGradient` element.
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
    svg -Content @(
        svg.defs @(
            svg.LinearGradient -Id myGradient -Content @(
                svg.stop -Offset '10%' -Stopcolor gold
                svg.stop -Offset '95%' -Stopcolor red
            ) -X1 0 -X2 0 -Y1 0% -Y2 100%
        )
        svg.rect -Fill 'url(#myGradient)' -Width 100 -Height 100
    ) -viewbox 0,0,100,100
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
    https://pssvg.start-automating.com/SVG.stop
.Link
    https://developer.mozilla.org/en-US/web/svg/element/stop/
.Link
    Write-SVG
#>
[Reflection.AssemblyMetadata('SVG.ElementName', 'stop')]
[CmdletBinding(PositionalBinding=$false)]
[OutputType([Xml.XmlElement])]
param(
# The Contents of the stop element
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
# This attribute defines where the gradient stop is placed along the gradient vector.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','offset')]
[PSObject]
$Offset,
# This attribute defines the color of the gradient stop. It can be used as a CSS property.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','stop-color')]
[Reflection.AssemblyMetaData('SVG.Value', 'currentcolor | {{cssxref("color_value", "<color>")}} <icccolor>')]
[ValidateScript({$_ -in '' -or $_ -match '\#[0-9a-f]{3}' -or $_ -match '\#[0-9a-f]{6}' -or $_ -notmatch '[\W-[\-]]'})]
[ArgumentCompleter({
    param ( $commandName,$parameterName,$wordToComplete,$commandAst,$fakeBoundParameters )    

    $validSet = 'currentcolor','{{cssxref("color_value", "<color>")}} <icccolor>'
    if ($wordToComplete) {        
        $toComplete = $wordToComplete -replace "^'" -replace "'$"
        return @($validSet -like "$toComplete*" -replace '^', "'" -replace '$',"'")
    } else {
        return @($validSet -replace '^', "'" -replace '$',"'")
    }
})]
[Reflection.AssemblyMetaData('SVG.Default value', 'black')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'True')]
[PSObject]
$StopColor,
# The StopOpacity attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','StopOpacity')]
[PSObject]
$StopOpacity,
# The CtopOpacity attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','CtopOpacity')]
[PSObject]
$CtopOpacity
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

