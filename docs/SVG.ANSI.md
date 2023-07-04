SVG.ANSI
--------




### Synopsis
SVG ANSI Text



---


### Description

Renders Text containing ANSI escape sequences as SVG.



---


### Related Links
* [SVG.svg](SVG.svg.md)





---


### Parameters
#### **LineSpacing**

The spacing between lines, in font-emphasis.    
By default, 1.2.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Double]`|false   |1       |true (ByPropertyName)|



#### **ForegroundColor**

The foreground color.  By default, white.    
All elements that use the -ForegroundColor will also use the CSS class foreground-fill.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |



#### **BackgroundColor**

The background color.  By default, black.    
All items colored in black will also use the class background-fill.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |



#### **ConsolePalette**

The console color palette.    
    
ANSI colors use a 3 bit palette (0-7), with an additional bit for brightness.    
    
This array contains default color used to fill each of the items in a 3-bit palette.    
    
By default, in order:    

* black    
* red    
* green    
* yellow    
* blue    
* magenta    
* cyan    
* white    

Each 3 or 4 bit ANSI color will also use the css class ansi$n-fill, where n is a number between 0 and 15.






|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |4       |false        |





---


### Syntax
```PowerShell
SVG.ANSI [[-LineSpacing] <Double>] [[-ForegroundColor] <String>] [[-BackgroundColor] <String>] [[-ConsolePalette] <String[]>] [<CommonParameters>]
```
