SVG.feMergeNode
---------------

### Synopsis
Creates SVG feMergeNode elements

---

### Description

The `feMergeNode` takes the result of another filter to be processed by its parent `feMerge`.

---

### Related Links
* [https://pssvg.start-automating.com/SVG.feMergeNode](https://pssvg.start-automating.com/SVG.feMergeNode)

* [https://developer.mozilla.org/en-US/web/svg/element/femergenode/](https://developer.mozilla.org/en-US/web/svg/element/femergenode/)

* [Write-SVG](Write-SVG.md)

---

### Examples
> EXAMPLE 1

```PowerShell
svg @(
    svg.filter -id embossed @(
        svg.feConvolveMatrix -KernelMatrix '
        5 0 0
        0 0 0
        0 0 -5
'
        svg.feMerge @(
            svg.feMergeNode
            svg.feMergeNode -In 'SourceGraphic'
        )
    )
svg.text "
Embossed
" -TextAnchor middle -DominantBaseline middle -Fill '#4488ff' -FontSize 16 -X 50% -Y 50% -Filter 'url(#embossed)'
) -ViewBox 0,0,300,100
```
> EXAMPLE 2

```PowerShell
svg @(
    svg.filter -id dropShadow @(
        svg.feDropShadow -dx 0.5 -dy 0.75 -StdDeviation 0 @(
            svg.animate -AttributeName dx -Values '.5;-.5;.5' -Dur 1s -RepeatCount 'indefinite'
        )
        svg.feMerge @(
            svg.feMergeNode
            svg.feMergeNode -In 'SourceGraphic'
        )
    )
svg.text "
Moving Shadows
" -TextAnchor middle -DominantBaseline middle -Fill '#4488ff' -FontSize 16 -X 50% -Y 50% -Filter 'url(#dropShadow)'
) -ViewBox 0,0,300,100
```

---

### Parameters
#### **Content**
The Contents of the feMergeNode element

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

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Object]`|false   |named   |true (ByPropertyName)|

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

#### **Id**
The **`id`** attribute assigns a unique name to an element.
You can use this attribute with any SVG element.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Lang**
The **`lang`** attribute specifies the primary language used in contents and attributes containing text content of particular elements.
There is also an xml:lang attribute (with namespace). If both of them are defined, the one with namespace is used and the one without is ignored.
In SVG 1.1 there was a `lang` attribute defined with a different meaning and only applying to glyph elements. That attribute specified a list of languages according to {{RFC(5646, "Tags for Identifying Languages (also known as BCP 47)")}}. The glyph was meant to be used if the `xml:lang` attribute exactly matched one of the languages given in the value of this parameter, or if the `xml:lang` attribute exactly equaled a prefix of one of the languages given in the value of this parameter such that the first tag character following the prefix was "-".
You can use this attribute with any SVG element.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **Tabindex**
The **`tabindex`** attribute allows you to control whether an element is focusable and to define the relative order of the element for the purposes of sequential focus navigation.
You can use this attribute with any SVG element.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **XmlBase**
The **`xml:base`** attribute specifies a base IRI other than the base IRI of the document or external entity.
You can use this attribute with any SVG element.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **XmlLang**
The **`xml:lang`** attribute specifies the primary language used in contents and attributes containing text content of particular elements.
It is a universal attribute allowed in all XML dialects to mark up the natural human language that an element contains.
There is also a lang attribute (without namespace). If both of them are defined, the one with namespace is used and the one without is ignored.
You can use this attribute with any SVG element.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

#### **XmlSpace**
SVG supports the built-in XML **`xml:space`** attribute to handle whitespace characters inside elements. Child elements inside an element may also have an `xml:space` attribute that overrides the parent's one.
> **Note:** Instead of using the `xml:space` attribute, use the white-space CSS property.
This attribute influences how browsers parse text content and therefore changes the way the DOM is built. Therefore, changing this attribute's value through the DOM API may have no effect.
You can use this attribute with any SVG element.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |named   |true (ByPropertyName)|

---

### Outputs
* [Xml.XmlElement](https://learn.microsoft.com/en-us/dotnet/api/System.Xml.XmlElement)

---

### Syntax
```PowerShell
SVG.feMergeNode [[-Content] <Object>] [-Data <IDictionary>] [-On <Object>] [-Attribute <IDictionary>] [-Comment <String>] [-Decorate <String>] [-Children <PSObject>] [-In <PSObject>] [-Id <PSObject>] [-Lang <PSObject>] [-Tabindex <PSObject>] [-XmlBase <PSObject>] [-XmlLang <PSObject>] [-XmlSpace <PSObject>] [<CommonParameters>]
```
