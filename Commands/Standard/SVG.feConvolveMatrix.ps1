function SVG.feConvolveMatrix  {
<#
.Synopsis
    Creates SVG feConvolveMatrix elements
.Description
    The **`<feConvolveMatrix>`** [SVG](https://developer.mozilla.org/en-US/docs/Web/SVG) filter primitive applies a matrix convolution filter effect. A convolution combines pixels in the input image with neighboring pixels to produce a resulting image. A wide variety of imaging operations can be achieved through convolutions, including blurring, edge detection, sharpening, embossing and beveling.
    
    A matrix convolution is based on an n-by-m matrix (the convolution kernel) which describes how a given pixel value in the input image is combined with its neighboring pixel values to produce a resulting pixel value. Each result pixel is determined by applying the kernel matrix to the corresponding source pixel and its neighboring pixels. The basic convolution formula which is applied to each color value for a given pixel is:
    
    <math display="block"><semantics><mrow><mi>C</mi><mi>O</mi><mi>L</mi><mi>O</mi><msub><mi>R</mi><mrow><mi>X</mi><mo separator="true">,</mo><mi>Y</mi></mrow></msub><mo>=</mo><mfrac><mrow><msubsup><mo movablelimits="false">∑</mo><mrow><mi>I</mi><mo>=</mo><mn>0</mn></mrow><mrow><mi>o</mi><mi>r</mi><mi>d</mi><mi>e</mi><mi>r</mi><mi>X</mi><mo>−</mo><mn>1</mn></mrow></msubsup><msubsup><mo movablelimits="false">∑</mo><mrow><mi>J</mi><mo>=</mo><mn>0</mn></mrow><mrow><mi>o</mi><mi>r</mi><mi>d</mi><mi>e</mi><mi>r</mi><mi>X</mi><mo>−</mo><mn>1</mn></mrow></msubsup><mrow><mo fence="true" form="prefix">(</mo><mi>S</mi><mi>O</mi><mi>U</mi><mi>R</mi><mi>C</mi><msub><mi>E</mi><mrow><mi>X</mi><mo>−</mo><mi>t</mi><mi>a</mi><mi>r</mi><mi>g</mi><mi>e</mi><mi>t</mi><mi>X</mi><mo>+</mo><mi>J</mi><mo separator="true">,</mo><mi>Y</mi><mo>−</mo><mi>t</mi><mi>a</mi><mi>r</mi><mi>g</mi><mi>e</mi><mi>t</mi><mi>Y</mi><mo>+</mo><mi>I</mi></mrow></msub><mo>\*</mo><mi>k</mi><mi>e</mi><mi>r</mi><mi>n</mi><mi>e</mi><mi>l</mi><mi>M</mi><mi>a</mi><mi>t</mi><mi>r</mi><mi>i</mi><msub><mi>x</mi><mrow><mi>o</mi><mi>r</mi><mi>d</mi><mi>e</mi><mi>r</mi><mi>X</mi><mo>−</mo><mi>J</mi><mo>−</mo><mn>1</mn><mo separator="true">,</mo><mi>o</mi><mi>r</mi><mi>d</mi><mi>e</mi><mi>r</mi><mi>Y</mi><mo>−</mo><mi>I</mi><mo>−</mo><mn>1</mn></mrow></msub><mo fence="true" form="postfix">)</mo></mrow></mrow><mrow><mi>d</mi><mi>i</mi><mi>v</mi><mi>s</mi><mi>o</mi><mi>r</mi><mo>+</mo><mi>b</mi><mi>i</mi><mi>a</mi><mi>s</mi><mo>\*</mo><mi>A</mi><mi>L</mi><mi>P</mi><mi>H</mi><msub><mi>A</mi><mrow><mi>X</mi><mo separator="true">,</mo><mi>Y</mi></mrow></msub></mrow></mfrac></mrow><annotation encoding="TeX">COLOR\_{X,Y} = \frac{ \sum\_{I=0}^{orderX-1} \sum\_{J=0}^{orderX-1}{\left( SOURCE\_{X-targetX+J, Y-targetY+I} \* kernelMatrix\_{orderX-J-1, orderY-I-1} \right)}}{divisor + bias \* ALPHA\_{X, Y}}</annotation></semantics></math>
    
    where "orderX" and "orderY" represent the X and Y values for the [`order`](https://developer.mozilla.orghttps://www.w3.org/TR/SVG11/filters.html#feConvolveMatrixElementOrderAttribute) attribute, "targetX" represents the value of the [`targetX`](https://developer.mozilla.orghttps://www.w3.org/TR/SVG11/filters.html#feConvolveMatrixElementTargetXAttribute) attribute, "targetY" represents the value of the [`targetY`](https://developer.mozilla.orghttps://www.w3.org/TR/SVG11/filters.html#feConvolveMatrixElementTargetYAttribute) attribute, "kernelMatrix" represents the value of the [`kernelMatrix`](https://developer.mozilla.orghttps://www.w3.org/TR/SVG11/filters.html#feConvolveMatrixElementKernelMatrixAttribute) attribute, "divisor" represents the value of the [`divisor`](https://developer.mozilla.orghttps://www.w3.org/TR/SVG11/filters.html#feConvolveMatrixElementDivisorAttribute) attribute, and "bias" represents the value of the [`bias`](https://developer.mozilla.orghttps://www.w3.org/TR/SVG11/filters.html#feConvolveMatrixElementBiasAttribute) attribute.
    
    Note in the above formulas that the values in the kernel matrix are applied such that the kernel matrix is rotated 180 degrees relative to the source and destination images in order to match convolution theory as described in many computer graphics textbooks.
    
    To illustrate, suppose you have an input image which is 5 pixels by 5 pixels, whose color values for one of the color channels are as follows:
    
    ```plain
    0    20  40 235 235
    100 120 140 235 235
    200 220 240 235 235
    225 225 255 255 255
    225 225 255 255 255
    ```
    
    and you define a 3-by-3 convolution kernel as follows:
    
    ```plain
    1 2 3
    4 5 6
    7 8 9
    ```
    
    Let's focus on the color value at the second row and second column of the image (source pixel value is 120). Assuming the simplest case (where the input image's pixel grid aligns perfectly with the kernel's pixel grid) and assuming default values for attributes ['divisor'](https://developer.mozilla.orghttps://www.w3.org/TR/SVG11/filters.html#feConvolveMatrixElementDivisorAttribute), ['targetX'](https://developer.mozilla.orghttps://www.w3.org/TR/SVG11/filters.html#feConvolveMatrixElementTargetXAttribute) and ['targetY'](https://developer.mozilla.orghttps://www.w3.org/TR/SVG11/filters.html#feConvolveMatrixElementTargetYAttribute), then resulting color value will be:
    
    ```plain
    (9*0   + 8*20  + 7*40 +
     6*100 + 5*120 + 4*140 +
     3*200 + 2*220 + 1*240) / (9+8+7+6+5+4+3+2+1)
    ```
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./Embossed.PSSVG.ps1 | Invoke-Item
    Pop-Location
.Link
    https://pssvg.start-automating.com/SVG.feConvolveMatrix
.Link
    https://developer.mozilla.org/en-US/web/svg/element/feconvolvematrix/
.Link
    Write-SVG
#>
[Reflection.AssemblyMetadata('SVG.ElementName', 'feConvolveMatrix')]
[CmdletBinding(PositionalBinding=$false)]
[OutputType([Xml.XmlElement])]
param(
# The Contents of the feConvolveMatrix element
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
[Reflection.AssemblyMetaData('SVG.AttributeName','order')]
[Reflection.AssemblyMetaData('SVG.Value', '<number-optional-number>')]
[Reflection.AssemblyMetaData('SVG.Default value', '3')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'True')]
[PSObject]
$Order,
# 
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','kernelMatrix')]
[Reflection.AssemblyMetaData('SVG.Value', '<list of numbers>')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'True')]
[PSObject]
$KernelMatrix,
# 
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','divisor')]
[Reflection.AssemblyMetaData('SVG.Value', '{{cssxref("number")}}')]
[Reflection.AssemblyMetaData('SVG.Default value', 'Sum of all values in {{SVGAttr("kernelMatrix")}} or 1 if sum is 0')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'True')]
[PSObject]
$Divisor,
# 
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','bias')]
[Reflection.AssemblyMetaData('SVG.Value', '<number>')]
[Reflection.AssemblyMetaData('SVG.Default value', '0')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'True')]
[PSObject]
$Bias,
# 
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','targetX')]
[Reflection.AssemblyMetaData('SVG.Value', '{{cssxref("integer")}}')]
[Reflection.AssemblyMetaData('SVG.Default value', 'floor({{SVGAttr("order")}}X / 2)')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'True')]
[PSObject]
$TargetX,
# 
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','targetY')]
[Reflection.AssemblyMetaData('SVG.Value', '{{cssxref("integer")}}')]
[Reflection.AssemblyMetaData('SVG.Default value', 'floor({{SVGAttr("order")}}Y / 2)')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'True')]
[PSObject]
$TargetY,
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
[Reflection.AssemblyMetaData('SVG.Default value', 'duplicate')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'True')]
[PSObject]
$EdgeMode,
# 
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','kernelUnitLength')]
[Reflection.AssemblyMetaData('SVG.Value', '<number-optional-number>')]
[Reflection.AssemblyMetaData('SVG.Default value', 'Pixel in offscreen bitmap')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'True')]
[PSObject]
$KernelUnitLength,
# 
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','preserveAlpha')]
[Reflection.AssemblyMetaData('SVG.Default value', 'false')]
[Reflection.AssemblyMetaData('SVG.Value', 'true | false')]
[ArgumentCompleter({
    param ( $commandName,$parameterName,$wordToComplete,$commandAst,$fakeBoundParameters )    

    $validSet = 'true','false'
    if ($wordToComplete) {        
        $toComplete = $wordToComplete -replace "^'" -replace "'$"
        return @($validSet -like "$toComplete*" -replace '^', "'" -replace '$',"'")
    } else {
        return @($validSet -replace '^', "'" -replace '$',"'")
    }
})]
[Reflection.AssemblyMetaData('SVG.Animatable', 'True')]
[PSObject]
$PreserveAlpha,
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
# The height attribute.  See [MDN]() for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','height')]
[PSObject]
$Height,
# The width attribute.  See [MDN]() for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','width')]
[PSObject]
$Width,
# The requiredFeatures attribute.  See [MDN]() for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.Deprecated',$true)]
[Reflection.AssemblyMetaData('SVG.AttributeName','requiredFeatures')]
[PSObject]
$RequiredFeatures,
# The x attribute.  See [MDN]() for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','x')]
[PSObject]
$X,
# The result attribute.  See [MDN]() for more information.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','result')]
[PSObject]
$Result,
# The y attribute.  See [MDN]() for more information.
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

