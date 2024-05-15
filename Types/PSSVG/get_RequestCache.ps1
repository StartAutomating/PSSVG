<#
.SYNOPSIS
    Gets the request cache for PSSVG.    
.DESCRIPTION
    Gets the request cache for PSSVG.

    This contains the paths that have been requested and their output.
#>
param()
if (-not $this.'.RequestCache') {
    $this.psobject.properties.add([psnoteproperty]::new('.RequestCache', [Ordered]@{}), $true)
}
return $this.'.RequestCache'
