﻿<#
.Synopsis
    GitHub Action for PSSVG
.Description
    GitHub Action for PSSVG.  This will:

    * Import PSSVG
    * Run all *.PSSVG.ps1 files beneath the workflow directory
    * Run a .PSSVGScript parameter

    Any files changed can be outputted by the script, and those changes can be checked back into the repo.
    Make sure to use the "persistCredentials" option with checkout.
#>

param(
# A PowerShell Script that uses PSSVG.  
# Any files outputted from the script will be added to the repository.
# If those files have a .Message attached to them, they will be committed with that message.
[string]
$PSSVG,

# If set, will not process any files named *.PSSVG.ps1
[switch]
$SkipPSSVGPS1,

# If set, will not run Build-PSSVG.
[switch]
$SkipBuild,

# If provided, will commit any remaining changes made to the workspace with this commit message.
# If no commit message is provided, if a GitHub Event contains a commit message, that message will be used.
# If no commit message is provided, and a commit message cannot be automatically detected, changes will not be committed.
[string]
$CommitMessage,

# The user email associated with a git commit.
[string]
$UserEmail,

# The user name associated with a git commit.
[string]
$UserName
)

"::group::Parameters" | Out-Host
[PSCustomObject]$PSBoundParameters | Format-List | Out-Host
"::endgroup::" | Out-Host

$gitHubEvent = if ($env:GITHUB_EVENT_PATH) {
    [IO.File]::ReadAllText($env:GITHUB_EVENT_PATH) | ConvertFrom-Json
} else { $null }

@"
::group::GitHubEvent
$($gitHubEvent | ConvertTo-Json -Depth 100)
::endgroup::
"@ | Out-Host

$PSD1Found = Get-ChildItem -Recurse -Filter "*.psd1" | Where-Object Name -eq 'PSSVG.psd1' | Select-Object -First 1

if ($PSD1Found) {
    $PSSVGModulePath = $PSD1Found
    Import-Module $PSD1Found -Force -PassThru | Out-Host
} elseif ($env:GITHUB_ACTION_PATH) {
    $PSSVGModulePath = Join-Path $env:GITHUB_ACTION_PATH 'PSSVG.psd1'
    if (Test-path $PSSVGModulePath) {
        Import-Module $PSSVGModulePath -Force -PassThru | Out-Host
    } else {
        throw "PSSVG not found"
    }
} elseif (-not (Get-Module PSSVG)) {    
    throw "Action Path not found"
}

"::notice title=ModuleLoaded::PSSVG Loaded from Path - $($PSSVGModulePath)" | Out-Host

$anyFilesChanged = $false
$processScriptOutput = { process { 
    $out = $_
    $outItem = Get-Item -Path $out -ErrorAction SilentlyContinue
    $fullName, $shouldCommit = 
        if ($out -is [IO.FileInfo]) {
            $out.FullName, (git status $out.Fullname -s)
        } elseif ($outItem) {
            $outItem.FullName, (git status $outItem.Fullname -s)
        }
    if ($shouldCommit) {
        git add $fullName
        if ($out.Message) {
            git commit -m "$($out.Message)"
        } elseif ($out.CommitMessage) {
            git commit -m "$($out.CommitMessage)"
        }
        elseif ($CommitMessage) {
            git commit -m $CommitMessage   
        }
        elseif ($gitHubEvent.head_commit.message) {
            git commit -m "$($gitHubEvent.head_commit.message)"
        }        
        $anyFilesChanged = $true
    }
    $out
} }


if (-not $UserName) { $UserName = $env:GITHUB_ACTOR }
if (-not $UserEmail) { 
    $GitHubUserEmail = 
        if ($env:GITHUB_TOKEN) {
            Invoke-RestMethod -uri "https://api.github.com/user/emails" -Headers @{
                Authorization = "token $env:GITHUB_TOKEN"
            } |
                Select-Object -First 1 -ExpandProperty email
        } else {''}
    $UserEmail = 
    if ($GitHubUserEmail) {
        $GitHubUserEmail
    } else {
        "$UserName@github.com"
    }    
}
git config --global user.email $UserEmail
git config --global user.name  $UserName

if (-not $env:GITHUB_WORKSPACE) { throw "No GitHub workspace" }

$branchName = git rev-parse --abrev-ref HEAD
if (-not $branchName) { 
    return
}

$PSSVGStart = [DateTime]::Now
if ($PSSVG) {
    $PSSVG |
        . $processScriptOutput |
        Out-Host
}

$PSSVGTook = [Datetime]::Now - $PSSVGStart
# "::set-output name=PSSVGRuntime::$($PSSVGScriptTook.TotalMilliseconds)" | Out-Host

$PSSVGPS1Start = [DateTime]::Now
$PSSVGPS1List  = @()

if (-not $SkipPSSVGPS1) {
    $PSSVGFiles = @(
    Get-ChildItem -Recurse -Path $env:GITHUB_WORKSPACE |
        Where-Object Name -Match '\.PSSVG\.ps1$')
        
    if ($PSSVGFiles) {
        $PSSVGFiles |        
            ForEach-Object {
                $PSSVGPS1List += $_.FullName.Replace($env:GITHUB_WORKSPACE, '').TrimStart('/')
                $PSSVGPS1Count++
                "::notice title=Running::$($_.Fullname)" | Out-Host
                . $_.FullName |            
                    . $processScriptOutput  | 
                    Out-Host
            }
    }
}

$PSSVGPS1EndStart = [DateTime]::Now
$PSSVGPS1Took = [Datetime]::Now - $PSSVGPS1Start
# "::set-output name=PSSVGPS1Count::$($PSSVGPS1List.Length)"   | Out-Host
# "::set-output name=PSSVGPS1Files::$($PSSVGPS1List -join ';')"   | Out-Host
# "::set-output name=PSSVGPS1Runtime::$($PSSVGPS1Took.TotalMilliseconds)"   | Out-Host

if ($CommitMessage -or $anyFilesChanged) {
    if ($CommitMessage) {
        dir $env:GITHUB_WORKSPACE -Recurse |
            ForEach-Object {
                $gitStatusOutput = git status $_.Fullname -s
                if ($gitStatusOutput) {
                    git add $_.Fullname
                }
            }

        git commit -m $ExecutionContext.SessionState.InvokeCommand.ExpandString($CommitMessage)
    }    
    


    $checkDetached = git symbolic-ref -q HEAD
    if (-not $LASTEXITCODE) {
        "::notice::Pulling Changes" | Out-Host
        git pull | Out-Host
        "::notice::Pushing Changes" | Out-Host
        git push | Out-Host
        "Git Push Output: $($gitPushed  | Out-String)"
    } else {
        "::notice::Not pushing changes (on detached head)" | Out-Host
        $LASTEXITCODE = 0
        exit 0
    }
}
