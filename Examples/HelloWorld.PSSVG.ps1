#requires -Module PSSVG

param(
[string]
$Message = "Hello World",

[string]
$GoogleFont = "Roboto",

[string]
$Fill = '#4488ff',

[string[]]
$Class,

[string]
$FontSize = "24em",

[double]
$Width = 1920,

[double]
$Height = 1080
)

svg @(
    svg.defs @(
        SVG.GoogleFont -FontName $GoogleFont
    )
    svg.text -X 50% -Y 50% -Fontsize $FontSize $Message -DominantBaseline middle -TextAnchor middle -Fill $Fill -Class $Class -FontFamily "'$GoogleFont', sans-serif"
) -ViewBox 0,0, 1920, 1080 -OutputPath (Join-Path $psScriptRoot .\HelloWorld.svg)
