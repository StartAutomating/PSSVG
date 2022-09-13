
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
### Parameters
#### **Content**

The Contents of the title element



> **Type**: ```[Object]```

> **Required**: false

> **Position**: 1

> **PipelineInput**:true (ByPropertyName)



---
#### **Data**

A dictionary containing data.  This data will be embedded in data- attributes.



> **Type**: ```[IDictionary]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)



---
#### **Id**

The **`id`** attribute assigns a unique name to an element.

You can use this attribute with any SVG element.



> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)



---
#### **Lang**

The **`lang`** attribute specifies the primary language used in contents and attributes containing text content of particular elements.

There is also an xml:lang attribute (with namespace). If both of them are defined, the one with namespace is used and the one without is ignored.

In SVG 1.1 there was a `lang` attribute defined with a different meaning and only applying to glyph elements. That attribute specified a list of languages according to {{RFC(5646, "Tags for Identifying Languages (also known as BCP 47)")}}. The glyph was meant to be used if the `xml:lang` attribute exactly matched one of the languages given in the value of this parameter, or if the `xml:lang` attribute exactly equaled a prefix of one of the languages given in the value of this parameter such that the first tag character following the prefix was "-".

You can use this attribute with any SVG element.



> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)



---
#### **Tabindex**

The **`tabindex`** attribute allows you to control whether an element is focusable and to define the relative order of the element for the purposes of sequential focus navigation.

You can use this attribute with any SVG element.



> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)



---
#### **XmlBase**

The **`xml:base`** attribute specifies a base IRI other than the base IRI of the document or external entity.

You can use this attribute with any SVG element.



> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)



---
#### **XmlLang**

The **`xml:lang`** attribute specifies the primary language used in contents and attributes containing text content of particular elements.

It is a universal attribute allowed in all XML dialects to mark up the natural human language that an element contains.

There is also a lang attribute (without namespace). If both of them are defined, the one with namespace is used and the one without is ignored.

You can use this attribute with any SVG element.



> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)



---
#### **XmlSpace**

SVG supports the built-in XML **`xml:space`** attribute to handle whitespace characters inside elements. Child elements inside an element may also have an `xml:space` attribute that overrides the parent's one.

> **Note:** Instead of using the `xml:space` attribute, use the white-space CSS property.

This attribute influences how browsers parse text content and therefore changes the way the DOM is built. Therefore, changing this attribute's value through the DOM API may have no effect.

You can use this attribute with any SVG element.



Valid Values:

* default
* preserve



> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)



---
#### **Class**

« [SVG Attribute reference home](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute)

Assigns a class name or set of class names to an element. You may assign the same class name or names to any number of elements, however, multiple class names must be separated by whitespace characters.

An element's class name serves two key roles:

* As a style sheet selector, for when an author assigns style information to a set of elements.
* For general use by the browser.

You can use this class to style SVG content using CSS.



> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)



---
#### **Style**

The **`style`** attribute allows to style an element using CSS declarations. It functions identically to [the `style` attribute in HTML](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/style).

You can use this attribute with any SVG element.



> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)



---
### Syntax
```PowerShell
SVG.title [[-Content] &lt;Object&gt;] [-Data &lt;IDictionary&gt;] [-Id &lt;Object&gt;] [-Lang &lt;Object&gt;] [-Tabindex &lt;Object&gt;] [-XmlBase &lt;Object&gt;] [-XmlLang &lt;Object&gt;] [-XmlSpace &lt;Object&gt;] [-Class &lt;Object&gt;] [-Style &lt;Object&gt;] [&lt;CommonParameters&gt;]
```
---


