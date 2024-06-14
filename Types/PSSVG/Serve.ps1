<#
.SYNOPSIS
    Serves a request
.DESCRIPTION
    Serves a single request to PSSVG.
#>
param(
# The request to serve
[PSObject]
$Request
)

# If the request is for an icon, return nothing.
# (every request comes with one for .favicon.ico, because legacy)
if ($request.Url -match '\.ico$') { return }

# If there's not a response object
if (-not $response) {
    # create an empty one (for testing purposes, and so this script does not error out)
    $response = [Ordered]@{
        Headers=[Ordered]@{}
    }
}
# The content type should always be SVG
$response.ContentType = 'image/svg+xml'

# Check to see if the request has been cached.
$hasCache = $this.HasCache($request)
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
        return $this.HandleStatus($response.StatusCode)
    } else {
        # If it's not a status code, it's an SVG, and we can tell them to keep it cached
        $response.Headers["Cache-Control"] = "public, max-age=$(60 * 60 * 24 * 7)"
        # Return the SVG
        return ($hasCache.Value | FrameSVG)
    }    
}

$resolvedRequest = $this.Resolve($request)
if (($resolvedRequest -is [Collections.IDictionary]) -and 
    $resolvedRequest.psobject.properties['Command']) {
    $commandToRun = $resolvedRequest.Command
    $cmdOut = & $commandToRun @resolvedRequest
    if ($cmdOut -as [xml]) {
        $this.RequestCache[$cacheKey] = ($cmdOut -as [xml]).OuterXml
        return ($cmdOut | FrameSVG)
    }
    elseif ($cmdOut -is [xml.xmlelement]) {            
        $this.RequestCache[$cacheKey] = $cmdOut        
        return ($this.RequestCache[$cacheKey] | FrameSVG)
    }
    elseif ($cmdOut -as [IO.FileInfo]) {
        $svgFileInfo = $cmdOut
        if ($svgFileInfo.Extension -eq '.svg') {
            $cmdOut = [IO.File]::ReadAllText($svgFileInfo.FullName) | FrameSVG
            $this.RequestCache[$cacheKey] = $cmdOut
            return $cmdOut
        }
        return ""
    }
    $this.RequestCache[$cacheKey] = 404 
    $response.StatusCode = 404
    $response.ContentType = 'text/html'
    return $this.HandleStatus($response.StatusCode)
}
elseif ($resolvedRequest -is [IO.FileInfo]) {
    $svgFileInfo = $cmdOut
    if ($svgFileInfo.Extension -eq '.svg') {
        $cmdOut = [IO.File]::ReadAllText($svgFileInfo.FullName) | FrameSVG
        $this.RequestCache[$cacheKey] = $cmdOut
        return $cmdOut
    }
    return ""
}
elseif ($resolvedRequest -is [int]) {
    $this.RequestCache[$cacheKey] = $resolvedRequest
    $response.Headers["Cache-Control"] = "public, max-age=$(60 * 60 * 24 * 7)"
    # Set the status code        
    $response.StatusCode = $hasCache.Value
    
    # Return any handled result of this status code.
    return $This.HandleStatus($response.StatusCode)
} else {
    $this.RequestCache[$cacheKey] = 404 
    $response.StatusCode = 404    
    return $this.HandleStatus($response.StatusCode)
}