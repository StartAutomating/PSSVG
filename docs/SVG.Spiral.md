SVG.Spiral
----------

### Synopsis
Draws an SVG Spiral

---

### Description

Creates an SVG spiral as an SVG path.

---

### Related Links
* [SVG.path](SVG.path.md)

---

### Parameters
#### **NumSteps**
The number of steps in the spiral

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[UInt32]`|false   |1       |true (ByPropertyName)|

#### **Theta**
The value for theta

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Double]`|false   |2       |true (ByPropertyName)|

#### **Alpha**
The value for alpha (not to be confused with transparency, that's -Opacity)

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Double]`|false   |3       |true (ByPropertyName)|

#### **ScaleX**
The scale of the spiral along the horizontal axis

|Type      |Required|Position|PipelineInput        |Aliases        |
|----------|--------|--------|---------------------|---------------|
|`[Double]`|false   |4       |true (ByPropertyName)|ScaleHorizontal|

#### **ScaleY**
The scale of the spiral along the vertical axis

|Type      |Required|Position|PipelineInput        |Aliases      |
|----------|--------|--------|---------------------|-------------|
|`[Double]`|false   |5       |true (ByPropertyName)|ScaleVertical|

---

### Syntax
```PowerShell
SVG.Spiral [[-NumSteps] <UInt32>] [[-Theta] <Double>] [[-Alpha] <Double>] [[-ScaleX] <Double>] [[-ScaleY] <Double>] [<CommonParameters>]
```
