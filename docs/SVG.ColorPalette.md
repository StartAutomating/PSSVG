SVG.ColorPalette
----------------

### Synopsis
SVG Color Palette

---

### Description

Imports a [4bitcss](https://4bitcss.com) color palette into SVG.

---

### Related Links
* [SVG.Style](SVG.Style.md)

* [SVG.StyleSheet](SVG.StyleSheet.md)

---

### Examples
> EXAMPLE 1

```PowerShell
SVG @(                
    $boxSize = [Ordered]@{Width = 80; Height = 80}    
    svg -ViewBox 640, 160 @(    
        SVG.ColorPalette -PaletteName "Jellybeans"    
        foreach ($n in 0..7) {    
            svg.rect -X ($boxSize.Width * $n) -Y 0 -Class "ansi$n-fill" @boxSize    
        }    
        foreach ($n in 8..15) {    
            svg.rect -X ($boxSize.Width * ($n - 8)) -Y 79 -Class "ansi$n-fill" @boxSize    
        }    
        SVG.Text -Text "Jellybeans" -X 50% -Y 50% -TextAnchor 'middle' -Class "foreground"    
    )                
) -Viewbox 100,100 -OutputPath .\PalettePreview.svg
```

---

### Parameters
#### **PaletteName**
The name of the palette.

|Type      |Required|Position|PipelineInput        |Aliases                                 |
|----------|--------|--------|---------------------|----------------------------------------|
|`[String]`|false   |1       |true (ByPropertyName)|Palette<br/>ColorScheme<br/>ColorPalette|

---

### Notes
Imported Palettes will not render when SVGs are linked as images.    
To use an imported palette, either load the SVG alone in it's own frame or embed the SVG directly in HTML.

---

### Syntax
```PowerShell
SVG.ColorPalette [[-PaletteName] <String>] [<CommonParameters>]
```
