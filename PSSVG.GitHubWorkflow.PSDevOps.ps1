#requires -Module PSDevOps
New-GitHubWorkflow -Name "Analyze, Test, Tag, and Publish" -On Push, PullRequest, Demand -Job PowerShellStaticAnalysis, TestPowerShellOnLinux, TagReleaseAndPublish, UsePiecemeal, BuildPipeScript, RunEZOut, HelpOut -Environment @{
    NoCoverage = $true
}|
    Set-Content (Join-Path $PSScriptRoot .github\workflows\TestAndPublish.yml) -Encoding UTF8 -PassThru

