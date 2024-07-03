SVG.Wikimedia
-------------

### Synopsis
Embeds an image from Wikimedia Commons.

---

### Description

Embeds an image from Wikimedia Commons, or from a Wikipedia page.

---

### Examples
> EXAMPLE 1

```PowerShell
SVG.Wikimedia -WikimediaUrl "https://en.wikipedia.org/wiki/Gallery_of_sovereign_state_flags" -Title "Ukraine" -OutputPath .\Flag_Ukraine.svg -Inline
```

---

### Parameters
#### **WikimediaUrl**
The URL of the Wikimedia or Wikipedia page.

|Type   |Required|Position|PipelineInput        |Aliases                          |
|-------|--------|--------|---------------------|---------------------------------|
|`[Uri]`|false   |1       |true (ByPropertyName)|Url<br/>Uri<br/>Href<br/>EmbedUri|

#### **Title**
The alt text of the image that identifies it.

|Type      |Required|Position|PipelineInput        |Aliases            |
|----------|--------|--------|---------------------|-------------------|
|`[String]`|false   |2       |true (ByPropertyName)|Alternative<br/>Alt|

#### **Inline**
If set, will embed the image inline (provided it is SVG).

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|

---

### Syntax
```PowerShell
SVG.Wikimedia [[-WikimediaUrl] <Uri>] [[-Title] <String>] [-Inline] [<CommonParameters>]
```
