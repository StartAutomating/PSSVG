SVG.PolarEquation
-----------------

### Synopsis
Draws a polar equation in SVG.

---

### Description

Draws a polar formula in SVG.    
The equation used to draw the polar formula and all relevant parameters are stored in the Data attributes of the path.

---

### Examples
> EXAMPLE 1

```PowerShell
SVG -Viewbox 200 -Width 100% -Height 100% @(    
    SVG.PolarEquation -Radius 100 -Equation { $Radius }    
) -OutputPath .\PolarCircle.svg
```
> EXAMPLE 2

```PowerShell
SVG -Viewbox 200 -Width 100% -Height 100% @(    
    SVG.PolarEquation -Radius 100 -Equation { $Radius * [Math]::Cos($Frequency * $Step * $Radian) } -Rotate 15 -Data @{Frequency=3.0}    
) -OutputPath .\PolarRose.svg
```
Cartoid    

```PowerShell
SVG -Viewbox 200 @(    
    SVG.PolarEquation -Radius 100 -Equation {    
        $Radius * [Math]::sin(    
            ($Step * $Radian) / 2    
        )                                    
    }    
) -OutputPath .\PolarCartoid.svg
```
Lemniscate    

```PowerShell
SVG -Viewbox 200 @(    
    SVG.PolarEquation -Radius 100 -Equation {    
        $Radius/2 * [Math]::Pow(    
            [Math]::Cos($StepRadian), 4      
        )                                    
    }    
) -OutputPath .\PolarLemniscate.svg
```
> EXAMPLE 5

```PowerShell
SVG -ViewBox 200 @(                
    @(    
        # Because any polar equation uses an equal number of points, we can morph between them.    
        SVG.PolarEquation -Radius 100 -Equation { $Radius }    
        SVG.PolarEquation -Radius 100 -Equation { $Radius * [Math]::Cos($Frequency * $Step * $Radian) } -Rotate 15 -Data @{Frequency=3.0}    
        SVG.PolarEquation -Radius 100 -Equation { $Radius }    
        SVG.PolarEquation -Radius 100 -Equation { $Radius/2 * [Math]::Pow( [Math]::Cos($StepRadian), 4 ) } -Rotate 45    
        SVG.PolarEquation -Radius 100 -Equation { $Radius }            
        SVG.PolarEquation -Radius 100 -Equation { $Radius * [Math]::Cos($Frequency * $Step * $Radian) } -Rotate 15 -Data @{Frequency=6.0}    
        SVG.PolarEquation -Radius 100 -Equation { $Radius/2 * [Math]::Pow( [Math]::Sin($StepRadian), 4 ) } -Rotate 90    
        SVG.PolarEquation -Radius 100 -Equation { $Radius }    
        SVG.PolarEquation -Radius 100 -Equation { $Radius * [Math]::Cos($Frequency * $Step * $Radian) } -Rotate -15 -Data @{Frequency=9.0}    
        SVG.PolarEquation -Radius 100 -Equation { $Radius }    
    ) | SVG.Morph -Dur 4.2 -RepeatCount indefinite    
) -OutputPath .\PolarMorph.svg
```

---

### Parameters
#### **Radius**
The radius of the polar path

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[Double]`|false   |1       |true (ByPropertyName)|R      |

#### **CenterX**
The frequency of the polar path.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[Double]`|false   |2       |true (ByPropertyName)|CX     |

#### **CenterY**
The frequency of the polar path.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[Double]`|false   |3       |true (ByPropertyName)|CY     |

#### **RevolutionCount**
The number of revolutions to draw.    
By default, one.    
This is not the number of petals, but the number of times the rose is drawn.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Double]`|false   |4       |true (ByPropertyName)|

#### **Reverse**
If set, will draw the rose in reverse.

|Type      |Required|Position|PipelineInput        |Aliases         |
|----------|--------|--------|---------------------|----------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|CounterClockwise|

#### **Rotate**
The initial rotation of the path.

|Type      |Required|Position|PipelineInput        |Aliases |
|----------|--------|--------|---------------------|--------|
|`[Double]`|false   |5       |true (ByPropertyName)|Rotation|

#### **Equation**
The equation to draw the polar path.    
For simplicity, translatability, and security, only Math expressions are allowed.    
No loops are allowed, no commands are allowed, no assignments are allowed.

|Type           |Required|Position|PipelineInput|Aliases|
|---------------|--------|--------|-------------|-------|
|`[ScriptBlock]`|false   |6       |false        |Formula|

---

### Syntax
```PowerShell
SVG.PolarEquation [[-Radius] <Double>] [[-CenterX] <Double>] [[-CenterY] <Double>] [[-RevolutionCount] <Double>] [-Reverse] [[-Rotate] <Double>] [[-Equation] <ScriptBlock>] [<CommonParameters>]
```
