#requires -Module PSSVG

$fileList      = @(Get-ChildItem -Path $PSScriptRoot)
$fileListText  = $fileList | Select-Object Name | Out-String -Width 1kb
$fileListLines = @($fileListText -split '(?>\r\n|\n)')

$fontSize = 14

$ln = 0
$maxLineLength =0 
$goldenRatio   = (1 + [Math]::Sqrt(5)) / 2

=<svg> (
    =<svg.text> -Fontsize $fontSize -FontFamily monospace -Fill '#4488ff' @(    
    foreach ($line in $fileListLines) {
        $ln++
        $href = 
            if ($ln -le 2) {
                "."
            } else {
                $file = $fileList[$ln - 3]
                $file.Name
            }
        if ($line.Length -gt $maxLineLength) {
            $maxLineLength = $line.Length
        }
        
        =<svg.a> -href $href (
            =<svg.tspan> -X 0 -DY 1.2em -Fontsize $fontSize $fileListLines[$ln] -Xmlspace preserve -Fontfamily monospace -Fill '#4488ff'
        )
    }
    )
) -OutputPath (Join-Path $PSScriptRoot Index.svg) -ViewBox "0 0 $(($maxLineLength * $fontSize)/$goldenRatio) $($ln * $fontSize * 1.2)"


