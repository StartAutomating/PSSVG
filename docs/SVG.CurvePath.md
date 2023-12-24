SVG.CurvePath
-------------

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
> EXAMPLE 1

```PowerShell
svg -Viewbox 50 @(    
    svg.CurvePath -Start 10 -ControlPoint 15,5,20,40  -End 30 -fill transparent -stroke black    
) -OutputPath .\Curve.svg
```
> EXAMPLE 2

```PowerShell
svg -Viewbox 100 (        
    svg.CurvePath -Start 50 -End 10 -Angle 45 -Multiquadratic |    
        svg.CurvePath -End 10 -Angle -45 -Multiquadratic |    
        svg.CurvePath -End 20 -Angle 50 -Multiquadratic |    
        svg.CurvePath -End 20 -Angle -50 -Stroke '#4488ff' -Fill transparent -Multiquadratic    
) -OutputPath .\ZigZagCurvePath.svg
```

---

### Parameters
#### **ControlPoint**
One or two control points.    
If two control points are provided, it will be assumed to be a Bezier curve.    
If only one control point is provided, it will be assumed to be a Quadratic curve.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[Double[]]`|false   |1       |true (ByPropertyName)|

#### **Start**
The start point of the curve.    
If only one value is provided, it will be used as the X and Y coordinate.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[Double[]]`|false   |2       |true (ByPropertyName)|

#### **End**
The end point of the curve.    
If only one value is provided, it will be used as the X and Y coordinate.

|Type        |Required|Position|PipelineInput        |Aliases |
|------------|--------|--------|---------------------|--------|
|`[Double[]]`|false   |3       |true (ByPropertyName)|Distance|

#### **Angle**
An optional angle.    
If an `-Angle` is provided and `-End` is a single number, it will be treated as a `-Distance`.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Double]`|false   |4       |true (ByPropertyName)|

#### **Smooth**
If set, will attempt to draw a smooth bezier curve.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|

#### **MultiQuadratic**
If set, will draw a multi-quadratic line.    
This can only be used if preceeded by another curve.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|

#### **Quadratic**
If set, will draw a quadratic bezier curve.    
This is the default, as it only requires a single control point.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|

#### **Close**
If set, will close the path after this element.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|

---

### Syntax
```PowerShell
SVG.CurvePath [[-ControlPoint] <Double[]>] [[-Start] <Double[]>] [[-End] <Double[]>] [[-Angle] <Double>] [-Smooth] [-MultiQuadratic] [-Quadratic] [-Close] [<CommonParameters>]
```
