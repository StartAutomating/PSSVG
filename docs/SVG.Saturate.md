SVG.Saturate
------------

### Synopsis
Saturate Filter

---

### Description

Creates a saturation filter in SVG.    
This controls how saturated colors are within the image.

---

### Related Links
* [https://developer.mozilla.org/en-US/docs/Web/SVG/Element/feColorMatrix](https://developer.mozilla.org/en-US/docs/Web/SVG/Element/feColorMatrix)

---

### Examples
> EXAMPLE 1

```PowerShell
SVG -ViewBox 200 @(    
    SVG.Defs @(    
        SVG.Saturate -Saturation .2    
    )    
    SVG.Circle -R 100 -CX 100 -CY 100 -Fill 'red' -Filter 'url(#saturate)'    
) -OutputPath .\Saturate.svg
```

---

### Parameters
#### **Saturation**
The amount of color saturation.

|Type      |Required|Position|PipelineInput        |Aliases         |
|----------|--------|--------|---------------------|----------------|
|`[Double]`|false   |1       |true (ByPropertyName)|Saturate<br/>Sat|

---

### Syntax
```PowerShell
SVG.Saturate [[-Saturation] <Double>] [<CommonParameters>]
```
