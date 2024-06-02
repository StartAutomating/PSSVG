SVG.Markdown
------------

### Synopsis
Embeds Markdown in SVG

---

### Description

Converts from Markdown to HTML and embeds it (and a style) into SVG.    
By default:    
* Width and Height are set to 100%    
* The body style will be set to full height and automatic overflow    
* Any direct children of the body will be given a margin of 1em and font-size of 1.25em    
* Tables will be made full width

---

### Examples
> EXAMPLE 1

```PowerShell
SVG.Markdown -Markdown '    
# Hello, World!    
This is a test of the Markdown to SVG conversion.    
'
```
> EXAMPLE 2

SVG.Markdown -ColorScheme 'Solarized Dark' -Markdown '    
# Hello, World!    
It's pretty easy to pick a palette.            
'
> EXAMPLE 3

```PowerShell
$pssvg |     
    Split-Path |     
    Join-Path -ChildPath 'README.md' |     
    Get-Item |    
    Get-Content -Raw |     
    SVG.Markdown -ColorScheme 'Solarized Dark' -OutputPath .\README.svg
```

---

### Parameters
#### **Markdown**
The markdown.    
The YAML header is currently ignored.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |1       |true (ByPropertyName)|

#### **FontName**
The [Google Font](https://fonts.google.com/) name.

|Type      |Required|Position|PipelineInput        |Aliases   |
|----------|--------|--------|---------------------|----------|
|`[String]`|false   |2       |true (ByPropertyName)|GoogleFont|

#### **CodeFont**
The Google Font name to use for code blocks.    
(this should be a [monospace font](https://fonts.google.com/?classification=Monospace))

|Type      |Required|Position|PipelineInput        |Aliases                                 |
|----------|--------|--------|---------------------|----------------------------------------|
|`[String]`|false   |3       |true (ByPropertyName)|PreFont<br/>CodeFontName<br/>PreFontName|

#### **AnimateCSS**
If set, will use the library [animate.css](https://animate.style/)

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|

#### **AnimationName**

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |4       |true (ByPropertyName)|

#### **AnimationDuration**
The animation duration.  By default, two seconds.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[TimeSpan]`|false   |5       |false        |

#### **PaletteName**
The name of the palette.

|Type      |Required|Position|PipelineInput        |Aliases                                 |
|----------|--------|--------|---------------------|----------------------------------------|
|`[String]`|false   |6       |true (ByPropertyName)|Palette<br/>ColorScheme<br/>ColorPalette|

#### **Style**
The style applied to the markdown.    
By default:    
    
* Width and Height are set to 100%    
* The body style will be set to full height and automatic overflow, and a font-size of 1.25em    
* Any direct children of the body will be given a margin of 1em    
* Tables will be made full width and have a border-collapse of collapse

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |7       |true (ByPropertyName)|

---

### Notes
In order to provide a better aesthetic experience, certain parameters are set by default:    
* Width and Height are set to 100%    
* The body style will be set to full height and automatic overflow    
* Any direct children of the body will be given a margin of 1em and font-size of 1.25em    
* Tables will be made full width and have a border-collapse of collapse    
The markdown is converted to HTML using ConvertFrom-Markdown, and then wrapped in an body element with the XHTML namespace.    
The XHTML is then passed to SVG.foreignObject to render the SVG.

---

### Syntax
```PowerShell
SVG.Markdown [[-Markdown] <String>] [[-FontName] <String>] [[-CodeFont] <String>] [-AnimateCSS] [[-AnimationName] <String>] [[-AnimationDuration] <TimeSpan>] [[-PaletteName] <String>] [[-Style] <PSObject>] [<CommonParameters>]
```
