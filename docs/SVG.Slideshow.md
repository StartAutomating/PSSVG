SVG.Slideshow
-------------

### Synopsis
Displays a slideshow of images.

---

### Description

Displays a slideshow of images.  This Animates the href attribute of an image over time.

---

### Related Links
* [SVG.Image](SVG.Image.md)

---

### Parameters
#### **Href**
One or more image URLs.

|Type     |Required|Position|PipelineInput        |Aliases    |
|---------|--------|--------|---------------------|-----------|
|`[Uri[]]`|false   |1       |true (ByPropertyName)|Uri<br/>Url|

#### **EachDuration**
The duration to display each image.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[TimeSpan]`|false   |2       |true (ByPropertyName)|

#### **TotalDuration**
The total duration of the slideshow.    
(if this is provided, it will override the EachDuration parameter)

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[TimeSpan]`|false   |3       |true (ByPropertyName)|

---

### Syntax
```PowerShell
SVG.Slideshow [[-Href] <Uri[]>] [[-EachDuration] <TimeSpan>] [[-TotalDuration] <TimeSpan>] [<CommonParameters>]
```
