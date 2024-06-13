function SVG.feDropShadow  {
<#
.Synopsis
    Creates SVG feDropShadow elements
.Description
    The SVG **`<feDropShadow>`** filter primitive creates a drop shadow of the input image. It can only be used inside a `filter` element.
    
    > **Note:** The drop shadow color and opacity can be changed by using the `flood-color` and `flood-opacity` presentation attributes.
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
    https://pssvg.start-automating.com/SVG.feDropShadow
.Link
    https://developer.mozilla.org/en-US/web/svg/element/fedropshadow/
.Link
    Write-SVG
#>
[Reflection.AssemblyMetadata('SVG.ElementName', 'feDropShadow')]
[CmdletBinding(PositionalBinding=$false)]
[OutputType([Xml.XmlElement])]
param(
# The Contents of the feDropShadow element
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
# This attribute defines the x offset of the drop shadow.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','dx')]
[Reflection.AssemblyMetaData('SVG.Value', '<number>')]
[Reflection.AssemblyMetaData('SVG.Default value', '2')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'True')]
[PSObject]
$Dx,
# This attribute defines the y offset of the drop shadow.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','dy')]
[Reflection.AssemblyMetaData('SVG.Value', '<number>')]
[Reflection.AssemblyMetaData('SVG.Default value', '2')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'True')]
[PSObject]
$Dy,
# The StdDeviation attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','StdDeviation')]
[PSObject]
$StdDeviation,
# The TtdDeviation attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','TtdDeviation')]
[PSObject]
$TtdDeviation,
# The ItdDeviation attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','ItdDeviation')]
[PSObject]
$ItdDeviation,
# The CtdDeviation attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','CtdDeviation')]
[PSObject]
$CtdDeviation,
# The LtdDeviation attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','LtdDeviation')]
[PSObject]
$LtdDeviation,
# The FtdDeviation attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','FtdDeviation')]
[PSObject]
$FtdDeviation,
# The BtdDeviation attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','BtdDeviation')]
[PSObject]
$BtdDeviation,
# The MtdDeviation attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','MtdDeviation')]
[PSObject]
$MtdDeviation,
# The VtdDeviation attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','VtdDeviation')]
[PSObject]
$VtdDeviation,
# The DtdDeviation attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','DtdDeviation')]
[PSObject]
$DtdDeviation,
# The OtdDeviation attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','OtdDeviation')]
[PSObject]
$OtdDeviation,
# The WtdDeviation attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','WtdDeviation')]
[PSObject]
$WtdDeviation,
# The PtdDeviation attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','PtdDeviation')]
[PSObject]
$PtdDeviation,
# The UtdDeviation attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','UtdDeviation')]
[PSObject]
$UtdDeviation,
# The AtdDeviation attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','AtdDeviation')]
[PSObject]
$AtdDeviation,
# The HtdDeviation attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','HtdDeviation')]
[PSObject]
$HtdDeviation,
# The XtdDeviation attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','XtdDeviation')]
[PSObject]
$XtdDeviation,
# The RtdDeviation attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','RtdDeviation')]
[PSObject]
$RtdDeviation,
# The YtdDeviation attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','YtdDeviation')]
[PSObject]
$YtdDeviation
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

