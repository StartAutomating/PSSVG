SVG.rect
--------

### Synopsis
Creates SVG rect elements

---

### Description

The **`<rect>`** element is a [basic SVG shape](https://developer.mozilla.org/en-US/docs/Web/SVG/Tutorial/Basic_Shapes) that draws rectangles, defined by their position, width, and height. The rectangles may have their corners rounded.

---

### Related Links
* [https://pssvg.start-automating.com/SVG.rect](https://pssvg.start-automating.com/SVG.rect)

* [https://developer.mozilla.org/en-US/web/svg/element/rect/](https://developer.mozilla.org/en-US/web/svg/element/rect/)

* [Write-SVG](Write-SVG.md)

---

### Examples
> EXAMPLE 1

```PowerShell
Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
./Animate.PSSVG.ps1
Pop-Location
```
> EXAMPLE 2

```PowerShell
Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
./AnimatedShapes.PSSVG.ps1
Pop-Location
```
> EXAMPLE 3

```PowerShell
Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
./AnimateMotion.PSSVG.ps1
Pop-Location
```
> EXAMPLE 4

```PowerShell
Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
./BPMAnimate.PSSVG.ps1
Pop-Location
```
> EXAMPLE 5

```PowerShell
Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
./BPMAnimate.PSSVG.ps1
Pop-Location
```
> EXAMPLE 6

```PowerShell
Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
./BPMAnimate.PSSVG.ps1
Pop-Location
```
> EXAMPLE 7

```PowerShell
Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
./BPMAnimate.PSSVG.ps1
Pop-Location
```
> EXAMPLE 8

```PowerShell
Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
./BPMAnimate.PSSVG.ps1
Pop-Location
```
> EXAMPLE 9

```PowerShell
Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
./BPMMorph.PSSVG.ps1
Pop-Location
```
> EXAMPLE 10

```PowerShell
Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
./BPMTriangleMorph.PSSVG.ps1
Pop-Location
```
> EXAMPLE 11

```PowerShell
Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
./CloudAnimation.PSSVG.ps1
Pop-Location
```
> EXAMPLE 12

```PowerShell
Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
./Clouds.PSSVG.ps1
Pop-Location
```
> EXAMPLE 13

```PowerShell
Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
./HexagonPattern.PSSVG.ps1
Pop-Location
```
> EXAMPLE 14

```PowerShell
Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
./LinearGradientAnimated.PSSVG.ps1
Pop-Location
```
> EXAMPLE 15

```PowerShell
Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
./ManyAnimatedRectangles.PSSVG.ps1
Pop-Location
```
> EXAMPLE 16

```PowerShell
Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
./ManyRectangles.PSSVG.ps1
Pop-Location
```
> EXAMPLE 17

```PowerShell
Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
./MovingGradient.PSSVG.ps1
Pop-Location
```
> EXAMPLE 18

```PowerShell
Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
./Pattern.PSSVG.ps1
Pop-Location
```
> EXAMPLE 19

```PowerShell
Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
./US-Flag.PSSVG.ps1
Pop-Location
```
> EXAMPLE 20

```PowerShell
Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
./US-Flag.PSSVG.ps1
Pop-Location
```
> EXAMPLE 21

```PowerShell
Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
./US-Flag.PSSVG.ps1
Pop-Location
```
> EXAMPLE 22

```PowerShell
Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
./US-FlagAnimated.PSSVG.ps1
Pop-Location
```
> EXAMPLE 23

```PowerShell
Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
./US-FlagAnimated.PSSVG.ps1
Pop-Location
```
> EXAMPLE 24

```PowerShell
Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
./US-FlagAnimated.PSSVG.ps1
Pop-Location
```
> EXAMPLE 25

```PowerShell
Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
./VerticalLinearGradient.PSSVG.ps1
Pop-Location
```

---

### Parameters
#### **Content**
The Contents of the rect element

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

#### **X**
The x coordinate of the rect.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Y**
The y coordinate of the rect.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Width**
The width of the rect.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Height**
The height of the rect.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Rx**
The horizontal corner radius of the rect. Defaults to `ry` if it is specified.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Ry**
The vertical corner radius of the rect. Defaults to `rx` if it is specified.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **PathLength**
The total length of the rectangle's perimeter, in user units.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **RequiredFeatures**
The requiredFeatures attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/requiredFeatures) for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **SystemLanguage**
The systemLanguage attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/systemLanguage) for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **RequiredExtensions**
The requiredExtensions attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/requiredExtensions) for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Tabindex**
The tabindex attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/tabindex) for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Id**
The id attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/id) for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Style**
The style attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/style) for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Xmlspace**
The xml:space attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/xml:space) for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Xmllang**
The xml:lang attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/xml:lang) for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Xmlbase**
The xml:base attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/xml:base) for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Class**
The class attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/class) for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Lang**
The lang attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/lang) for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Clippath**
The clip-path attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/clip-path) for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Strokeopacity**
The stroke-opacity attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/stroke-opacity) for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Fontstretch**
The font-stretch attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/font-stretch) for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Baselineshift**
The baseline-shift attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/baseline-shift) for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Floodcolor**
The flood-color attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/flood-color) for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Markerend**
The marker-end attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/marker-end) for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Fontsizeadjust**
The font-size-adjust attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/font-size-adjust) for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Colorinterpolationfilters**
The color-interpolation-filters attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/color-interpolation-filters) for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Visibility**
The visibility attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/visibility) for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Strokelinecap**
The stroke-linecap attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/stroke-linecap) for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Textrendering**
The text-rendering attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/text-rendering) for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Fill**
The fill attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/fill) for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Fillrule**
The fill-rule attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/fill-rule) for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Display**
The display attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/display) for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Stroke**
The stroke attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/stroke) for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Opacity**
The opacity attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/opacity) for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **D**
The d attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/d) for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Transform**
The transform attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/transform) for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Cursor**
The cursor attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/cursor) for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Vectoreffect**
The vector-effect attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/vector-effect) for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Strokelinejoin**
The stroke-linejoin attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/stroke-linejoin) for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Textanchor**
The text-anchor attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/text-anchor) for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Markermid**
The marker-mid attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/marker-mid) for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Colorprofile**
The color-profile attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/color-profile) for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Strokedashoffset**
The stroke-dashoffset attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/stroke-dashoffset) for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Fontweight**
The font-weight attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/font-weight) for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Transformorigin**
The transform-origin attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/transform-origin) for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Strokemiterlimit**
The stroke-miterlimit attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/stroke-miterlimit) for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Lightingcolor**
The lighting-color attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/lighting-color) for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Dominantbaseline**
The dominant-baseline attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/dominant-baseline) for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Color**
The color attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/color) for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Cliprule**
The clip-rule attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/clip-rule) for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Strokedasharray**
The stroke-dasharray attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/stroke-dasharray) for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Enablebackground**
The enable-background attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/enable-background) for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Direction**
The direction attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/direction) for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Floodopacity**
The flood-opacity attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/flood-opacity) for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Fontvariant**
The font-variant attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/font-variant) for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Colorinterpolation**
The color-interpolation attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/color-interpolation) for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Stopopacity**
The stop-opacity attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/stop-opacity) for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Overflow**
The overflow attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/overflow) for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Strokewidth**
The stroke-width attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/stroke-width) for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Fontfamily**
The font-family attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/font-family) for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Fontsize**
The font-size attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/font-size) for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Filter**
The filter attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/filter) for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Fontstyle**
The font-style attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/font-style) for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Textdecoration**
The text-decoration attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/text-decoration) for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Kerning**
The kerning attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/kerning) for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Wordspacing**
The word-spacing attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/word-spacing) for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Glyphorientationhorizontal**
The glyph-orientation-horizontal attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/glyph-orientation-horizontal) for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Writingmode**
The writing-mode attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/writing-mode) for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Pointerevents**
The pointer-events attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/pointer-events) for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Imagerendering**
The image-rendering attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/image-rendering) for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Letterspacing**
The letter-spacing attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/letter-spacing) for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Glyphorientationvertical**
The glyph-orientation-vertical attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/glyph-orientation-vertical) for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Unicodebidi**
The unicode-bidi attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/unicode-bidi) for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Alignmentbaseline**
The alignment-baseline attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/alignment-baseline) for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Stopcolor**
The stop-color attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/stop-color) for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Mask**
The mask attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/mask) for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Shaperendering**
The shape-rendering attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/shape-rendering) for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Markerstart**
The marker-start attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/marker-start) for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Clip**
The clip attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/clip) for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Fillopacity**
The fill-opacity attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/fill-opacity) for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Colorrendering**
The color-rendering attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/color-rendering) for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **ExternalResourcesRequired**
The externalResourcesRequired attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/externalResourcesRequired) for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **ViewBox**
The viewBox attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/viewBox) for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Paintorder**
The paint-order attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/paint-order) for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **TextLength**
The textLength attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/textLength) for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

---

### Outputs
* [Xml.XmlElement](https://learn.microsoft.com/en-us/dotnet/api/System.Xml.XmlElement)

---

### Syntax
```PowerShell
SVG.rect [[-Content] <Object>] [-Data <IDictionary>] [-On <PSObject>] [-Slot <String>] [-Attribute <IDictionary>] [-Comment <String>] [-Decorate <String>] [-Children <PSObject>] [-X <PSObject>] [-Y <PSObject>] [-Width <PSObject>] [-Height <PSObject>] [-Rx <PSObject>] [-Ry <PSObject>] [-PathLength <PSObject>] [-RequiredFeatures <PSObject>] [-SystemLanguage <PSObject>] [-RequiredExtensions <PSObject>] [-Tabindex <PSObject>] [-Id <PSObject>] [-Style <PSObject>] [-Xmlspace <PSObject>] [-Xmllang <PSObject>] [-Xmlbase <PSObject>] [-Class <PSObject>] [-Lang <PSObject>] [-Clippath <PSObject>] [-Strokeopacity <PSObject>] [-Fontstretch <PSObject>] [-Baselineshift <PSObject>] [-Floodcolor <PSObject>] [-Markerend <PSObject>] [-Fontsizeadjust <PSObject>] [-Colorinterpolationfilters <PSObject>] [-Visibility <PSObject>] [-Strokelinecap <PSObject>] [-Textrendering <PSObject>] [-Fill <PSObject>] [-Fillrule <PSObject>] [-Display <PSObject>] [-Stroke <PSObject>] [-Opacity <PSObject>] [-D <PSObject>] [-Transform <PSObject>] [-Cursor <PSObject>] [-Vectoreffect <PSObject>] [-Strokelinejoin <PSObject>] [-Textanchor <PSObject>] [-Markermid <PSObject>] [-Colorprofile <PSObject>] [-Strokedashoffset <PSObject>] [-Fontweight <PSObject>] [-Transformorigin <PSObject>] [-Strokemiterlimit <PSObject>] [-Lightingcolor <PSObject>] [-Dominantbaseline <PSObject>] [-Color <PSObject>] [-Cliprule <PSObject>] [-Strokedasharray <PSObject>] [-Enablebackground <PSObject>] [-Direction <PSObject>] [-Floodopacity <PSObject>] [-Fontvariant <PSObject>] [-Colorinterpolation <PSObject>] [-Stopopacity <PSObject>] [-Overflow <PSObject>] [-Strokewidth <PSObject>] [-Fontfamily <PSObject>] [-Fontsize <PSObject>] [-Filter <PSObject>] [-Fontstyle <PSObject>] [-Textdecoration <PSObject>] [-Kerning <PSObject>] [-Wordspacing <PSObject>] [-Glyphorientationhorizontal <PSObject>] [-Writingmode <PSObject>] [-Pointerevents <PSObject>] [-Imagerendering <PSObject>] [-Letterspacing <PSObject>] [-Glyphorientationvertical <PSObject>] [-Unicodebidi <PSObject>] [-Alignmentbaseline <PSObject>] [-Stopcolor <PSObject>] [-Mask <PSObject>] [-Shaperendering <PSObject>] [-Markerstart <PSObject>] [-Clip <PSObject>] [-Fillopacity <PSObject>] [-Colorrendering <PSObject>] [-ExternalResourcesRequired <PSObject>] [-ViewBox <PSObject>] [-Paintorder <PSObject>] [-TextLength <PSObject>] [<CommonParameters>]
```
