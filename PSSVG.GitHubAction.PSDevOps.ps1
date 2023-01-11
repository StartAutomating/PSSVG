#requires -Module PSDevOps
#requires -Module PSSVG
Import-BuildStep -ModuleName PSSVG
New-GitHubAction -Name "MakePSSVG" -Description @'
Build SVGs in your Workflow (with PowerShell)
'@ -Action PSSVG -Icon aperture -OutputPath .\action.yml 
