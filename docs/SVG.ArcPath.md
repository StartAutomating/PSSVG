SVG.ArcPath
-----------
### Synopsis
Draws an SVG arc.

---
### Description

Draws an SVG arc path.

---
### Related Links
* [SVG.Path](SVG.Path.md)



---
### Examples
#### EXAMPLE 1
```PowerShell
-Viewbox 100, 100 (
    =<svg.ArcPath> -Start 50 -End 75 -Radius 25 -Large
) -OutputPath .\arcs.svg
```

---
### Parameters
#### **Start**

The Starting point of the arc.
If only one value is provided, it will be used as the X and Y coordinate.






|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[Double[]]`|false   |named   |true (ByPropertyName)|



---
#### **Radius**

The radius of the arc.
If only one value is provided, it will be used as the X and Y coordinate.






|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[Double[]]`|false   |named   |true (ByPropertyName)|



---
#### **ArcRotation**

The Arc Rotation along the X axis.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Object]`|false   |named   |true (ByPropertyName)|



---
#### **Large**

If set, the arc will be considered a "Large arc"






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|



---
#### **Sweep**

If set, the arc will sweep the circle.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|



---
#### **End**

The end point of the arc.
If only one value is provided, it will be used as the X and Y coordinate.






|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[Double[]]`|false   |named   |true (ByPropertyName)|



---
### Syntax
```PowerShell
SVG.ArcPath [-Start <Double[]>] [-Radius <Double[]>] [-ArcRotation <Object>] [-Large] [-Sweep] [-End <Double[]>] [<CommonParameters>]
```
---
