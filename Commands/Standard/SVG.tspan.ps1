function SVG.tspan  {
<#
.Synopsis
    Creates SVG tspan elements
.Description
    The SVG **`<tspan>`** element defines a subtext within a `text` element or another `<tspan>` element. It allows for adjustment of the style and/or position of that subtext as needed.
    
    > **Note:** the `<tspan>` element does not wrap by default, to make this happen it needs to be styled with the `white-space` CSS property.
.Example
    $fileList      = @(Get-ChildItem -Path $PSScriptRoot)
    $fileListText  = $fileList | Select-Object Name | Out-String -Width 1kb
    $fileListLines = @($fileListText -split '(?>\r\n|\n)')
    
    $fontSize = 14
    
    $ln = 0
    $maxLineLength =0
    $goldenRatio   = (1 + [Math]::Sqrt(5)) / 2
    
    svg (
        svg.text -Fontsize $fontSize -FontFamily monospace -Fill '#4488ff' @(
        foreach ($line in $fileListLines) {
            $ln++
            $href =
                if ($ln -le 2) {
                    "."
                } else {
                    $file = $fileList[$ln - 3]
                    $file.Name
                }
            if ($line.Length -gt $maxLineLength) {
                $maxLineLength = $line.Length
            }
    
            svg.a -href $href (
                svg.tspan -X 0 -DY 1.2em -Fontsize $fontSize $fileListLines[$ln] -Xmlspace preserve -Fontfamily monospace -Fill '#4488ff'
            )
        }
        )
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
.Example
    svg @(
        svg.ConvexPolygon -SideCount 8 -Rotate (360/16) -Fill '#dd0000' -Stroke white -CenterX 100 -CenterY 100 -Radius 100
    
        svg.text -X 50% -Y 50% -DominantBaseline 'middle' -TextAnchor 'middle' -FontSize 64 -FontFamily sans-serif -Fill white @(
            svg.tspan -Content "STOP" -Id stop
            svg.animate -Values '64;66;64' -Dur 5s -AttributeName font-size -RepeatDur 'indefinite'
        )
    
        svg.text -X 50% -Y 65% -DominantBaseline 'middle' -TextAnchor 'middle' -FontSize 12 -FontFamily sans-serif -Fill white -Content @(
            svg.tspan -Content "USING" -Id using
            svg.animate -Values '12;13;12' -Dur 5s -AttributeName font-size -RepeatDur 'indefinite'
    
        )
    
        svg.text -X 50% -Y 80% -DominantBaseline 'middle' -TextAnchor 'middle' -FontSize 32 -FontFamily sans-serif -Fill white -Content @(
            svg.tspan -Content "GIFS" -Id gif
            svg.animate -Values '28;30;28' -Dur 5s -AttributeName font-size -RepeatDur 'indefinite'
        )
    ) -ViewBox 200,200
.Example
    svg @(
        svg.ConvexPolygon -SideCount 8 -Rotate (360/16) -Fill '#dd0000' -Stroke white -CenterX 100 -CenterY 100 -Radius 100
    
        svg.text -X 50% -Y 50% -DominantBaseline 'middle' -TextAnchor 'middle' -FontSize 64 -FontFamily sans-serif -Fill white @(
            svg.tspan -Content "STOP" -Id stop
            svg.animate -Values '64;66;64' -Dur 5s -AttributeName font-size -RepeatDur 'indefinite'
        )
    
        svg.text -X 50% -Y 65% -DominantBaseline 'middle' -TextAnchor 'middle' -FontSize 12 -FontFamily sans-serif -Fill white -Content @(
            svg.tspan -Content "USING" -Id using
            svg.animate -Values '12;13;12' -Dur 5s -AttributeName font-size -RepeatDur 'indefinite'
    
        )
    
        svg.text -X 50% -Y 80% -DominantBaseline 'middle' -TextAnchor 'middle' -FontSize 32 -FontFamily sans-serif -Fill white -Content @(
            svg.tspan -Content "GIFS" -Id gif
            svg.animate -Values '28;30;28' -Dur 5s -AttributeName font-size -RepeatDur 'indefinite'
        )
    ) -ViewBox 200,200
.Example
    svg @(
        svg.ConvexPolygon -SideCount 8 -Rotate (360/16) -Fill '#dd0000' -Stroke white -CenterX 100 -CenterY 100 -Radius 100
    
        svg.text -X 50% -Y 50% -DominantBaseline 'middle' -TextAnchor 'middle' -FontSize 64 -FontFamily sans-serif -Fill white @(
            svg.tspan -Content "STOP" -Id stop
            svg.animate -Values '64;66;64' -Dur 5s -AttributeName font-size -RepeatDur 'indefinite'
        )
    
        svg.text -X 50% -Y 65% -DominantBaseline 'middle' -TextAnchor 'middle' -FontSize 12 -FontFamily sans-serif -Fill white -Content @(
            svg.tspan -Content "USING" -Id using
            svg.animate -Values '12;13;12' -Dur 5s -AttributeName font-size -RepeatDur 'indefinite'
    
        )
    
        svg.text -X 50% -Y 80% -DominantBaseline 'middle' -TextAnchor 'middle' -FontSize 32 -FontFamily sans-serif -Fill white -Content @(
            svg.tspan -Content "GIFS" -Id gif
            svg.animate -Values '28;30;28' -Dur 5s -AttributeName font-size -RepeatDur 'indefinite'
        )
    ) -ViewBox 200,200
.Link
    https://pssvg.start-automating.com/SVG.tspan
.Link
    https://developer.mozilla.org/en-US/web/svg/element/tspan/
.Link
    Write-SVG
#>
[Reflection.AssemblyMetadata('SVG.ElementName', 'tspan')]
[CmdletBinding(PositionalBinding=$false)]
[OutputType([Xml.XmlElement])]
param(
# The Contents of the tspan element
[Reflection.AssemblyMetaData('SVG.IsCData', $True)]
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
# The x coordinate of the starting point of the text baseline.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','x')]
[Reflection.AssemblyMetaData('SVG.Value', 'List of (<length> | <percentage>)')]
[ValidatePattern('(?>|\d+)')]
[ArgumentCompleter({
    param ( $commandName,$parameterName,$wordToComplete,$commandAst,$fakeBoundParameters )    

    $validSet = 'List of (<length>','<percentage>)'
    if ($wordToComplete) {        
        $toComplete = $wordToComplete -replace "^'" -replace "'$"
        return @($validSet -like "$toComplete*" -replace '^', "'" -replace '$',"'")
    } else {
        return @($validSet -replace '^', "'" -replace '$',"'")
    }
})]
[Reflection.AssemblyMetaData('SVG.Animatable', 'True')]
[PSObject]
$X,
# The y coordinate of the starting point of the text baseline.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','y')]
[Reflection.AssemblyMetaData('SVG.Value', 'List of (<length> | <percentage>)')]
[ValidatePattern('(?>|\d+)')]
[ArgumentCompleter({
    param ( $commandName,$parameterName,$wordToComplete,$commandAst,$fakeBoundParameters )    

    $validSet = 'List of (<length>','<percentage>)'
    if ($wordToComplete) {        
        $toComplete = $wordToComplete -replace "^'" -replace "'$"
        return @($validSet -like "$toComplete*" -replace '^', "'" -replace '$',"'")
    } else {
        return @($validSet -replace '^', "'" -replace '$',"'")
    }
})]
[Reflection.AssemblyMetaData('SVG.Animatable', 'True')]
[PSObject]
$Y,
# Shifts the text position horizontally from a previous text element.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','dx')]
[Reflection.AssemblyMetaData('SVG.Value', 'List of <length>')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'True')]
[PSObject]
$Dx,
# Shifts the text position vertically from a previous text element.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','dy')]
[Reflection.AssemblyMetaData('SVG.Value', 'List of <length>')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'True')]
[PSObject]
$Dy,
# Rotates orientation of each individual glyph. Can rotate glyphs individually.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','rotate')]
[Reflection.AssemblyMetaData('SVG.Value', 'auto | auto-reverse | {{cssxref("number")}}')]
[ValidatePattern('(?>auto|auto-reverse|\d+)')]
[ArgumentCompleter({
    param ( $commandName,$parameterName,$wordToComplete,$commandAst,$fakeBoundParameters )    

    $validSet = 'auto','auto-reverse','<number>'
    if ($wordToComplete) {        
        $toComplete = $wordToComplete -replace "^'" -replace "'$"
        return @($validSet -like "$toComplete*" -replace '^', "'" -replace '$',"'")
    } else {
        return @($validSet -replace '^', "'" -replace '$',"'")
    }
})]
[Reflection.AssemblyMetaData('SVG.Default value', '0')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'False')]
[PSObject]
$Rotate,
# How the text is stretched or compressed to fit the width defined by the `textLength` attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','lengthAdjust')]
[Reflection.AssemblyMetaData('SVG.Value', 'spacing | spacingAndGlyphs')]
[ArgumentCompleter({
    param ( $commandName,$parameterName,$wordToComplete,$commandAst,$fakeBoundParameters )    

    $validSet = 'spacing','spacingAndGlyphs'
    if ($wordToComplete) {        
        $toComplete = $wordToComplete -replace "^'" -replace "'$"
        return @($validSet -like "$toComplete*" -replace '^', "'" -replace '$',"'")
    } else {
        return @($validSet -replace '^', "'" -replace '$',"'")
    }
})]
[Reflection.AssemblyMetaData('SVG.Default value', 'spacing')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'True')]
[PSObject]
$LengthAdjust,
# A width that the text should be scaled to fit.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','textLength')]
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
[Reflection.AssemblyMetaData('SVG.Animatable', 'True')]
[PSObject]
$TextLength,
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

