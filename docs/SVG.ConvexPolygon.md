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



#### **ShapeName**

The formal name of the shape, for example Pentagon.    
Note, for ease of calculation, only shapes with sides between three and thirty accept their names.    
(aka, No Hectagons or Megagons)



Valid Values:

* Triangle
* Rectangle
* Pentagon
* Hexagon
* Heptagon
* Octagon
* Nonagon
* Decagon
* Decagon
* Hendecagon
* Dodecagon
* Tridecagon
* Tetradecagon
* Pentadecagon
* Hexadecagon
* Heptadecagon
* Octadecagon
* Enneadecagon
* Icosagon
* Icosikaihenagon
* Icosikaidigon
* Icositrigon
* Icositetragon
* Icosikaipentagon
* Icosikaihexagon
* Icosikaiheptagon
* Icosikaioctagon
* Icosikaienneagon
* Triacontagon






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|



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
SVG.ConvexPolygon [[-SideCount] <Int32>] [-ShapeName <String>] [-Rotate <Double>] [-CenterX <Double>] [-CenterY <Double>] [-Radius <Double>] [<CommonParameters>]
```
