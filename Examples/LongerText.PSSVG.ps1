#requires -Module PSSVG

$longText = dir | Out-String
$longTextLines = @($longText -split '(?>\r\n|\n)')
$fontSize = 14
$lineSpacing = 1.2

$ln = 0
$maxLineLength =0 
$goldenRatio   = (1 + [Math]::Sqrt(5)) / 2

=<svg> @(
    $ln = 0
    foreach ($line in $longTextLines) {
        $ln++
        if ($line.Length -gt $maxLineLength) {
            $maxLineLength = $line.Length
        }
        =<svg.text> -X 0 -Y ($ln * $fontSize * $lineSpacing) -Fontsize $fontSize $longTextLines[$ln] -Xmlspace preserve -Fontfamily monospace -Fill '#4488ff'
    }
    
) -ViewBox "0 0 $(($maxLineLength * $fontSize)/$goldenRatio) $($ln * $fontSize * 1.2)" -OutputPath (Join-Path $PSScriptRoot .\LongerText.svg)


