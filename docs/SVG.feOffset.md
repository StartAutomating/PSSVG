
SVG.feOffset
------------
### Synopsis
Creates SVG feOffset elements

---
### Description

The **`<feOffset>`** SVG filter primitive allows to offset the input image. The input image as a whole is offset by the values specified in the `dx` and `dy` attributes.

---
### Related Links
* [https://pssvg.start-automating.com/SVG.feOffset](https://pssvg.start-automating.com/SVG.feOffset)
* [https://developer.mozilla.org/en-US/web/svg/element/feoffset/](https://developer.mozilla.org/en-US/web/svg/element/feoffset/)
* [Write-SVG](Write-SVG.md)
---
### Parameters
#### **Content**

The Contents of the feOffset element



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
#### **In**

> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)
---
#### **Dx**

> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)
---
#### **Dy**

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
#### **AlignmentBaseline**

The **`alignment-baseline`** attribute specifies how an object is aligned with respect to its parent. This property specifies which baseline of this element is to be aligned with the corresponding baseline of the parent. For example, this allows alphabetic baselines in Roman text to stay aligned across font size changes. It defaults to the baseline with the same name as the computed value of the `alignment-baseline` property.

> **Note:** As a presentation attribute `alignment-baseline` can be used as a CSS property.



Valid Values:

* auto
* baseline
* before-edge
* text-before-edge
* middle
* central
* after-edge
* text-after-edge
* ideographic
* alphabetic
* hanging
* mathematical
* top
* center
* bottom



> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)
---
#### **BaselineShift**

The **`baseline-shift`** attribute allows repositioning of the dominant-baseline relative to the dominant-baseline of the parent text content element. The shifted object might be a sub- or superscript.

> **Note:** As a presentation attribute `baseline-shift` can be used as a CSS property.

> **Note:** This property is going to be deprecated and authors are advised to use [`vertical-align`](https://developer.mozilla.org/en-US/docs/Web/CSS/vertical-align) instead.



> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)
---
#### **Clip**

The **`clip`** attribute is a presentation attribute defining the visible region of an element.

This attribute has the same parameter values as defined for the {{ cssxref("clip","CSS clip property") }}. Unitless values, which indicate current user coordinates, are permitted on the coordinate values on the `rect()`. The value of `auto` defines a clipping path along the bounds of the viewport created by the given element.



Valid Values:

* auto
* rect()



> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)
---
#### **ClipPath**

The **`clip-path`** presentation attribute defines or associates a clipping path with the element it is related to.

> **Note:** As a presentation attribute `clip-path` can be used as a CSS property.



> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)
---
#### **ClipRule**

« [SVG Attribute reference home](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute)

The `clip-rule` attribute only applies to graphics elements that are contained within a clipPath element. The `clip-rule` attribute basically works as the fill-rule attribute, except that it applies to clipPath definitions.

The following fragment of code will cause an evenodd clipping rule to be applied to the clipping path because `clip-rule` is specified on the path element that defines the clipping shape:

```html
<g>
<clipPath id="MyClip">
<path d="..." clip-rule="evenodd" />
</clipPath>
<rect clip-path="url(#MyClip)" ... />
</g>
```

whereas the following fragment of code will not cause an evenodd clipping rule to be applied because the `clip-rule` is specified on the referencing element, not on the object defining the clipping shape:

```html
<g>
<clipPath id="MyClip">
<path d="..." />
</clipPath>
<rect clip-path="url(#MyClip)" clip-rule="evenodd" ... />
</g>
```

As a presentation attribute, it also can be used as a property directly inside a CSS stylesheet



Valid Values:

* nonzero
* evenodd
* inherit



> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)
---
#### **Color**

The **`color`** attribute is used to provide a potential indirect value, `currentcolor`, for the fill, stroke, stop-color, flood-color, and lighting-color attributes.

> **Note:** As a presentation attribute, `color` can be used as a CSS property. See [CSS color](https://developer.mozilla.org/en-US/docs/Web/CSS/color) for further information.

As a presentation attribute, it can be applied to any element, but as noted above, it has no direct effect on SVG elements.



> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)
---
#### **ColorInterpolation**

The **`color-interpolation`** attribute specifies the color space for gradient interpolations, color animations, and alpha compositing.

> **Note:** For filter effects, the color-interpolation-filters property controls which color space is used.

The color-interpolation property chooses between color operations occurring in the sRGB color space or in a (light energy linear) linearized RGB color space. Having chosen the appropriate color space, component-wise linear interpolation is used.

When a child element is blended into a background, the value of the `color-interpolation` property on the child determines the type of blending, not the value of the `color-interpolation` on the parent. For gradients which make use of the href or the deprecated xlink:href attribute to reference another gradient, the gradient uses the property's value from the gradient element which is directly referenced by the fill or stroke property. When animating colors, color interpolation is performed according to the value of the `color-interpolation` property on the element being animated.

> **Note:** As a presentation attribute, `color-interpolation` can be used as a CSS property.



Valid Values:

* auto
* sRGB
* linearRGB



> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)
---
#### **ColorInterpolationFilters**

The **`color-interpolation-filters`** attribute specifies the color space for imaging operations performed via filter effects.

> **Note:** This property just has an affect on filter operations. Therefore, it has no effect on filter primitives like feOffset, feImage, feTile or feFlood.
>
> `color-interpolation-filters` has a different initial value than color-interpolation. `color-interpolation-filters` has an initial value of `linearRGB`, whereas `color-interpolation` has an initial value of `sRGB`. Thus, in the default case, filter effects operations occur in the linearRGB color space, whereas all other color interpolations occur by default in the sRGB color space.
>
> It has no affect on filter functions, which operate in the sRGB color space.

> **Note:** As a presentation attribute, `color-interpolation-filters` can be used as a CSS property.



Valid Values:

* auto
* sRGB
* linearRGB



> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)
---
#### **ColorProfile**

The **`color-profile`** attribute is used to define which color profile a raster image included through the image element should use.

> **Note:** As a presentation attribute, `color-profile` can be used as a CSS property.



> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)
---
#### **Cursor**

[SVG Attribute reference home](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute)

The `cursor` attribute specifies the mouse cursor displayed when the mouse pointer is over an element.

This attribute behaves exactly like the {{ cssxref("cursor","CSS cursor") }} property except that if the browser supports the cursor element, you should be able to use it with the [\<funciri>](https://developer.mozilla.org/en-US/docs/Web/SVG/Content_type#funciri) notation.

As a presentation attribute, it also can be used as a property directly inside a CSS stylesheet, see {{ cssxref("cursor","CSS cursor") }} for further information.



> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)
---
#### **Direction**

The **`direction`** attribute specifies the inline-base direction of a text or tspan element. It defines the start and end points of a line of text as used by the text-anchor and inline-size properties. It also may affect the direction in which characters are positioned if the unicode-bidi property's value is either `embed` or `bidi-override`.

It applies only to glyphs oriented perpendicular to the inline-base direction, which includes the usual case of horizontally-oriented Latin or Arabic text and the case of narrow-cell Latin or Arabic characters rotated 90 degrees clockwise relative to a top-to-bottom inline-base direction.

In many cases, the bidirectional Unicode algorithm produces the desired result automatically, so this attribute doesn't need to be specified in those cases. For other cases, such as when using right-to-left languages, it may be sufficient to add the `direction` attribute to the outermost svg element, and allow that direction to inherit to all text elements:

> **Note:** As a presentation attribute, `direction` can be used as a CSS property. See {{cssxref("direction", "CSS direction")}} for further information.



Valid Values:

* ltr
* rtl



> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)
---
#### **Display**

The **`display`** attribute lets you control the rendering of graphical or container elements.

A value of `display="none"` indicates that the given element and its children will not be rendered. Any value other than `none` or `inherit` indicates that the given element will be rendered by the browser.

When applied to a container element, setting `display` to `none` causes the container and all of its children to be invisible; thus, it acts on groups of elements as a group. This means that any child of an element with `display="none"` will never be rendered even if the child has a value for `display` other than `none`.

When the `display` attribute is set to `none`, then the given element does not become part of the rendering tree. It has implications for the tspan, tref, and altGlyph elements, event processing, for bounding box calculations and for calculation of clipping paths:

* If `display` is set to `none` on a tspan, tref, or altGlyph element, then the text string is ignored for the purposes of text layout.
* Regarding events, if `display` is set to `none`, the element receives no events.
* The geometry of a [graphics element](https://developer.mozilla.org/en-US/docs/Web/SVG/Element#graphics_elements) with `display` set to `none` is not included in bounding box and clipping paths calculations.

The `display` attribute only affects the direct rendering of a given element, whereas it does not prevent elements from being referenced by other elements. For example, setting it to `none` on a path element will prevent that element from getting rendered directly onto the canvas, but the path element can still be referenced by a textPath element; furthermore, its geometry will be used in text-on-a-path processing even if the path has a `display` value of `none`.

This attribute also affects direct rendering into offscreen canvases, such as occurs with masks or clip paths. Thus, setting `display="none"` on a child of a mask will prevent the given child element from being rendered as part of the mask. Similarly, setting `display="none"` on a child of a clipPath element will prevent the given child element from contributing to the clipping path.

> **Note:** As a presentation attribute, `display` can be used as a CSS property. See {{cssxref("display", "CSS display")}} for further information.

You can use this attribute with any SVG element.



> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)
---
#### **DominantBaseline**

The **`dominant-baseline`** attribute specifies the dominant baseline, which is the baseline used to align the box's text and inline-level contents. It also indicates the default alignment baseline of any boxes participating in baseline alignment in the box's alignment context.

It is used to determine or re-determine a scaled-baseline-table. A scaled-baseline-table is a compound value with three components:

1. a baseline-identifier for the dominant-baseline,
2. a baseline-table, and
3. a baseline-table font-size.

Some values of the property re-determine all three values. Others only re-establish the baseline-table font-size. When the initial value, `auto`, would give an undesired result, this property can be used to explicitly set the desired scaled-baseline-table.

If there is no baseline table in the nominal font, or if the baseline table lacks an entry for the desired baseline, then the browser may use heuristics to determine the position of the desired baseline.

> **Note:** As a presentation attribute, `dominant-baseline` can be used as a CSS property.



Valid Values:

* auto
* text-bottom
* alphabetic
* ideographic
* middle
* central
* mathematical
* hanging
* text-top



> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)
---
#### **EnableBackground**

The **`enable-background`** attribute specifies how the accumulation of the background image is managed.

> **Note:** As a presentation attribute, `enable-background` can be used as a CSS property.



> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)
---
#### **Fill**

The **`fill`** attribute has two different meanings. For shapes and text it's a presentation attribute that defines the color (_or any SVG paint servers like gradients or patterns_) used to paint the element; for animation it defines the final state of the animation.



> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)
---
#### **FillOpacity**

The **`fill-opacity`** attribute is a presentation attribute defining the opacity of the paint server (_color_, _gradient_, _pattern_, etc.) applied to a shape.

> **Note:** As a presentation attribute `fill-opacity` can be used as a CSS property.



> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)
---
#### **FillRule**

The **`fill-rule`** attribute is a presentation attribute defining the algorithm to use to determine the _inside_ part of a shape.

> **Note:** As a presentation attribute, `fill-rule` can be used as a CSS property.



Valid Values:

* nonzero
* evenodd



> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)
---
#### **Filter**

The **`filter`** attribute specifies the filter effects defined by the filter element that shall be applied to its element.

> **Note:** As a presentation attribute, `filter` can be used as a CSS property. See {{cssxref("filter", "CSS filter")}} for further information.

As a presentation attribute, it can be applied to any element but it only has effect on [container elements](https://developer.mozilla.org/en-US/docs/Web/SVG/Element#container_elements) without the defs element, all [graphics elements](https://developer.mozilla.org/en-US/docs/Web/SVG/Element#graphics_elements) and the use element.



> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)
---
#### **FloodColor**

The **`flood-color`** attribute indicates what color to use to flood the current filter primitive subregion.

> **Note:** As a presentation attribute, `flood-color` can be used as a CSS property.



> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)
---
#### **FloodOpacity**

The **`flood-opacity`** attribute indicates the opacity value to use across the current filter primitive subregion.

> **Note:** As a presentation attribute, `flood-opacity` can be used as a CSS property.



> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)
---
#### **FontFamily**

The **`font-family`** attribute indicates which font family will be used to render the text, specified as a prioritized list of font family names and/or generic family names.

> **Note:** As a presentation attribute, `font-family` can be used as a CSS property. See the {{cssxref("font-family", "CSS font-family")}} property for more information.



> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)
---
#### **FontSize**

The **`font-size`** attribute refers to the size of the font from baseline to baseline when multiple lines of text are set solid in a multiline layout environment.

> **Note:** As a presentation attribute, `font-size` can be used as a CSS property. See the {{cssxref("font-size", "CSS font-size")}} property for more information.



> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)
---
#### **FontSizeAdjust**

The `font-size-adjust` attribute allows authors to specify an aspect value for an element that will preserve the x-height of the first choice font in a substitute font.

> **Note:** As a presentation attribute, `font-size-adjust` can be used as a CSS property. See the {{cssxref("font-size-adjust", "CSS font-size-adjust")}} property for more information.



> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)
---
#### **FontStretch**

The **`font-stretch`** attribute indicates the desired amount of condensing or expansion in the glyphs used to render the text.

> **Note:** As a presentation attribute, `font-stretch` can be used as a CSS property. See the {{cssxref("font-stretch", "CSS font-stretch")}} property for more information.



> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)
---
#### **FontStyle**

The **`font-style`** attribute specifies whether the text is to be rendered using a normal, italic, or oblique face.

> **Note:** As a presentation attribute, `font-style` can be used as a CSS property. See the {{cssxref("font-style", "CSS font-style")}} property for more information.



Valid Values:

* normal
* italic
* oblique



> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)
---
#### **FontVariant**

The **`font-variant`** attribute indicates whether the text is to be rendered using variations of the font's {{Glossary("glyph", "glyphs")}}.

> **Note:** As a presentation attribute, `font-variant` can be used as a CSS property. See the {{cssxref("font-variant", "CSS font-variant")}} property for more information.



> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)
---
#### **FontWeight**

The **`font-weight`** attribute refers to the boldness or lightness of the glyphs used to render the text, relative to other fonts in the same font family.

> **Note:** As a presentation attribute, `font-weight` can be used as a CSS property. See the {{cssxref("font-weight", "CSS font-weight")}} property for more information.



> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)
---
#### **GlyphOrientationHorizontal**

The **`glyph-orientation-horizontal`** attribute affects the amount that the current text position advances as each glyph is rendered.

When the reference orientation direction is horizontal and the `glyph-orientation-horizontal` results in an orientation angle that is a multiple of 180 degrees, then the current text position is incremented according to the horizontal metrics of the glyph. Otherwise, if the value of this attribute is not a multiple of 180 degrees, then the current text position is incremented according to the vertical metrics of the glyph.

This attribute is applied only to text written in a horizontal writing-mode.

> **Note:** As a presentation attribute, `glyph-orientation-horizontal` can be used as a CSS property.



> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)
---
#### **GlyphOrientationVertical**

The **`glyph-orientation-vertical`** attribute affects the amount that hte current text position advances as each glyph is rendered.

When the inline-progression-direction is vertical and the `glyph-orientation-vertical` results in an orientation angle that is a multiple of 180 degrees, then the current text position is incremented according to the vertical metrics of the glyph. Otherwise, if the angle is not a multiple of 180 degrees, then the current text position is incremented according to the horizontal metrics of the glyph.

This attribute is applied only to text written in a vertical writing-mode.

> **Note:** As a presentation attribute, `glyph-orientation-vertical` can be used as a CSS property.



> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)
---
#### **ImageRendering**

The **`image-rendering`** attribute provides a hint to the browser about how to make speed vs. quality tradeoffs as it performs image processing.

The resampling is always done in a truecolor (e.g., 24-bit) color space even if the original data and/or the target device is indexed color.

> **Note:** As a presentation attribute, `image-rendering` can be used as a CSS property. See the {{cssxref("image-rendering", "CSS image-rendering")}} property for more information.



Valid Values:

* auto
* optimizeSpeed
* optimizeQuality



> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)
---
#### **Kerning**

The **`kerning`** attribute indicates whether the spacing between {{Glossary("glyph", "glyphs")}} should be adjusted based on kerning tables that are included in the relevant font (i.e., enable auto-kerning) or instead disable auto-kerning and set the spacing between them to a specific length (typically, zero).

> **Note:** As a presentation attribute `kerning` can be used as a CSS property. In CSS the property is called {{cssxref("font-kerning")}}, though.



> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)
---
#### **LetterSpacing**

The **`letter-spacing`** attribute controls spacing between text characters, in addition to any spacing from the kerning attribute.

If the attribute value is a unitless number (like `128`), the browser processes it as a {{cssxref("length")}} in the current user coordinate system.

If the attribute value has a unit identifier, such as `.25em` or `1%`, then the browser converts the \<length> into its corresponding value in the current user coordinate system.

> **Note:** As a presentation attribute, `letter-spacing` can be used as a CSS property. See the {{cssxref("letter-spacing", "CSS letter-spacing")}} property for more information.



> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)
---
#### **LightingColor**

The **`lighting-color`** attribute defines the color of the light source for lighting filter primitives.



> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)
---
#### **MarkerEnd**

The **`marker-end`** attribute defines the arrowhead or polymarker that will be drawn at the final vertex of the given [shape](https://developer.mozilla.org/en-US/docs/Web/SVG/Element#shape_elements).

For all shape elements, except polyline and path, the last vertex is the same as the first vertex. In this case, if the value of marker-start and `marker-end` are both not `none`, then two markers will be rendered on that final vertex. For `<path>` elements, for each closed subpath, the last vertex is the same as the first vertex. `marker-end` is only rendered on the final vertex of the [path data](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/d#path_commands).

> **Note:** As a presentation attribute, `marker-end` can be used as a CSS property.



> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)
---
#### **MarkerMid**

The **`marker-mid`** attribute defines the arrowhead or polymarker that will be drawn at all interior vertices of the given [shape](https://developer.mozilla.org/en-US/docs/Web/SVG/Element#shape_elements).

The marker is rendered on every vertex other than the first and last vertices of the [path data](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/d#path_commands).

> **Note:** As a presentation attribute, `marker-mid` can be used as a CSS property.



> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)
---
#### **MarkerStart**

The **`marker-start`** attribute defines the arrowhead or polymarker that will be drawn at the first vertex of the given [shape](https://developer.mozilla.org/en-US/docs/Web/SVG/Element#shape_elements).

For all shape elements, except polyline and path, the last vertex is the same as the first vertex. In this case, if the value of `marker-start` and marker-end are both not `none`, then two markers will be rendered on that final vertex. For `<path>` elements, for each closed subpath, the last vertex is the same as the first vertex. `marker-start` is only rendered on the first vertex of the [path data](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/d#path_commands).

> **Note:** As a presentation attribute, `marker-start` can be used as a CSS property.



> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)
---
#### **Mask**

The **`mask`** attribute is a presentation attribute mainly used to bind a given mask element with the element the attribute belongs to.

> **Note:** As a presentation attribute {{cssxref('mask')}} can be used as a CSS property.



> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)
---
#### **Opacity**

The **`opacity`** attribute specifies the transparency of an object or of a group of objects, that is, the degree to which the background behind the element is overlaid.

> **Note:** As a presentation attribute, `opacity` can be used as a CSS property. See the {{cssxref("opacity", "CSS opacity")}} property for more information.



> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)
---
#### **Overflow**

The **`overflow`** attribute sets what to do when an element's content is too big to fit in its block formatting context. **This feature is not widely implemented yet**.

This attribute has the same parameter values and meaning as the {{cssxref("overflow", "CSS overflow property")}}, however, the following additional points apply:

* If it has a value of `visible`, the attribute has no effect (i.e., a clipping rectangle is not created).
* If the `overflow` property has the value `hidden` or `scroll`, a clip of the exact size of the SVG viewport is applied.
* When `scroll` is specified on an svg element, a scrollbar or panner is normally shown for the SVG viewport whether or not any of its content is clipped.
* Within SVG content, the value `auto` implies that all rendered content for child elements must be visible, either through a scrolling mechanism, or by rendering with no clip.

> **Note:** Although the initial value for overflow is `auto`, it is overwritten in the User Agent style sheet for the svg element when it is not the root element of a stand-alone document, the pattern element, and the marker element to be hidden by default.

> **Note:** As a presentation attribute, `overflow` can be used as a CSS property. See the CSS {{cssxref("overflow")}} property for more information.



Valid Values:

* visible
* hidden
* scroll
* auto



> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)
---
#### **PointerEvents**

The **`pointer-events`** attribute is a presentation attribute that allows defining whether or when an element may be the target of a mouse event.

> **Note:** As a presentation attribute {{cssxref('pointer-events')}} can be used as a CSS property.



Valid Values:

* bounding-box
* visiblePainted
* visibleFill
* visibleStroke
* visible
* painted
* fill
* stroke
* all
* none



> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)
---
#### **ShapeRendering**

The **`shape-rendering`** attribute provides hints to the renderer about what tradeoffs to make when rendering shapes like paths, circles, or rectangles.

> **Note:** As a presentation attribute, `shape-rendering` can be used as a CSS property.



Valid Values:

* auto
* optimizeSpeed
* crispEdges
* geometricPrecision



> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)
---
#### **StopColor**

The **`stop-color`** attribute indicates what color to use at a gradient stop.

> **Note:** With respect to gradients, SVG treats the `transparent` keyword differently than CSS. SVG does not calculate gradients in pre-multiplied space, so `transparent` really means transparent black. So, specifying a `stop-color` with the value `transparent` is equivalent to specifying a `stop-color` with the value `black` and a stop-opacity with the value `0`.

> **Note:** As a presentation attribute, `stop-color` can be used as a CSS property.



> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)
---
#### **StopOpacity**

The **`stop-opacity`** attribute defines the opacity of a given color gradient stop.

The opacity value used for the gradient calculation is the product of the value of `stop-opacity` and the opacity of the value of the stop-color attribute. For `stop-color` values that don't include explicit opacity information, the opacity is treated as `1`.

> **Note:** As a presentation attribute, `stop-opacity` can be used as a CSS property.



> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)
---
#### **Stroke**

The **`stroke`** attribute is a presentation attribute defining the color (_or any SVG paint servers like gradients or patterns_) used to paint the outline of the shape;

> **Note:** As a presentation attribute `stroke` can be used as a CSS property.



> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)
---
#### **StrokeDasharray**

The **`stroke-dasharray`** attribute is a presentation attribute defining the pattern of dashes and gaps used to paint the outline of the shape;

> **Note:** As a presentation attribute, `stroke-dasharray` can be used as a CSS property.



> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)
---
#### **StrokeDashoffset**

The **`stroke-dashoffset`** attribute is a presentation attribute defining an offset on the rendering of the associated dash array.

> **Note:** As a presentation attribute `stroke-dashoffset` can be used as a CSS property.



> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)
---
#### **StrokeLinecap**

The **`stroke-linecap`** attribute is a presentation attribute defining the shape to be used at the end of open subpaths when they are stroked.

> **Note:** As a presentation attribute `stroke-linecap` can be used as a CSS property.



Valid Values:

* butt
* round
* square



> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)
---
#### **StrokeLinejoin**

The **`stroke-linejoin`** attribute is a presentation attribute defining the shape to be used at the corners of paths when they are stroked.

> **Note:** As a presentation attribute `stroke-linejoin` can be used as a CSS property.



Valid Values:

* arcs
* bevel
* miter
* miter-clip
* round



> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)
---
#### **StrokeMiterlimit**

The **`stroke-miterlimit`** attribute is a presentation attribute defining a limit on the ratio of the miter length to the stroke-width used to draw a miter join. When the limit is exceeded, the join is converted from a miter to a bevel.

> **Note:** As a presentation attribute `stroke-miterlimit` can be used as a CSS property.



> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)
---
#### **StrokeOpacity**

The **`stroke-opacity`** attribute is a presentation attribute defining the opacity of the paint server (_color_, _gradient_, _pattern_, etc.) applied to the stroke of a shape.

> **Note:** As a presentation attribute `stroke-opacity` can be used as a CSS property.



> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)
---
#### **StrokeWidth**

The **`stroke-width`** attribute is a presentation attribute defining the width of the stroke to be applied to the shape.



> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)
---
#### **TextAnchor**

The **`text-anchor`** attribute is used to align (start-, middle- or end-alignment) a string of pre-formatted text or auto-wrapped text where the wrapping area is determined from the {{cssxref("inline-size")}} property relative to a given point.

This attribute is not applicable to other types of auto-wrapped text. For those cases you should use {{cssxref("text-align")}}. For multi-line text, the alignment takes place for each line.

The `text-anchor` attribute is applied to each individual text chunk within a given text element. Each text chunk has an initial current text position, which represents the point in the user coordinate system resulting from (depending on context) application of the x and y attributes on the `<text>` element, any `x` or `y` attribute values on a tspan, tref or altGlyph element assigned explicitly to the first rendered character in a text chunk, or determination of the initial current text position for a textPath element.

> **Note:** As a presentation attribute, `text-anchor` can be used as a CSS property.



Valid Values:

* start
* middle
* end



> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)
---
#### **TextDecoration**

The **`text-decoration`** attribute defines whether text is decorated with an underline, overline and/or strike-through. It is a shorthand for the {{cssxref("text-decoration-line")}} and {{cssxref("text-decoration-style")}} properties.

The fill and stroke of the text decoration are given by the fill and stroke of the text at the point where the text decoration is declared.

The paint order of the text decoration, i.e. the fill and stroke, is determined by the value of the paint-order attribute at the point where the text decoration is declared.

> **Note:** As a presentation attribute, `text-decoration` can be used as a CSS property. See the {{cssxref("text-decoration", "CSS text-decoration")}} property for more information.



> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)
---
#### **TextRendering**

The **`text-rendering`** attribute provides hints to the renderer about what tradeoffs to make when rendering text.

> **Note:** As a presentation attribute, `text-rendering` can be used as a CSS property. See the {{cssxref("text-rendering", "CSS text-rendering")}} property for more information.



Valid Values:

* auto
* optimizeSpeed
* optimizeLegibility
* geometricPrecision



> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)
---
#### **Transform**

The **`transform`** attribute defines a list of transform definitions that are applied to an element and the element's children.

> **Note:** As of SVG2, `transform` is a presentation attribute, meaning it can be used as a CSS property. However, be aware that there are some differences in syntax between the CSS property and the attribute. See the documentation for the CSS property {{cssxref('transform')}} for the specific syntax to use in that case.

You can use this attribute with any SVG element.



> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)
---
#### **TransformOrigin**

> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)
---
#### **UnicodeBidi**

The **`unicode-bidi`** attribute specifies how the accumulation of the background image is managed.

> **Note:** As a presentation attribute, `unicode-bidi` can be used as a CSS property. See the [CSS `unicode-bidi`](https://developer.mozilla.org/en-US/docs/Web/CSS/unicode-bidi) property for more information.



> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)
---
#### **VectorEffect**

The **`vector-effect`** property specifies the vector effect to use when drawing an object. Vector effects are applied before any of the other compositing operations, i.e. filters, masks and clips.

> **Note:** As a presentation attribute, `vector-effect` can be used as a CSS property.



Valid Values:

* none
* non-scaling-stroke
* non-scaling-size
* non-rotation
* fixed-position



> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)
---
#### **Visibility**

The **`visibility`** attribute lets you control the visibility of graphical elements. With a value of `hidden` or `collapse` the current graphics element is invisible.

> **Note:** If the `visibility` attribute is set to `hidden` on a text element, then the text is invisible but still takes up space in text layout calculations.

Depending on the value of attribute pointer-events, graphics elements which have their `visibility` attribute set to `hidden` still might receive events.

> **Note:** As a presentation attribute, `visibility` can be used as a CSS property. See the {{cssxref("visibility", "CSS visibility")}} property for more information.



Valid Values:

* visible
* hidden
* collapse



> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)
---
#### **WordSpacing**

The **`word-spacing`** attribute specifies spacing behavior between words.

If a {{cssxref("length")}} is provided without a unit identifier (e.g. an unqualified number such as 128), the browser processes the \<length> as a width value in the current user coordinate system.

If a \<length> is provided with one of the unit identifiers (e.g. .25em or 1%), then the browser converts the \<length> into a corresponding value in the current user coordinate system.

> **Note:** As a presentation attribute, `word-spacing` can be used as a CSS property. See the {{cssxref("word-spacing", "CSS word-spacing")}} property for more information.



> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)
---
#### **WritingMode**

The **`writing-mode`** attribute specifies whether the initial inline-progression-direction for a text element shall be left-to-right, right-to-left, or top-to-bottom. The `writing-mode` attribute applies only to text elements; the attribute is ignored for tspan, tref, altGlyph and textPath sub-elements. (Note that the inline-progression-direction can change within a text element due to the Unicode bidirectional algorithm and properties direction and unicode-bidi.)

> **Note:** As a presentation attribute, `writing-mode` can be used as a CSS property. See the CSS {{cssxref("writing-mode")}} property for more information.



Valid Values:

* horizontal-tb
* vertical-rl
* vertical-lr



> **Type**: ```[Object]```

> **Required**: false

> **Position**: named

> **PipelineInput**:true (ByPropertyName)
---
### Syntax
```PowerShell
SVG.feOffset [[-Content] <Object>] [-Data <IDictionary>] [-In <Object>] [-Dx <Object>] [-Dy <Object>] [-Id <Object>] [-Lang <Object>] [-Tabindex <Object>] [-XmlBase <Object>] [-XmlLang <Object>] [-XmlSpace <Object>] [-AlignmentBaseline <Object>] [-BaselineShift <Object>] [-Clip <Object>] [-ClipPath <Object>] [-ClipRule <Object>] [-Color <Object>] [-ColorInterpolation <Object>] [-ColorInterpolationFilters <Object>] [-ColorProfile <Object>] [-Cursor <Object>] [-Direction <Object>] [-Display <Object>] [-DominantBaseline <Object>] [-EnableBackground <Object>] [-Fill <Object>] [-FillOpacity <Object>] [-FillRule <Object>] [-Filter <Object>] [-FloodColor <Object>] [-FloodOpacity <Object>] [-FontFamily <Object>] [-FontSize <Object>] [-FontSizeAdjust <Object>] [-FontStretch <Object>] [-FontStyle <Object>] [-FontVariant <Object>] [-FontWeight <Object>] [-GlyphOrientationHorizontal <Object>] [-GlyphOrientationVertical <Object>] [-ImageRendering <Object>] [-Kerning <Object>] [-LetterSpacing <Object>] [-LightingColor <Object>] [-MarkerEnd <Object>] [-MarkerMid <Object>] [-MarkerStart <Object>] [-Mask <Object>] [-Opacity <Object>] [-Overflow <Object>] [-PointerEvents <Object>] [-ShapeRendering <Object>] [-StopColor <Object>] [-StopOpacity <Object>] [-Stroke <Object>] [-StrokeDasharray <Object>] [-StrokeDashoffset <Object>] [-StrokeLinecap <Object>] [-StrokeLinejoin <Object>] [-StrokeMiterlimit <Object>] [-StrokeOpacity <Object>] [-StrokeWidth <Object>] [-TextAnchor <Object>] [-TextDecoration <Object>] [-TextRendering <Object>] [-Transform <Object>] [-TransformOrigin <Object>] [-UnicodeBidi <Object>] [-VectorEffect <Object>] [-Visibility <Object>] [-WordSpacing <Object>] [-WritingMode <Object>] [<CommonParameters>]
```
---


