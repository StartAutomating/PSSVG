Write-FormatCustomView -AsControl -Action {
    Write-FormatViewExpression -ForegroundColor Verbose -ScriptBlock {
        ' ' + $_.Name
    }
    Write-FormatViewExpression -ForegroundColor Warning -ScriptBlock {
        $null = $_.OuterXml -match '=\s{0,}(?<q>["''])'
        if ($matches.Q) {
            '=' + $matches.Q
        }
    }
    Write-FormatViewExpression -ForegroundColor Blue -ScriptBlock {
        [security.SecurityElement]::Escape($_.Value)
    }
    Write-FormatViewExpression -ForegroundColor Warning -ScriptBlock {
        $null = $_.OuterXml -match '=\s{0,}(?<q>["''])'
        $matches.Q
    }

} -Name XmlAttributeControl