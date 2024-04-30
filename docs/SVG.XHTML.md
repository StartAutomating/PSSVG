SVG.XHTML
---------

### Synopsis
Embeds HTML in SVG

---

### Description

Embeds HTML (technically, XHTML) in an SVG element.

---

### Parameters
#### **HTML**
The HTML. For this to work properly, it should be XHTML

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|false   |1       |true (ByPropertyName)|XHTML  |

---

### Notes
The HTML is wrapped in an XHTML element.    
The XHTML is then passed to SVG.foreignObject to render the SVG.

---

### Syntax
```PowerShell
SVG.XHTML [[-HTML] <String>] [<CommonParameters>]
```
