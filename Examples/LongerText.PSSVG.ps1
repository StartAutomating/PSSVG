#requires -Module PSSVG

$longText = dir | Out-String
$longTextLines = @($longText -split '(?>\r\n|\n)')
$fontSize = 14

=<svg> @(
    $ln = 0
    foreach ($line in $longTextLines) {
        $ln++
        =<svg.text> -X 0 -Y ($ln * $fontSize) -Fontsize $fontSize $longTextLines[$ln] -Xmlspace preserve -Fontfamily monospace
    }
    
) -OutputPath (Join-Path $PSScriptRoot .\LongerText.svg)


