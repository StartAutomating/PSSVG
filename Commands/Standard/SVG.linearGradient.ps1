function SVG.linearGradient {

<#
.Synopsis
    Creates SVG linearGradient elements
.Description
    The **`<linearGradient>`** element lets authors define linear gradients to apply to other SVG elements.
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
                svg.stop -Offset '10%' -Stopcolor gold
                svg.stop -Offset '95%' -Stopcolor red
            ) -X1 0 -X2 0 -Y1 0% -Y2 100%
        )
        svg.rect -Fill 'url(#myGradient)' -Width 100 -Height 100
    ) -viewbox 0,0,100,100
.Link
    https://pssvg.start-automating.com/SVG.linearGradient
.Link
    https://developer.mozilla.org/en-US/web/svg/element/lineargradient/
.Link
    Write-SVG
#>
[Reflection.AssemblyMetadata('SVG.ElementName', 'linearGradient')]
[CmdletBinding(PositionalBinding=$false)]
[OutputType([Xml.XmlElement])]
param(
# The Contents of the linearGradient element
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
# This attribute defines the coordinate system for attributes `x1`, `x2`, `y1`, `y2`
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
# This attribute defines a reference to another `<linearGradient>` element that will be used as a template.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','href')]
[Reflection.AssemblyMetaData('SVG.Value', '<url>')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'True')]
[PSObject]
$Href,
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
# This attribute defines the x coordinate of the starting point of the vector gradient along which the linear gradient is drawn.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','x1')]
[Reflection.AssemblyMetaData('SVG.Value', '<length> | <percentage> | <number>')]
[ValidatePattern('(?>|\d+)')]
[ArgumentCompleter({
    param ( $commandName,$parameterName,$wordToComplete,$commandAst,$fakeBoundParameters )    

    $validSet = '<length>','<percentage>','<number>'
    if ($wordToComplete) {        
        $toComplete = $wordToComplete -replace "^'" -replace "'$"
        return @($validSet -like "$toComplete*" -replace '^', "'" -replace '$',"'")
    } else {
        return @($validSet -replace '^', "'" -replace '$',"'")
    }
})]
[Reflection.AssemblyMetaData('SVG.Default value', '0%')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'True')]
[PSObject]
$X1,
# This attribute defines the x coordinate of the ending point of the vector gradient along which the linear gradient is drawn.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','x2')]
[Reflection.AssemblyMetaData('SVG.Value', '<length> | <percentage> | <number>')]
[ValidatePattern('(?>|\d+)')]
[ArgumentCompleter({
    param ( $commandName,$parameterName,$wordToComplete,$commandAst,$fakeBoundParameters )    

    $validSet = '<length>','<percentage>','<number>'
    if ($wordToComplete) {        
        $toComplete = $wordToComplete -replace "^'" -replace "'$"
        return @($validSet -like "$toComplete*" -replace '^', "'" -replace '$',"'")
    } else {
        return @($validSet -replace '^', "'" -replace '$',"'")
    }
})]
[Reflection.AssemblyMetaData('SVG.Default value', '100%')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'True')]
[PSObject]
$X2,
# An [\<IRI>](https://developer.mozilla.org/en-US/docs/Web/SVG/Content_type#iri) reference to another `<linearGradient>` element that will be used as a template.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','xlink:href')]
[Reflection.AssemblyMetaData('SVG.Value', '<iri>')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'True')]
[PSObject]
$XlinkHref,
# This attribute defines the y coordinate of the starting point of the vector gradient along which the linear gradient is drawn.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','y1')]
[Reflection.AssemblyMetaData('SVG.Value', '<length> | <percentage> | <number>')]
[ValidatePattern('(?>|\d+)')]
[ArgumentCompleter({
    param ( $commandName,$parameterName,$wordToComplete,$commandAst,$fakeBoundParameters )    

    $validSet = '<length>','<percentage>','<number>'
    if ($wordToComplete) {        
        $toComplete = $wordToComplete -replace "^'" -replace "'$"
        return @($validSet -like "$toComplete*" -replace '^', "'" -replace '$',"'")
    } else {
        return @($validSet -replace '^', "'" -replace '$',"'")
    }
})]
[Reflection.AssemblyMetaData('SVG.Default value', '0%')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'True')]
[PSObject]
$Y1,
# This attribute defines the y coordinate of the ending point of the vector gradient along which the linear gradient is drawn.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','y2')]
[Reflection.AssemblyMetaData('SVG.Value', '<length> | <percentage> | <number>')]
[ValidatePattern('(?>|\d+)')]
[ArgumentCompleter({
    param ( $commandName,$parameterName,$wordToComplete,$commandAst,$fakeBoundParameters )    

    $validSet = '<length>','<percentage>','<number>'
    if ($wordToComplete) {        
        $toComplete = $wordToComplete -replace "^'" -replace "'$"
        return @($validSet -like "$toComplete*" -replace '^', "'" -replace '$',"'")
    } else {
        return @($validSet -replace '^', "'" -replace '$',"'")
    }
})]
[Reflection.AssemblyMetaData('SVG.Default value', '0%')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'True')]
[PSObject]
$Y2
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

