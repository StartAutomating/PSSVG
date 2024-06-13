SVG.animateTransform
--------------------

### Synopsis
Creates SVG animateTransform elements

---

### Description

The `animateTransform` element animates a transformation attribute on its target element, thereby allowing animations to control translation, scaling, rotation, and/or skewing.

---

### Related Links
* [https://pssvg.start-automating.com/SVG.animateTransform](https://pssvg.start-automating.com/SVG.animateTransform)

* [https://developer.mozilla.org/en-US/web/svg/element/animatetransform/](https://developer.mozilla.org/en-US/web/svg/element/animatetransform/)

* [Write-SVG](Write-SVG.md)

---

### Examples
> EXAMPLE 1

```PowerShell
Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
./AnimateMotion.PSSVG.ps1
Pop-Location
```
> EXAMPLE 2

```PowerShell
Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
./MorphingRose.PSSVG.ps1
Pop-Location
```
> EXAMPLE 3

```PowerShell
Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
./PatternAnimation.PSSVG.ps1
Pop-Location
```
> EXAMPLE 4

```PowerShell
Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
./PatternAnimation.PSSVG.ps1
Pop-Location
```
> EXAMPLE 5

```PowerShell
Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
./PatternMask.PSSVG.ps1
Pop-Location
```
> EXAMPLE 6

```PowerShell
Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
./RepeatedShapes.PSSVG.ps1
Pop-Location
```
> EXAMPLE 7

```PowerShell
Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
./SpinningSpiral.PSSVG.ps1
Pop-Location
```
> EXAMPLE 8

```PowerShell
Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
./Stars.PSSVG.ps1
Pop-Location
```
> EXAMPLE 9

```PowerShell
Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
./Stars.PSSVG.ps1
Pop-Location
```
> EXAMPLE 10

```PowerShell
Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
./Stars.PSSVG.ps1
Pop-Location
```
> EXAMPLE 11

```PowerShell
Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
./Stars.PSSVG.ps1
Pop-Location
```
> EXAMPLE 12

```PowerShell
Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
./Stars.PSSVG.ps1
Pop-Location
```
> EXAMPLE 13

```PowerShell
Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
./Stars.PSSVG.ps1
Pop-Location
```
> EXAMPLE 14

```PowerShell
Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
./SweepCircle.PSSVG.ps1
Pop-Location
```
> EXAMPLE 15

```PowerShell
Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
./US-Flag.PSSVG.ps1
Pop-Location
```
> EXAMPLE 16

```PowerShell
Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
./US-Flag.PSSVG.ps1
Pop-Location
```
> EXAMPLE 17

```PowerShell
Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
./US-FlagAnimated.PSSVG.ps1
Pop-Location
```
> EXAMPLE 18

```PowerShell
Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
./US-FlagAnimated.PSSVG.ps1
Pop-Location
```

---

### Parameters
#### **Content**
The Contents of the animateTransform element

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

#### **By**

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **From**

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **To**

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Type**

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

#### **Xlinktype**
The xlink:type attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/xlink:type) for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Xlinkarcrole**
The xlink:arcrole attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/xlink:arcrole) for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Xlinkshow**
The xlink:show attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/xlink:show) for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Xlinktitle**
The xlink:title attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/xlink:title) for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Xlinkhref**
The xlink:href attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/xlink:href) for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Xlinkrole**
The xlink:role attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/xlink:role) for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Xlinkactuate**
The xlink:actuate attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/xlink:actuate) for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **AttributeType**
The attributeType attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/attributeType) for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Begin**
The begin attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/begin) for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **CalcMode**
The calcMode attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/calcMode) for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Additive**
The additive attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/additive) for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **ExternalResourcesRequired**
The externalResourcesRequired attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/externalResourcesRequired) for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Accumulate**
The accumulate attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/accumulate) for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Dur**
The dur attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/dur) for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Fill**
The fill attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/fill) for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **RepeatDur**
The repeatDur attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/repeatDur) for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Href**
The href attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/href) for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **AttributeName**
The attributeName attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/attributeName) for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **KeySplines**
The keySplines attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/keySplines) for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **End**
The end attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/end) for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Min**
The min attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/min) for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Restart**
The restart attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/restart) for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **KeyPoints**
The keyPoints attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/keyPoints) for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **RepeatCount**
The repeatCount attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/repeatCount) for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Values**
The values attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/values) for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Max**
The max attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/max) for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **KeyTimes**
The keyTimes attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/keyTimes) for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

---

### Outputs
* [Xml.XmlElement](https://learn.microsoft.com/en-us/dotnet/api/System.Xml.XmlElement)

---

### Syntax
```PowerShell
SVG.animateTransform [[-Content] <Object>] [-Data <IDictionary>] [-On <PSObject>] [-Slot <String>] [-Attribute <IDictionary>] [-Comment <String>] [-Decorate <String>] [-Children <PSObject>] [-By <PSObject>] [-From <PSObject>] [-To <PSObject>] [-Type <PSObject>] [-RequiredFeatures <PSObject>] [-SystemLanguage <PSObject>] [-RequiredExtensions <PSObject>] [-Tabindex <PSObject>] [-Id <PSObject>] [-Style <PSObject>] [-Xmlspace <PSObject>] [-Xmllang <PSObject>] [-Xmlbase <PSObject>] [-Class <PSObject>] [-Lang <PSObject>] [-Xlinktype <PSObject>] [-Xlinkarcrole <PSObject>] [-Xlinkshow <PSObject>] [-Xlinktitle <PSObject>] [-Xlinkhref <PSObject>] [-Xlinkrole <PSObject>] [-Xlinkactuate <PSObject>] [-AttributeType <PSObject>] [-Begin <PSObject>] [-CalcMode <PSObject>] [-Additive <PSObject>] [-ExternalResourcesRequired <PSObject>] [-Accumulate <PSObject>] [-Dur <PSObject>] [-Fill <PSObject>] [-RepeatDur <PSObject>] [-Href <PSObject>] [-AttributeName <PSObject>] [-KeySplines <PSObject>] [-End <PSObject>] [-Min <PSObject>] [-Restart <PSObject>] [-KeyPoints <PSObject>] [-RepeatCount <PSObject>] [-Values <PSObject>] [-Max <PSObject>] [-KeyTimes <PSObject>] [<CommonParameters>]
```
