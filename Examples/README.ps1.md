~~~PipeScript {
    
    $files     = Get-ChildItem -Filter *.PSSVG.ps1 -Path $pwd
    $svgFiles  = Get-ChildItem -Filter *.svg -Path $pwd
    

    [PSCustomObject]@{
        Table = $files | 
            Select-Object @{
                Name='Example Name'
                Expression = {
                    $file = $_
                    "[$($file.Name -replace '\.PSSVG\.ps1$')]($($file.Name))"
                }            
            }, @{
                Name='Image'
                Expression = {
                    $fileName = $_.Name -replace '\.PSSVG\.ps1$'

                    @(Get-ChildItem |
                        Where-Object { 
                            $_.Name -match "$fileName\d{0,}\.svg$" -and
                            $_.Name.StartsWith($fileName)
                        } |
                        Foreach-Object {
                            "[$($_.Name)]($($_.Name))"
                            "![$fileName]($($_.Name))"
                        }) -join '<br/>'
                }
            }              
    }



    "$($svgFile.Count) SVG examples (~ $([Math]::Round(($svgFile | Measure-Object -Sum -Property Length | Select -Expand Sum)/1kb)) kb )"    
}
~~~
