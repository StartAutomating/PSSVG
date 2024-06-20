SVG.Grayscale
-------------

### Synopsis
Grayscale Filter

---

### Description

Creates a grayscale filter in SVG.    
This uses a fixed saturation of zero, to remove all colors within the image.

---

### Related Links
* [https://developer.mozilla.org/en-US/docs/Web/SVG/Element/feColorMatrix](https://developer.mozilla.org/en-US/docs/Web/SVG/Element/feColorMatrix)

---

### Examples
> EXAMPLE 1

```PowerShell
SVG -ViewBox 200 @(    
    SVG.Circle -R 100 -CX 100 -CY 100 -Fill '#4488ff' -Filter 'url(#grayscale)' |    
        SVG.Grayscale    
) -OutputPath .\Grayscale.svg
```

---

### Syntax
```PowerShell
SVG.Grayscale [<CommonParameters>]
```
