function SVG.radialGradient  {
<#
.Synopsis
    Creates SVG radialGradient elements
.Description
    The **`<radialGradient>`** element lets authors define radial gradients that can be applied to fill or stroke of graphical elements.
    
    > **Note:** Don't be confused with CSS {{cssxref('gradient/radial-gradient', 'radial-gradient()')}} as CSS gradients can only apply to HTML elements where SVG gradient can only apply to SVG elements.
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
.Link
    https://pssvg.start-automating.com/SVG.radialGradient
.Link
    https://developer.mozilla.org/en-US/web/svg/element/radialgradient/
.Link
    Write-SVG
#>
[Reflection.AssemblyMetadata('SVG.ElementName', 'radialGradient')]
[CmdletBinding(PositionalBinding=$false)]
[OutputType([Xml.XmlElement])]
param(
# The Contents of the radialGradient element
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
# This attribute defines the x coordinate of the end circle of the radial gradient.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','cx')]
[Reflection.AssemblyMetaData('SVG.Value', '{{cssxref("length-percentage")}}')]
[Reflection.AssemblyMetaData('SVG.Default value', '50%')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'True')]
[PSObject]
$Cx,
# This attribute defines the y coordinate of the end circle of the radial gradient.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','cy')]
[Reflection.AssemblyMetaData('SVG.Value', '{{cssxref("length-percentage")}}')]
[Reflection.AssemblyMetaData('SVG.Default value', '50%')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'True')]
[PSObject]
$Cy,
# This attribute defines the radius of the start circle of the radial gradient. The gradient will be drawn such that the 0% {{SVGElement('stop','gradient stop')}} is mapped to the perimeter of the start circle.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','fr')]
[Reflection.AssemblyMetaData('SVG.Value', '{{cssxref("length")}}')]
[Reflection.AssemblyMetaData('SVG.Default value', '0')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'None')]
[PSObject]
$Fr,
# This attribute defines the x coordinate of the start circle of the radial gradient.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','fx')]
[Reflection.AssemblyMetaData('SVG.Value', '{{cssxref("length")}}')]
[Reflection.AssemblyMetaData('SVG.Default value', 'Coincides with the presentational value of {{SVGAttr("cx")}} for the element whether the value for cx was inherited or not.')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'None')]
[PSObject]
$Fx,
# This attribute defines the y coordinate of the start circle of the radial gradient.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','fy')]
[Reflection.AssemblyMetaData('SVG.Value', '{{cssxref("length")}}')]
[Reflection.AssemblyMetaData('SVG.Default value', 'Coincides with the presentational value of {{SVGAttr("cy")}} for the element whether the value for cy was inherited or not.')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'None')]
[PSObject]
$Fy,
# This attribute defines the coordinate system for attributes `cx`, `cy`, `r`, `fx`, `fy`, `fr`
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','gradientUnits')]
[Reflection.AssemblyMetaData('SVG.Value', 'userSpaceOnUse | objectBoundingBox')]
[ArgumentCompleter({
    param ( $commandName,$parameterName,$wordToComplete,$commandAst,$fakeBoundParameters )    

    $validSet = 'userSpaceOnUse','objectBoundingBox'
    if ($wordToComplete) {        
        $toComplete = $wordToComplete -replace "^'" -replace "'$"
        return @($validSet -like "$toComplete*" -replace '^', "'" -replace '$',"'")
    } else {
        return @($validSet -replace '^', "'" -replace '$',"'")
    }
})]
[Reflection.AssemblyMetaData('SVG.Default value', 'objectBoundingBox')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'True')]
[PSObject]
$GradientUnits,
# This attribute provides additional [transformation](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/transform) to the gradient coordinate system.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','gradientTransform')]
[Reflection.AssemblyMetaData('SVG.Default value', 'Identity transform')]
[Reflection.AssemblyMetaData('SVG.Value', '<transform-list>')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'True')]
[PSObject]
$GradientTransform,
# This attribute defines a reference to another `<radialGradient>` element that will be used as a template.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','href')]
[Reflection.AssemblyMetaData('SVG.Value', '<url>')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'True')]
[PSObject]
$Href,
# This attribute defines the radius of the end circle of the radial gradient. The gradient will be drawn such that the 100% {{SVGElement('stop','gradient stop')}} is mapped to the perimeter of the end circle.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','r')]
[PSObject]
$R,
# This attribute indicates how the gradient behaves if it starts or ends inside the bounds of the shape containing the gradient.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','spreadMethod')]
[Reflection.AssemblyMetaData('SVG.Value', 'pad | reflect | repeat')]
[ArgumentCompleter({
    param ( $commandName,$parameterName,$wordToComplete,$commandAst,$fakeBoundParameters )    

    $validSet = 'pad','reflect','repeat'
    if ($wordToComplete) {        
        $toComplete = $wordToComplete -replace "^'" -replace "'$"
        return @($validSet -like "$toComplete*" -replace '^', "'" -replace '$',"'")
    } else {
        return @($validSet -replace '^', "'" -replace '$',"'")
    }
})]
[Reflection.AssemblyMetaData('SVG.Initial value', 'pad')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'True')]
[PSObject]
$SpreadMethod,
# The XlinkHref attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','XlinkHref')]
[PSObject]
$XlinkHref,
# The ClinkHref attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','ClinkHref')]
[PSObject]
$ClinkHref,
# The SlinkHref attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','SlinkHref')]
[PSObject]
$SlinkHref,
# The ElinkHref attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','ElinkHref')]
[PSObject]
$ElinkHref
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

