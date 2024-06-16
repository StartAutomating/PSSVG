SVG.Erode
---------

### Synopsis
Erode Filter

---

### Description

Creates a erode filter in SVG.    
This controls how eroded an image should be.

---

### Related Links
* [https://developer.mozilla.org/en-US/docs/Web/SVG/Element/feMorphology](https://developer.mozilla.org/en-US/docs/Web/SVG/Element/feMorphology)

---

### Examples
> EXAMPLE 1

```PowerShell
SVG -ViewBox 200 @(    
    SVG.Defs @(    
        SVG.Erode -Content @(    
            SVG.Animate -AttributeName 'radius' -values '0;40;0' -dur '4s' -repeatCount 'indefinite'    
        )    
    )    
    SVG.Circle -R 100 -CX 100 -CY 100 -Fill '#4488ff' -Filter 'url(#erode)'    
) -OutputPath .\Erode.svg
```

---

### Parameters
#### **Erosion**

|Type      |Required|Position|PipelineInput        |Aliases    |
|----------|--------|--------|---------------------|-----------|
|`[Double]`|false   |1       |true (ByPropertyName)|Erode<br/>E|

---

### Syntax
```PowerShell
SVG.Erode [[-Erosion] <Double>] [<CommonParameters>]
```
