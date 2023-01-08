ConvertTo-PSSVG
---------------
### Synopsis
Converts an SVG to PSSVG

---
### Description

Converts an SVG to a PowerShell Script that would generate that SVG

---
### Related Links
* [Write-SVG](Write-SVG.md)



---
### Examples
#### EXAMPLE 1
```PowerShell
ConvertTo-PSSVG -InputObject https://PSSVG.start-automating.com/Assets/PSSVG.svg
```

#### EXAMPLE 2
```PowerShell
ConvertTo-PSSVG -InputObject .\a.svg
```

#### EXAMPLE 3
```PowerShell
<circle cx='5' cy='5' r='3'></svg>"
```

---
### Parameters
#### **InputObject**




|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[Object]`|true    |1       |true (ByValue, ByPropertyName)|



---
### Syntax
```PowerShell
ConvertTo-PSSVG [-InputObject] <Object> [<CommonParameters>]
```
---
