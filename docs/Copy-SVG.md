Copy-SVG
--------

### Synopsis
Copies SVG content.

---

### Description

Makes multiple copies of one or more SVG elements.

---

### Examples
> EXAMPLE 1

```PowerShell
Copy-SVG -CopyCount 4 -Content @(        
    SVG.Circle -R 100 -CX 100 -CY 100 -Fill currentColor                    
) -OutputPath .\CircleCopies.svg
```
> EXAMPLE 2

```PowerShell
@(    
    SVG.Circle -r 100 -fill currentColor    
    SVG.Circle -r 100 -stroke currentColor    
) | Copy-SVG -CopyCount 25 -Viewbox 1kb -OutputPath .\MultipleCircleCopies.svg
```

---

### Parameters
#### **CopyCount**
The number of copies of each item to show.

|Type     |Required|Position|PipelineInput        |Aliases                 |
|---------|--------|--------|---------------------|------------------------|
|`[Int32]`|false   |1       |true (ByPropertyName)|NumberOfCopies<br/>Count|

#### **RowCount**
The number of rows to display.    
If this is not provided, it will be calculated based on the number of columns.    
If columns are not provided, it will be calculated based on the number of copies.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |2       |true (ByPropertyName)|

#### **ColumnCount**
The number of columns to display.    
If this is not provided, it will be calculated based on the number of rows.    
If rows are not provided, it will be calculated based on the number of copies.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |3       |true (ByPropertyName)|

#### **Overlap**
If set, will overlap multiple content items in 2d or 3d.      
By default, multiple content items will be interleaved.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|

---

### Syntax
```PowerShell
Copy-SVG [[-CopyCount] <Int32>] [[-RowCount] <Int32>] [[-ColumnCount] <Int32>] [-Overlap] [<CommonParameters>]
```
