$showElementIf = {'#text','#whitespace','#document' -notcontains $_.LocalName }
Write-FormatTreeView -Property @({
    Write-FormatViewExpression -ForegroundColor Success -if $showElementIf -ScriptBlock { '<'.Trim() }
    Write-FormatViewExpression -ForegroundColor Verbose -if $showElementIf -ScriptBlock {
        $_.LocalName
    }
    Write-FormatViewExpression -ControlName XmlAttributeControl -ScriptBlock {$_.Attributes} -Enumerate -If {
        $_.HasAttributes -and '#text', '#whitespace' -notcontains $_.LocalName
    }
    Write-FormatViewExpression -ForegroundColor Success -ScriptBlock {
        if ($_.HasChildren -or $_.HasChildNodes) {
            '>'
        } else {
            '/>'
        }
    } -if $showElementIf
    Write-FormatViewExpression -If { $_.LocalName -eq '#text' } -ScriptBlock {$_.InnerText } -ForegroundColor 'Verbose'
}) -TypeName 'Svg.Element' -HasChildren { $_.HasChildren -or $_.HasChildNodes -and $_.LocalName -ne '#whitespace'} -Children {
    @(foreach ($cn in $_.ChildNodes) {
        if ($cn.LocalName -eq '#whitespace') { continue }
        $cn
    })
} -EndBranchScript {
    Write-FormatViewExpression -ForegroundColor Success -ScriptBlock {
        if (-not ($_.HasChildren -or $_.HasChildNodes) -or $_.LocalName -eq '#document') {
            ''
        } else {
            [Environment]::NewLine + (' ' * ($script:TreeDepth - 1)* 4) + '</'
        }
    }
    Write-FormatViewExpression -ForegroundColor Verbose -ScriptBlock {
         if (($_.HasChildren -or $_.HasChildNodes) -and $_.LocalName -ne '#document') { $_.LocalName}
    }
    Write-FormatViewExpression -ForegroundColor Success -ScriptBlock {
        if (($_.HasChildren -or $_.HasChildNodes) -and $_.LocalName -ne '#document') {'>'}
    }
} -ControlName SVGNodeControl
