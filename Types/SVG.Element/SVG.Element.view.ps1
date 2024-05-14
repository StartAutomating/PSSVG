[OutputType('SVG.Element')]
param()

Write-FormatViewExpression -If {$script:TreeDepth = 0;$true} -ControlName SVGNodeControl -ScriptBlock {
    @(foreach ($cn in $_.ChildNodes) {
        if ($cn -is [xml.xmldeclaration]) { continue }
        $cn
    })
} -Enumerate
Write-FormatViewExpression -If {$ExecutionContext.SessionState.PSVariable.Remove('script:TreeDepth'); $false} -ScriptBlock { $null }
