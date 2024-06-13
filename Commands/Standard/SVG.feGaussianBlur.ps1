function SVG.feGaussianBlur  {
<#
.Synopsis
    Creates SVG feGaussianBlur elements
.Description
    The **`<feGaussianBlur>`** [SVG](https://developer.mozilla.org/en-US/docs/Web/SVG) filter primitive blurs the input image by the amount specified in `stdDeviation`, which defines the bell-curve.
.Example
    SVG @(
        SVG.filter (
            SVG.feGaussianBlur -In 'SourceGraphic' -StdDeviation 5
        ) -id blurMe
    
        SVG.circle -Fill '#4488ff' -Filter 'url(#blurMe)' -R 50 -Cx 50 -Cy 50
    ) -ViewBox 100, 100
.Example
    $AnimationTimeframe = [Ordered]@{
        Dur = '2s'
        RepeatCount = 'indefinite'
    }
    
    SVG -viewBox 1920,1080 -Content @(
        SVG.filter -id 'noise1' -x '0' -y '0' -width '100%' -height '100%' -Content @(
            SVG.feTurbulence -baseFrequency '0.025' @(
                SVG.animate -AttributeName numOctaves -Values '1;6;12' @AnimationTimeframe
                SVG.animate -AttributeName seed -Values '0;5;0' @AnimationTimeframe
            ) -NumOctaves 4 -Type fractalNoise
            SVG.feGaussianBlur -stdDeviation 0.9 @(
                SVG.animate -AttributeName stdDeviation -Values '1.1;3.3;1.1' @AnimationTimeframe
            )
            SVG.feBlend -In 'SourceGraphic' -Mode color-burn
        )
        SVG.rect -x '0' -y '0' -width 100% -height 100% -style 'filter: url(#noise1);' -Fill '#4488ff' -Opacity .4
    )
.Example
    #.SYNOPSIS
    #    Generates clouds using SVG
    #.DESCRIPTION
    #    Generates a cloud effect using fractal noise and blending modes.
    
    SVG -viewBox 1920, 1080 -Content @(
        SVG.filter -id 'noise1' -x '0' -y '0' -width '100%' -height '100%' -Content @(
            SVG.feTurbulence -baseFrequency '0.025' -Type 'fractalNoise' -NumOctaves 4
            SVG.feGaussianBlur -stdDeviation 0.9
            SVG.feBlend -In 'SourceGraphic' -Mode color-burn
        )
        SVG.rect -x '0' -y '0' -width 100% -height 100% -style 'filter: url(#noise1);' -Fill '#4488ff' -Opacity .2
    )
.Link
    https://pssvg.start-automating.com/SVG.feGaussianBlur
.Link
    https://developer.mozilla.org/en-US/web/svg/element/fegaussianblur/
.Link
    Write-SVG
#>
[Reflection.AssemblyMetadata('SVG.ElementName', 'feGaussianBlur')]
[CmdletBinding(PositionalBinding=$false)]
[OutputType([Xml.XmlElement])]
param(
# The Contents of the feGaussianBlur element
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
[Reflection.AssemblyMetaData('SVG.AttributeName','stdDeviation')]
[Reflection.AssemblyMetaData('SVG.Value', '<number-optional-number>')]
[Reflection.AssemblyMetaData('SVG.Default value', '0')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'True')]
[PSObject]
$StdDeviation,
# 
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','edgeMode')]
[Reflection.AssemblyMetaData('SVG.Value', 'duplicate | wrap | none')]
[ArgumentCompleter({
    param ( $commandName,$parameterName,$wordToComplete,$commandAst,$fakeBoundParameters )    

    $validSet = 'duplicate','wrap','none'
    if ($wordToComplete) {        
        $toComplete = $wordToComplete -replace "^'" -replace "'$"
        return @($validSet -like "$toComplete*" -replace '^', "'" -replace '$',"'")
    } else {
        return @($validSet -replace '^', "'" -replace '$',"'")
    }
})]
[Reflection.AssemblyMetaData('SVG.Animatable', 'True')]
[PSObject]
$EdgeMode,
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
# The Height attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Height')]
[PSObject]
$Height,
# The X attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','X')]
[PSObject]
$X,
# The Width attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Width')]
[PSObject]
$Width,
# The Result attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Result')]
[PSObject]
$Result,
# The Y attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Y')]
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

