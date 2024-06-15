SVG.HueRotate
-------------

### Synopsis
Hue Rotate Filter

---

### Description

Creates a hue rotate filter in SVG.

---

### Examples
> EXAMPLE 1

```PowerShell
SVG -ViewBox 200 @(    
    SVG.Defs @(    
        SVG.HueRotate -HueRotate 180    
    )    
    SVG.Circle -R 100 -CX 100 -CY 100 -Fill 'red' -Filter 'url(#hueRotate)'    
) -OutputPath .\HueRotate.svg
```

---

### Parameters
#### **HueRotate**

|Type      |Required|Position|PipelineInput|Aliases    |
|----------|--------|--------|-------------|-----------|
|`[Double]`|false   |1       |false        |Angle<br/>A|

---

### Syntax
```PowerShell
SVG.HueRotate [[-HueRotate] <Double>] [<CommonParameters>]
```
