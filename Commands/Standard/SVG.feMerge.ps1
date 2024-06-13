function SVG.feMerge  {
<#
.Synopsis
    Creates SVG feMerge elements
.Description
    The **`<feMerge>`** SVG element allows filter effects to be applied concurrently instead of sequentially. This is achieved by other filters storing their output via the `result` attribute and then accessing it in a `feMergeNode` child.
.Example
    param(
    # The message to emboss
    [string]
    $Message = "Embossed",
    
    # The fill color of the text
    [string]
    $Fill = '#4488ff',
    
    # The css classes to apply to the image
    [string[]]
    $Class,
    
    # The font size of the text
    [string]
    $FontSize = "26em",
    
    # The embossing level
    [int]
    $Emboss = 5
    )
    svg @(
        svg.filter -id embossed @(
            svg.feConvolveMatrix -KernelMatrix "
            $Emboss 0 0
            0 0 0
            0 0 -$($Emboss * -1)
    "
            svg.feMerge @(
                svg.feMergeNode
                svg.feMergeNode -In 'SourceGraphic'
            )
        )
    
        svg.text "
    Embossed
    " -TextAnchor middle -DominantBaseline middle -Fill $Fill -FontSize $FontSize -X 50% -Y 50% -Filter 'url(#embossed)'
    ) -Class $class -ViewBox 0,0,300,100
.Example
    param(
    [string]
    $Fill = '#4488ff',
    
    [string[]]
    $Class,
    
    [timespan]
    $Duration = '00:00:02.5',
    
    [double[]]
    $ShadowX = @(0.5, -.5, 0.5),
    
    [double[]]
    $ShadowY = @(0.75, -.75, 0.75)
    )
    
    svg @(
        svg.filter -id dropShadow @(
            svg.feDropShadow -dx $ShadowX[0] -dy $ShadowY[0] -StdDeviation 0 @(
                svg.animate -AttributeName dx -Values $($ShadowX -join ';') -Dur $Duration -RepeatCount 'indefinite'
                svg.animate -AttributeName dY -Values $($Shadowy -join ';') -Dur $Duration -RepeatCount 'indefinite'
            )
            svg.feMerge @(
                svg.feMergeNode
                svg.feMergeNode -In 'SourceGraphic'
            )
        )
    
        svg.text "
    Moving Shadows
    " -TextAnchor middle -DominantBaseline middle -Fill $fill -Class $Class -FontSize 16 -X 50% -Y 50% -Filter 'url(#dropShadow)'
    ) -ViewBox 0,0,300,100
.Link
    https://pssvg.start-automating.com/SVG.feMerge
.Link
    https://developer.mozilla.org/en-US/web/svg/element/femerge/
.Link
    Write-SVG
#>
[Reflection.AssemblyMetadata('SVG.ElementName', 'feMerge')]
[CmdletBinding(PositionalBinding=$false)]
[OutputType([Xml.XmlElement])]
param(
# The Contents of the feMerge element
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
# The TlinkHref attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','TlinkHref')]
[PSObject]
$TlinkHref,
# The IlinkHref attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','IlinkHref')]
[PSObject]
$IlinkHref,
# The SlinkHref attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','SlinkHref')]
[PSObject]
$SlinkHref,
# The ClinkHref attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','ClinkHref')]
[PSObject]
$ClinkHref,
# The LlinkHref attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','LlinkHref')]
[PSObject]
$LlinkHref,
# The FlinkHref attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','FlinkHref')]
[PSObject]
$FlinkHref,
# The BlinkHref attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','BlinkHref')]
[PSObject]
$BlinkHref,
# The MlinkHref attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','MlinkHref')]
[PSObject]
$MlinkHref,
# The VlinkHref attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','VlinkHref')]
[PSObject]
$VlinkHref,
# The DlinkHref attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','DlinkHref')]
[PSObject]
$DlinkHref,
# The OlinkHref attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','OlinkHref')]
[PSObject]
$OlinkHref,
# The WlinkHref attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','WlinkHref')]
[PSObject]
$WlinkHref,
# The PlinkHref attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','PlinkHref')]
[PSObject]
$PlinkHref,
# The UlinkHref attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','UlinkHref')]
[PSObject]
$UlinkHref,
# The AlinkHref attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','AlinkHref')]
[PSObject]
$AlinkHref,
# The HlinkHref attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','HlinkHref')]
[PSObject]
$HlinkHref,
# The XlinkHref attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','XlinkHref')]
[PSObject]
$XlinkHref,
# The RlinkHref attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','RlinkHref')]
[PSObject]
$RlinkHref,
# The YlinkHref attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','YlinkHref')]
[PSObject]
$YlinkHref
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

