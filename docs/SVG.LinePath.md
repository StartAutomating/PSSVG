SVG.LinePath
------------

### Synopsis
Draws an SVG Line Path.

---

### Description

Draws a line in SVG Path Syntax.

---

### Related Links
* [SVG.Path](SVG.Path.md)

---

### Examples
> EXAMPLE 1

```PowerShell
-Viewbox 100, 100 (    
    =<svg.LinePath> -Start 50 -End 75 -Stroke black    
) -OutputPath .\Line1.svg
```
> EXAMPLE 2

```PowerShell
-Viewbox 60, 60 (    
    =<svg.LinePath> -Start 10 -Horizontal -End 50 -Stroke black -Fill transparent |    
        =<svg.LinePath> -Vertical -End 50 |    
        =<svg.LinePath> -Horizontal -End 10 |    
        =<svg.LinePath> -Vertical -End 10 -Close    
) -OutputPath .\LineBox.svg
```

---

### Parameters
#### **Start**
The Starting point of the arc.    
If only one value is provided, it will be used as the X and Y coordinate.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[Double[]]`|false   |1       |true (ByPropertyName)|

#### **Horizontal**
If set, will draw a horizontal line.    
Only the first -End point will be evaluated.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|

#### **Vertical**
If set, will draw a vertical line.    
-LineLength must also be provided.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|

#### **Close**
If set, will close the path.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|

#### **End**
The end point of the line, or it's length    
If this is provided, a line will be drawn to this point

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[Double[]]`|false   |2       |true (ByPropertyName)|

---

### Syntax
```PowerShell
SVG.LinePath [[-Start] <Double[]>] [-Horizontal] [-Vertical] [-Close] [[-End] <Double[]>] [<CommonParameters>]
```
