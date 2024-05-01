SVG.Rose
--------

### Synopsis
Draws a Rose in SVG.

---

### Description

Draws a [Rose](https://en.wikipedia.org/wiki/Rose_(mathematics)) in SVG.

---

### Examples
> EXAMPLE 1

```PowerShell
SVG @(    
    SVG.Rose -Amplitude 50 -Frequency 3 -CenterX 50 -CenterY 50 -RevolutionCount 2 -Fill transparent -Stroke black    
) -ViewBox 100,100 -OutputPath .\Trifolium.svg
```

---

### Parameters
#### **Radius**
The radius of the rose.    
This is the variable `a` in the equation r = a * cos(kθ).

|Type      |Required|Position|PipelineInput        |Aliases              |
|----------|--------|--------|---------------------|---------------------|
|`[Double]`|false   |1       |true (ByPropertyName)|Amplitude<br/>a<br/>r|

#### **Frequency**
The frequency of the rose.    
This is the variable `k` in the equation r = a * cos(kθ).

|Type      |Required|Position|PipelineInput        |Aliases    |
|----------|--------|--------|---------------------|-----------|
|`[Double]`|false   |2       |true (ByPropertyName)|Angle<br/>k|

#### **RevolutionCount**
The number of revolutions to draw.    
By default, one.    
This is not the number of petals, but the number of times the rose is drawn.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Double]`|false   |3       |true (ByPropertyName)|

#### **Reverse**
If set, will draw the rose in reverse.

|Type      |Required|Position|PipelineInput        |Aliases         |
|----------|--------|--------|---------------------|----------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|CounterClockwise|

#### **Rotate**
The initial rotation of the rhombus.

|Type      |Required|Position|PipelineInput        |Aliases |
|----------|--------|--------|---------------------|--------|
|`[Double]`|false   |4       |true (ByPropertyName)|Rotation|

#### **Center**
The center point.    
If only one coordinate is provided, it will be duplicated.    
If more than two coordinates are provided, it will be ignored.    
If either -CenterX or -CenterY is provided, they will be used instead.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[Double[]]`|false   |5       |true (ByPropertyName)|

#### **CenterX**
The center X coordinate for the rose.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Double]`|false   |6       |true (ByPropertyName)|

#### **CenterY**
The center Y coordinate for the rose.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Double]`|false   |7       |true (ByPropertyName)|

---

### Syntax
```PowerShell
SVG.Rose [[-Radius] <Double>] [[-Frequency] <Double>] [[-RevolutionCount] <Double>] [-Reverse] [[-Rotate] <Double>] [[-Center] <Double[]>] [[-CenterX] <Double>] [[-CenterY] <Double>] [<CommonParameters>]
```
