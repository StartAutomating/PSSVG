SVG.style
---------




### Synopsis
Creates SVG style elements



---


### Description

The SVG **`<style>`** element allows style sheets to be embedded directly within SVG content.

> **Note:** SVG's `style` element has the same attributes as the corresponding element in HTML (see HTML's `style` element).



---


### Related Links
* [https://pssvg.start-automating.com/SVG.style](https://pssvg.start-automating.com/SVG.style)



* [https://developer.mozilla.org/en-US/web/svg/element/style/](https://developer.mozilla.org/en-US/web/svg/element/style/)



* [Write-SVG](Write-SVG.md)





---


### Parameters
#### **Content**

The Contents of the style element






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



#### **Children**

One or more child elements.  These will be treated as if they were content.






|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[Object]`|false   |named   |true (ByPropertyName)|Child  |



#### **Type**

This attribute defines type of the style sheet language to use as a media type string.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Object]`|false   |named   |true (ByPropertyName)|



#### **Media**

This attribute defines to which {{cssxref('@media', 'media')}} the style applies.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Object]`|false   |named   |true (ByPropertyName)|



#### **Title**

This attribute the title of the style sheet which can be used to switch between [alternate style sheets](https://developer.mozilla.org/en-US/docs/Web/CSS/Alternative_style_sheets).






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Object]`|false   |named   |true (ByPropertyName)|



#### **Id**

The **`id`** attribute assigns a unique name to an element.

You can use this attribute with any SVG element.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Object]`|false   |named   |true (ByPropertyName)|



#### **Lang**

The **`lang`** attribute specifies the primary language used in contents and attributes containing text content of particular elements.

There is also an xml:lang attribute (with namespace). If both of them are defined, the one with namespace is used and the one without is ignored.

In SVG 1.1 there was a `lang` attribute defined with a different meaning and only applying to glyph elements. That attribute specified a list of languages according to {{RFC(5646, "Tags for Identifying Languages (also known as BCP 47)")}}. The glyph was meant to be used if the `xml:lang` attribute exactly matched one of the languages given in the value of this parameter, or if the `xml:lang` attribute exactly equaled a prefix of one of the languages given in the value of this parameter such that the first tag character following the prefix was "-".

You can use this attribute with any SVG element.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Object]`|false   |named   |true (ByPropertyName)|



#### **Tabindex**

The **`tabindex`** attribute allows you to control whether an element is focusable and to define the relative order of the element for the purposes of sequential focus navigation.

You can use this attribute with any SVG element.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Object]`|false   |named   |true (ByPropertyName)|



#### **XmlBase**

The **`xml:base`** attribute specifies a base IRI other than the base IRI of the document or external entity.

You can use this attribute with any SVG element.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Object]`|false   |named   |true (ByPropertyName)|



#### **XmlLang**

The **`xml:lang`** attribute specifies the primary language used in contents and attributes containing text content of particular elements.

It is a universal attribute allowed in all XML dialects to mark up the natural human language that an element contains.

There is also a lang attribute (without namespace). If both of them are defined, the one with namespace is used and the one without is ignored.

You can use this attribute with any SVG element.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Object]`|false   |named   |true (ByPropertyName)|



#### **XmlSpace**

SVG supports the built-in XML **`xml:space`** attribute to handle whitespace characters inside elements. Child elements inside an element may also have an `xml:space` attribute that overrides the parent's one.

> **Note:** Instead of using the `xml:space` attribute, use the white-space CSS property.

This attribute influences how browsers parse text content and therefore changes the way the DOM is built. Therefore, changing this attribute's value through the DOM API may have no effect.

You can use this attribute with any SVG element.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Object]`|false   |named   |true (ByPropertyName)|



#### **Class**

« [SVG Attribute reference home](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute)

Assigns a class name or set of class names to an element. You may assign the same class name or names to any number of elements, however, multiple class names must be separated by whitespace characters.

An element's class name serves two key roles:

* As a style sheet selector, for when an author assigns style information to a set of elements.
* For general use by the browser.

You can use this class to style SVG content using CSS.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Object]`|false   |named   |true (ByPropertyName)|



#### **Style**

The **`style`** attribute allows to style an element using CSS declarations. It functions identically to [the `style` attribute in HTML](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/style).

You can use this attribute with any SVG element.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Object]`|false   |named   |true (ByPropertyName)|





---


### Outputs
* [Xml.XmlElement](https://learn.microsoft.com/en-us/dotnet/api/System.Xml.XmlElement)






---


### Syntax
```PowerShell
SVG.style [[-Content] <Object>] [-Data <IDictionary>] [-On <Object>] [-Attribute <IDictionary>] [-Comment <String>] [-Children <Object>] [-Type <Object>] [-Media <Object>] [-Title <Object>] [-Id <Object>] [-Lang <Object>] [-Tabindex <Object>] [-XmlBase <Object>] [-XmlLang <Object>] [-XmlSpace <Object>] [-Class <Object>] [-Style <Object>] [<CommonParameters>]
```
