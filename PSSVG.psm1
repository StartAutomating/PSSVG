foreach ($file in Get-ChildItem -Filter *-*.ps1 -Path $PSScriptRoot) {
    if ($file.Name -like '*-*.ps1' -and $file.Name -notlike '.*.ps1') {
        . $file.FullName
    }    
}

$svgCommandsPath = Join-Path $PSScriptRoot Commands

foreach ($file in Get-ChildItem -Filter SVG*.ps1 -Path $svgCommandsPath -Recurse) {
    if ($file.Name -match '^SVG\.' -and $file.Name -notmatch '\.ps1{0,1}\.ps1$')  {
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
