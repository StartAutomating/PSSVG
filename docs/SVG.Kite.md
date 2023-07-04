SVG.Kite
--------




### Synopsis
Generates a Kite in SVG



---


### Description

Generates a Kite in SVG.    
A Kite is generated with a -Radius and an -InnerRadius and an -OuterRadius.



---


### Examples
#### EXAMPLE 1
```PowerShell
SVG -ViewBox 2,2 (    
    SVG.Kite -Fill "#4488ff"     
) -OutputPath .\Kite.svg
```

#### EXAMPLE 2
```PowerShell
SVG -ViewBox 200,200 (    
    SVG.Kite -Fill "#4488ff" -CenterX 100 -CenterY 100 -Radius 33 -InnerRadius 25 -OuterRadius 66     
) -OutputPath .\Ready-To-Fly-Kite.svg
```

#### EXAMPLE 3
```PowerShell
SVG -ViewBox 2,2 (    
    SVG.Kite -Fill "#4488ff" @(    
        SVG.animate -AttributeName d -Values (    
            @(    
                SVG.Kite -Rotate 0    
                SVG.Kite -Rotate 90    
                SVG.Kite -Rotate 180    
                SVG.Kite -Rotate 270                            
            ).D -join ';'    
        ) -AttributeType XML -Dur 2s -RepeatCount indefinite -CalcMode linear    
    )     
) -OutputPath .\Kite-Morph.svg
```



---


### Parameters
#### **Rotate**

The initial rotation of the rhombus.






|Type      |Required|Position|PipelineInput        |Aliases |
|----------|--------|--------|---------------------|--------|
|`[Double]`|false   |named   |true (ByPropertyName)|Rotation|



#### **CenterX**

The center X coordinate for the kite.






|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[Double]`|false   |named   |true (ByPropertyName)|CX     |



#### **CenterY**

The center Y coordinate for the kite.






|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[Double]`|false   |named   |true (ByPropertyName)|CY     |



#### **Radius**

The radius of the kite.    
This is the distance to either constant side of the kite.






|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[Double]`|false   |named   |true (ByPropertyName)|R      |



#### **InnerRadius**

The inner radius of the kite.    
This is the distance from the center of the kite to the top.






|Type      |Required|Position|PipelineInput        |Aliases        |
|----------|--------|--------|---------------------|---------------|
|`[Double]`|false   |named   |true (ByPropertyName)|IR<br/>InRadius|



#### **OuterRadius**

The outer radius of the kite.    
This is the distance from the center of the kite to the bottom.






|Type      |Required|Position|PipelineInput        |Aliases         |
|----------|--------|--------|---------------------|----------------|
|`[Double]`|false   |named   |true (ByPropertyName)|OR<br/>OutRadius|





---


### Syntax
```PowerShell
SVG.Kite [-Rotate <Double>] [-CenterX <Double>] [-CenterY <Double>] [-Radius <Double>] [-InnerRadius <Double>] [-OuterRadius <Double>] [<CommonParameters>]
```
