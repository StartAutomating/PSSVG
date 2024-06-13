function SVG.a  {
<#
.Synopsis
    Creates SVG a elements
.Description
    The **\<a>** SVG element creates a hyperlink to other web pages, files, locations in the same page, email addresses, or any other URL. It is very similar to HTML's `a` element.
    
    SVG's `<a>` element is a container, which means you can create a link around text (like in HTML) but also around any shape.
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
.Link
    https://pssvg.start-automating.com/SVG.a
.Link
    https://developer.mozilla.org/en-US/web/svg/element/a/
.Link
    Write-SVG
#>
[Reflection.AssemblyMetadata('SVG.ElementName', 'a')]
[CmdletBinding(PositionalBinding=$false)]
[OutputType([Xml.XmlElement])]
param(
# The Contents of the a element
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
# Instructs browsers to download a URL instead of navigating to it, so the user will be prompted to save it as a local file.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','[`download`](/en-US/docs/Web/HTML/Element/a#download)')]
[PSObject]
$Download,
# The URL or URL fragment the hyperlink points to.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','href')]
[Reflection.AssemblyMetaData('SVG.Value', '<url>')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'True')]
[PSObject]
$Href,
# The human language of the URL or URL fragment that the hyperlink points to.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','[`hreflang`](/en-US/docs/Web/HTML/Element/a#hreflang)')]
[PSObject]
$Hreflang,
# A space-separated list of URLs to which, when the hyperlink is followed, POST requests with the body `PING` will be sent by the browser (in the background). Typically used for tracking. For a more widely-supported feature addressing the same use cases, see Navigator.sendBeacon().
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','[`ping`](/en-US/docs/Web/HTML/Element/a#ping)')]
[PSObject]
$Ping,
# Which [referrer](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Referer) to send when fetching the URL.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','[`referrerpolicy`](/en-US/docs/Web/HTML/Element/a#referrerpolicy)')]
[PSObject]
$Referrerpolicy,
# The relationship of the target object to the link object.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','[`rel`](/en-US/docs/Web/HTML/Element/a#rel)')]
[PSObject]
$Rel,
# Where to display the linked URL.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','target')]
[Reflection.AssemblyMetaData('SVG.Value', '_self | _parent | _top | _blank | <XML-Name>')]
[ArgumentCompleter({
    param ( $commandName,$parameterName,$wordToComplete,$commandAst,$fakeBoundParameters )    

    $validSet = '_self','_parent','_top','_blank','<XML-Name>'
    if ($wordToComplete) {        
        $toComplete = $wordToComplete -replace "^'" -replace "'$"
        return @($validSet -like "$toComplete*" -replace '^', "'" -replace '$',"'")
    } else {
        return @($validSet -replace '^', "'" -replace '$',"'")
    }
})]
[Reflection.AssemblyMetaData('SVG.Default value', '_self')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'True')]
[PSObject]
$Target,
# A MIME type for the linked URL.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','[`type`](/en-US/docs/Web/HTML/Element/a#type)')]
[PSObject]
$Type,
# The URL or URL fragment that the hyperlink points to. May be required for backwards compatibility for older browsers.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','xlink:href')]
[Reflection.AssemblyMetaData('SVG.Value', '<iri>')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'True')]
[PSObject]
$XlinkHref,
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
# The Xlinkrole attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Xlinkrole')]
[PSObject]
$Xlinkrole,
# The Xlinkactuate attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Xlinkactuate')]
[PSObject]
$Xlinkactuate,
# The ExternalResourcesRequired attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','ExternalResourcesRequired')]
[PSObject]
$ExternalResourcesRequired
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

