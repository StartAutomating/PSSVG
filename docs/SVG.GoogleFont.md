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
#### EXAMPLE 1
```PowerShell
SVG @(
    SVG.Defs @(
        SVG.GoogleFont -FontName Abel
    )
    SVG.Text -Text "Abel" -X 50% -Y 50% -TextAnchor 'middle'
) -Viewbox 100,100 -OutputPath .\abel.svg
```

---
### Parameters
#### **FontName**

The name of the font.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|



---
### Syntax
```PowerShell
SVG.GoogleFont [-FontName <String>] [<CommonParameters>]
```
---
### Notes
Imported Google Fonts will not render when SVGs are linked as images.
To use an imported Google Fonts, either load the SVG alone in it's own frame or embed the SVG directly in HTML.
