SVG.feBlend
-----------

### Synopsis
Creates SVG feBlend elements

---

### Description

The **`<feBlend>`** [SVG](https://developer.mozilla.org/en-US/docs/Web/SVG) filter primitive composes two objects together ruled by a certain blending mode. This is similar to what is known from image editing software when blending two layers. The mode is defined by the `mode` attribute.

---

### Related Links
* [https://pssvg.start-automating.com/SVG.feBlend](https://pssvg.start-automating.com/SVG.feBlend)

* [https://developer.mozilla.org/en-US/web/svg/element/feblend/](https://developer.mozilla.org/en-US/web/svg/element/feblend/)

* [Write-SVG](Write-SVG.md)

---

### Examples
> EXAMPLE 1

```PowerShell
Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
./CloudAnimation.PSSVG.ps1 | Invoke-Item
Pop-Location
```
> EXAMPLE 2

```PowerShell
Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
./Clouds.PSSVG.ps1 | Invoke-Item
Pop-Location
```

---

### Parameters
#### **Content**
The Contents of the feBlend element

|Type      |Required|Position|PipelineInput                 |Aliases                                        |
|----------|--------|--------|------------------------------|-----------------------------------------------|
|`[Object]`|false   |1       |true (ByValue, ByPropertyName)|InputObject<br/>Text<br/>InnerText<br/>Contents|

#### **Data**
A dictionary containing data.  This data will be embedded in data- attributes.

|Type           |Required|Position|PipelineInput        |Aliases                         |
|---------------|--------|--------|---------------------|--------------------------------|
|`[IDictionary]`|false   |named   |true (ByPropertyName)|DataAttribute<br/>DataAttributes|

#### **On**
A dictionary or object containing event handlers.
Each key or property name will be the name of the event
Each value will be the handler.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Slot**
The slot attribute.

|Type      |Required|Position|PipelineInput        |Aliases |
|----------|--------|--------|---------------------|--------|
|`[String]`|false   |named   |true (ByPropertyName)|SlotName|

#### **Attribute**
A dictionary of attributes.  This can set any attribute not exposed in other parameters.

|Type           |Required|Position|PipelineInput        |Aliases                       |
|---------------|--------|--------|---------------------|------------------------------|
|`[IDictionary]`|false   |named   |true (ByPropertyName)|SVGAttributes<br/>SVGAttribute|

#### **Comment**
A comment that will appear before the element.

|Type      |Required|Position|PipelineInput        |Aliases |
|----------|--------|--------|---------------------|--------|
|`[String]`|false   |named   |true (ByPropertyName)|Comments|

#### **Decorate**
If provided, will decorate outputted objects with a typename.
This can allow for custom formatting and extended types.        
If nothing was provided, each output will be decorated with it's ElementName.

|Type      |Required|Position|PipelineInput        |Aliases                                                                             |
|----------|--------|--------|---------------------|------------------------------------------------------------------------------------|
|`[String]`|false   |named   |true (ByPropertyName)|PSTypeName<br/>PSTypeNames<br/>TypeName<br/>TypeNames<br/>Decoration<br/>Decorations|

#### **Children**
One or more child elements.  These will be treated as if they were content.

|Type        |Required|Position|PipelineInput        |Aliases|
|------------|--------|--------|---------------------|-------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|Child  |

#### **In**

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **In2**

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Mode**

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Lang**
The lang attribute.  See [MDN]() for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Tabindex**
The tabindex attribute.  See [MDN]() for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Class**
The class attribute.  See [MDN]() for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Id**
The id attribute.  See [MDN]() for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **XmlLang**
The xml:lang attribute.  See [MDN]() for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **XmlSpace**
The xml:space attribute.  See [MDN]() for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Style**
The style attribute.  See [MDN]() for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **FontFamily**
The font-family attribute.  See [MDN]() for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Cursor**
The cursor attribute.  See [MDN]() for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **StrokeMiterlimit**
The stroke-miterlimit attribute.  See [MDN]() for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **FontSize**
The font-size attribute.  See [MDN]() for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **MarkerEnd**
The marker-end attribute.  See [MDN]() for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **StrokeDasharray**
The stroke-dasharray attribute.  See [MDN]() for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **GlyphOrientationVertical**
The glyph-orientation-vertical attribute.  See [MDN]() for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **VectorEffect**
The vector-effect attribute.  See [MDN]() for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **ImageRendering**
The image-rendering attribute.  See [MDN]() for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Visibility**
The visibility attribute.  See [MDN]() for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **ShapeRendering**
The shape-rendering attribute.  See [MDN]() for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **GlyphOrientationHorizontal**
The glyph-orientation-horizontal attribute.  See [MDN]() for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **StopColor**
The stop-color attribute.  See [MDN]() for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **LightingColor**
The lighting-color attribute.  See [MDN]() for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **WordSpacing**
The word-spacing attribute.  See [MDN]() for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **FloodColor**
The flood-color attribute.  See [MDN]() for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **ClipPath**
The clip-path attribute.  See [MDN]() for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **LetterSpacing**
The letter-spacing attribute.  See [MDN]() for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **BaselineShift**
The baseline-shift attribute.  See [MDN]() for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **FloodOpacity**
The flood-opacity attribute.  See [MDN]() for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **FontStyle**
The font-style attribute.  See [MDN]() for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Filter**
The filter attribute.  See [MDN]() for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **DominantBaseline**
The dominant-baseline attribute.  See [MDN]() for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **PointerEvents**
The pointer-events attribute.  See [MDN]() for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **StrokeOpacity**
The stroke-opacity attribute.  See [MDN]() for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **StrokeWidth**
The stroke-width attribute.  See [MDN]() for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **TextDecoration**
The text-decoration attribute.  See [MDN]() for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **D**
The d attribute.  See [MDN]() for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **StopOpacity**
The stop-opacity attribute.  See [MDN]() for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **StrokeLinecap**
The stroke-linecap attribute.  See [MDN]() for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **ColorInterpolationFilters**
The color-interpolation-filters attribute.  See [MDN]() for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **StrokeLinejoin**
The stroke-linejoin attribute.  See [MDN]() for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Direction**
The direction attribute.  See [MDN]() for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **MarkerStart**
The marker-start attribute.  See [MDN]() for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **TextRendering**
The text-rendering attribute.  See [MDN]() for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Clip**
The clip attribute.  See [MDN]() for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **FillOpacity**
The fill-opacity attribute.  See [MDN]() for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Color**
The color attribute.  See [MDN]() for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **FontStretch**
The font-stretch attribute.  See [MDN]() for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **FontWeight**
The font-weight attribute.  See [MDN]() for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **FontSizeAdjust**
The font-size-adjust attribute.  See [MDN]() for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **WritingMode**
The writing-mode attribute.  See [MDN]() for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Overflow**
The overflow attribute.  See [MDN]() for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **TextAnchor**
The text-anchor attribute.  See [MDN]() for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **ClipRule**
The clip-rule attribute.  See [MDN]() for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **FontVariant**
The font-variant attribute.  See [MDN]() for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **ColorInterpolation**
The color-interpolation attribute.  See [MDN]() for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **TransformOrigin**
The transform-origin attribute.  See [MDN]() for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Fill**
The fill attribute.  See [MDN]() for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Transform**
The transform attribute.  See [MDN]() for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **UnicodeBidi**
The unicode-bidi attribute.  See [MDN]() for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **FillRule**
The fill-rule attribute.  See [MDN]() for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **MarkerMid**
The marker-mid attribute.  See [MDN]() for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **AlignmentBaseline**
The alignment-baseline attribute.  See [MDN]() for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Mask**
The mask attribute.  See [MDN]() for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **StrokeDashoffset**
The stroke-dashoffset attribute.  See [MDN]() for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Stroke**
The stroke attribute.  See [MDN]() for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Display**
The display attribute.  See [MDN]() for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Opacity**
The opacity attribute.  See [MDN]() for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **ColorRendering**
The color-rendering attribute.  See [MDN]() for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Height**
The height attribute.  See [MDN]() for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Width**
The width attribute.  See [MDN]() for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **RequiredFeatures**
The requiredFeatures attribute.  See [MDN]() for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **X**
The x attribute.  See [MDN]() for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Result**
The result attribute.  See [MDN]() for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Y**
The y attribute.  See [MDN]() for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

---

### Outputs
* [Xml.XmlElement](https://learn.microsoft.com/en-us/dotnet/api/System.Xml.XmlElement)

---

### Syntax
```PowerShell
SVG.feBlend [[-Content] <Object>] [-Data <IDictionary>] [-On <PSObject>] [-Slot <String>] [-Attribute <IDictionary>] [-Comment <String>] [-Decorate <String>] [-Children <PSObject>] [-In <PSObject>] [-In2 <PSObject>] [-Mode <PSObject>] [-Lang <PSObject>] [-Tabindex <PSObject>] [-Class <PSObject>] [-Id <PSObject>] [-XmlLang <PSObject>] [-XmlSpace <PSObject>] [-Style <PSObject>] [-FontFamily <PSObject>] [-Cursor <PSObject>] [-StrokeMiterlimit <PSObject>] [-FontSize <PSObject>] [-MarkerEnd <PSObject>] [-StrokeDasharray <PSObject>] [-GlyphOrientationVertical <PSObject>] [-VectorEffect <PSObject>] [-ImageRendering <PSObject>] [-Visibility <PSObject>] [-ShapeRendering <PSObject>] [-GlyphOrientationHorizontal <PSObject>] [-StopColor <PSObject>] [-LightingColor <PSObject>] [-WordSpacing <PSObject>] [-FloodColor <PSObject>] [-ClipPath <PSObject>] [-LetterSpacing <PSObject>] [-BaselineShift <PSObject>] [-FloodOpacity <PSObject>] [-FontStyle <PSObject>] [-Filter <PSObject>] [-DominantBaseline <PSObject>] [-PointerEvents <PSObject>] [-StrokeOpacity <PSObject>] [-StrokeWidth <PSObject>] [-TextDecoration <PSObject>] [-D <PSObject>] [-StopOpacity <PSObject>] [-StrokeLinecap <PSObject>] [-ColorInterpolationFilters <PSObject>] [-StrokeLinejoin <PSObject>] [-Direction <PSObject>] [-MarkerStart <PSObject>] [-TextRendering <PSObject>] [-Clip <PSObject>] [-FillOpacity <PSObject>] [-Color <PSObject>] [-FontStretch <PSObject>] [-FontWeight <PSObject>] [-FontSizeAdjust <PSObject>] [-WritingMode <PSObject>] [-Overflow <PSObject>] [-TextAnchor <PSObject>] [-ClipRule <PSObject>] [-FontVariant <PSObject>] [-ColorInterpolation <PSObject>] [-TransformOrigin <PSObject>] [-Fill <PSObject>] [-Transform <PSObject>] [-UnicodeBidi <PSObject>] [-FillRule <PSObject>] [-MarkerMid <PSObject>] [-AlignmentBaseline <PSObject>] [-Mask <PSObject>] [-StrokeDashoffset <PSObject>] [-Stroke <PSObject>] [-Display <PSObject>] [-Opacity <PSObject>] [-ColorRendering <PSObject>] [-Height <PSObject>] [-Width <PSObject>] [-RequiredFeatures <PSObject>] [-X <PSObject>] [-Result <PSObject>] [-Y <PSObject>] [<CommonParameters>]
```
