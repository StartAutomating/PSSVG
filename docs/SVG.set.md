SVG.set
-------

### Synopsis
Creates SVG set elements

---

### Description

The SVG **`<set>`** element provides a simple means of just setting the value of an attribute for a specified duration.

It supports all attribute types, including those that cannot reasonably be interpolated, such as string and boolean values. For attributes that can be reasonably be interpolated, the `animate` is usually preferred.

> **Note:** The `<set>` element is non-additive. The `additive` and `accumulate` attributes are not allowed, and will be ignored if specified.

---

### Related Links
* [https://pssvg.start-automating.com/SVG.set](https://pssvg.start-automating.com/SVG.set)

* [https://developer.mozilla.org/en-US/web/svg/element/set/](https://developer.mozilla.org/en-US/web/svg/element/set/)

* [Write-SVG](Write-SVG.md)

---

### Parameters
#### **Content**
The Contents of the set element

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

#### **To**
This attribute defines the value to be applied to the target attribute for the duration of the animation. The value must match the requirements of the target attribute.

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

#### **ExternalResourcesRequired**
The externalResourcesRequired attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/externalResourcesRequired) for more information.

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

#### **Max**
The max attribute.  See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/max) for more information.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

---

### Outputs
* [Xml.XmlElement](https://learn.microsoft.com/en-us/dotnet/api/System.Xml.XmlElement)

---

### Syntax
```PowerShell
SVG.set [[-Content] <Object>] [-Data <IDictionary>] [-On <PSObject>] [-Slot <String>] [-Attribute <IDictionary>] [-Comment <String>] [-Decorate <String>] [-Children <PSObject>] [-To <PSObject>] [-RequiredFeatures <PSObject>] [-SystemLanguage <PSObject>] [-RequiredExtensions <PSObject>] [-Tabindex <PSObject>] [-Id <PSObject>] [-Style <PSObject>] [-Xmlspace <PSObject>] [-Xmllang <PSObject>] [-Xmlbase <PSObject>] [-Class <PSObject>] [-Lang <PSObject>] [-Xlinktype <PSObject>] [-Xlinkarcrole <PSObject>] [-Xlinkshow <PSObject>] [-Xlinktitle <PSObject>] [-Xlinkhref <PSObject>] [-Xlinkrole <PSObject>] [-Xlinkactuate <PSObject>] [-AttributeType <PSObject>] [-Begin <PSObject>] [-ExternalResourcesRequired <PSObject>] [-Dur <PSObject>] [-Fill <PSObject>] [-RepeatDur <PSObject>] [-Href <PSObject>] [-AttributeName <PSObject>] [-End <PSObject>] [-Min <PSObject>] [-Restart <PSObject>] [-KeyPoints <PSObject>] [-RepeatCount <PSObject>] [-Max <PSObject>] [<CommonParameters>]
```
