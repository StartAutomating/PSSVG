<#
.SYNOPSIS
    Determines if a request has been cached.
.DESCRIPTION
    Determines if a request has been cached.  If it has, it returns the cached value.
#>
param($Request)

$cacheKey = $request.Url.PathAndQuery -replace "^/$([Regex]::Escape($this.Name))/" -replace '^/' -replace '/\?','?'
if ($this.RequestCache -and $this.RequestCache.Contains($cacheKey)) {
    return [PSCustomObject][Ordered]@{
        Key = $CacheKey
        Value = $PSSVG.RequestCache[$cacheKey]
    }
}

return [PSCustomObject][Ordered]@{
    Key = $CacheKey
    Value = $null
}