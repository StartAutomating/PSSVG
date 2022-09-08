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
}
