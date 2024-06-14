Resolve-PSSVG
-------------

### Synopsis
Resolves a request

---

### Description

Resolves a request to PSSVG.

A request can be resolved to a file, a command, or a script block, and any number of parameters.

---

### Parameters
#### **Request**
The request to resolve

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[PSObject]`|false   |1       |false        |

#### **Command**
The command(s) to use when resolving parameters.
By default, this will be determined by the request.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[PSObject[]]`|false   |2       |false        |

---

### Syntax
```PowerShell
Resolve-PSSVG [[-Request] <PSObject>] [[-Command] <PSObject[]>] [<CommonParameters>]
```
