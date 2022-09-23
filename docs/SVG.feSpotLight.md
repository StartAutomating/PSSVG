
SVG.feSpotLight
---------------
### Synopsis
Creates SVG feSpotLight elements

---
### Description

The **`<feSpotLight>`** [SVG](https://developer.mozilla.org/en-US/docs/Web/SVG) filter primitive defines a light source that can be used to create a spotlight effect.
It is used within a lighting filter primitive: `feDiffuseLighting` or `feSpecularLighting`.

---
### Related Links
* [https://pssvg.start-automating.com/SVG.feSpotLight](https://pssvg.start-automating.com/SVG.feSpotLight)



* [https://developer.mozilla.org/en-US/web/svg/element/fespotlight/](https://developer.mozilla.org/en-US/web/svg/element/fespotlight/)



* [Write-SVG](Write-SVG.md)



---
### Parameters
#### **Content**

The Contents of the feSpotLight element



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
#### **Attribute**

A dictionary of attributes.  This can set any attribute not exposed in other parameters.



> **Type**: ```[IDictionary]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)



---
#### **X**

> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)



---
#### **Y**

> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)



---
#### **Z**

> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)



---
#### **PointsAtX**

> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)



---
#### **PointsAtY**

> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)



---
#### **PointsAtZ**

> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)



---
#### **SpecularExponent**

> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)



---
#### **LimitingConeAngle**

> **Type**: ```[Object]```

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



> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)



---
### Syntax
```PowerShell
SVG.feSpotLight [[-Content] &lt;Object&gt;] [-Data &lt;IDictionary&gt;] [-Attribute &lt;IDictionary&gt;] [-X &lt;Object&gt;] [-Y &lt;Object&gt;] [-Z &lt;Object&gt;] [-PointsAtX &lt;Object&gt;] [-PointsAtY &lt;Object&gt;] [-PointsAtZ &lt;Object&gt;] [-SpecularExponent &lt;Object&gt;] [-LimitingConeAngle &lt;Object&gt;] [-Id &lt;Object&gt;] [-Lang &lt;Object&gt;] [-Tabindex &lt;Object&gt;] [-XmlBase &lt;Object&gt;] [-XmlLang &lt;Object&gt;] [-XmlSpace &lt;Object&gt;] [&lt;CommonParameters&gt;]
```
---


