SVG.animateMotion
-----------------
### Synopsis
Creates SVG animateMotion elements

---
### Description

The SVG **`<animateMotion>`** element provides a way to define how an element moves along a motion path.

> **Note:** To reuse an existing path, it will be necessary to use an `mpath` element inside the `<animateMotion>` element instead of the `path` attribute.

---
### Related Links
* [https://pssvg.start-automating.com/SVG.animateMotion](https://pssvg.start-automating.com/SVG.animateMotion)



* [https://developer.mozilla.org/en-US/web/svg/element/animatemotion/](https://developer.mozilla.org/en-US/web/svg/element/animatemotion/)



* [Write-SVG](Write-SVG.md)



---
### Examples
#### EXAMPLE 1
```PowerShell
$path = "M20,50 C20,-50 180,150 180,50 C180-50 20,150 20,50 z"
=<svg> -viewBox "0 0 200 100" @(
    =<svg.path> -d $path -Fill none -Stroke lightgrey
    =<svg.circle> -r 5 -Fill red (
        =<svg.animateMotion> -Dur 10s -RepeatCount 'indefinite' -Path $path
    )
    =<svg.rect> -Width 2 -Height 2 -X -1 -Y -1 -Fill blue @(
        =<svg.animateMotion> -Dur 10s -RepeatCount 'indefinite' -Path $path
        =<svg.animateTransform> -AttributeName transform -From "0 0 0"  -To "360 0 0" -dur "5s" -RepeatCount indefinite -AttributeType xml -type rotate
    )
)
```

#### EXAMPLE 2
```PowerShell
$path = "M20,50 C20,-50 180,150 180,50 C180-50 20,150 20,50 z"
=<svg> -viewBox "0 0 200 100" @(
    =<svg.path> -d $path -Fill none -Stroke lightgrey
    =<svg.circle> -r 5 -Fill red (
        =<svg.animateMotion> -Dur 10s -RepeatCount 'indefinite' -Path $path
    )
    =<svg.rect> -Width 2 -Height 2 -X -1 -Y -1 -Fill blue @(
        =<svg.animateMotion> -Dur 10s -RepeatCount 'indefinite' -Path $path
        =<svg.animateTransform> -AttributeName transform -From "0 0 0"  -To "360 0 0" -dur "5s" -RepeatCount indefinite -AttributeType xml -type rotate
    )
)
```

---
### Parameters
#### **Content**

The Contents of the animateMotion element






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Object]`|false   |1       |true (ByPropertyName)|



---
#### **Data**

A dictionary containing data.  This data will be embedded in data- attributes.






|Type           |Required|Position|PipelineInput        |
|---------------|--------|--------|---------------------|
|`[IDictionary]`|false   |named   |true (ByPropertyName)|



---
#### **On**

A dictionary or object containing event handlers.
Each key or property name will be the name of the event
Each value will be the handler.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Object]`|false   |named   |true (ByPropertyName)|



---
#### **Attribute**

A dictionary of attributes.  This can set any attribute not exposed in other parameters.






|Type           |Required|Position|PipelineInput        |
|---------------|--------|--------|---------------------|
|`[IDictionary]`|false   |named   |true (ByPropertyName)|



---
#### **KeyPoints**

This attribute indicate, in the range \[0,1], how far is the object along the path for each keyTimes associated values.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Object]`|false   |named   |true (ByPropertyName)|



---
#### **Path**

This attribute defines the path of the motion, using the same syntax as the d attribute.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Object]`|false   |named   |true (ByPropertyName)|



---
#### **Rotate**

This attribute defines a rotation applied to the element animated along a path, usually to make it pointing in the direction of the animation.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Object]`|false   |named   |true (ByPropertyName)|



---
#### **Href**

The **`href`** attribute defines a link to a resource as a reference [URL](https://developer.mozilla.org/en-US/docs/Web/SVG/Content_type#url). The exact meaning of that link depends on the context of each element using it.

> **Note:** Specifications before SVG 2 defined an xlink:href attribute, which is now rendered obsolete by the `href` attribute. If you need to support earlier browser versions, the deprecated `xlink:href` attribute can be used as a fallback in addition to the `href` attribute, e.g. `<use href="some-id" xlink:href="some-id" x="5" y="5" />`.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Object]`|false   |named   |true (ByPropertyName)|



---
#### **AttributeType**

The **`attributeType`** attribute specifies the namespace in which the target attribute and its associated values are defined.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Object]`|false   |named   |true (ByPropertyName)|



---
#### **AttributeName**

The **`attributeName`** attribute indicates the name of the CSS property or attribute of the target element that is going to be changed during an animation.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Object]`|false   |named   |true (ByPropertyName)|



---
#### **Begin**

The **`begin`** attribute defines when an animation should begin or when an element should be discarded.

The attribute value is a semicolon separated list of values. The interpretation of a list of start times is detailed in the SMIL specification in ["Evaluation of begin and end time lists"](https://developer.mozilla.orghttps://www.w3.org/TR/2001/REC-smil-animation-20010904/#Timing-EvaluationOfBeginEndTimeLists). Each individual value can be one of the following: `<offset-value>`, `<syncbase-value>`, `<event-value>`, `<repeat-value>`, `<accessKey-value>`, `<wallclock-sync-value>` or the keyword `indefinite`.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Object]`|false   |named   |true (ByPropertyName)|



---
#### **Dur**

The **`dur`** attribute indicates the simple duration of an animation.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Object]`|false   |named   |true (ByPropertyName)|



---
#### **End**

The **`end`** attribute defines an end value for the animation that can constrain the active duration.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Object]`|false   |named   |true (ByPropertyName)|



---
#### **Min**

The **`min`** attribute specifies the minimum value of the active animation duration.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Object]`|false   |named   |true (ByPropertyName)|



---
#### **Max**

The **`max`** attribute specifies the maximum value of the active animation duration.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Object]`|false   |named   |true (ByPropertyName)|



---
#### **Restart**

The **`restart`** attribute specifies whether or not an animation can restart.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Object]`|false   |named   |true (ByPropertyName)|



---
#### **RepeatCount**

The **`repeatCount`** attribute indicates the number of times an animation will take place.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Object]`|false   |named   |true (ByPropertyName)|



---
#### **RepeatDur**

The **`repeatDur`** attribute specifies the total duration for repeating an animation.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Object]`|false   |named   |true (ByPropertyName)|



---
#### **Fill**

The **`fill`** attribute has two different meanings. For shapes and text it's a presentation attribute that defines the color (_or any SVG paint servers like gradients or patterns_) used to paint the element; for animation it defines the final state of the animation.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Object]`|false   |named   |true (ByPropertyName)|



---
#### **CalcMode**

The **`calcMode`** attribute specifies the interpolation mode for the animation.

The default mode is `linear`, however if the attribute does not support linear interpolation (e.g. for strings), the `calcMode` attribute is ignored and discrete interpolation is used.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Object]`|false   |named   |true (ByPropertyName)|



---
#### **Values**

The `values` attribute has different meanings, depending upon the context where it's used, either it defines a sequence of values used over the course of an animation, or it's a list of numbers for a color matrix, which is interpreted differently depending on the type of color change to be performed.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Object]`|false   |named   |true (ByPropertyName)|



---
#### **KeyTimes**

The **`keyTimes`** attribute represents a list of time values used to control the pacing of the animation.

Each time in the list corresponds to a value in the values attribute list, and defines when the value is used in the animation. Each time value in the `keyTimes` list is specified as a floating point value between 0 and 1 (inclusive), representing a proportional offset into the duration of the animation element.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Object]`|false   |named   |true (ByPropertyName)|



---
#### **KeySplines**

The **`keySplines`** attribute defines a set of [Bézier curve](https://developer.mozilla.org/en-US/docs/Glossary/Bezier_curve) control points associated with the keyTimes list, defining a cubic Bézier function that controls interval pacing.

This attribute is ignored unless the calcMode attribute is set to `spline`.

If there are any errors in the keySplines specification (bad values, too many or too few values), the animation will not occur.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Object]`|false   |named   |true (ByPropertyName)|



---
#### **From**

The **`from`** attribute indicates the initial value of the attribute that will be modified during the animation.

When used with the to attribute, the animation will change the modified attribute from the `from` value to the `to` value. When used with the by attribute, the animation will change the attribute relatively from the `from` value by the value specified in `by`.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Object]`|false   |named   |true (ByPropertyName)|



---
#### **To**

The **`to`** attribute indicates the final value of the attribute that will be modified during the animation.

The value of the attribute will change between the from attribute value and this value.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Object]`|false   |named   |true (ByPropertyName)|



---
#### **By**

The **`by`** attribute specifies a relative offset value for an attribute that will be modified during an animation.

The starting value for the attribute is either indicated by specifying it as value for the attribute given in the attributeName or the from attribute.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Object]`|false   |named   |true (ByPropertyName)|



---
#### **Additive**

The **`additive`** attribute controls whether or not an animation is additive.

It is frequently useful to define animation as an offset or delta to an attribute's value, rather than as absolute values.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Object]`|false   |named   |true (ByPropertyName)|



---
#### **Accumulate**

The **`accumulate`** attribute controls whether or not an animation is cumulative.

It is frequently useful for repeated animations to build upon the previous results, accumulating with each iteration. This attribute said to the animation if the value is added to the previous animated attribute's value on each iteration.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Object]`|false   |named   |true (ByPropertyName)|



---
#### **Id**

The **`id`** attribute assigns a unique name to an element.

You can use this attribute with any SVG element.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Object]`|false   |named   |true (ByPropertyName)|



---
#### **Lang**

The **`lang`** attribute specifies the primary language used in contents and attributes containing text content of particular elements.

There is also an xml:lang attribute (with namespace). If both of them are defined, the one with namespace is used and the one without is ignored.

In SVG 1.1 there was a `lang` attribute defined with a different meaning and only applying to glyph elements. That attribute specified a list of languages according to {{RFC(5646, "Tags for Identifying Languages (also known as BCP 47)")}}. The glyph was meant to be used if the `xml:lang` attribute exactly matched one of the languages given in the value of this parameter, or if the `xml:lang` attribute exactly equaled a prefix of one of the languages given in the value of this parameter such that the first tag character following the prefix was "-".

You can use this attribute with any SVG element.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Object]`|false   |named   |true (ByPropertyName)|



---
#### **Tabindex**

The **`tabindex`** attribute allows you to control whether an element is focusable and to define the relative order of the element for the purposes of sequential focus navigation.

You can use this attribute with any SVG element.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Object]`|false   |named   |true (ByPropertyName)|



---
#### **XmlBase**

The **`xml:base`** attribute specifies a base IRI other than the base IRI of the document or external entity.

You can use this attribute with any SVG element.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Object]`|false   |named   |true (ByPropertyName)|



---
#### **XmlLang**

The **`xml:lang`** attribute specifies the primary language used in contents and attributes containing text content of particular elements.

It is a universal attribute allowed in all XML dialects to mark up the natural human language that an element contains.

There is also a lang attribute (without namespace). If both of them are defined, the one with namespace is used and the one without is ignored.

You can use this attribute with any SVG element.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Object]`|false   |named   |true (ByPropertyName)|



---
#### **XmlSpace**

SVG supports the built-in XML **`xml:space`** attribute to handle whitespace characters inside elements. Child elements inside an element may also have an `xml:space` attribute that overrides the parent's one.

> **Note:** Instead of using the `xml:space` attribute, use the white-space CSS property.

This attribute influences how browsers parse text content and therefore changes the way the DOM is built. Therefore, changing this attribute's value through the DOM API may have no effect.

You can use this attribute with any SVG element.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Object]`|false   |named   |true (ByPropertyName)|



---
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



---
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
SVG.animateMotion [[-Content] <Object>] [-Data <IDictionary>] [-On <Object>] [-Attribute <IDictionary>] [-KeyPoints <Object>] [-Path <Object>] [-Rotate <Object>] [-Href <Object>] [-AttributeType <Object>] [-AttributeName <Object>] [-Begin <Object>] [-Dur <Object>] [-End <Object>] [-Min <Object>] [-Max <Object>] [-Restart <Object>] [-RepeatCount <Object>] [-RepeatDur <Object>] [-Fill <Object>] [-CalcMode <Object>] [-Values <Object>] [-KeyTimes <Object>] [-KeySplines <Object>] [-From <Object>] [-To <Object>] [-By <Object>] [-Additive <Object>] [-Accumulate <Object>] [-Id <Object>] [-Lang <Object>] [-Tabindex <Object>] [-XmlBase <Object>] [-XmlLang <Object>] [-XmlSpace <Object>] [-Class <Object>] [-Style <Object>] [<CommonParameters>]
```
---
