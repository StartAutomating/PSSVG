SVG.Arc
-------
### Synopsis
Draws an SVG arc.

---
### Description

Draws an SVG arc path.

---
### Related Links
* [SVG.Path](SVG.Path.md)



---
### Parameters
#### **StartX**

The X-starting point of the arc.
If -StartY point is not provided, -StartY will be -StartX






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Double]`|false   |named   |true (ByPropertyName)|



---
#### **StartY**

The Y-starting point of the arc.
If -StartX point is not provided, -StartX will be -StartY






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Double]`|false   |named   |true (ByPropertyName)|



---
#### **RadiusX**

The X-radius of the arc.
If -RadiusX is not provided, -RadiusY will be -RadiusX






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Double]`|false   |named   |true (ByPropertyName)|



---
#### **RadiusY**

The Y-radius of the arc.
If -RadiusY is not provided, -RadiusX will be -RadiusY






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Double]`|false   |named   |true (ByPropertyName)|



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
#### **EndX**

The end X point of the arc.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Double]`|false   |named   |true (ByPropertyName)|



---
#### **EndY**

The end Y point of the arc.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Double]`|false   |named   |true (ByPropertyName)|



---
### Syntax
```PowerShell
SVG.Arc [-StartX <Double>] [-StartY <Double>] [-RadiusX <Double>] [-RadiusY <Double>] [-ArcRotation <Object>] [-Large] [-Sweep] [-EndX <Double>] [-EndY <Double>] [<CommonParameters>]
```
---
