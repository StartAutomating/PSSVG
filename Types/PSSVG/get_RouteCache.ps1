<#
.SYNOPSIS
    Gets the route cache for PSSVG.
.DESCRIPTION
    Gets the route cache for PSSVG.

    This contains the routes that have been requested, and their destinations.
#>
param()
if (-not $this.'.RouteCache') {
    $this.psobject.properties.add([psnoteproperty]::new('.RouteCache', [Ordered]@{}), $true)
}
return $this.'.RouteCache'