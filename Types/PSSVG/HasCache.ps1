<#
.SYNOPSIS
    Determines if a request has been cached.
.DESCRIPTION
    Determines if a request has been cached.  If it has, it returns the cached value.
#>
param($Request)

$cacheKey = $request.Url.PathAndQuery -replace '^/pssvg/' -replace '^/' -replace '/\?','?'
if ($PSSVG.RequestCache -and $PSSVG.RequestCache.Contains($cacheKey)) {
    if ($PSSVG.RequestCache[$cacheKey] -is [int] -and $response) {
        $response.Headers["Cache-Control"] = "public, max-age=$(60 * 60 * 24 * 7)"
        $response.StatusCode = $PSSVG.RequestCache[$cacheKey]
        
    } elseif ($response) {
        $response.Headers["Cache-Control"] = "public, max-age=$(60 * 60 * 24 * 7)"        
    }
    return $PSSVG.RequestCache[$cacheKey]
}