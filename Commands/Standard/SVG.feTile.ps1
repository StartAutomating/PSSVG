function SVG.feTile  {
<#
.Synopsis
    Creates SVG feTile elements
.Description
    The **`<feTile>`** [SVG](https://developer.mozilla.org/en-US/docs/Web/SVG) filter primitive allows to fill a target rectangle with a repeated, tiled pattern of an input image. The effect is similar to the one of a `pattern`.
.Link
    https://pssvg.start-automating.com/SVG.feTile
.Link
    https://developer.mozilla.org/en-US/web/svg/element/fetile/
.Link
    Write-SVG
#>
[Reflection.AssemblyMetadata('SVG.ElementName', 'feTile')]
[CmdletBinding(PositionalBinding=$false)]
[OutputType([Xml.XmlElement])]
param(
# The Contents of the feTile element
[Parameter(Position=0,ValueFromPipeline,ValueFromPipelineByPropertyName)]
[Alias('InputObject','Text', 'InnerText', 'Contents')]
$Content,
# A dictionary containing data.  This data will be embedded in data- attributes.
[Parameter(ValueFromPipelineByPropertyName)]
[Alias('DataAttribute','DataAttributes')]
[Collections.IDictionary]
$Data,
# The On attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','On')]
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
# The In attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','In')]
[PSObject]
$In,
# The Tn attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Tn')]
[PSObject]
$Tn,
# The Sn attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Sn')]
[PSObject]
$Sn,
# The Cn attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Cn')]
[PSObject]
$Cn,
# The Ln attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Ln')]
[PSObject]
$Ln,
# The Fn attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Fn')]
[PSObject]
$Fn,
# The Bn attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Bn')]
[PSObject]
$Bn,
# The Mn attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Mn')]
[PSObject]
$Mn,
# The Vn attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Vn')]
[PSObject]
$Vn,
# The Dn attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Dn')]
[PSObject]
$Dn,
# The Wn attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Wn')]
[PSObject]
$Wn,
# The Pn attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Pn')]
[PSObject]
$Pn,
# The Un attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Un')]
[PSObject]
$Un,
# The An attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','An')]
[PSObject]
$An,
# The Hn attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Hn')]
[PSObject]
$Hn,
# The Xn attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Xn')]
[PSObject]
$Xn,
# The Rn attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Rn')]
[PSObject]
$Rn,
# The Yn attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Yn')]
[PSObject]
$Yn
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

