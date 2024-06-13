function SVG.pattern  {
<#
.Synopsis
    Creates SVG pattern elements
.Description
    The **`<pattern>`** element defines a graphics object which can be redrawn at repeated x- and y-coordinate intervals ("tiled") to cover an area.
    
    The `<pattern>` is referenced by the `fill` and/or `stroke` attributes on other [graphics elements](https://developer.mozilla.org/en-US/docs/Web/SVG/Tutorial/Basic_Shapes) to fill or stroke those elements with the referenced pattern.
.Example
    param(
    [Alias('BPM')]
    [double]
    $BeatsPerMinute = 90
    )
    
    $bpm = $BeatsPerMinute
    $animateDuration = "$([Math]::Round(1/($bpm / 90), 4))s"
    $animateSplat = [Ordered]@{
        Dur = $animateDuration
        RepeatDur = "indefinite"
    }
    
    $Color = "#4488ff"
    
    SVG -ViewBox 200, 200 -Fill black @(
        SVG.pattern -Width .5 -Height .5 @(
            SVG.rect -Width 0 -Height 0 -X 25 -Y 25 @(
                SVG.animate -AttributeName width -Values '0;50' @animateSplat
                SVG.animate -AttributeName height -Values '0;50' @animateSplat
                SVG.animate -AttributeName x -Values '25;0' @animateSplat
                SVG.animate -AttributeName y -Values '25;0' @animateSplat
                SVG.animate -AttributeName opacity -From 0 -To 1 @animateSplat
                SVG.animate -AttributeName rx -Values "0;5;0" @animateSplat
            ) -Fill $color -Id TopLeft
    
            SVG.rect -Width 0 -Height 0 -X 75 -Y 25 @(
                SVG.animate -AttributeName width -Values '50;0' @animateSplat
                SVG.animate -AttributeName height -Values '50;0' @animateSplat
                SVG.animate -AttributeName x -Values '50;75' @animateSplat
                SVG.animate -AttributeName y -From 0 -To 25 @animateSplat
                SVG.animate -AttributeName opacity -From 1 -To 0 @animateSplat
                SVG.animate -AttributeName rx -Values "0;5;0" @animateSplat
            ) -Fill $Color -Id TopRight
    
            SVG.rect -Width 0 -Height 0 -X 75 -Y 75 @(
                SVG.animate -AttributeName width -Values '0;50' @animateSplat
                SVG.animate -AttributeName height -Values '0;50' @animateSplat
                SVG.animate -AttributeName x -Values '75;50' @animateSplat
                SVG.animate -AttributeName y -Values '75;50' @animateSplat
                SVG.animate -AttributeName opacity -From 0 -To 1 @animateSplat
                SVG.animate -AttributeName rx -Values "0;5;0" @animateSplat
            ) -Fill $color -Id BottomRight
    
            SVG.rect -Width 0 -Height 0 -X 25 -Y 75 @(
                SVG.animate -AttributeName width -Values '50;0' @animateSplat
                SVG.animate -AttributeName height -Values '50;0' @animateSplat
                SVG.animate -AttributeName y -Values '50;75' @animateSplat
                SVG.animate -AttributeName x -From 0 -To 25 @animateSplat
                SVG.animate -AttributeName opacity -From 1 -To 0 @animateSplat
                SVG.animate -AttributeName rx -Values "0;5;0" @animateSplat
            ) -Fill $Color -Id TopRight
        ) -id fillPattern
        SVG.rect -Width 200 -Height 200 -Fill "url(#fillPattern)" -X 0 -Y 0
    )
.Example
    param(
    [Alias('BPM')]
    [double]
    $BeatsPerMinute = 70,
    
    [int]
    $scale = 4
    )
    
    $animateDuration = "$([Math]::Round(1/($BeatsPerMinute / 60), 4))s"
    $animateSplat = [Ordered]@{
        Dur = $animateDuration
        RepeatDur = "indefinite"
    }
    
    $patternSize = 1/$scale
    
    $Color = "#4488ff"
    
    SVG -ViewBox 800, 800 @(
        SVG.pattern -Width $patternSize -Height $patternSize @(
            SVG.polygon -Points "10,10, 10,90, 50,50, 90,10 90,90" @(
                SVG.animate -AttributeName points -to "0,0 100,0 100,100, 0,100 0,0" -AttributeType XML @animateSplat
            )  -Fill $color -Stroke $color
        ) -id fillPattern
        SVG.rect -Width 800 -Height 800 -Fill "url(#fillPattern)" -X 0 -Y 0
    )
.Example
    param(
    # The number of beats per minute
    [double]
    $BeatsPerMinute = 128,
    
    # The number repetitions of the pattern
    [ValidateRange(1,16)]
    [int]
    $Scale = 6
    )
    
    $bpm = $BeatsPerMinute
    
    $animateDuration = "$([Math]::Round(1/($bpm / 60), 4))s"
    $animateSplat = [Ordered]@{
        Dur = $animateDuration
        RepeatDur = "indefinite"
    }
    
    $patternSize = 1/$scale
    
    $Color = "#4488ff"
    
    SVG -ViewBox 800, 800 @(
        SVG.pattern -Width $patternSize -Height $patternSize @(
            SVG.polygon -Points "0,0, 100,100, 0,100" @(
                SVG.animate -AttributeName points -to "100,100 0,0 100,0" -AttributeType XML @animateSplat
            )  -Fill $color -Stroke $color
        ) -id fillPattern
        SVG.rect -Width 800 -Height 800 -Fill "url(#fillPattern)"
    )
.Example
    param(
    # The scale of the pattern
    [double]
    $Scale = 0.75
    )
    SVG -Content @(
        SVG.defs -Content @(
    
            SVG.pattern -id 'HexagonPattern' -patternUnits 'userSpaceOnUse' -width '174' -height '200' -patternTransform "scale($Scale)" -Content @(
                SVG.Hexagon -CenterX 87 -CenterY 100 -Radius 100 -Fill transparent -Stroke '#4488ff' -Comment "A hexagon with a" -Class 'foreground-fill'
            ) -Comment "A faint hexagon Pattern, rendered 4x at a base scale of 174 by 200"
        )
        $hugeSize = 20000
    
        SVG.rect -width "$hugeSize%" -height "$hugeSize%" -fill 'url(#HexagonPattern)'
    )
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
    svg -ViewBox 0, 0, 250, 200 -Content @(
        svg.defs (
            svg.pattern -id star -ViewBox 0,0, 10, 10 -Width 10% -Height 10% @(
                svg.polygon -Points "0,0", "2,5", "0,10", "5,8", "10,10","8,5", "10,0", "5,2" @(
                    svg.animateTransform -AttributeName transform -From "0 5 5"  -To "360 5 5" -dur "5s" -RepeatCount indefinite -AttributeType xml -type rotate
                ) -Fill '#4488ff'
            )
        )
        svg.circle -cx 50 -cy 100 -r 50 -Fill 'url(#star)'
        svg.circle -cx 180 -cy 100 -r 50 -Fill 'none' -StrokeWidth 20 -Stroke 'url(#star)' -Content @(
            svg.animateTransform -AttributeName transform -From "0 180 100"  -To "360 180 100" -dur "5s" -RepeatCount indefinite -AttributeType xml -type rotate
        )
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
.Link
    https://pssvg.start-automating.com/SVG.pattern
.Link
    https://developer.mozilla.org/en-US/web/svg/element/pattern/
.Link
    Write-SVG
#>
[Reflection.AssemblyMetadata('SVG.ElementName', 'pattern')]
[CmdletBinding(PositionalBinding=$false)]
[OutputType([Xml.XmlElement])]
param(
# The Contents of the pattern element
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
# This attribute determines the height of the pattern tile.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','height')]
[Reflection.AssemblyMetaData('SVG.Value', '<length>')]
[Reflection.AssemblyMetaData('SVG.Default value', '0')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'True')]
[PSObject]
$Height,
# This attribute reference a template pattern that provides default values for the `<pattern>` attributes.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','href')]
[Reflection.AssemblyMetaData('SVG.Value', '<url>')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'True')]
[PSObject]
$Href,
# This attribute defines the coordinate system for the contents of the pattern.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','patternContentUnits')]
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
[Reflection.AssemblyMetaData('SVG.Default value', 'userSpaceOnUse')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'True')]
[PSObject]
$PatternContentUnits,
# This attribute contains the definition of an optional additional transformation from the pattern coordinate system onto the target coordinate system.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','patternTransform')]
[Reflection.AssemblyMetaData('SVG.Value', '<transform-list>')]
[Reflection.AssemblyMetaData('SVG.Default value', 'Identity transform')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'True')]
[PSObject]
$PatternTransform,
# This attribute defines the coordinate system for attributes `x`, `y`, `width`, and `height`.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','patternUnits')]
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
$PatternUnits,
# This attribute defines how the SVG fragment must be deformed if it is embedded in a container with a different aspect ratio.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','preserveAspectRatio')]
[Reflection.AssemblyMetaData('SVG.Value', '<align> <meetOrSlice>?')]
[Reflection.AssemblyMetaData('SVG.Default value', 'xMidYMidmeet')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'True')]
[PSObject]
$PreserveAspectRatio,
# This attribute defines the bound of the SVG viewport for the pattern fragment.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','viewBox')]
[Reflection.AssemblyMetaData('SVG.Value', '<number>,? <number>,? <number>,? <number>')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'True')]
[PSObject]
$ViewBox,
# This attribute determines the width of the pattern tile.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','width')]
[Reflection.AssemblyMetaData('SVG.Value', '<length>')]
[Reflection.AssemblyMetaData('SVG.Default value', '0')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'True')]
[PSObject]
$Width,
# This attribute determines the x coordinate shift of the pattern tile.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','x')]
[Reflection.AssemblyMetaData('SVG.Value', '<length>')]
[Reflection.AssemblyMetaData('SVG.Default value', '0')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'True')]
[PSObject]
$X,
# This attribute references a template pattern that provides default values for the `<pattern>` attributes.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','xlink:href')]
[Reflection.AssemblyMetaData('SVG.Value', '<iri>')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'True')]
[PSObject]
$XlinkHref,
# This attribute determines the y coordinate shift of the pattern tile.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','y')]
[Reflection.AssemblyMetaData('SVG.Value', '<length>')]
[Reflection.AssemblyMetaData('SVG.Default value', '0')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'True')]
[PSObject]
$Y
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

