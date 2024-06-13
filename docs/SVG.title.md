SVG.title
---------

### Synopsis
Creates SVG title elements

---

### Description

The **`<title>`** element provides an accessible, short-text description of any SVG [container element](https://developer.mozilla.org/en-US/docs/Web/SVG/Element#container_elements) or [graphics element](https://developer.mozilla.org/en-US/docs/Web/SVG/Element#graphics_elements).

Text in a `<title>` element is not rendered as part of the graphic, but browsers usually display it as a tooltip. If an element can be described by visible text, it is recommended to reference that text with an [`aria-labelledby`](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Attributes/aria-labelledby) attribute rather than using the `<title>` element.

> **Note:** For backward compatibility with SVG 1.1, `<title>` elements should be the first child element of their parent.

---

### Related Links
* [https://pssvg.start-automating.com/SVG.title](https://pssvg.start-automating.com/SVG.title)

* [https://developer.mozilla.org/en-US/web/svg/element/title/](https://developer.mozilla.org/en-US/web/svg/element/title/)

* [Write-SVG](Write-SVG.md)

---

### Examples
> EXAMPLE 1

```PowerShell
Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
./US-Flag.PSSVG.ps1
Pop-Location
```
> EXAMPLE 2

```PowerShell
Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
./US-FlagAnimated.PSSVG.ps1
Pop-Location
```

---

### Parameters
#### **Content**
The Contents of the title element

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

#### **RequiredFeatures**
The requiredFeatures attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/requiredFeatures) for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Xlinktitle**
The xlink:title attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/xlink:title) for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

---

### Outputs
* [Xml.XmlElement](https://learn.microsoft.com/en-us/dotnet/api/System.Xml.XmlElement)

---

### Syntax
```PowerShell
SVG.title [[-Content] <Object>] [-Data <IDictionary>] [-On <PSObject>] [-Slot <String>] [-Attribute <IDictionary>] [-Comment <String>] [-Decorate <String>] [-Children <PSObject>] [-Tabindex <PSObject>] [-Id <PSObject>] [-Style <PSObject>] [-Xmlspace <PSObject>] [-Xmllang <PSObject>] [-Xmlbase <PSObject>] [-Class <PSObject>] [-Lang <PSObject>] [-RequiredFeatures <PSObject>] [-Xlinktitle <PSObject>] [<CommonParameters>]
```
