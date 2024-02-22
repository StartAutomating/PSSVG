<#
.SYNOPSIS
    Runs before PSSVGs main build
.DESCRIPTION
    Runs before the main PSSVG build.
.NOTES
    This will import PSSVG for later build steps.
#>
[Relfection.AssemblyMetaData("Order",-1kb)]
param()

Push-Location ($PSScriptRoot | Split-Path)

Import-Module .\PSSVG.psd1 -Force -Global -PassThru | Out-Host

Pop-Location
