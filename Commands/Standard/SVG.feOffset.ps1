function SVG.feOffset  {
<#
.Synopsis
    Creates SVG feOffset elements
.Description
    The **`<feOffset>`** SVG filter primitive allows to offset the input image. The input image as a whole is offset by the values specified in the `dx` and `dy` attributes.
.Link
    https://pssvg.start-automating.com/SVG.feOffset
.Link
    https://developer.mozilla.org/en-US/web/svg/element/feoffset/
.Link
    Write-SVG
#>
[Reflection.AssemblyMetadata('SVG.ElementName', 'feOffset')]
[CmdletBinding(PositionalBinding=$false)]
[OutputType([Xml.XmlElement])]
param(
# The Contents of the feOffset element
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
[Reflection.AssemblyMetaData('SVG.AttributeName','in')]
[Reflection.AssemblyMetaData('SVG.Value', 'SourceGraphic | SourceAlpha | BackgroundImage | BackgroundAlpha | FillPaint | StrokePaint | <filter-primitive-reference>')]
[ArgumentCompleter({
    param ( $commandName,$parameterName,$wordToComplete,$commandAst,$fakeBoundParameters )    

    $validSet = 'SourceGraphic','SourceAlpha','BackgroundImage','BackgroundAlpha','FillPaint','StrokePaint','<filter-primitive-reference>'
    if ($wordToComplete) {        
        $toComplete = $wordToComplete -replace "^'" -replace "'$"
        return @($validSet -like "$toComplete*" -replace '^', "'" -replace '$',"'")
    } else {
        return @($validSet -replace '^', "'" -replace '$',"'")
    }
})]
[Reflection.AssemblyMetaData('SVG.Default value', 'SourceGraphic for first filter primitive, otherwise result of previous filter primitive')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'True')]
[PSObject]
$In,
# 
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','dx')]
[Reflection.AssemblyMetaData('SVG.Value', '<number>')]
[Reflection.AssemblyMetaData('SVG.Default value', '0')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'True')]
[PSObject]
$Dx,
# The Dy attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Dy')]
[PSObject]
$Dy,
# The Ty attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Ty')]
[PSObject]
$Ty,
# The Iy attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Iy')]
[PSObject]
$Iy,
# The Sy attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Sy')]
[PSObject]
$Sy,
# The Cy attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Cy')]
[PSObject]
$Cy,
# The Ly attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Ly')]
[PSObject]
$Ly,
# The Fy attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Fy')]
[PSObject]
$Fy,
# The By attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','By')]
[PSObject]
$By,
# The My attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','My')]
[PSObject]
$My,
# The Vy attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Vy')]
[PSObject]
$Vy,
# The Oy attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Oy')]
[PSObject]
$Oy,
# The Wy attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Wy')]
[PSObject]
$Wy,
# The Py attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Py')]
[PSObject]
$Py,
# The Uy attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Uy')]
[PSObject]
$Uy,
# The Ay attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Ay')]
[PSObject]
$Ay,
# The Hy attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Hy')]
[PSObject]
$Hy,
# The Xy attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Xy')]
[PSObject]
$Xy,
# The Ry attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Ry')]
[PSObject]
$Ry,
# The Yy attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Yy')]
[PSObject]
$Yy
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

