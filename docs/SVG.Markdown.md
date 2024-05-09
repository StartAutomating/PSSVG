SVG.Markdown
------------

### Synopsis
Embeds Markdown in SVG

---

### Description

Converts from Markdown to HTML and embeds it into SVG.

---

### Parameters
#### **Markdown**
The markdown.  The YAML header is currently ignored.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |1       |true (ByPropertyName)|

---

### Notes
The markdown is converted to HTML using ConvertFrom-Markdown, and then wrapped in an body element with the XHTML namespace.    
The XHTML is then passed to SVG.foreignObject to render the SVG.

---

### Syntax
```PowerShell
SVG.Markdown [[-Markdown] <String>] [<CommonParameters>]
```
