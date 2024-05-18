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
> EXAMPLE 2

```PowerShell
SVG @(    
    SVG.defs @(    
        SVG.marker -id 'Head' -ViewBox 100,100 @(    
            svg.polygon -Points (@(    
                "30,0"    
                "35,0"    
                "60,50"    
                "15,100"    
                "12.5,100"    
                "55,50"    
            ) -join ' ') -Fill '#4488ff' -Class 'foreground-fill'    
        ) -MarkerWidth 75 -MarkerHeight 75 -RefX 50 -RefY 50 -Orient 'auto-start-reverse'    
    )                
    $w = SVG.WavyCircle -Radius 90 -Amplitude 10 -Frequency 4.2 -RevolutionCount 8 -CenterX 100 -CenterY 100 -Fill transparent -Stroke black -MarkerStart 'url(#Head)' -MarkerEnd 'url(#Head)' -MarkerMid 'url(#Head)'    
    $w    
    SVG.circle -r 1 -Fill red (    
       SVG.animateMotion -Dur 30s -RepeatCount 'indefinite' -Path $w.D    
    )    
) -OutputPath .\OddRevolutions.svg -viewbox 200
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
