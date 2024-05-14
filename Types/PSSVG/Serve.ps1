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
    if ($hasCache -is [int]) {
        # Make sure we tell them to keep it cached
        $response.Headers["Cache-Control"] = "public, max-age=$(60 * 60 * 24 * 7)"
        # Set the status code        
        $response.StatusCode = $hasCache
        
        # Return the status code by setting the status        
        $PSSVG.Status = $hasCache
        return $PSSVG.Status
    } else {
        $response.Headers["Cache-Control"] = "public, max-age=$(60 * 60 * 24 * 7)"
        return ($hasCache.Value | FrameSVG)
    }    
}
    
$rootLocation = 
    if ($env:PSSVG_ROOT) {
        $env:PSSVG_ROOT
    } else {
        $pssvg | Split-Path
    }

$foundPath = $null

$localPath = Join-Path $rootLocation "${path}*"
if (Test-Path $localPath) { 
    $localMatches = @(Get-Item -Path $localPath) -match '\.(?>pssvg\.ps1|ps1|md|markdown|svg)$'
    if ($localMatches) {
        if ($localMatches.Count -gt 1) {
            $indexOrReadme = $localMatches -match '(?>default|home|index|readme)\.'
            if ($indexOrReadme) {
                $foundPath = $indexOrReadme[0]
            } else {
                $foundPath = $localMatches[0]
            }
        } else {
            $foundPath = $localMatches[0].FullName
        }
    }
}

if (-not $foundPath) {
    $PSSVG.RequestCache[$cacheKey] = 404 
    $response.StatusCode = 404
    $pssvg.Status = 404
    return $pssvg.Status
}

$localPath = $foundPath

if ($localPath -match '\.ps1$') {    
    $localScript = $ExecutionContext.SessionState.InvokeCommand.GetCommand($localPath, 'ExternalScript')
    
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
    return "?"
} 
elseif ($localPath -match '\.(?>md|markdown)') {
    $svgOut = SVG -ViewBox 1080 @(
        $markdownContent = Get-Content -Raw $localPath
        SVG.Markdown -Markdown $markdownContent
    )
    $PSSVG.RequestCache[$cacheKey] = $svgOut
    return $svgOut
}
elseif ($localPath -match '\.svg') {
    $svgOut = [IO.File]::ReadAllText("$localPath")
    $PSSVG.RequestCache[$cacheKey] = $svgOut
    return $svgOut
}