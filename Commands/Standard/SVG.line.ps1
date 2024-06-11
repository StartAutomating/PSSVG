function SVG.line  {
<#
.Synopsis
    Creates SVG line elements
.Description
    The **`<line>`** element is an SVG basic shape used to create a line connecting two points.
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
    https://pssvg.start-automating.com/SVG.line
.Link
    https://developer.mozilla.org/en-US/web/svg/element/line/
.Link
    Write-SVG
#>
[Reflection.AssemblyMetadata('SVG.ElementName', 'line')]
[CmdletBinding(PositionalBinding=$false)]
[OutputType([Xml.XmlElement])]
param(
# The Contents of the line element
[Parameter(Position=0,ValueFromPipeline,ValueFromPipelineByPropertyName)]
[Alias('InputObject','Text', 'InnerText', 'Contents')]
$Content,
# The element identifier.
[Parameter(ValueFromPipelineByPropertyName)]
[string]
$Id,
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
# Defines the x-axis coordinate of the line starting point.
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
[Reflection.AssemblyMetaData('SVG.Default value', '0')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'True')]
[PSObject]
$X1,
# Defines the x-axis coordinate of the line ending point.
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
[Reflection.AssemblyMetaData('SVG.Default value', '0')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'True')]
[PSObject]
$X2,
# Defines the y-axis coordinate of the line starting point.
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
[Reflection.AssemblyMetaData('SVG.Default value', '0')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'True')]
[PSObject]
$Y1,
# Defines the y-axis coordinate of the line ending point.
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
[Reflection.AssemblyMetaData('SVG.Default value', '0')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'True')]
[PSObject]
$Y2,
# Defines the total path length in user units.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','pathLength')]
[Reflection.AssemblyMetaData('SVG.Value', '<number>')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'True')]
[PSObject]
$PathLength
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

