@{
    ModuleVersion     = '0.2.10'
    Guid              = '77696e6e-0252-43f2-b914-2dfa63953c60'
    CompanyName       = 'Start-Automating'
    Copyright         = '2022-2023 Start-Automating'
    Author            = 'James Brundage'
    AliasesToExport   = '*'
    RootModule        = 'PSSVG.psm1'
    Description       = 'Script SVGs with PowerShell'
    FormatsToProcess  = 'PSSVG.format.ps1xml'
    TypesToProcess    = 'PSSVG.types.ps1xml'
    PrivateData = @{
        PSData = @{
            Tags = 'SVG', 'ScalableVectorGraphics', 'PowerShell', 'PipeScript', 'Irregular'
            ProjectURI = 'https://github.com/StartAutomating/PSSVG'
            LicenseURI = 'https://github.com/StartAutomating/PSSVG/blob/main/LICENSE'            
            ReleaseNotes = @'
### PSSVG 0.2.10:

> Like It? [Star It](https://github.com/StartAutomating/PSSVG)
> Love It? [Support It](https://github.com/sponsors/StartAutomating)

* Write-SVG - Fixing -ViewBox for string values (#127)
* Adding -ShapeName and many aliases to SVG.ConvexPolygon (#132)
* Adding HexagonPattern Example (#133)
* Adding more RepeatedShapes (with less black background) (#129)

---

Additional Changes in [Changelog](https://github.com/StartAutomating/PSSVG/blob/main/CHANGELOG.md)
'@
        }
    }
}
