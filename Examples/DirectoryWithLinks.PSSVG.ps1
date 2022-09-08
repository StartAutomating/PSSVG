#require -Module PS2D

$fileList      = @(Get-ChildItem -Path $PSScriptRoot)
$fileListText  = $fileList | Select-Object Name | Out-String -Width 1kb
$fileListLines = @($fileListText -split '(?>\r\n|\n)')

$fontSize = 14

=<svg> @(
    $ln = 0
    foreach ($line in $fileListLines) {
        $ln++
        $href = 
            if ($ln -le 2) {
                "."
            } else {
                $file = $fileList[$ln - 3]
                $file.Name
            }
        =<svg.a> -href $href (
            =<svg.text> -X 0 -Y ($ln * $fontSize) -Fontsize $fontSize $fileListLines[$ln] -Xmlspace preserve -Fontfamily monospace
        )        
    }
) -OutputPath (Join-Path $PSScriptRoot DirectoryWithLinks.svg)


