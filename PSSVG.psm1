foreach ($file in Get-ChildItem -Filter *-*.ps1 -Path $PSScriptRoot) {
    if ($file.Name -like '*-*.ps1' -and $file.Name -notlike '.*.ps1') {
        . $file.FullName
    }    
}

$myModule = $MyInvocation.MyCommand.ScriptBlock.Module
$ExecutionContext.SessionState.PSVariable.Set($myModule.Name, $myModule)
$myModule.pstypenames.insert(0, $myModule.Name)

$svgCommandsPath = Join-Path $PSScriptRoot Commands

foreach ($file in Get-ChildItem -Filter *.ps1 -Path $svgCommandsPath -Recurse) {
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

New-PSDrive -Name $MyModule.Name -PSProvider FileSystem -Scope Global -Root $PSScriptRoot -ErrorAction Ignore

if ($home) {
    $MyModuleProfileDirectory = Join-Path $home $MyModule.Name
    if (-not (Test-Path $MyModuleProfileDirectory)) {
        $null = New-Item -ItemType Directory -Path $MyModuleProfileDirectory -Force
    }
    New-PSDrive -Name "My$($MyModule.Name)" -PSProvider FileSystem -Scope Global -Root $MyModuleProfileDirectory -ErrorAction Ignore
}

$myTypeData = Get-TypeData -TypeName $MyModule.Name
$myMembers  = @($myTypeData.Members.GetEnumerator())
$KnownVerbs = Get-Verb | Select-Object -ExpandProperty Verb

$myMemberCommands  =
    [ScriptBlock]::Create(@(foreach ($myMemberInfo in $myMembers) {
        $myMemberName = $myMemberInfo.Key
        $myMember = $myMemberInfo.Value
        if ($myMember -is [Management.Automation.Runspaces.ScriptMethodData]) {            
            $myFunctionName = 
                if ($myMemberName -in $KnownVerbs) {
                    "$($myMemberName)-$($MyModule.Name)"
                } else {
                    "$($MyModule.Name).$($myMemberName)"
                }
            # Declare My Function
            "function $myFunctionName { $($myMember.Script) }"
            if ($myMemberName -in $KnownVerbs) {
                # Alias it if it's a known verb, so both verb and noun form are available.
                "Set-Alias -Name '$($myFunctionName -replace '-','.')' -Value '$myFunctionName'"
            }
        }
        elseif ($myMember -is [Management.Automation.Runspaces.AliasPropertyData] -and
            $myTypeData.Members[$myMember.ReferencedMemberName] -is [Management.Automation.Runspaces.ScriptMethodData]
        ) {
            "Set-Alias -Name '$($myMember.Name)' -Value '$($myMember.ReferencedMemberName)'"
        }
    }) -join [Environment]::NewLine)

. $myMemberCommands
# Set a script variable of this, set to the module
# (so all scripts in this scope default to the correct `$this`)
$script:this = $myModule

Export-ModuleMember -Alias * -Function * -Variable $myModule.Name
