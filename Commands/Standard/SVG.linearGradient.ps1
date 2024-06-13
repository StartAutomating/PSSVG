function SVG.linearGradient  {
<#
.Synopsis
    Creates SVG linearGradient elements
.Description
    The **`<linearGradient>`** element lets authors define linear gradients to apply to other SVG elements.
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./LinearGradient.PSSVG.ps1 | Invoke-Item
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./LinearGradientAnimated.PSSVG.ps1 | Invoke-Item
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./MovingGradient.PSSVG.ps1 | Invoke-Item
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./VerticalLinearGradient.PSSVG.ps1 | Invoke-Item
    Pop-Location
.Link
    https://pssvg.start-automating.com/SVG.linearGradient
.Link
    https://developer.mozilla.org/en-US/web/svg/element/lineargradient/
.Link
    Write-SVG
#>
[Reflection.AssemblyMetadata('SVG.ElementName', 'linearGradient')]
[CmdletBinding(PositionalBinding=$false)]
[OutputType([Xml.XmlElement])]
param(
# The Contents of the linearGradient element
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
# This attribute defines the coordinate system for attributes `x1`, `x2`, `y1`, `y2`
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','gradientUnits')]
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
$GradientUnits,
# This attribute provides additional [transformation](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/transform) to the gradient coordinate system.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','gradientTransform')]
[Reflection.AssemblyMetaData('SVG.Default value', 'Identity transform')]
[Reflection.AssemblyMetaData('SVG.Value', '<transform-list>')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'True')]
[PSObject]
$GradientTransform,
# This attribute defines a reference to another `<linearGradient>` element that will be used as a template.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','href')]
[Reflection.AssemblyMetaData('SVG.Value', '<url>')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'True')]
[PSObject]
$Href,
# This attribute indicates how the gradient behaves if it starts or ends inside the bounds of the shape containing the gradient.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','spreadMethod')]
[Reflection.AssemblyMetaData('SVG.Value', 'pad | reflect | repeat')]
[ArgumentCompleter({
    param ( $commandName,$parameterName,$wordToComplete,$commandAst,$fakeBoundParameters )    

    $validSet = 'pad','reflect','repeat'
    if ($wordToComplete) {        
        $toComplete = $wordToComplete -replace "^'" -replace "'$"
        return @($validSet -like "$toComplete*" -replace '^', "'" -replace '$',"'")
    } else {
        return @($validSet -replace '^', "'" -replace '$',"'")
    }
})]
[Reflection.AssemblyMetaData('SVG.Initial value', 'pad')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'True')]
[PSObject]
$SpreadMethod,
# This attribute defines the x coordinate of the starting point of the vector gradient along which the linear gradient is drawn.
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
[Reflection.AssemblyMetaData('SVG.Default value', '0%')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'True')]
[PSObject]
$X1,
# This attribute defines the x coordinate of the ending point of the vector gradient along which the linear gradient is drawn.
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
[Reflection.AssemblyMetaData('SVG.Default value', '100%')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'True')]
[PSObject]
$X2,
# An [\<IRI>](https://developer.mozilla.org/en-US/docs/Web/SVG/Content_type#iri) reference to another `<linearGradient>` element that will be used as a template.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','xlink:href')]
[Reflection.AssemblyMetaData('SVG.Value', '<iri>')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'True')]
[PSObject]
$XlinkHref,
# This attribute defines the y coordinate of the starting point of the vector gradient along which the linear gradient is drawn.
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
[Reflection.AssemblyMetaData('SVG.Default value', '0%')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'True')]
[PSObject]
$Y1,
# This attribute defines the y coordinate of the ending point of the vector gradient along which the linear gradient is drawn.
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
[Reflection.AssemblyMetaData('SVG.Default value', '0%')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'True')]
[PSObject]
$Y2,
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
# The xlink:type attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/xlink:type) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.Deprecated',$true)]
[Reflection.AssemblyMetaData('SVG.AttributeName','xlink:type')]
[PSObject]
$Xlinktype,
# The xlink:arcrole attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/xlink:arcrole) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.Deprecated',$true)]
[Reflection.AssemblyMetaData('SVG.AttributeName','xlink:arcrole')]
[PSObject]
$Xlinkarcrole,
# The xlink:show attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/xlink:show) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.Deprecated',$true)]
[Reflection.AssemblyMetaData('SVG.AttributeName','xlink:show')]
[PSObject]
$Xlinkshow,
# The xlink:title attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/xlink:title) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.Deprecated',$true)]
[Reflection.AssemblyMetaData('SVG.AttributeName','xlink:title')]
[PSObject]
$Xlinktitle,
# The xlink:role attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/xlink:role) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','xlink:role')]
[PSObject]
$Xlinkrole,
# The xlink:actuate attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/xlink:actuate) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','xlink:actuate')]
[PSObject]
$Xlinkactuate,
# The externalResourcesRequired attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/externalResourcesRequired) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','externalResourcesRequired')]
[PSObject]
$ExternalResourcesRequired,
# The requiredFeatures attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/requiredFeatures) for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.Deprecated',$true)]
[Reflection.AssemblyMetaData('SVG.AttributeName','requiredFeatures')]
[PSObject]
$RequiredFeatures
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

