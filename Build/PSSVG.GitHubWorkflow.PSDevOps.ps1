#requires -Module PSDevOps
Import-BuildStep -SourcePath (
    Join-Path $PSScriptRoot 'GitHub'
) -BuildSystem GitHubWorkflow

Push-Location ($PSScriptRoot | Split-Path)

New-GitHubWorkflow -Name "Analyze, Test, Tag, and Publish" -On Push, PullRequest, Demand -Job PowerShellStaticAnalysis, TestPowerShellOnLinux, TagReleaseAndPublish, MakePSSVG -Environment ([Ordered]@{
    NoCoverage = $true
    GIT_TOKEN = '${{secrets.GITHUB_TOKEN}}'
    REGISTRY = 'ghcr.io'
    IMAGE_NAME = '${{ github.repository }}'
}) -OutputPath (
    Join-Path $pwd .github\workflows\TestAndPublish.yml
)

New-GitHubWorkflow -On Demand -Job RunGitPub -Name GitPub -OutputPath (
    Join-Path $pwd .github\workflows\GitPub.yml
)

Pop-Location