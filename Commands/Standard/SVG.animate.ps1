function SVG.animate  {
<#
.Synopsis
    Creates SVG animate elements
.Description
    The SVG **`<animate>`** element provides a way to animate an attribute of an element over time.
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./Animate.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./Animate.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./AnimateColor.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./AnimateColor.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./AnimateColor.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./AnimatedShapes.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./AnimatedShapes.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./AnimatedShapes.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./AnimatedShapes.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./AnimatedShapes.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./BPMAnimate.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./BPMAnimate.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./BPMAnimate.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./BPMAnimate.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./BPMAnimate.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./BPMAnimate.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./BPMAnimate.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./BPMAnimate.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./BPMAnimate.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./BPMAnimate.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./BPMAnimate.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./BPMAnimate.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./BPMAnimate.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./BPMAnimate.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./BPMAnimate.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./BPMAnimate.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./BPMAnimate.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./BPMAnimate.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./BPMAnimate.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./BPMAnimate.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./BPMAnimate.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./BPMAnimate.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./BPMAnimate.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./BPMAnimate.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./BPMMorph.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./BPMTriangleMorph.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./CloudAnimation.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./CloudAnimation.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./CloudAnimation.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./FadeIn.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./LinearGradientAnimated.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./LinearGradientAnimated.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./ManyAnimatedRectangles.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./ManyAnimatedRectangles.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./Morphing.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./MorphingConvexPolygon.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./MorphingRose.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./MovingGradient.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./MovingGradient.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./MovingGradient.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./MovingGradient.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./MovingShadows.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./MovingShadows.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./RadialGradientAnimated.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./RepeatedShapes.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./StopUsingGIFs.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./StopUsingGIFs.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./StopUsingGIFs.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./ViewBoxAnimation.PSSVG.ps1
    Pop-Location
.Link
    https://pssvg.start-automating.com/SVG.animate
.Link
    https://developer.mozilla.org/en-US/web/svg/element/animate/
.Link
    Write-SVG
#>
[Reflection.AssemblyMetadata('SVG.ElementName', 'animate')]
[CmdletBinding(PositionalBinding=$false)]
[OutputType([Xml.XmlElement])]
param(
# The Contents of the animate element
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
# The requiredFeatures attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/requiredFeatures) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.Deprecated',$true)]
[Reflection.AssemblyMetaData('SVG.AttributeName','requiredFeatures')]
[PSObject]
$RequiredFeatures,
# The systemLanguage attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/systemLanguage) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','systemLanguage')]
[PSObject]
$SystemLanguage,
# The requiredExtensions attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/requiredExtensions) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','requiredExtensions')]
[PSObject]
$RequiredExtensions,
# The tabindex attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/tabindex) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','tabindex')]
[PSObject]
$Tabindex,
# The id attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/id) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','id')]
[PSObject]
$Id,
# The style attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/style) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','style')]
[PSObject]
$Style,
# The xml:space attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/xml:space) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.Deprecated',$true)]
[Reflection.AssemblyMetaData('SVG.AttributeName','xml:space')]
[PSObject]
$Xmlspace,
# The xml:lang attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/xml:lang) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.Deprecated',$true)]
[Reflection.AssemblyMetaData('SVG.AttributeName','xml:lang')]
[PSObject]
$Xmllang,
# The xml:base attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/xml:base) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.Deprecated',$true)]
[Reflection.AssemblyMetaData('SVG.AttributeName','xml:base')]
[PSObject]
$Xmlbase,
# The class attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/class) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','class')]
[PSObject]
$Class,
# The lang attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/lang) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','lang')]
[PSObject]
$Lang,
# The xlink:type attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/xlink:type) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.Deprecated',$true)]
[Reflection.AssemblyMetaData('SVG.AttributeName','xlink:type')]
[PSObject]
$Xlinktype,
# The xlink:arcrole attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/xlink:arcrole) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.Deprecated',$true)]
[Reflection.AssemblyMetaData('SVG.AttributeName','xlink:arcrole')]
[PSObject]
$Xlinkarcrole,
# The xlink:show attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/xlink:show) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.Deprecated',$true)]
[Reflection.AssemblyMetaData('SVG.AttributeName','xlink:show')]
[PSObject]
$Xlinkshow,
# The xlink:title attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/xlink:title) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.Deprecated',$true)]
[Reflection.AssemblyMetaData('SVG.AttributeName','xlink:title')]
[PSObject]
$Xlinktitle,
# The xlink:href attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/xlink:href) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.Deprecated',$true)]
[Reflection.AssemblyMetaData('SVG.AttributeName','xlink:href')]
[PSObject]
$Xlinkhref,
# The xlink:role attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/xlink:role) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','xlink:role')]
[PSObject]
$Xlinkrole,
# The xlink:actuate attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/xlink:actuate) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','xlink:actuate')]
[PSObject]
$Xlinkactuate,
# The attributeType attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/attributeType) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.Deprecated',$true)]
[Reflection.AssemblyMetaData('SVG.AttributeName','attributeType')]
[PSObject]
$AttributeType,
# The begin attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/begin) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','begin')]
[PSObject]
$Begin,
# The calcMode attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/calcMode) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','calcMode')]
[PSObject]
$CalcMode,
# The additive attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/additive) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','additive')]
[PSObject]
$Additive,
# The externalResourcesRequired attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/externalResourcesRequired) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','externalResourcesRequired')]
[PSObject]
$ExternalResourcesRequired,
# The attributeName attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/attributeName) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','attributeName')]
[PSObject]
$AttributeName,
# The from attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/from) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','from')]
[PSObject]
$From,
# The to attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/to) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','to')]
[PSObject]
$To,
# The dur attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/dur) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','dur')]
[PSObject]
$Dur,
# The repeatCount attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/repeatCount) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','repeatCount')]
[PSObject]
$RepeatCount,
# The accumulate attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/accumulate) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','accumulate')]
[PSObject]
$Accumulate,
# The by attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/by) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','by')]
[PSObject]
$By,
# The fill attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/fill) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','fill')]
[PSObject]
$Fill,
# The repeatDur attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/repeatDur) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','repeatDur')]
[PSObject]
$RepeatDur,
# The href attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/href) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','href')]
[PSObject]
$Href,
# The keySplines attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/keySplines) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','keySplines')]
[PSObject]
$KeySplines,
# The color-interpolation attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/color-interpolation) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','color-interpolation')]
[PSObject]
$Colorinterpolation,
# The end attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/end) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','end')]
[PSObject]
$End,
# The min attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/min) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','min')]
[PSObject]
$Min,
# The restart attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/restart) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','restart')]
[PSObject]
$Restart,
# The keyPoints attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/keyPoints) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','keyPoints')]
[PSObject]
$KeyPoints,
# The values attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/values) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','values')]
[PSObject]
$Values,
# The max attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/max) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','max')]
[PSObject]
$Max,
# The keyTimes attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/keyTimes) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','keyTimes')]
[PSObject]
$KeyTimes
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

