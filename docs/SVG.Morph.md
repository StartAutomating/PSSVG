SVG.Morph
---------

### Synopsis
Morphs attributes.

---

### Description

Morphs attributes from one value into subsequent values.    
If a path or a polygon has the same number of points, it will morph from one to the other.    
If a path or a polygon has a different number of points, it will switch between the two.    
If multiple items are piped into this command, it will morph each one in turn.    
If only two items are piped in, it will morph from the first to the second.

---

### Examples
> EXAMPLE 1

```PowerShell
SVG -Viewbox 200 @(    
    SVG.Morph -RepeatCount indefinite -Duration .84 @(    
        SVG.Rose -Frequency 4 -Radius 100 -Stroke currentColor -Rotate 45    
        SVG.Rose -Frequency 2 -Radius 100 -Stroke currentColor -Rotate 180    
        SVG.Rose -Frequency 4 -Radius 100 -Stroke currentColor -Rotate 45    
    )                        
) -OutputPath .\RoseMorph.svg
```
> EXAMPLE 2

```PowerShell
SVG -Viewbox 200 @(    
    @(    
        SVG.Arbelos -Radius 100 -Stroke currentColor -Midpoint 0.3    
        SVG.Arbelos -Radius 50 -CenterX 100 -CenterY 100 -Stroke currentColor -Midpoint 0.7 -Rotate 90    
        SVG.Arbelos -Radius 100 -Stroke currentColor -Midpoint .3     
    ) |    
        SVG.Morph -RepeatCount indefinite -Duration 1.1    
) -OutputPath .\ArbelosMorph.svg
```
> EXAMPLE 3

```PowerShell
SVG -Viewbox 200 @(    
    @(    
        SVG -Viewbox 100 @(    
            SVG.Rect -Width 100 -Height 100 -Fill currentColor    
        ) -X 50% -Y 50%    
        svg -viewbox 200    
        svg -viewbox 100    
    ) |    
        SVG.Morph -RepeatCount indefinite -Duration 1.1    
) -OutputPath .\ViewBoxMorph.svg
```

---

### Parameters
#### **AttributeName**
The names of one or more attributes to morph.    
If none are provided, the command will attempt to morph any `points`, `d`, or `viewbox` attributes.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

---

### Syntax
```PowerShell
SVG.Morph [-AttributeName <String[]>] [<CommonParameters>]
```
