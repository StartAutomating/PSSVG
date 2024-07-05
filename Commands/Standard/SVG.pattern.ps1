function SVG.pattern  {
<#
.Synopsis
    Creates SVG pattern elements
.Description
    The **`<pattern>`** element defines a graphics object which can be redrawn at repeated x- and y-coordinate intervals ("tiled") to cover an area.
    
    The `<pattern>` is referenced by the `fill` and/or `stroke` attributes on other [graphics elements](https://developer.mozilla.org/en-US/docs/Web/SVG/Tutorial/Basic_Shapes) to fill or stroke those elements with the referenced pattern.
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./BPMAnimate.PSSVG.ps1 | Invoke-Item
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./BPMMorph.PSSVG.ps1 | Invoke-Item
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./BPMTriangleMorph.PSSVG.ps1 | Invoke-Item
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./HexagonPattern.PSSVG.ps1 | Invoke-Item
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./Pattern.PSSVG.ps1 | Invoke-Item
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./PatternAnimation.PSSVG.ps1 | Invoke-Item
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./PatternMask.PSSVG.ps1 | Invoke-Item
    Pop-Location
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
$Y,
# The systemLanguage attribute.  See [MDN]() for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','systemLanguage')]
[PSObject]
$SystemLanguage,
# The requiredFeatures attribute.  See [MDN]() for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.Deprecated',$true)]
[Reflection.AssemblyMetaData('SVG.AttributeName','requiredFeatures')]
[PSObject]
$RequiredFeatures,
# The requiredExtensions attribute.  See [MDN]() for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','requiredExtensions')]
[PSObject]
$RequiredExtensions,
# The lang attribute.  See [MDN]() for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','lang')]
[PSObject]
$Lang,
# The tabindex attribute.  See [MDN]() for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','tabindex')]
[PSObject]
$Tabindex,
# The class attribute.  See [MDN]() for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','class')]
[PSObject]
$Class,
# The id attribute.  See [MDN]() for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','id')]
[PSObject]
$Id,
# The xml:lang attribute.  See [MDN]() for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.Deprecated',$true)]
[Reflection.AssemblyMetaData('SVG.AttributeName','xml:lang')]
[PSObject]
$XmlLang,
# The xml:space attribute.  See [MDN]() for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.Deprecated',$true)]
[Reflection.AssemblyMetaData('SVG.AttributeName','xml:space')]
[PSObject]
$XmlSpace,
# The style attribute.  See [MDN]() for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','style')]
[PSObject]
$Style,
# The font-family attribute.  See [MDN]() for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','font-family')]
[PSObject]
$FontFamily,
# The cursor attribute.  See [MDN]() for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','cursor')]
[PSObject]
$Cursor,
# The stroke-miterlimit attribute.  See [MDN]() for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','stroke-miterlimit')]
[PSObject]
$StrokeMiterlimit,
# The font-size attribute.  See [MDN]() for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','font-size')]
[PSObject]
$FontSize,
# The marker-end attribute.  See [MDN]() for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','marker-end')]
[PSObject]
$MarkerEnd,
# The stroke-dasharray attribute.  See [MDN]() for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','stroke-dasharray')]
[PSObject]
$StrokeDasharray,
# The glyph-orientation-vertical attribute.  See [MDN]() for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.Deprecated',$true)]
[Reflection.AssemblyMetaData('SVG.AttributeName','glyph-orientation-vertical')]
[PSObject]
$GlyphOrientationVertical,
# The vector-effect attribute.  See [MDN]() for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','vector-effect')]
[PSObject]
$VectorEffect,
# The image-rendering attribute.  See [MDN]() for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','image-rendering')]
[PSObject]
$ImageRendering,
# The visibility attribute.  See [MDN]() for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','visibility')]
[PSObject]
$Visibility,
# The shape-rendering attribute.  See [MDN]() for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','shape-rendering')]
[PSObject]
$ShapeRendering,
# The glyph-orientation-horizontal attribute.  See [MDN]() for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.Deprecated',$true)]
[Reflection.AssemblyMetaData('SVG.AttributeName','glyph-orientation-horizontal')]
[PSObject]
$GlyphOrientationHorizontal,
# The stop-color attribute.  See [MDN]() for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','stop-color')]
[PSObject]
$StopColor,
# The lighting-color attribute.  See [MDN]() for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','lighting-color')]
[PSObject]
$LightingColor,
# The word-spacing attribute.  See [MDN]() for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','word-spacing')]
[PSObject]
$WordSpacing,
# The flood-color attribute.  See [MDN]() for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','flood-color')]
[PSObject]
$FloodColor,
# The clip-path attribute.  See [MDN]() for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','clip-path')]
[PSObject]
$ClipPath,
# The letter-spacing attribute.  See [MDN]() for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','letter-spacing')]
[PSObject]
$LetterSpacing,
# The baseline-shift attribute.  See [MDN]() for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','baseline-shift')]
[PSObject]
$BaselineShift,
# The flood-opacity attribute.  See [MDN]() for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','flood-opacity')]
[PSObject]
$FloodOpacity,
# The font-style attribute.  See [MDN]() for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','font-style')]
[PSObject]
$FontStyle,
# The filter attribute.  See [MDN]() for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','filter')]
[PSObject]
$Filter,
# The dominant-baseline attribute.  See [MDN]() for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','dominant-baseline')]
[PSObject]
$DominantBaseline,
# The pointer-events attribute.  See [MDN]() for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','pointer-events')]
[PSObject]
$PointerEvents,
# The stroke-opacity attribute.  See [MDN]() for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','stroke-opacity')]
[PSObject]
$StrokeOpacity,
# The stroke-width attribute.  See [MDN]() for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','stroke-width')]
[PSObject]
$StrokeWidth,
# The text-decoration attribute.  See [MDN]() for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','text-decoration')]
[PSObject]
$TextDecoration,
# The d attribute.  See [MDN]() for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','d')]
[PSObject]
$D,
# The stop-opacity attribute.  See [MDN]() for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','stop-opacity')]
[PSObject]
$StopOpacity,
# The stroke-linecap attribute.  See [MDN]() for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','stroke-linecap')]
[PSObject]
$StrokeLinecap,
# The color-interpolation-filters attribute.  See [MDN]() for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','color-interpolation-filters')]
[PSObject]
$ColorInterpolationFilters,
# The stroke-linejoin attribute.  See [MDN]() for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','stroke-linejoin')]
[PSObject]
$StrokeLinejoin,
# The direction attribute.  See [MDN]() for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','direction')]
[PSObject]
$Direction,
# The marker-start attribute.  See [MDN]() for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','marker-start')]
[PSObject]
$MarkerStart,
# The text-rendering attribute.  See [MDN]() for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','text-rendering')]
[PSObject]
$TextRendering,
# The clip attribute.  See [MDN]() for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.Deprecated',$true)]
[Reflection.AssemblyMetaData('SVG.AttributeName','clip')]
[PSObject]
$Clip,
# The fill-opacity attribute.  See [MDN]() for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','fill-opacity')]
[PSObject]
$FillOpacity,
# The color attribute.  See [MDN]() for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','color')]
[PSObject]
$Color,
# The font-stretch attribute.  See [MDN]() for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','font-stretch')]
[PSObject]
$FontStretch,
# The font-weight attribute.  See [MDN]() for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','font-weight')]
[PSObject]
$FontWeight,
# The font-size-adjust attribute.  See [MDN]() for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','font-size-adjust')]
[PSObject]
$FontSizeAdjust,
# The writing-mode attribute.  See [MDN]() for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','writing-mode')]
[PSObject]
$WritingMode,
# The overflow attribute.  See [MDN]() for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','overflow')]
[PSObject]
$Overflow,
# The text-anchor attribute.  See [MDN]() for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','text-anchor')]
[PSObject]
$TextAnchor,
# The clip-rule attribute.  See [MDN]() for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','clip-rule')]
[PSObject]
$ClipRule,
# The font-variant attribute.  See [MDN]() for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','font-variant')]
[PSObject]
$FontVariant,
# The color-interpolation attribute.  See [MDN]() for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','color-interpolation')]
[PSObject]
$ColorInterpolation,
# The transform-origin attribute.  See [MDN]() for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','transform-origin')]
[PSObject]
$TransformOrigin,
# The fill attribute.  See [MDN]() for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','fill')]
[PSObject]
$Fill,
# The transform attribute.  See [MDN]() for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','transform')]
[PSObject]
$Transform,
# The unicode-bidi attribute.  See [MDN]() for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','unicode-bidi')]
[PSObject]
$UnicodeBidi,
# The fill-rule attribute.  See [MDN]() for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','fill-rule')]
[PSObject]
$FillRule,
# The marker-mid attribute.  See [MDN]() for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','marker-mid')]
[PSObject]
$MarkerMid,
# The alignment-baseline attribute.  See [MDN]() for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','alignment-baseline')]
[PSObject]
$AlignmentBaseline,
# The mask attribute.  See [MDN]() for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','mask')]
[PSObject]
$Mask,
# The stroke-dashoffset attribute.  See [MDN]() for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','stroke-dashoffset')]
[PSObject]
$StrokeDashoffset,
# The stroke attribute.  See [MDN]() for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','stroke')]
[PSObject]
$Stroke,
# The display attribute.  See [MDN]() for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','display')]
[PSObject]
$Display,
# The opacity attribute.  See [MDN]() for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','opacity')]
[PSObject]
$Opacity,
# The color-rendering attribute.  See [MDN]() for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','color-rendering')]
[PSObject]
$ColorRendering,
# The xlink:type attribute.  See [MDN]() for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.Deprecated',$true)]
[Reflection.AssemblyMetaData('SVG.AttributeName','xlink:type')]
[PSObject]
$XlinkType,
# The xlink:title attribute.  See [MDN]() for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.Deprecated',$true)]
[Reflection.AssemblyMetaData('SVG.AttributeName','xlink:title')]
[PSObject]
$XlinkTitle,
# The xlink:show attribute.  See [MDN]() for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.Deprecated',$true)]
[Reflection.AssemblyMetaData('SVG.AttributeName','xlink:show')]
[PSObject]
$XlinkShow,
# The xlink:arcrole attribute.  See [MDN]() for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.Deprecated',$true)]
[Reflection.AssemblyMetaData('SVG.AttributeName','xlink:arcrole')]
[PSObject]
$XlinkArcrole,
# The xlink:role attribute.  See [MDN]() for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','xlink:role')]
[PSObject]
$XlinkRole,
# The xlink:actuate attribute.  See [MDN]() for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','xlink:actuate')]
[PSObject]
$XlinkActuate,
# The externalResourcesRequired attribute.  See [MDN]() for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','externalResourcesRequired')]
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

