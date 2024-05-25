<#
.SYNOPSIS
    Starts a PSSVG server.
.DESCRIPTION
    Starts a server for PSSVG.    
#>  
param(
# The URL to serve the server on.
[string]
$ServerUrl,

# The local root path to serve files from.
# If this is not provided, the root directory of PSSVG will be used.
[string]
$RootPath,

# The port to serve on.  If this is not provided, a random port will be used.
[int]
$Port,

# The scriptblock used to serve requests.
[ScriptBlock]
$Server
)

if ((-not $this) -and $MyInvocation.MyCommand.ScriptBlock.Module) {
    $this = $MyInvocation.MyCommand.ScriptBlock.module
}

$environmentVariables = Get-ChildItem env:

if (-not $ServerUrl) {    
    $myServerUrl = $environmentVariables | 
        Where-Object Name -eq "$($this.Name)_URL" | 
        Select-Object -ExpandProperty Value
    
    
    $serverUrl = $(if (-not $myServerUrl) {
        if ($PSVersionTable.Platform -eq 'Unix') {
            if (-not $port) { $port = 80}
            "http://*:$port/"
        } else {
            if (-not $port) { $port = $(Get-Random -Min 4000 -Max 8000)}
            "http://localhost:$port/$($this.Name)/"
        }    
    } else {
        $myServerUrl
    })
}

if (-not $serverUrl) {
    return
}

if (-not $RootPath) {
    $myServerRoot = $environmentVariables | 
        Where-Object Name -eq "$($this.Name)_ROOT" | 
        Select-Object -ExpandProperty Value

    $RootPath = 
        if (-not $myServerRoot) {
            $this | Split-Path
        } else {
            $myServerRoot
        }
}

if (-not $Server -and $this.Serve.Script) {
    $server = $this.Serve.Script
}

# Start the node, passing the current script block and the PSSVG module
$psNode = @(Start-PSNode -Server $serveUrl -Command $Server -ImportModule "PSSVG") -ne $null

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