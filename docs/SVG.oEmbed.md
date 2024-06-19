SVG.oEmbed
----------

### Synopsis
Embeds content with oEmbed.

---

### Description

Embeds content in SVG from any oEmbed site.

---

### Related Links
* [https://oembed.com/](https://oembed.com/)

---

### Examples
> EXAMPLE 1

```PowerShell
SVG.oEmbed -EmbedUrl https://giphy.com/gifs/community-donald-glover-handshake-Yggr0uQUbA79C
```

---

### Parameters
#### **EmbedUrl**
The URL of the content to embed.

|Type   |Required|Position|PipelineInput        |Aliases                          |
|-------|--------|--------|---------------------|---------------------------------|
|`[Uri]`|false   |1       |true (ByPropertyName)|Url<br/>Uri<br/>Href<br/>EmbedUri|

---

### Syntax
```PowerShell
SVG.oEmbed [[-EmbedUrl] <Uri>] [<CommonParameters>]
```
