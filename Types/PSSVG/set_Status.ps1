<#
.SYNOPSIS
    Sets the status of the request.
.DESCRIPTION
    Sets the status of the request.

    If the status is greater than or equal to 300, it will attempt to get the status code handler.
    If the status code handler is a script block, it will execute the script block. 
    If it is an XML object, it will return the OuterXml.
    Otherwise, it will return the status code.
#>
param($statusValue)


if ($statusValue -is [int] -and $statusValue -ge 300) {
    $StatusCodeHandler = $PSSVG."$statusValue"
    $statusValue = 
        if ($StatusCodeHandler -is [ScriptBlock]) {
            & $StatusCodeHandler
        } elseif ($StatusCodeHandler -is [xml]) {
            $StatusCodeHandler.OuterXml
        } else {
            $statusValue
        }
}

$this.psobject.properties.add([psnoteproperty]::new('.LastStatus', $statusValue), $true)
