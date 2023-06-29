SVG.ConvexPolygon
-----------------




### Synopsis
SVG Convex Polygon



---


### Description

Creates a Regular Convex Polygon of an number of sides.



---


### Related Links
* [SVG.Path](SVG.Path.md)





---


### Parameters
#### **SideCount**

The number of sides in the polygon






|Type     |Required|Position|PipelineInput        |Aliases                                                                |
|---------|--------|--------|---------------------|-----------------------------------------------------------------------|
|`[Int32]`|false   |1       |true (ByPropertyName)|NumberOfSides<br/>SC<br/>Sides<br/>NumSides<br/>PC<br/>D<br/>PointCount|



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
SVG.ConvexPolygon [[-SideCount] <Int32>] [[-Rotate] <Double>] [[-CenterX] <Double>] [[-CenterY] <Double>] [[-Radius] <Double>] [<CommonParameters>]
```
