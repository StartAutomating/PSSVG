Invoke-SVG
----------

### Synopsis
Invoke-SVG, Fractal Generation of SVG

---

### Description

Generates a SVG fractally by repeatedly invoking commands with slightly different parameters.

---

### Examples
> EXAMPLE 1

```PowerShell
SVG.Fractal -Command SVG.Star -RepeatCount 4 -Parameter @{        
    Stroke = 'black'        
    Fill = 'transparent'    
    Radius = 1        
    StrokeWidth = '0.1%'        
} -Change @{        
    Radius = -0.1        
} -Viewbox 3 -OutputPath .\Fractal1.svg
```
> EXAMPLE 2

```PowerShell
SVG.Fractal -Command SVG.Star -RepeatCount 5 -Parameter @{        
    Stroke = 'black'        
    Fill = 'transparent'    
    Radius = 1        
    StrokeWidth = '0.1%'        
} -Change @{        
    Radius = '/5'        
} -Viewbox 3 -OutputPath .\Fractal2.svg
```
> EXAMPLE 3

```PowerShell
SVG.Fractal -Command SVG.Star -RepeatCount 5 -Parameter @{        
    Stroke = 'black'        
    Fill = 'transparent'    
    Radius = 1        
    StrokeWidth = '0.1%'        
} -Change @{        
    Radius = '*4/5'        
} -Viewbox 3 -OutputPath .\Fractal3.svg
```
> EXAMPLE 4

```PowerShell
SVG.Fractal -Command SVG.Pentagon -RepeatCount 5 -Parameter @{        
    Stroke = 'black'        
    Fill = 'transparent'    
    Radius = 1    
    StrokeWidth = '0.1%'    
    Rotate = 0    
} -Change @{        
    Radius = '*4/5'    
    Rotate = 360/10    
} -Viewbox 3 -OutputPath .\Fractal4.svg
```
> EXAMPLE 5

```PowerShell
SVG.Fractal -Command SVG.Hexagon -RepeatCount 6 -Parameter @{        
    Stroke = 'black'        
    Fill = 'transparent'    
    Radius = 1    
    StrokeWidth = '0.1%'    
    Rotate = 0    
} -Change @{        
    Radius = '/7/6'    
    Rotate = 360/12    
} -Viewbox 3 -OutputPath .\Fractal5.svg
```
> EXAMPLE 6

```PowerShell
SVG.Fractal -Command SVG.Octagon -RepeatCount 8 -Parameter @{        
    Stroke = 'black'        
    Fill = 'transparent'    
    Radius = 1    
    StrokeWidth = '0.1%'    
    Rotate = 0    
} -Change @{        
    Radius = '/8/11'    
    Rotate = 360/16    
} -Viewbox 3 -OutputPath .\Fractal8.svg
```

---

### Parameters
#### **Command**
The command for the fractal.    
This can be the name of a command within PSSVG, or a ScriptBlock.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |1       |true (ByPropertyName)|

#### **RepeatCount**
The number of times the command should be repeated.  By default, 1.

|Type     |Required|Position|PipelineInput        |Aliases                                    |
|---------|--------|--------|---------------------|-------------------------------------------|
|`[Int32]`|false   |2       |true (ByPropertyName)|IterationCount<br/>Repetions<br/>Iterations|

#### **Parameter**
The parameters to the command.

|Type           |Required|Position|PipelineInput        |Aliases   |
|---------------|--------|--------|---------------------|----------|
|`[IDictionary]`|false   |3       |true (ByPropertyName)|Parameters|

#### **Change**
Any changes to to the command parameters.    
Numeric values will be added    
Boolean values will be toggled    
Lists of values will be iterated over    
ScriptBlocks will be evaluated.

|Type           |Required|Position|PipelineInput        |Aliases|
|---------------|--------|--------|---------------------|-------|
|`[IDictionary]`|false   |4       |true (ByPropertyName)|Changes|

---

### Syntax
```PowerShell
Invoke-SVG [[-Command] <String>] [[-RepeatCount] <Int32>] [[-Parameter] <IDictionary>] [[-Change] <IDictionary>] [<CommonParameters>]
```
