SVG.Rhombus
-----------




### Synopsis
Generates a Rhombus in SVG



---


### Description

Generates a Rhombus in SVG.    
A Rhombus is generated with a -Radius and an -InRadius.



---


### Examples
#### EXAMPLE 1
```PowerShell
SVG -ViewBox 2,2 (    
    SVG.Rhombus -Fill "#4488ff"     
) -OutputPath .\Rhombus.svg
```

#### EXAMPLE 2
```PowerShell
SVG -ViewBox 2,2 (    
    SVG.Rhombus -Fill "#4488ff" @(    
        SVG.animate -AttributeName d -Values (    
            @(    
                SVG.Rhombus -Rotate 0    
                SVG.Rhombus -Rotate 90    
                SVG.Rhombus -Rotate 180    
                SVG.Rhombus -Rotate 270                            
            ).D -join ';'    
        ) -AttributeType XML -Dur 2s -RepeatCount indefinite -CalcMode spline    
    )     
) -OutputPath .\Rhombus-Morph.svg
```



---


### Parameters
#### **Rotate**

The initial rotation of the rhombus.






|Type      |Required|Position|PipelineInput        |Aliases |
|----------|--------|--------|---------------------|--------|
|`[Double]`|false   |named   |true (ByPropertyName)|Rotation|



#### **CenterX**

The center X coordinate for the rhombus.






|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[Double]`|false   |named   |true (ByPropertyName)|CX     |



#### **CenterY**

The center Y coordinate for the rhombus.






|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[Double]`|false   |named   |true (ByPropertyName)|CY     |



#### **Radius**

The out radius of the rhombus.






|Type      |Required|Position|PipelineInput        |Aliases |
|----------|--------|--------|---------------------|--------|
|`[Double]`|false   |named   |true (ByPropertyName)|R<br/>OR|



#### **InRadius**

The in radius of the rhombus.






|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[Object]`|false   |named   |true (ByPropertyName)|IR     |





---


### Syntax
```PowerShell
SVG.Rhombus [-Rotate <Double>] [-CenterX <Double>] [-CenterY <Double>] [-Radius <Double>] [-InRadius <Object>] [<CommonParameters>]
```
