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
$PathLength,
# The SystemLanguage attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','SystemLanguage')]
[PSObject]
$SystemLanguage,
# The RequiredExtensions attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','RequiredExtensions')]
[PSObject]
$RequiredExtensions,
# The Tabindex attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Tabindex')]
[PSObject]
$Tabindex,
# The Id attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Id')]
[PSObject]
$Id,
# The Style attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Style')]
[PSObject]
$Style,
# The Class attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Class')]
[PSObject]
$Class,
# The Lang attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Lang')]
[PSObject]
$Lang,
# The Clippath attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Clippath')]
[PSObject]
$Clippath,
# The Strokeopacity attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Strokeopacity')]
[PSObject]
$Strokeopacity,
# The Fontstretch attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Fontstretch')]
[PSObject]
$Fontstretch,
# The Baselineshift attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Baselineshift')]
[PSObject]
$Baselineshift,
# The Floodcolor attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Floodcolor')]
[PSObject]
$Floodcolor,
# The Markerend attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Markerend')]
[PSObject]
$Markerend,
# The Fontsizeadjust attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Fontsizeadjust')]
[PSObject]
$Fontsizeadjust,
# The Colorinterpolationfilters attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Colorinterpolationfilters')]
[PSObject]
$Colorinterpolationfilters,
# The Visibility attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Visibility')]
[PSObject]
$Visibility,
# The Strokelinecap attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Strokelinecap')]
[PSObject]
$Strokelinecap,
# The Textrendering attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Textrendering')]
[PSObject]
$Textrendering,
# The Fill attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Fill')]
[PSObject]
$Fill,
# The Fillrule attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Fillrule')]
[PSObject]
$Fillrule,
# The Display attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Display')]
[PSObject]
$Display,
# The Stroke attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Stroke')]
[PSObject]
$Stroke,
# The Opacity attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Opacity')]
[PSObject]
$Opacity,
# The D attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','D')]
[PSObject]
$D,
# The Transform attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Transform')]
[PSObject]
$Transform,
# The Cursor attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Cursor')]
[PSObject]
$Cursor,
# The Vectoreffect attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Vectoreffect')]
[PSObject]
$Vectoreffect,
# The Strokelinejoin attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Strokelinejoin')]
[PSObject]
$Strokelinejoin,
# The Textanchor attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Textanchor')]
[PSObject]
$Textanchor,
# The Markermid attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Markermid')]
[PSObject]
$Markermid,
# The Strokedashoffset attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Strokedashoffset')]
[PSObject]
$Strokedashoffset,
# The Fontweight attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Fontweight')]
[PSObject]
$Fontweight,
# The Transformorigin attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Transformorigin')]
[PSObject]
$Transformorigin,
# The Strokemiterlimit attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Strokemiterlimit')]
[PSObject]
$Strokemiterlimit,
# The Lightingcolor attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Lightingcolor')]
[PSObject]
$Lightingcolor,
# The Dominantbaseline attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Dominantbaseline')]
[PSObject]
$Dominantbaseline,
# The Color attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Color')]
[PSObject]
$Color,
# The Cliprule attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Cliprule')]
[PSObject]
$Cliprule,
# The Strokedasharray attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Strokedasharray')]
[PSObject]
$Strokedasharray,
# The Direction attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Direction')]
[PSObject]
$Direction,
# The Floodopacity attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Floodopacity')]
[PSObject]
$Floodopacity,
# The Fontvariant attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Fontvariant')]
[PSObject]
$Fontvariant,
# The Colorinterpolation attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Colorinterpolation')]
[PSObject]
$Colorinterpolation,
# The Stopopacity attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Stopopacity')]
[PSObject]
$Stopopacity,
# The Overflow attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Overflow')]
[PSObject]
$Overflow,
# The Strokewidth attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Strokewidth')]
[PSObject]
$Strokewidth,
# The Fontfamily attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Fontfamily')]
[PSObject]
$Fontfamily,
# The Fontsize attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Fontsize')]
[PSObject]
$Fontsize,
# The Filter attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Filter')]
[PSObject]
$Filter,
# The Fontstyle attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Fontstyle')]
[PSObject]
$Fontstyle,
# The Textdecoration attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Textdecoration')]
[PSObject]
$Textdecoration,
# The Wordspacing attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Wordspacing')]
[PSObject]
$Wordspacing,
# The Writingmode attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Writingmode')]
[PSObject]
$Writingmode,
# The Pointerevents attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Pointerevents')]
[PSObject]
$Pointerevents,
# The Imagerendering attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Imagerendering')]
[PSObject]
$Imagerendering,
# The Letterspacing attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Letterspacing')]
[PSObject]
$Letterspacing,
# The Unicodebidi attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Unicodebidi')]
[PSObject]
$Unicodebidi,
# The Alignmentbaseline attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Alignmentbaseline')]
[PSObject]
$Alignmentbaseline,
# The Stopcolor attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Stopcolor')]
[PSObject]
$Stopcolor,
# The Mask attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Mask')]
[PSObject]
$Mask,
# The Shaperendering attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Shaperendering')]
[PSObject]
$Shaperendering,
# The Markerstart attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Markerstart')]
[PSObject]
$Markerstart,
# The Fillopacity attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Fillopacity')]
[PSObject]
$Fillopacity,
# The Colorrendering attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Colorrendering')]
[PSObject]
$Colorrendering,
# The ExternalResourcesRequired attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','ExternalResourcesRequired')]
[PSObject]
$ExternalResourcesRequired,
# The Paintorder attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Paintorder')]
[PSObject]
$Paintorder
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

