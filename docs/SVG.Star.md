SVG.Star
--------




### Synopsis
SVG Star



---


### Description

Creates a Star of an number of points.



---


### Related Links
* [SVG.Path](SVG.Path.md)





---


### Parameters
#### **PointCount**

The number of sides in the polygon






|Type     |Required|Position|PipelineInput        |Aliases      |
|---------|--------|--------|---------------------|-------------|
|`[Int32]`|false   |1       |true (ByPropertyName)|PC<br/>Points|



#### **Rotate**

The initial rotation of the polygon.






|Type      |Required|Position|PipelineInput|Aliases |
|----------|--------|--------|-------------|--------|
|`[Double]`|false   |2       |false        |Rotation|



#### **CenterX**

The center X coordinate for the polygon.






|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[Double]`|false   |3       |false        |CX     |



#### **CenterY**

The center Y coordinate for the polygon.






|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[Double]`|false   |4       |false        |CY     |



#### **Radius**

The radius of the polygon.






|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[Double]`|false   |5       |false        |R      |





---


### Syntax
```PowerShell
SVG.Star [[-PointCount] <Int32>] [[-Rotate] <Double>] [[-CenterX] <Double>] [[-CenterY] <Double>] [[-Radius] <Double>] [<CommonParameters>]
```
