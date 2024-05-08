SVG.WavyCircle
--------------

### Synopsis
Creates a circle with a wavy edge in SVG.

---

### Description

Creates a circle with a wavy edge in SVG by drawing a circle and then adding a sine wave to the radius.

---

### Examples
> EXAMPLE 1

```PowerShell
SVG @(    
    SVG.WavyCircle -Radius 40 -Amplitude 10 -Frequency 8 -CenterX 50 -CenterY 50 -Fill transparent -Stroke black    
) -ViewBox 100,100 -OutputPath .\WavyCircle.svg
```

---

### Parameters
#### **Radius**
The radius of the circle.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[Double]`|false   |1       |true (ByPropertyName)|R      |

#### **Amplitude**
The amplitude of the wave.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[Double]`|false   |2       |true (ByPropertyName)|A      |

#### **Frequency**
The number of oscillations that should occur in the circle.    
(while it is not a side count, it allows this function to work well with stars and convex polygons)

|Type      |Required|Position|PipelineInput        |Aliases  |
|----------|--------|--------|---------------------|---------|
|`[Double]`|false   |3       |true (ByPropertyName)|SideCount|

#### **Rotate**
The initial rotation of the circle.

|Type      |Required|Position|PipelineInput        |Aliases |
|----------|--------|--------|---------------------|--------|
|`[Double]`|false   |4       |true (ByPropertyName)|Rotation|

#### **RevolutionCount**
The number of revolutions to draw.    
By default, one.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Double]`|false   |5       |true (ByPropertyName)|

#### **CenterX**
The center X coordinate for the circle.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Double]`|false   |6       |true (ByPropertyName)|

#### **CenterY**
The center Y coordinate for the circle.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Double]`|false   |7       |true (ByPropertyName)|

---

### Syntax
```PowerShell
SVG.WavyCircle [[-Radius] <Double>] [[-Amplitude] <Double>] [[-Frequency] <Double>] [[-Rotate] <Double>] [[-RevolutionCount] <Double>] [[-CenterX] <Double>] [[-CenterY] <Double>] [<CommonParameters>]
```
