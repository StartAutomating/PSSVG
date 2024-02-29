Invoke-SVG
----------

### Synopsis
Invoke-SVG, Fractal Generation of SVG

---

### Description

Generates a SVG fractally by repeatedly invoking a `-Command` and `-Change`ing `-Parameter`s for N `-Repetitions`

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
> EXAMPLE 7

```PowerShell
1..100 | %{ $_; $_ } | Invoke-SVG
```
> EXAMPLE 8

```PowerShell
@(5,90,5,180,5,270,5,0) | %{ $_; $_ } | Invoke-SVG -CoordinateSystem Polar -Viewbox 100 -Fill transparent -stroke black -strokewidth 1%
```

---

### Parameters
#### **Command**
The command for the fractal.    
This can be the name of a command within PSSVG, or a ScriptBlock.

|Type      |Required|Position|PipelineInput        |Aliases    |
|----------|--------|--------|---------------------|-----------|
|`[String]`|false   |1       |true (ByPropertyName)|ScriptBlock|

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

#### **CoordinateSystem**
The coordinate system to use.    
By default, cartesian.    
Any -Command is likely to return a full SVG element, but may also return a series of points    
If a series of points is provided, this will determine how they will be interpreted.    
Note: using a coordinate system will require that a -ViewBox is provided, and will be based off of the center of that viewbox.
Valid Values:

* Cartesian
* Polar

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |5       |false        |

#### **CurvePoint**
If set, will interpret each point as a curve, rather than a straight line.

|Type      |Required|Position|PipelineInput        |Aliases    |
|----------|--------|--------|---------------------|-----------|
|`[Switch]`|false   |named   |true (ByPropertyName)|CurvePoints|

---

### Notes
The -Command can be a specific command within this module or a `[ScriptBlock]`.    
Because this command can accept a [ScriptBlock] parameter that runs without any bounding, it is unsafe to expose Invoke-SVG as a web service.

---

### Syntax
```PowerShell
Invoke-SVG [[-Command] <String>] [[-RepeatCount] <Int32>] [[-Parameter] <IDictionary>] [[-Change] <IDictionary>] [[-CoordinateSystem] <String>] [-CurvePoint] [<CommonParameters>]
```
