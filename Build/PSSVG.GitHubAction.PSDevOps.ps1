#requires -Module PSDevOps
Import-BuildStep -SourcePath (
    Join-Path $PSScriptRoot 'GitHub'
) -BuildSystem GitHubAction

Push-Location ($PSScriptRoot | Split-Path)

New-GitHubAction -Name "MakePSSVG" -Description @'
Build SVGs in your Workflow (with PowerShell)
'@ -Action PSSVG -Icon aperture -OutputPath .\action.yml 


Pop-Location