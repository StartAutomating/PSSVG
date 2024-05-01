#requires -Module PSSVG
param(
# The ViewBox of the SVG
[int[]]
$ViewBox = @(1920, 1080),

# The font size
[string]
$FontSize = "3em",

# The google font to use
[string]
$GoogleFont,

# The markdown to convert to SVG
[string]
$Markdown = "# Hello World"
)

svg -ViewBox $ViewBox -Data $Data -FontSize $FontSize @(
    if ($GoogleFont) {
        SVG.GoogleFont -Font $GoogleFont
    }
    $MarkdownParameters = [Ordered]@{}
    if ($GoogleFont) { $MarkdownParameters.FontFamily = $GoogleFont}
    SVG.Markdown -Markdown $Markdown @MarkdownParameters
) -OutputPath (Join-Path $PSScriptRoot .\MarkdownMessage.svg)
