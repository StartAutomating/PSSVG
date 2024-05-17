SVG.Arbelos
-----------

### Synopsis
Creates an arbelos in SVG.

---

### Description

Creates an arbelos in SVG by drawing a major semicircle, a minor semicircle, and a circle tangent to both.

---

### Related Links
* [https://en.wikipedia.org/wiki/Arbelos](https://en.wikipedia.org/wiki/Arbelos)

---

### Examples
> EXAMPLE 1

```PowerShell
SVG -Viewbox 200, 100 @(    
    SVG.Arbelos -Radius 90 -CenterX 100 -CenterY 100    
)
```

---

### Parameters
#### **Radius**
The radius of the arbelos.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Double]`|false   |1       |true (ByPropertyName)|

#### **Midpoint**
The midpoint of the arbelos.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Double]`|false   |2       |true (ByPropertyName)|

#### **CenterX**
The center X coordinate for the arbelos.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[Double]`|false   |3       |true (ByPropertyName)|CX     |

#### **CenterY**
The center Y coordinate for the arbelos.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[Double]`|false   |4       |true (ByPropertyName)|CY     |

#### **Rotate**
The rotation of the arbelos.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Double]`|false   |5       |true (ByPropertyName)|

---

### Syntax
```PowerShell
SVG.Arbelos [[-Radius] <Double>] [[-Midpoint] <Double>] [[-CenterX] <Double>] [[-CenterY] <Double>] [[-Rotate] <Double>] [<CommonParameters>]
```
