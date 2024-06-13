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
# 
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','dy')]
[Reflection.AssemblyMetaData('SVG.Value', '<number>')]
[Reflection.AssemblyMetaData('SVG.Default value', '0')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'True')]
[PSObject]
$Dy,
# The tabindex attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/tabindex) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','tabindex')]
[PSObject]
$Tabindex,
# The id attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/id) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','id')]
[PSObject]
$Id,
# The style attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/style) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','style')]
[PSObject]
$Style,
# The xml:space attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/xml:space) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.Deprecated',$true)]
[Reflection.AssemblyMetaData('SVG.AttributeName','xml:space')]
[PSObject]
$Xmlspace,
# The xml:lang attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/xml:lang) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.Deprecated',$true)]
[Reflection.AssemblyMetaData('SVG.AttributeName','xml:lang')]
[PSObject]
$Xmllang,
# The xml:base attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/xml:base) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.Deprecated',$true)]
[Reflection.AssemblyMetaData('SVG.AttributeName','xml:base')]
[PSObject]
$Xmlbase,
# The class attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/class) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','class')]
[PSObject]
$Class,
# The lang attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/lang) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','lang')]
[PSObject]
$Lang,
# The clip-path attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/clip-path) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','clip-path')]
[PSObject]
$Clippath,
# The stroke-opacity attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/stroke-opacity) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','stroke-opacity')]
[PSObject]
$Strokeopacity,
# The font-stretch attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/font-stretch) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','font-stretch')]
[PSObject]
$Fontstretch,
# The baseline-shift attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/baseline-shift) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','baseline-shift')]
[PSObject]
$Baselineshift,
# The flood-color attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/flood-color) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','flood-color')]
[PSObject]
$Floodcolor,
# The marker-end attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/marker-end) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','marker-end')]
[PSObject]
$Markerend,
# The font-size-adjust attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/font-size-adjust) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','font-size-adjust')]
[PSObject]
$Fontsizeadjust,
# The color-interpolation-filters attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/color-interpolation-filters) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','color-interpolation-filters')]
[PSObject]
$Colorinterpolationfilters,
# The visibility attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/visibility) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','visibility')]
[PSObject]
$Visibility,
# The stroke-linecap attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/stroke-linecap) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','stroke-linecap')]
[PSObject]
$Strokelinecap,
# The text-rendering attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/text-rendering) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','text-rendering')]
[PSObject]
$Textrendering,
# The fill attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/fill) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','fill')]
[PSObject]
$Fill,
# The fill-rule attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/fill-rule) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','fill-rule')]
[PSObject]
$Fillrule,
# The display attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/display) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','display')]
[PSObject]
$Display,
# The stroke attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/stroke) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','stroke')]
[PSObject]
$Stroke,
# The opacity attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/opacity) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','opacity')]
[PSObject]
$Opacity,
# The d attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/d) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','d')]
[PSObject]
$D,
# The transform attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/transform) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','transform')]
[PSObject]
$Transform,
# The cursor attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/cursor) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','cursor')]
[PSObject]
$Cursor,
# The vector-effect attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/vector-effect) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','vector-effect')]
[PSObject]
$Vectoreffect,
# The stroke-linejoin attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/stroke-linejoin) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','stroke-linejoin')]
[PSObject]
$Strokelinejoin,
# The text-anchor attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/text-anchor) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','text-anchor')]
[PSObject]
$Textanchor,
# The marker-mid attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/marker-mid) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','marker-mid')]
[PSObject]
$Markermid,
# The color-profile attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/color-profile) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.Deprecated',$true)]
[Reflection.AssemblyMetaData('SVG.AttributeName','color-profile')]
[PSObject]
$Colorprofile,
# The stroke-dashoffset attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/stroke-dashoffset) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','stroke-dashoffset')]
[PSObject]
$Strokedashoffset,
# The font-weight attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/font-weight) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','font-weight')]
[PSObject]
$Fontweight,
# The transform-origin attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/transform-origin) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','transform-origin')]
[PSObject]
$Transformorigin,
# The stroke-miterlimit attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/stroke-miterlimit) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','stroke-miterlimit')]
[PSObject]
$Strokemiterlimit,
# The lighting-color attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/lighting-color) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','lighting-color')]
[PSObject]
$Lightingcolor,
# The dominant-baseline attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/dominant-baseline) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','dominant-baseline')]
[PSObject]
$Dominantbaseline,
# The color attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/color) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','color')]
[PSObject]
$Color,
# The clip-rule attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/clip-rule) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','clip-rule')]
[PSObject]
$Cliprule,
# The stroke-dasharray attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/stroke-dasharray) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','stroke-dasharray')]
[PSObject]
$Strokedasharray,
# The enable-background attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/enable-background) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.Deprecated',$true)]
[Reflection.AssemblyMetaData('SVG.AttributeName','enable-background')]
[PSObject]
$Enablebackground,
# The direction attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/direction) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','direction')]
[PSObject]
$Direction,
# The flood-opacity attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/flood-opacity) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','flood-opacity')]
[PSObject]
$Floodopacity,
# The font-variant attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/font-variant) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','font-variant')]
[PSObject]
$Fontvariant,
# The color-interpolation attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/color-interpolation) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','color-interpolation')]
[PSObject]
$Colorinterpolation,
# The stop-opacity attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/stop-opacity) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','stop-opacity')]
[PSObject]
$Stopopacity,
# The overflow attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/overflow) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','overflow')]
[PSObject]
$Overflow,
# The stroke-width attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/stroke-width) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','stroke-width')]
[PSObject]
$Strokewidth,
# The font-family attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/font-family) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','font-family')]
[PSObject]
$Fontfamily,
# The font-size attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/font-size) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','font-size')]
[PSObject]
$Fontsize,
# The filter attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/filter) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','filter')]
[PSObject]
$Filter,
# The font-style attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/font-style) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','font-style')]
[PSObject]
$Fontstyle,
# The text-decoration attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/text-decoration) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','text-decoration')]
[PSObject]
$Textdecoration,
# The kerning attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/kerning) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.Deprecated',$true)]
[Reflection.AssemblyMetaData('SVG.AttributeName','kerning')]
[PSObject]
$Kerning,
# The word-spacing attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/word-spacing) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','word-spacing')]
[PSObject]
$Wordspacing,
# The glyph-orientation-horizontal attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/glyph-orientation-horizontal) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.Deprecated',$true)]
[Reflection.AssemblyMetaData('SVG.AttributeName','glyph-orientation-horizontal')]
[PSObject]
$Glyphorientationhorizontal,
# The writing-mode attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/writing-mode) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','writing-mode')]
[PSObject]
$Writingmode,
# The pointer-events attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/pointer-events) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','pointer-events')]
[PSObject]
$Pointerevents,
# The image-rendering attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/image-rendering) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','image-rendering')]
[PSObject]
$Imagerendering,
# The letter-spacing attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/letter-spacing) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','letter-spacing')]
[PSObject]
$Letterspacing,
# The glyph-orientation-vertical attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/glyph-orientation-vertical) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.Deprecated',$true)]
[Reflection.AssemblyMetaData('SVG.AttributeName','glyph-orientation-vertical')]
[PSObject]
$Glyphorientationvertical,
# The unicode-bidi attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/unicode-bidi) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','unicode-bidi')]
[PSObject]
$Unicodebidi,
# The alignment-baseline attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/alignment-baseline) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','alignment-baseline')]
[PSObject]
$Alignmentbaseline,
# The stop-color attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/stop-color) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','stop-color')]
[PSObject]
$Stopcolor,
# The mask attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/mask) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','mask')]
[PSObject]
$Mask,
# The shape-rendering attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/shape-rendering) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','shape-rendering')]
[PSObject]
$Shaperendering,
# The marker-start attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/marker-start) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','marker-start')]
[PSObject]
$Markerstart,
# The clip attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/clip) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.Deprecated',$true)]
[Reflection.AssemblyMetaData('SVG.AttributeName','clip')]
[PSObject]
$Clip,
# The fill-opacity attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/fill-opacity) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','fill-opacity')]
[PSObject]
$Fillopacity,
# The color-rendering attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/color-rendering) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','color-rendering')]
[PSObject]
$Colorrendering,
# The height attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/height) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','height')]
[PSObject]
$Height,
# The requiredFeatures attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/requiredFeatures) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.Deprecated',$true)]
[Reflection.AssemblyMetaData('SVG.AttributeName','requiredFeatures')]
[PSObject]
$RequiredFeatures,
# The x attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/x) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','x')]
[PSObject]
$X,
# The width attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/width) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','width')]
[PSObject]
$Width,
# The result attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/result) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','result')]
[PSObject]
$Result,
# The y attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/y) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','y')]
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

