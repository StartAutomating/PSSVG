<#
.SYNOPSIS
    Determines if a request has a route.
.DESCRIPTION
    Determines if a request has a route.

    If a route already exists, it returns the route.
    
    If it does not, it attempts to map the route.    
#>
param($Request)

$cacheKey = $request.Url.LocalPath -replace "^/$([regex]::Escape($this.Name))/" -replace '^/' -replace '/\?','?'
if ($this.RouteCache -and $this.RouteCache.Contains($cacheKey)) {
    return [PSCustomObject][Ordered]@{
        Key = $CacheKey
        Value = $PSSVG.RouteCache[$cacheKey]
    }
}

if ($this.ExportedCommands[$cacheKey]) {
    $this.RouteCache[$cacheKey] = $this.ExportedCommands[$cacheKey]
    return [PSCustomObject][Ordered]@{
        Key = $CacheKey
        Value = $this.ExportedCommands[$cacheKey]
    }
}

# If the path has PSSVG in it, we can remove that
$path = $cacheKey
$rootLocation = 
    if ($env:PSSVG_ROOT) {
        $env:PSSVG_ROOT
    } else {
        $this | Split-Path
    }

$foundPath = $null

$localPath = Join-Path $rootLocation "${path}*"
$foundLocalFile = 
    if (Test-Path $localPath) { 
        $localMatches = @(Get-Item -Path $localPath) -match '\.(?>pssvg\.ps1|ps1|md|markdown|svg)$'
        $foundPath = 
            if ($localMatches) {
                if ($localMatches.Count -gt 1) {
                    $indexOrReadme = $localMatches -match '(?>default|home|index|readme)\.'
                    if ($indexOrReadme) {
                        $indexOrReadme[0].FullName
                    } else {
                        $localMatches[0].FullName
                    }
                } else {
                    $localMatches[0].FullName
                }
            }


        if ($foundPath) {
            $foundPath -as [IO.FileInfo]
        }
    }


if ($foundLocalFile) {
    if ($foundLocalFile -match '\.ps1$') {
        $foundLocalFile = $ExecutionContext.SessionState.InvokeCommand.GetCommand($foundLocalFile.FullName, 'ExternalScript')
    }
    $this.RouteCache[$cacheKey] = $foundLocalFile
    return [PSCustomObject][Ordered]@{
        Key = $CacheKey
        Value = $foundLocalFile
    }
}
else {        
    return [PSCustomObject][Ordered]@{
        Key = $CacheKey
        Value = $this.RouteCache[$cacheKey] = 404
    }            
}