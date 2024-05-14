PSSVG.set_Status()
------------------

### Synopsis
Sets the status of the request.

---

### Description

Sets the status of the request.

If the status is greater than or equal to 300, it will attempt to get the status code handler.
If the status code handler is a script block, it will execute the script block. 
If it is an XML object, it will return the OuterXml.
Otherwise, it will return the status code.

---

### Parameters
#### **statusValue**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |1       |false        |

---
