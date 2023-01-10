SVG.Curve
---------
### Synopsis
Draws an SVG curve.

---
### Description

Draws an SVG curve path.

---
### Related Links
* [SVG.Path](SVG.Path.md)



---
### Examples
#### EXAMPLE 1
```PowerShell
-OutputPath .\Curves.svg @(
    =<svg.Curve> -Start 10 -ControlPoint 15,5,20,15  -End 30,30 -fill transparent -stroke black
) -viewbox 50, 50
```

---
### Parameters
#### **ControlPoint**




|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[Double[]]`|false   |named   |true (ByPropertyName)|



---
#### **Start**

The X-starting point of the curve.
If -StartY point is not provided, -StartY will be -StartX






|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[Double[]]`|false   |named   |true (ByPropertyName)|



---
#### **End**

The end point of the curve.






|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[Double[]]`|false   |named   |true (ByPropertyName)|



---
#### **Smooth**




|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|



---
#### **MultiQuadratic**




|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|



---
#### **Quadratic**




|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|



---
### Syntax
```PowerShell
SVG.Curve [-ControlPoint <Double[]>] [-Start <Double[]>] [-End <Double[]>] [-Smooth] [-MultiQuadratic] [-Quadratic] [<CommonParameters>]
```
---
