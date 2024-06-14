<#
.SYNOPSIS
    Resolves a request
.DESCRIPTION
    Resolves a request to PSSVG.

    A request can be resolved to a file, a command, or a script block, and any number of parameters.
#>
param(
# The request to resolve
[PSObject]
$Request,

# The command(s) to use when resolving parameters.
# By default, this will be determined by the request.
[PSObject[]]
$Command
)

filter ToSplat {    
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

        # If we have said we will not serve this parameter, remove it.
        if ($this.DoNotServe -match "^\p{P}?$paramName") {
            $localSplat.Remove($paramName)
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
    

    $localSplat.psobject.properties.add([PSNoteProperty]::new('Command', $cmdIn))
    $localSplat    
}

# If a commands were provided, use that instead.
if ($Command) {
    return $Command | ToSplat
}

# If the request is for an icon, return nothing.
# (every request comes with one for .favicon.ico, because legacy)
if ($request.Url -match '\.ico$') { return }

$hasRoute = $This.HasRoute($request)
if ($hasRoute.Value -is [int]) {    
    return $hasRoute.Value
}

$routedTo = $hasRoute.Value

if ($routedTo -is [Management.Automation.CommandInfo]) {    
    return $routedTo | ToSplat
} else {
    return $routedTo
}