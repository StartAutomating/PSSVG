foreach ($file in Get-ChildItem -Filter *.ps1 -Path $PSScriptRoot) {            
    if ($file.Name -match '^SVG\.')  {
        . $file.FullName
        $functionName = $file.Name -replace '\.ps1$'
        $aliasName = $functionName -replace '^SVG\.'
        if ($aliasName -eq 'svg') {
            Set-Alias "=<svg>" "$functionName" 
            Set-Alias "svg" "$functionName"
        } else {
            Set-Alias "=<svg.$aliasName>" "$functionName"            
        }        
    }
    elseif ($file.Name -like '*-*.ps1') {
        . $file.FullName
    }
}

Export-ModuleMember -Alias * -Function *
