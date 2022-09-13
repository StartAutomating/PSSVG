@{
    ModuleVersion     = '0.2.1'
    Guid              = '77696e6e-0252-43f2-b914-2dfa63953c60'
    CompanyName       = 'Start-Automating'
    Copyright         = '2022 Start-Automating'
    Author            = 'James Brundage'
    AliasesToExport   = '*'
    RootModule        = 'PSSVG.psm1'
    Description       = 'Script SVGs with PowerShell'
    PrivateData = @{
        PSData = @{
            Tags = 'SVG', 'ScalableVectorGraphics', 'PowerShell', 'PipeScript', 'Irregular'
            ProjectURI = 'https://github.com/StartAutomating/PSSVG'
            LicenseURI = 'https://github.com/StartAutomating/PSSVG/blob/main/LICENSE'            
            ReleaseNotes = @'
### 0.2.1
* Improved Command Help
  * Adding More Examples (Fixes #21)
  * Adding Example/README.md (Fixes #26)
* Write-SVG: Allowing 2 value ViewBox (Fixes #28)
* All SVG.* commands allow elements (Fixes #25 )
* All SVG.* commands now have argument completers (Fixes #24)
---           

### 0.2
* All SVG. commands now support -Data attributes (Fixes #12)
* Improved Command Help
  * Linking to docs and MDN (Get-Help SVG.a -Online) (Fixes #15)
  * Adding .Examples (Fixes #18)  
* Adding Write-SVG (Fixes #14)
---

### 0.1
* Initial Release of PSSVG, including:
  * A command for every SVG element (fixes #1)
  * Lots of examples (fixes #2)
  * CI/CD (fixes #3) with tests (fixes #4)
  * automatically generated documentation (fixes #5), thanks to [HelpOut](https://github.com/StartAutomating/HelpOut)
  * A GitHub action (fixes #6), thanks to [PSDevOps](https://github.com/StartAutomating/PSDevOps)
  * It's own logo (fixes #7)
  * The script used to generate every SVG element (fixes #8)
  * [A github page](https://PSSVG.start-automating.com) (fixes #9)
---
'@
        }
    }
}
