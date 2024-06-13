function SVG.text  {
<#
.Synopsis
    Creates SVG text elements
.Description
    The SVG **`<text>`** element draws a graphics element consisting of text. It's possible to apply a gradient, pattern, clipping path, mask, or filter to `<text>`, like any other SVG graphics element.
    
    If text is included in SVG not inside of a `<text>` element, it is not rendered. This is different than being hidden by default, as setting the `display` property won't show the text.
    
    > **Note:** the `<text>` element does not wrap by default, to make this happen it needs to be styled with the `white-space` CSS property.
.Example
    param(
        [double]
        $DistanceY = 0.75,
    
        [double]
        $DistanceX = 0
    )
    SVG @(
        SVG.DropShadow -DistanceY $DistanceY  -DistanceX $DistanceX
    
        SVG.text "
    Dropping Shadows
    " -TextAnchor middle -DominantBaseline middle -Fill '#4488ff' -FontSize 16 -X 50% -Y 50% -Filter 'url(#dropShadow)'
    
    ) -ViewBox 0,0,300,100
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
    # The Message to display
    [string]
    $Message = "Fading in",
    
    # The fill color of the text
    [string]
    $Fill = '#4488ff',
    
    # One or more CSS classes to apply to the text
    [string[]]
    $Class,
    
    # The font size of the text
    [string]
    $FontSize = "26em",
    
    # The duration of the animation.
    [Timespan]
    $Duration = "00:00:02",
    
    [string]
    $RepeatCount = 'indefinite'
    )
    
    svg -ViewBox 0,0,1920,1080 -Content (
        svg.g -Content @(
            svg.text -Y "50%" -X "50%" -DominantBaseline middle -TextAnchor middle -Text $Message -Fill $fill -Class $Class -fontSize $FontSize
    
            # If you only want to fade in once, remove the -RepeatCount
            svg.animate -Values '0;1' -AttributeName opacity -Begin '0s' -End "$($Duration.TotalSeconds)" -Dur "$($duration.TotalSeconds)s" -RepeatCount $RepeatCount
        )
    )
.Example
    param(
    [string]
    $Message = "Hello World",
    
    [string]
    $GoogleFont = "Roboto",
    
    [string]
    $Fill = '#4488ff',
    
    [string[]]
    $Class,
    
    [string]
    $FontSize = "24em",
    
    [double]
    $Width = 1920,
    
    [double]
    $Height = 1080
    )
    
    svg @(
        svg.defs @(
            SVG.GoogleFont -FontName $GoogleFont
        )
        svg.text -X 50% -Y 50% -Fontsize $FontSize $Message -DominantBaseline middle -TextAnchor middle -Fill $Fill -Class $Class -FontFamily "'$GoogleFont', sans-serif"
    ) -ViewBox 0,0, 1920, 1080
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
    https://pssvg.start-automating.com/SVG.text
.Link
    https://developer.mozilla.org/en-US/web/svg/element/text/
.Link
    Write-SVG
#>
[Reflection.AssemblyMetadata('SVG.ElementName', 'text')]
[CmdletBinding(PositionalBinding=$false)]
[OutputType([Xml.XmlElement])]
param(
# The Contents of the text element
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
[Reflection.AssemblyMetaData('SVG.Default value', '0')]
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
[Reflection.AssemblyMetaData('SVG.Default value', '0')]
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
# The Path attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Path')]
[PSObject]
$Path,
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

