function SVG.marker  {
<#
.Synopsis
    Creates SVG marker elements
.Description
    The **`<marker>`** element defines a graphic used for drawing arrowheads or polymarkers on a given `path`, `line`, `polyline` or `polygon` element.
    
    Markers can be attached to shapes using the `marker-start`, `marker-mid`, and `marker-end` properties.
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
.Link
    https://pssvg.start-automating.com/SVG.marker
.Link
    https://developer.mozilla.org/en-US/web/svg/element/marker/
.Link
    Write-SVG
#>
[Reflection.AssemblyMetadata('SVG.ElementName', 'marker')]
[CmdletBinding(PositionalBinding=$false)]
[OutputType([Xml.XmlElement])]
param(
# The Contents of the marker element
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
# This attribute defines the height of the marker viewport.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','markerHeight')]
[Reflection.AssemblyMetaData('SVG.Value', '
        {{cssxref("length-percentage")}} |
        {{cssxref("number")}}
      ')]
[ValidatePattern('(?>|\d+)')]
[ArgumentCompleter({
    param ( $commandName,$parameterName,$wordToComplete,$commandAst,$fakeBoundParameters )    

    $validSet = '<length-percentage>','<number>'
    if ($wordToComplete) {        
        $toComplete = $wordToComplete -replace "^'" -replace "'$"
        return @($validSet -like "$toComplete*" -replace '^', "'" -replace '$',"'")
    } else {
        return @($validSet -replace '^', "'" -replace '$',"'")
    }
})]
[Reflection.AssemblyMetaData('SVG.Default value', '3')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'True')]
[PSObject]
$MarkerHeight,
# This attribute defines the coordinate system for the attributes `markerWidth`, `markerHeight` and the contents of the `<marker>`.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','markerUnits')]
[Reflection.AssemblyMetaData('SVG.Value', 'userSpaceOnUse | strokeWidth')]
[ArgumentCompleter({
    param ( $commandName,$parameterName,$wordToComplete,$commandAst,$fakeBoundParameters )    

    $validSet = 'userSpaceOnUse','strokeWidth'
    if ($wordToComplete) {        
        $toComplete = $wordToComplete -replace "^'" -replace "'$"
        return @($validSet -like "$toComplete*" -replace '^', "'" -replace '$',"'")
    } else {
        return @($validSet -replace '^', "'" -replace '$',"'")
    }
})]
[Reflection.AssemblyMetaData('SVG.Default value', 'strokeWidth')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'True')]
[PSObject]
$MarkerUnits,
# This attribute defines the width of the marker viewport.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','markerWidth')]
[Reflection.AssemblyMetaData('SVG.Value', '
        {{cssxref("length-percentage")}} |
        {{cssxref("number")}}
      ')]
[ValidatePattern('(?>|\d+)')]
[ArgumentCompleter({
    param ( $commandName,$parameterName,$wordToComplete,$commandAst,$fakeBoundParameters )    

    $validSet = '<length-percentage>','<number>'
    if ($wordToComplete) {        
        $toComplete = $wordToComplete -replace "^'" -replace "'$"
        return @($validSet -like "$toComplete*" -replace '^', "'" -replace '$',"'")
    } else {
        return @($validSet -replace '^', "'" -replace '$',"'")
    }
})]
[Reflection.AssemblyMetaData('SVG.Default value', '3')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'True')]
[PSObject]
$MarkerWidth,
# This attribute defines the orientation of the marker relative to the shape it is attached to.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','orient')]
[Reflection.AssemblyMetaData('SVG.Value', 'auto | auto-start-reverse | {{cssxref("angle")}} | {{cssxref("number")}}')]
[ValidatePattern('(?>auto|auto-start-reverse|{{cssxref("angle")}}|\d+)')]
[ArgumentCompleter({
    param ( $commandName,$parameterName,$wordToComplete,$commandAst,$fakeBoundParameters )    

    $validSet = 'auto','auto-start-reverse','<angle>','<number>'
    if ($wordToComplete) {        
        $toComplete = $wordToComplete -replace "^'" -replace "'$"
        return @($validSet -like "$toComplete*" -replace '^', "'" -replace '$',"'")
    } else {
        return @($validSet -replace '^', "'" -replace '$',"'")
    }
})]
[Reflection.AssemblyMetaData('SVG.Default value', '0')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'Yes (non-additive)')]
[PSObject]
$Orient,
# This attribute defines how the svg fragment must be deformed if it is embedded in a container with a different aspect ratio.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','preserveAspectRatio')]
[Reflection.AssemblyMetaData('SVG.Value', '<align> <meetOrSlice>?')]
[Reflection.AssemblyMetaData('SVG.Default value', 'xMidYMidmeet')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'True')]
[PSObject]
$PreserveAspectRatio,
# This attribute defines the x coordinate for the reference point of the marker.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','refX')]
[Reflection.AssemblyMetaData('SVG.Value', '{{cssxref("length-percentage")}} | {{cssxref("number")}} | left | center | right')]
[ValidatePattern('(?>|\d+)')]
[ArgumentCompleter({
    param ( $commandName,$parameterName,$wordToComplete,$commandAst,$fakeBoundParameters )    

    $validSet = '<length-percentage>','<number>','left','center','right'
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
$RefX,
# This attribute defines the y coordinate for the reference point of the marker.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','refY')]
[Reflection.AssemblyMetaData('SVG.Value', '{{cssxref("length-percentage")}} | {{cssxref("number")}} | top | center | bottom')]
[ValidatePattern('(?>|\d+)')]
[ArgumentCompleter({
    param ( $commandName,$parameterName,$wordToComplete,$commandAst,$fakeBoundParameters )    

    $validSet = '<length-percentage>','<number>','top','center','bottom'
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
$RefY,
# This attribute defines the bound of the SVG viewport for the current SVG fragment.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','viewBox')]
[Reflection.AssemblyMetaData('SVG.Value', '<number>,? <number>,? <number>,? <number>')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'True')]
[PSObject]
$ViewBox,
# The CiewBox attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','CiewBox')]
[PSObject]
$CiewBox,
# The SiewBox attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','SiewBox')]
[PSObject]
$SiewBox,
# The EiewBox attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','EiewBox')]
[PSObject]
$EiewBox,
# The TiewBox attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','TiewBox')]
[PSObject]
$TiewBox
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

