<#
.SYNOPSIS
    Serves a request
.DESCRIPTION
    Serves a single request to PSSVG.
#>
param(
$Request
)

# If the request is for an icon, return nothing.
# (every request comes with one for .favicon.ico, because legacy)
if ($request.Url -match '\.ico$') { return }

# If the path has PSSVG in it, we can remove that
$path = $request.Url.LocalPath -replace '^/pssvg/' -replace '^/' -replace '/\?','?'

# If there's not a response object
if (-not $response) {
    # create an empty one (for testing purposes, and so this script does not error out)
    $response = [Ordered]@{
        Headers=[Ordered]@{}
    }
}
# The content type should always be SVG
$response.ContentType = 'image/svg+xml'

# `$PSSVG` should be `$this`
if ($this -and -not $pssvg)
{
    $pssvg = $this
}
# If not, `$this` should be `$pssvg`
elseif ($pssvg -and -not $this)
{
    $this = $pssvg
}

# Check to see if the request has been cached.
$hasCache = $PSSVG.HasCache($request)
# (we always need to keep track of the key)
$cacheKey = $hasCache.Key

# If the request has a cached value, return it.
if ($hasCache.Value) {
    # If the cached value is an integer, it's a status code
    if ($hasCache.Value -is [int]) {
        # Make sure we tell them to keep it cached
        $response.Headers["Cache-Control"] = "public, max-age=$(60 * 60 * 24 * 7)"
        # Set the status code        
        $response.StatusCode = $hasCache.Value
        
        # Return any handled result of this status code.
        return $PSSVG.HandleStatus($response.StatusCode)
    } else {
        $response.Headers["Cache-Control"] = "public, max-age=$(60 * 60 * 24 * 7)"
        return ($hasCache.Value | FrameSVG)
    }    
}

$hasRoute = $This.HasRoute($request)
if ($hasRoute.Value -is [int]) {
    $response.StatusCode = $hasRoute.Value
    return $This.HandleStatus($response.StatusCode)
}

$routedTo = $hasRoute.Value
    
$localPath = $routedTo

if ($localPath -match '\.ps1$') {    
    $localScript = $routedTo
    
    $svgOut = $localScript | . $InvokeQuerySplat
    
    if ($svgOut -as [xml]) {
        $PSSVG.RequestCache[$cacheKey] = ($svgOut -as [xml]).OuterXml
        return ($svgOut | FrameSVG)
    }
    elseif ($svgOut -as [IO.FileInfo]) {
        $svgFileInfo = $svgOut
        if ($svgFileInfo.Extension -eq '.svg') {
            $svgOut = [IO.File]::ReadAllText($svgFileInfo.FullName) | FrameSVG
            $PSSVG.RequestCache[$cacheKey] = $svgOut
            return $svgOut
        }
        return ""
    }
    $PSSVG.RequestCache[$cacheKey] = 404 
    $response.StatusCode = 404
    $response.ContentType = 'text/html'
    return $pssvg.HandleStatus($response.StatusCode)
} 
elseif ($localPath -match '\.(?>md|markdown)$') {
    $svgOut = SVG -ViewBox 1080 @(
        $markdownContent = [IO.File]::ReadAllText($localPath.FullName)
        SVG.Markdown -Markdown $markdownContent
    )
    $This.RequestCache[$cacheKey] = $svgOut
    return $svgOut
}
elseif ($localPath -match '\.svg$') {
    $svgOut = [IO.File]::ReadAllText($localPath.FullName)
    $This.RequestCache[$cacheKey] = $svgOut
    return $svgOut
}