function SVG.polygon  {
<#
.Synopsis
    Creates SVG polygon elements
.Description
    The **`<polygon>`** element defines a closed shape consisting of a set of connected straight line segments. The last point is connected to the first point.
    
    For open shapes, see the `polyline` element.
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
    svg -Content @(
        svg.polygon -Points "25,50 50,75 75,50 50,25" -Fill '#4488ff' @(
            svg.animate -AttributeName points -Values "25,50 50,75 75,50 50,25;0,0 0,100 100,100, 100,0; 25,50 50,75 75,50 50,25" -Dur 2s -Id morph1 -RepeatCount 'indefinite' -AttributeType XML
        )
    ) -ViewBox 100,100
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
.Example
    svg -ViewBox 100,100 -Content @(
        svg.symbol -Id psChevron -Content @(
            svg.polygon -Points (@(
                "40,20"
                "45,20"
                "60,50"
                "35,80"
                "32.5,80"
                "55,50"
            ) -join ' ')
        ) -ViewBox 100, 100
    
        svg.use -Href '#psChevron' -Fill '#4488ff'
    )
.Example
    svg -viewBox 300, 100 -Content @(
        svg.symbol -Id psChevron -Content @(
            svg.polygon -Points (@(
                "40,20"
                "45,20"
                "60,50"
                "35,80"
                "32.5,80"
                "55,50"
            ) -join ' ')
        ) -ViewBox 100, 100
        svg.use -Href '#psChevron' -Fill '#4488ff' -X -7.5%
        svg.text @(
            svg.tspan -Content 'Start' -LetterSpacing .15em -AlignmentBaseline 'middle'
            svg.tspan -Content 'Automating' -LetterSpacing .2em -AlignmentBaseline 'middle' -Dx 0.5em
        ) -FontFamily 'monospace' -AlignmentBaseline 'middle' -X 27.5% -Y 50% -Fill '#4488ff'
        # svg.text -Content 'Automating' -FontFamily 'monospace' -AlignmentBaseline 'middle' -X 45% -Y 55% -Fill '#4488ff' -LetterSpacing .1em
    )
.Link
    https://pssvg.start-automating.com/SVG.polygon
.Link
    https://developer.mozilla.org/en-US/web/svg/element/polygon/
.Link
    Write-SVG
#>
[Reflection.AssemblyMetadata('SVG.ElementName', 'polygon')]
[CmdletBinding(PositionalBinding=$false)]
[OutputType([Xml.XmlElement])]
param(
# The Contents of the polygon element
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
# This attribute defines the list of points (pairs of `x,y` absolute coordinates) required to draw the polygon.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','points')]
[Reflection.AssemblyMetaData('SVG.Value', '[ {{cssxref("number")}}+ ]#')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'True')]
[PSObject]
$Points,
# This attribute lets specify the total length for the path, in user units.
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

