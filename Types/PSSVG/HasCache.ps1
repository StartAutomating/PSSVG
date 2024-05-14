<#
.SYNOPSIS
    Determines if a request has been cached.
.DESCRIPTION
    Determines if a request has been cached.  If it has, it returns the cached value.
#>
param($Request)

$cacheKey = $request.Url.PathAndQuery -replace '^/pssvg/' -replace '^/' -replace '/\?','?'
if ($PSSVG.RequestCache -and $PSSVG.RequestCache.Contains($cacheKey)) {            
    return [PSCustomObject][Ordered]@{
        Key = $CacheKey
        Value = $PSSVG.RequestCache[$cacheKey]
    }
}

return [PSCustomObject][Ordered]@{
    Key = $CacheKey
    Value = $null
}