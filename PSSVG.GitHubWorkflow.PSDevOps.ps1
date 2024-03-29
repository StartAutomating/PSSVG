#requires -Module PSDevOps
Import-BuildStep -ModuleName PSSVG
New-GitHubWorkflow -Name "Analyze, Test, Tag, and Publish" -On Push, PullRequest, Demand -Job PowerShellStaticAnalysis, TestPowerShellOnLinux, TagReleaseAndPublish, MakePSSVG -Environment @{
    NoCoverage = $true
    GIT_TOKEN = '${{secrets.GITHUB_TOKEN}}'
} -OutputPath (
    Join-Path $PSScriptRoot .github\workflows\TestAndPublish.yml
)

New-GitHubWorkflow -On Demand -Job RunGitPub -Name GitPub -OutputPath (
    Join-Path $PSScriptRoot .github\workflows\GitPub.yml
)
