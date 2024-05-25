Start-PSSVG
-----------

### Synopsis
Starts a PSSVG server.

---

### Description

Starts a server for PSSVG.

---

### Parameters
#### **ServerUrl**
The URL to serve the server on.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **RootPath**
The local root path to serve files from.
If this is not provided, the root directory of PSSVG will be used.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **Port**
The port to serve on.  If this is not provided, a random port will be used.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |3       |false        |

#### **Server**
The scriptblock used to serve requests.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[ScriptBlock]`|false   |4       |false        |

---

### Syntax
```PowerShell
Start-PSSVG [[-ServerUrl] <String>] [[-RootPath] <String>] [[-Port] <Int32>] [[-Server] <ScriptBlock>] [<CommonParameters>]
```
