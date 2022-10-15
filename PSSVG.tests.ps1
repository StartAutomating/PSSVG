describe PSSVG {
    context 'Generates SVGs' {
        it 'Has Pleanty of /Examples' {
            Get-Module PSSVG | 
                Split-Path | 
                Join-Path -ChildPath Examples | 
                Get-ChildItem -Filter *.PSSVG.ps1 |
                ForEach-Object {
                    & $_.Fullname | 
                        ForEach-Object {
                            $_.GetType() | Should -Be ([IO.FileInfo])
                        }
                }
        }
        it 'Makes SVGs Pretty Quickly' {
            Get-Module PSSVG | 
                Split-Path | 
                Join-Path -ChildPath Examples | 
                Get-ChildItem -Filter *.PSSVG.ps1 |
                ForEach-Object {
                    $fileInfo = $_
                    (Measure-Command {
                        & $fileInfo.Fullname 
                    }).TotalSeconds | 
                    Should -BeLessThan 1 # Honestly, it should only be a few milliseconds, just leaving breathing room in case the test machine is slow.
                }
        }
    }

    context 'Converting SVGs' {
        it 'Can convert SVGs to PSSVG' {
            ConvertTo-PSSVG https://raw.githubusercontent.com/StartAutomating/PSSVG/main/Assets/PSSVG.svg | 
                ForEach-Object { 
                    $_.GetType() | Should -Be ([scriptblock])
                }

            Get-ChildItem -Path $PSScriptRoot -Filter *.svg |
                Select-Object -First 1 |
                ConvertTo-PSSVG |
                ForEach-Object { 
                    $_.GetType() | Should -Be ([scriptblock])
                }
        }
    }
}
