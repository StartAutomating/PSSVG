SVG.Star
--------

### Synopsis
SVG Star

---

### Description

Creates a Star of an number of points.

---

### Related Links
* [SVG.Path](SVG.Path.md)

* [SVG.ConvexPolygon](SVG.ConvexPolygon.md)

---

### Parameters
#### **PointCount**
The number of points in the star.    
This is also aliased to -SideCount for consistent use with SVG.ConvexPolygon,    
(even if this is not mathematically accurate).

|Type     |Required|Position|PipelineInput        |Aliases                                                  |
|---------|--------|--------|---------------------|---------------------------------------------------------|
|`[Int32]`|false   |1       |true (ByPropertyName)|PC<br/>Points<br/>SC<br/>SideCount<br/>Sides<br/>NumSides|

#### **Rotate**
The initial rotation of the polygon.

|Type      |Required|Position|PipelineInput        |Aliases |
|----------|--------|--------|---------------------|--------|
|`[Double]`|false   |named   |true (ByPropertyName)|Rotation|

#### **CenterX**
The center X coordinate for the polygon.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[Double]`|false   |named   |true (ByPropertyName)|CX     |

#### **CenterY**
The center Y coordinate for the polygon.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[Double]`|false   |named   |true (ByPropertyName)|CY     |

#### **Radius**
The radius of the polygon.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[Double]`|false   |named   |true (ByPropertyName)|R      |

---

### Syntax
```PowerShell
SVG.Star [[-PointCount] <Int32>] [-Rotate <Double>] [-CenterX <Double>] [-CenterY <Double>] [-Radius <Double>] [<CommonParameters>]
```
