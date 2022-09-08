$PSSVGLoaded = Get-Module PSSVG
if (-not $PSSVGLoaded) {
    $PSSVGLoaded = Get-ChildItem -Recurse -Filter "*.psd1" | Where-Object Name -like 'PSSVG*' | Import-Module -Name { $_.FullName } -Force -PassThru
}
if ($PSSVGLoaded) {
    "::notice title=ModuleLoaded::PSSVG Loaded" | Out-Host
} else {
    "::error:: PSSVG not loaded" |Out-Host
}
if ($PSSVGLoaded) {
    Save-MarkdownHelp -Module $PSSVGLoaded.Name -PassThru
}
