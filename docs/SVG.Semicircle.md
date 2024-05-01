SVG.Semicircle
--------------

### Synopsis
Creates a semicircle in SVG.

---

### Description

Creates a semicircle in SVG by drawing an arc path from the start to the end of a circle, and closing it.

---

### Parameters
#### **Radius**
The radius of the semi-circle.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[Double]`|false   |1       |true (ByPropertyName)|R      |

#### **CenterX**
The center X coordinate for the semi-circle.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[Double]`|false   |2       |true (ByPropertyName)|CX     |

#### **CenterY**
The center Y coordinate for the semi-circle.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[Double]`|false   |3       |true (ByPropertyName)|CY     |

#### **Rotate**
The start angle of the semi-circle.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Double]`|false   |4       |false        |

---

### Syntax
```PowerShell
SVG.Semicircle [[-Radius] <Double>] [[-CenterX] <Double>] [[-CenterY] <Double>] [[-Rotate] <Double>] [<CommonParameters>]
```
