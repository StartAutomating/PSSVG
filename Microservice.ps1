#requires -Module PipeScript, PSSVG
if (-not $psNode) {
    # If no node is running, start one

    # If the PSSVG_URL environment variable is not set, we will use a random port
    $serveUrl = $(if (-not $env:PSSVG_URL) {
        if ($PSVersionTable.Platform -eq 'Unix') {
            "http://*:80/"
        } else {
            "http://localhost:$(Get-Random -Min 7000 -Max 8000)/pssvg/"
        }    
    } else {
        $env:PSSVG_URL
    })

    # If the PSSVG_ROOT environment variable is not set, we will use the Examples directory
    if (-not $env:PSSVG_ROOT) {
        $env:PSSVG_ROOT = "$(Get-Module PSSVG | Split-path | Join-Path -ChildPath 'Examples')"
    }

    # Start the node, passing the current script block and the PSSVG module
    $psNode = @(Start-PSNode -Server $serveUrl -Command $MyInvocation.MyCommand.ScriptBlock -ImportModule "PSSVG") -ne $null
    
    # Output the location of the node being served.
    @{serving=$($psNode.Location)} | ConvertTo-Json -Compress | Out-Host
    
    # Wait for the node to finish
    # (If this is running in a headless web server, it should never finish)
    do {
        Wait-Job -Id $psNode.ID -Timeout ([int](Get-Random -Minimum 1067 -Maximum 2971))
        # Write the output of the node to the host
        $psNode | Receive-Job | Out-Host
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
    if ($svgIn -and -not $svgIn.svg) {
        return (SVG @($svgIn)).OuterXml        
    }
    $svgIn.OuterXml
}

$InvokeQuerySplat = {
    process {
    $cmdIn = $_

    $orderedQuery = [Ordered]@{}
    if ($request.Url.Query) {
        $parsedQuery = [Web.HttpUtility]::ParseQueryString($request.Url.Query)
        foreach ($key in $parsedQuery.Keys) {
            $orderedQuery[$key] = $parsedQuery[$key]
        }
    }
    $queryParameters = 
        if ($request.Url.Query) {
            $orderedQuery
        } else { $null }
    $localCommandMetadata = $cmdIn
    $localSplat = [Ordered]@{}    
    if (-not $localCommandMetadata) { return }
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
            if ($localParameterType -eq [timespan]) {
                $localSplat[$paramName] = $localSplat[$paramName] -as [timespan]
                if ($localSplat[$paramName].Ticks -lt 1000 -and $localSplat[$paramName].Ticks -gt 0) {
                    $localSplat[$paramName] = [Timespan]::FromMilliseconds((60 * 1000) / $localSplat[$paramName].Ticks)
                } elseif ($localSplat[$paramName].TotalSeconds -lt 1) {
                    $localSplat.Remove($paramName)
                }
            }
            elseif ($localParameterType -eq [switch]) {
                $localSplat[$paramName] =$localSplat[$paramName] -notmatch '^(?>\$?false|0|null|)$'
            }
            elseif ($localParameterType.GetInterface('IDictionary') -or $localParameterType -eq [PSObject]) {
                # Convert the query string from a hashtable or a JSON object
                $localValue = $localSplat[$paramName]
                if ($localValue -match '^\s{0,}[\{\]].+?\:') {
                    try {                        
                        $localSplat[$paramName] = $localValue | ConvertFrom-Json -ErrorAction Stop -AsHashtable:$(
                            $localParameterType.GetInterface('IDictionary') -as [bool]
                        )
                    } catch {
                        # Remove values that are not valid JSON
                        $localSplat.Remove($paramName)
                    }
                } elseif ($localValue -match '\^\s{0,}\@\{') {
                    try {
                        $toDataBlock = [ScriptBlock]::Create("data {$localValue}")
                        # If we could parse it, it's valid PowerShell.
                        # As as it is only one statement and it is a data block, we can execute it.
                        if ($ToDataBlock.Ast.EndBlock.Statements.Count -eq 1 -and 
                            $toDataBlock.Ast.EndBlock.Statements[0] -is [Management.Automation.Language.DataStatementAst]) {
                            # If we have confirmed that it is a data block, we can execute it.
                            # Since order may be important, we replace any hashtable creations with an [Ordered] block
                            & ([ScriptBlock]::Create($localValue -replace '@\{','[Ordered]@{'))
                        }
                    } catch {
                        $localSplat.Remove($paramName)                    
                    }
                }
            }
        }
        
    }
    if ($psNode -and $DebugPreference -ne 'SilentlyContinue') {
        $psNode.WriteOutput("Running $($request.Url.PathAndQuery) ( $(@($cmdIn -split '[\\/]')[-1]) ) [$($localCommandMetadata.Parameters.Keys)] with $($localSplat | Out-String)")
    }
    
    & $cmdIn @localSplat
    }
}

if (-not $request) {     
    $response = [Ordered]@{
        ContentType = 'text/plain'
        StatusCode = 200
    }
    return
}


return $PSSVG.Serve($request)

trap {
    $err = $_
    if ($psNode) {
        $psNode.Error.Add($err)
    }   
    continue
}