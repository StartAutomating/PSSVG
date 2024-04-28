SVG.Markdown
------------

### Synopsis
Converts markdown to SVG

---

### Description

Converts markdown to SVG.

---

### Parameters
#### **Markdown**
The markdown.  The YAML header is currently ignored.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |1       |true (ByPropertyName)|

---

### Notes
The markdown is converted to HTML using ConvertFrom-Markdown, and then wrapped in an XHTML element. The XHTML is then passed to SVG.foreignObject to render the SVG.

---

### Syntax
```PowerShell
SVG.Markdown [[-Markdown] <String>] [<CommonParameters>]
```
