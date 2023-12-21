SVG.GoogleFont
--------------

### Synopsis
SVG Google Font

---

### Description

Imports a Google Font into SVG.

---

### Related Links
* [SVG.Style](SVG.Style.md)

* [SVG.StyleSheet](SVG.StyleSheet.md)

---

### Examples
> EXAMPLE 1

```PowerShell
SVG @(    
    SVG.Defs @(    
        SVG.GoogleFont -FontName "La Belle Aurore"    
    )    
    SVG.Text -Text "Fancy Text" -X 50% -Y 50% -TextAnchor 'middle' -Style "font-family: 'La Belle Aurore'"    
) -Viewbox 100,100 -OutputPath .\FancyText.svg
```

---

### Parameters
#### **FontName**
The name of the font.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |1       |true (ByPropertyName)|

---

### Notes
Imported Google Fonts will not render when SVGs are linked as images.    
To use an imported Google Fonts, either load the SVG alone in it's own frame or embed the SVG directly in HTML.

---

### Syntax
```PowerShell
SVG.GoogleFont [[-FontName] <String>] [<CommonParameters>]
```
