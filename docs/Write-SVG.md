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



#### **Attribute**

A dictionary of attributes.






|Type           |Required|Position|PipelineInput        |
|---------------|--------|--------|---------------------|
|`[IDictionary]`|false   |2       |true (ByPropertyName)|



#### **Data**

A dictionary of data.






|Type           |Required|Position|PipelineInput        |
|---------------|--------|--------|---------------------|
|`[IDictionary]`|false   |3       |true (ByPropertyName)|



#### **Content**

An object containing content.
If this content is XML, it will be added as a child element.






|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[PSObject]`|false   |4       |true (ByPropertyName)|



#### **Comment**

A comment that will appear before the element.






|Type      |Required|Position|PipelineInput        |Aliases |
|----------|--------|--------|---------------------|--------|
|`[String]`|false   |5       |true (ByPropertyName)|Comments|



#### **On**

A dictionary or object containing event handlers.
Each key or property name will be the name of the event
Each value will be the handler.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Object]`|false   |6       |true (ByPropertyName)|



#### **OutputPath**

An output path.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |7       |true (ByPropertyName)|





---


### Notes
While this function can be used directly, it is designed to be the core function that other SVG creation functions call.



---


### Syntax
```PowerShell
Write-SVG [-ElementName] <String> [[-Attribute] <IDictionary>] [[-Data] <IDictionary>] [[-Content] <PSObject>] [[-Comment] <String>] [[-On] <Object>] [[-OutputPath] <String>] [<CommonParameters>]
```
