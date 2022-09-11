
SVG.mpath
---------
### Synopsis
Creates SVG mpath elements

---
### Description

The **`<mpath>`** sub-element for the `animateMotion` element provides the ability to reference an external `path` element as the definition of a motion path.

---
### Related Links
* [https://pssvg.start-automating.com/SVG.mpath](https://pssvg.start-automating.com/SVG.mpath)
* [https://developer.mozilla.org/en-US/web/svg/element/mpath/](https://developer.mozilla.org/en-US/web/svg/element/mpath/)
---
### Parameters
#### **Content**

The Contents of the mpath element



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
#### **XlinkHref**

The **`xlink:href`** attribute defines a reference to a resource as a reference [IRI](https://developer.mozilla.org/en-US/docs/Web/SVG/Content_type#iri). The exact meaning of that link depends on the context of each element using it.

> **Note:** SVG 2 removed the need for the `xlink` namespace, so instead of `xlink:href` you should use href. If you need to support earlier browser versions, the deprecated `xlink:href` attribute can be used as a fallback in addition to the `href` attribute, e.g. `<use href="some-id" xlink:href="some-id" x="5" y="5" />`.



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

> **Note:** Instead of using the `xml:space` attribute, use the {{cssxref("white-space")}} CSS property.

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
#### **XlinkType**

The **`xlink:type`** attribute identifies the type of XLink being used. In SVG, only simple links are available.



> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)
---
#### **XlinkArcrole**

The **`xlink:arcrole`** attribute specifies a contextual role for the element and corresponds to the [RDF Primer](https://developer.mozilla.orghttps://www.w3.org/TR/rdf-primer/) notion of a property.

This contextual role can differ from the meaning of the resource when taken outside the context of this particular arc. For example, a resource might generically represent a "person," but in the context of a particular arc it might have the role of "mother" and in the context of a different arc it might have the role of "daughter."



> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)
---
#### **XlinkTitle**

The **`xlink:title`** attribute is used to describe the meaning of a link or resource in a human-readable fashion.

The use of this information is highly dependent on the type of processing being done. It may be used, for example, to make titles available to applications used by visually impaired users, or to create a table of links, or to present help text that appears when a user lets a mouse pointer hover over a starting resource.

> **Note:** New content should use a title child element rather than a `xlink:title` attribute.



> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)
---
#### **XlinkShow**

The **`xlink:show`** attribute indicates how a linked resource should be opened and is meant for XLink-aware processors. In case of a conflict, the target attribute has priority, since it can express a wider range of values.



Valid Values:

* new
* replace
* embed
* other
* none



> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)
---
### Syntax
```PowerShell
SVG.mpath [[-Content] <Object>] [-Data <IDictionary>] [-XlinkHref <Object>] [-Id <Object>] [-Lang <Object>] [-Tabindex <Object>] [-XmlBase <Object>] [-XmlLang <Object>] [-XmlSpace <Object>] [-XlinkType <Object>] [-XlinkArcrole <Object>] [-XlinkTitle <Object>] [-XlinkShow <Object>] [<CommonParameters>]
```
---


