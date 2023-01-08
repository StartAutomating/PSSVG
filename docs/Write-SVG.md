Write-SVG
---------
### Synopsis
Writes a SVG element

---
### Description

Writes a Scalable Vector Graphics element.

---
### Parameters
#### **ElementName**

The name of the SVG element.






|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |



---
#### **Attribute**

A dictionary of attributes.






|Type           |Required|Position|PipelineInput        |
|---------------|--------|--------|---------------------|
|`[IDictionary]`|false   |2       |true (ByPropertyName)|



---
#### **Data**

A dictionary of data.






|Type           |Required|Position|PipelineInput        |
|---------------|--------|--------|---------------------|
|`[IDictionary]`|false   |3       |true (ByPropertyName)|



---
#### **Content**

A dictionary of content.






|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |4       |true (ByPropertyName)|



---
#### **OutputPath**

An output path.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |5       |true (ByPropertyName)|



---
### Syntax
```PowerShell
Write-SVG [-ElementName] <String> [[-Attribute] <IDictionary>] [[-Data] <IDictionary>] [[-Content] <PSObject>] [[-OutputPath] <String>] [<CommonParameters>]
```
---
### Notes
While this function can be used directly, it is designed to be the core function that other SVG creation functions call.
