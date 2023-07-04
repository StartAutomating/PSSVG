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



* [SVG.Star](SVG.Star.md)





---


### Parameters
#### **SideCount**

The number of sides in the polygon    
This is also aliased to -PointCount for consistent use with SVG.Star.






|Type     |Required|Position|PipelineInput        |Aliases                                                                |
|---------|--------|--------|---------------------|-----------------------------------------------------------------------|
|`[Int32]`|false   |1       |true (ByPropertyName)|NumberOfSides<br/>SC<br/>Sides<br/>NumSides<br/>PC<br/>D<br/>PointCount|



#### **Rotate**

The initial rotation of the polygon.






|Type      |Required|Position|PipelineInput        |Aliases |
|----------|--------|--------|---------------------|--------|
|`[Double]`|false   |named   |true (ByPropertyName)|Rotation|



#### **CenterX**

The center X coordinate for the polygon.






|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[Double]`|false   |named   |true (ByPropertyName)|CX     |



#### **CenterY**

The center Y coordinate for the polygon.






|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[Double]`|false   |named   |true (ByPropertyName)|CY     |



#### **Radius**

The radius of the polygon.






|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[Double]`|false   |named   |true (ByPropertyName)|R      |





---


### Syntax
```PowerShell
SVG.ConvexPolygon [[-SideCount] <Int32>] [-Rotate <Double>] [-CenterX <Double>] [-CenterY <Double>] [-Radius <Double>] [<CommonParameters>]
```
