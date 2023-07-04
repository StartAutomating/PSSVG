SVG.StyleSheet
--------------




### Synopsis
SVG StyleSheet



---


### Description

Imports a StyleSheet into SVG.



---


### Related Links
* [SVG.Style](SVG.Style.md)



* [SVG.GoogleFont](SVG.GoogleFont.md)





---


### Examples
#### EXAMPLE 1
```PowerShell
SVG @(    
    SVG.Defs @(    
        SVG.StyleSheet -StyleSheetURI https://4bitcss.com/Konsolas.css    
    )    
    # When viewed in it's own frame, this rectangle will be Konsolas's version of 'red'    
    # When viewed in an <img> tag, it will be red.    
    SVG.Rect -Width 200% -Height 100% -Fill red -Class ansi1-fill -X -50%    
) -Viewbox 100,100 -OutputPath .\test.svg
```



---


### Parameters
#### **StyleSheetUri**

The URI to a StyleSheet






|Type   |Required|Position|PipelineInput        |Aliases                            |
|-------|--------|--------|---------------------|-----------------------------------|
|`[Uri]`|false   |1       |true (ByPropertyName)|StyleSheetUrl<br/>CSSUrl<br/>CSSUri|





---


### Notes
Imported stylesheets will not render when SVGs are linked as images.    
To use an imported stylesheet, either load the SVG alone in it's own frame or embed the SVG directly in HTML.



---


### Syntax
```PowerShell
SVG.StyleSheet [[-StyleSheetUri] <Uri>] [<CommonParameters>]
```
