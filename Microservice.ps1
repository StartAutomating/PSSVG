#requires -Module PipeScript, PSSVG
if (-not $psNode) {
    $serveUrl = $(if (-not $env:PSSVG_URL) {
        if ($PSVersionTable.Platform -eq 'Unix') {
            "http://*:80/"
        } else {
            "http://localhost:$(Get-Random -Min 1000 -Max 2000)/pssvg/"
        }    
    } else {
        $env:PSSVG_URL
    })

    if (-not $env:PSSVG_ROOT) {
        $env:PSSVG_ROOT = "$(Get-Module PSSVG | Split-path | Join-Path -ChildPath 'Examples')"
    }

    $psNode = @(Start-PSNode -Server $serveUrl -Command $MyInvocation.MyCommand.ScriptBlock -ImportModule (
        Get-Module PSSVG
    )) -ne $null
    
    @{serving=$($psNode.Location)} | ConvertTo-Json -Compress | Out-Host
    
    do {
        Wait-Job -Id $psNode.ID -Timeout ([int](Get-Random -Minimum 1067 -Maximum 2971))
        $psNode | Receive-Job -Keep
    } while ($psNode.State -eq 'Running')
    
    return
}

if ($args) {
    Write-Information "Arguments Passed: $($args | Out-String)"    
}

filter FrameSVG {
    $svgIn = $_
    if ($svgIn -is [string]) {
        $svgIn = $svgIn -as [xml]
    }
    if (-not $svgIn.svg) {
        return
    }
    $svgIn.OuterXml    
}

if (-not $request) {     
    $response = [Ordered]@{
        ContentType = 'text/plain'
        StatusCode = 200
    }
    return
}


# if ($request.Method -notin 'GET', 'OPTIONS') { return }
if ($request.Url -match '\.ico$') { return }    

$path = $request.Url.LocalPath -replace '^/pssvg/' -replace '^/' -replace '/\?','?'

if (-not $global:PSSVG_Path_Cache) {
    $global:PSSVG_Path_Cache = @{}
}
$response.ContentType = 'image/svg+xml'

$orderedQuery = [Ordered]@{}
if ($request.Url.Query) {
    $parsedQuery = [Web.HttpUtility]::ParseQueryString($request.Url.Query)
    foreach ($key in $parsedQuery.Keys) {
        $orderedQuery[$key] = $parsedQuery[$key]
    }
}

$cacheKey = $request.Url.PathAndQuery -replace '^/pssvg/' -replace '^/' -replace '/\?','?'
if ($global:PSSVG_Path_Cache.Contains($cacheKey)) {
    if ($global:PSSVG_Path_Cache[$cacheKey] -is [int]) {
        $response.Headers["Cache-Control"] = "public, max-age=$(60 * 60 * 24 * 7)"
        $response.StatusCode = $global:PSSVG_Path_Cache[$cacheKey]
        return
    } else {
        $response.Headers["Cache-Control"] = "public, max-age=$(60 * 60 * 24 * 7)"
        return ($global:PSSVG_Path_Cache[$cacheKey] | FrameSVG)
    }
}
if (-not $pssvg) {    
    $pssvg = Get-Module PSSVG
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
    $localMatches = @(Get-Item -Path $localPath) -match '\.(?>pssvg\.ps1|ps1|svg)$'
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
    $global:PSSVG_Path_Cache[$cacheKey] = 404 
    $response.StatusCode = 404
    return
}

$localPath = $foundPath

if ($localPath -match '\.ps1$') {
    $queryParameters = 
        if ($request.Url.Query) {                                
            $orderedQuery
        } else { $null }
    $localScript = $ExecutionContext.SessionState.InvokeCommand.GetCommand($localPath, 'ExternalScript')
    $localCommandMetadata = $localScript -as [Management.Automation.CommandMetaData]
    $localSplat = [Ordered]@{}    
    foreach ($queryKey in @($queryParameters.Keys)) {
        if (-not $queryKey) { continue }
        
        if (-not $localCommandMetadata.Parameters) { continue }
        $paramName = 
            if ($localCommandMetadata.Parameters[$queryKey]) {
                $localSplat[$queryKey] = $queryParameters[$queryKey]
                $queryKey
            } else {
                foreach ($localParameter in $localCommandMetadata.Parameters.Values) {
                    if ($localParameter.Aliases -contains $queryKey) {
                        $localSplat[$localParameter.Name] = $queryParameters[$queryKey]
                        $localParameter.Name
                    }
                }
            }

        if ($paramName) {
            $localParameterType = $localCommandMetadata.Parameters[$paramName].ParameterType
            if ($localParameterType.IsArray) {
                $localSplat[$paramName] = $localSplat[$paramName] -split ','
            }
            if ($localParameterType -is [timespan]) {
                $localSplat[$paramName] = $localSplat[$paramName] -as [timespan]
                if ($localSplat[$paramName].Ticks -lt 1000 -and $localSplat[$paramName].Ticks -gt 0) {
                    $localSplat[$paramName] = [Timespan]::FromMilliseconds((60 * 1000) / $localSplat[$paramName].Ticks)
                } elseif ($localSplat[$paramName].TotalSeconds -lt 1) {
                    $localSplat.Remove($paramName)
                }
            }
        }
        
    }
    $psNode.WriteOutput("Running $($request.Url.PathAndQuery) ( $($localPath | Split-Path -Leaf) ) [$($localCommandMetadata.Parameters.Keys)] with $($localSplat | Out-String)")
    $svgOut = & $localPath @localSplat
    if ($svgOut -as [xml]) {
        $global:PSSVG_Path_Cache[$cacheKey] = ($svgOut -as [xml]).OuterXml
        return ($svgOut.OuterXml | FrameSVG)
    }
    elseif ($svgOut -as [IO.FileInfo]) {
        $svgFileInfo = $svgOut
        if ($svgFileInfo.Extension -eq '.svg') {
            $svgOut = [IO.File]::ReadAllText($svgFileInfo.FullName) | FrameSVG
            $global:PSSVG_Path_Cache[$cacheKey] = $svgOut
            return $svgOut
        }
        return ""
    }
    $global:PSSVG_Path_Cache[$cacheKey] = 404 
    $response.StatusCode = 404
    $response.ContentType = 'text/html'
    return "?"
} elseif ($localPath -match '\.svg') {
    $svgOut = [IO.File]::ReadAllText("$localPath")
    $global:PSSVG_Path_Cache[$cacheKey] = $svgOut
    return $svgOut
}
