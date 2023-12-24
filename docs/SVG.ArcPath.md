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
> EXAMPLE 1

```PowerShell
svg -Viewbox 100 (    
    svg.ArcPath -Start 50 -End 75 -Radius 25 -Large    
) -OutputPath .\arc-1.svg
```
> EXAMPLE 2

```PowerShell
svg -Viewbox 100 (        
    svg.ArcPath -Start 50 -Radius 10 -End 10 -Angle 45  |    
        svg.ArcPath -End 10 -Radius 20 -Angle -45  |    
        svg.ArcPath -End 20 -Radius 30 -Angle 50  |    
        svg.ArcPath -End 20 -Radius 40 -Angle -50 -Stroke '#4488ff' -Fill transparent    
) -OutputPath .\ZigZagArcPath.svg
```

---

### Parameters
#### **Start**
The Starting point of the arc.    
If only one value is provided, it will be used as the X and Y coordinate.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[Double[]]`|false   |1       |true (ByPropertyName)|

#### **Radius**
The radius of the arc.    
If only one value is provided, it will be used as the X and Y coordinate.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[Double[]]`|false   |2       |true (ByPropertyName)|

#### **ArcRotation**
The Arc Rotation along the X axis.

|Type      |Required|Position|PipelineInput        |Aliases      |
|----------|--------|--------|---------------------|-------------|
|`[Object]`|false   |3       |true (ByPropertyName)|XAxisRotation|

#### **Large**
If set, the arc will be considered a "Large arc"

|Type      |Required|Position|PipelineInput        |Aliases                |
|----------|--------|--------|---------------------|-----------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|IsLargeArc<br/>LargeArc|

#### **Sweep**
If set, the arc will sweep the circle.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|

#### **End**
The end point of the arc.    
If only one value is provided without an `-Angle`, it will be used as the X and Y coordinate.    
If only one value is provided an an `-Angle` is provided, a single value will be treated as a `-Distance`.

|Type        |Required|Position|PipelineInput        |Aliases |
|------------|--------|--------|---------------------|--------|
|`[Double[]]`|false   |4       |true (ByPropertyName)|Distance|

#### **Angle**
An optional angle.    
If an `-Angle` is provided and `-End` is a single number, it will be treated as a `-Distance`.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Double]`|false   |5       |true (ByPropertyName)|

#### **Close**
If set, will close the path after this element.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|

---

### Syntax
```PowerShell
SVG.ArcPath [[-Start] <Double[]>] [[-Radius] <Double[]>] [[-ArcRotation] <Object>] [-Large] [-Sweep] [[-End] <Double[]>] [[-Angle] <Double>] [-Close] [<CommonParameters>]
```
