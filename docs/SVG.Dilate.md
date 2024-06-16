SVG.Dilate
----------

### Synopsis
Dilate Filter

---

### Description

Creates a Dilate filter in SVG.    
This controls how Dilated an image should be.

---

### Related Links
* [https://developer.mozilla.org/en-US/docs/Web/SVG/Element/feMorphology](https://developer.mozilla.org/en-US/docs/Web/SVG/Element/feMorphology)

---

### Examples
> EXAMPLE 1

```PowerShell
SVG -ViewBox 200 @(    
    SVG.Defs @(    
        SVG.Dilate -Content @(    
            SVG.Animate -AttributeName 'radius' -values '0;21;0' -dur '4.2s' -repeatCount 'indefinite'    
        )    
    )    
    SVG.Circle -R 100 -CX 100 -CY 100 -Fill '#4488ff' -Filter 'url(#Dilate)'    
) -OutputPath .\Dilate.svg
```

---

### Parameters
#### **Dilation**
The amount to dilate the image.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[Double]`|false   |1       |true (ByPropertyName)|Dilate |

---

### Syntax
```PowerShell
SVG.Dilate [[-Dilation] <Double>] [<CommonParameters>]
```
