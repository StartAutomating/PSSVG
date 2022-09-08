#requires -Module PSDevOps
#requires -Module PSSVG
Import-BuildStep -ModuleName PSSVG
New-GitHubAction -Name "MakePSSVG" -Description 'Script SVGs with PowerShell' -Action PSSVG -Icon aperture -ActionOutput ([Ordered]@{
    PSSVGRuntime = [Ordered]@{
        description = "The time it took the .PSSVG parameter to run"
        value = '${{steps.PSSVGAction.outputs.PSSVGRuntime}}'
    }
    PSSVGBuildRuntime = [Ordered]@{
        description = "The time it took Build-PSSVG to run"
        value = '${{steps.PSSVGAction.outputs.PSSVGBuildRuntime}}'
    }
    PSSVGFilesBuilt = [Ordered]@{
        description = "The files built using PSSVG (separated by semicolons)"
        value = '${{steps.PSSVGAction.outputs.PSSVGFilesBuilt}}'
    }
    PSSVGFilesBuiltCount = [Ordered]@{
        description = "The number of .PSSVG.ps1 files that were run"
        value = '${{steps.PSSVGAction.outputs.PSSVGFilesBuiltCount}}'
    }
}) |
    Set-Content .\action.yml -Encoding UTF8 -PassThru
