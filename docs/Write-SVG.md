
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



> **Type**: ```[String]```

> **Required**: true

> **Position**: 1

> **PipelineInput**:false



---
#### **Attribute**

A dictionary of attributes.



> **Type**: ```[IDictionary]```

> **Required**: false

> **Position**: 2

> **PipelineInput**:true (ByPropertyName)



---
#### **Data**

A dictionary of data.



> **Type**: ```[IDictionary]```

> **Required**: false

> **Position**: 3

> **PipelineInput**:true (ByPropertyName)



---
#### **Content**

A dictionary of content.



> **Type**: ```[PSObject]```

> **Required**: false

> **Position**: 4

> **PipelineInput**:true (ByPropertyName)



---
#### **OutputPath**

An output path.



> **Type**: ```[String]```

> **Required**: false

> **Position**: 5

> **PipelineInput**:true (ByPropertyName)



---
### Syntax
```PowerShell
Write-SVG [-ElementName] <String> [[-Attribute] <IDictionary>] [[-Data] <IDictionary>] [[-Content] <PSObject>] [[-OutputPath] <String>] [<CommonParameters>]
```
---
### Notes
While this function can be used directly, it is designed to be the core function that other SVG creation functions call.



