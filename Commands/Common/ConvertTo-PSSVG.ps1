function ConvertTo-PSSVG
{
    <#
    .SYNOPSIS
        Converts an SVG to PSSVG
    .DESCRIPTION
        Converts an SVG to a PowerShell Script that would generate that SVG
    .LINK
        Write-SVG
    .EXAMPLE
        ConvertTo-PSSVG -InputObject https://PSSVG.start-automating.com/Assets/PSSVG.svg
    .EXAMPLE
        ConvertTo-PSSVG -InputObject .\a.svg
    .EXAMPLE
        ConvertTo-PSSVG -InputObject "<svg><circle cx='5' cy='5' r='3'></svg>"
    #>
    param(
    [Parameter(Mandatory)]
    $InputObject
    )

    begin {
        $indentDepth = 0 
        filter ToPSSVG {
            if ($_.LocalName -eq '#whitespace') { return }
            if ($_.LocalName -eq '#text') {
                (' ' * (4 * $indentDepth)) + "'$($_.Value -replace "'", "''")'"
            } elseif ($_.LocalName) {
                $xin = $_
                $svgCmdName = if ($xin.LocalName -ne 'SVG') {
                    "=<SVG.$($xin.LocalName)>"
                } else {
                    "=<SVG>"
                }

                (' ' * (4 * $indentDepth)) + $svgCmdName
                $svgFunc = $ExecutionContext.SessionState.InvokeCommand.GetCommand($svgCmdName, 'Alias').ResolvedCommand
                
                
                foreach ($attr in $xin.Attributes) {
                    $paramName = $attr.LocalName -replace '-'
                    if (-not $svgFunc.Parameters.$paramName) {
                        continue
                    }
                    " -$paramName "
                    "'$($attr.'#text' -replace "'","''")'"
                }

                $xChildren = @($xin.ChildNodes)

                if ($xChildren) {
                    $indentDepth++
                    " -Content @("
                    [Environment]::NewLine                    
                    foreach ($childNode in $xin.ChildNodes) {
                        $childNode | ToPSSVG
                    }                    
                    [Environment]::NewLine
                    ")"
                    $indentDepth--
                }
                [Environment]::NewLine
            } else {
                $_
            }
        }
    }

    process {
        # If the input looks like a URL
        if ($InputObject -match '^https{0,1}://') 
        {
            # go get it
            $InputObject = Invoke-RestMethod -Uri $InputObject
            if ($InputObject -is [string]) {
                $InputObject = ($InputObject -replace '^[^<]+') -as [xml]
            }
        } elseif ($InputObject -isnot [xml] -and 
            $InputObject -isnot [Xml.XmlDocument] -and 
            (-not ($InputObject -as [xml]))
        ) {
            # If it's not XML and won't be XML, try loading it from a file.
            $resolvedPath = $ExecutionContext.SessionState.Path.GetResolvedPSPathFromPSPath($InputObject)
            if (-not $resolvedPath) { return }
            if ($resolvedPath) {
                $inputObject = [xml][IO.File]::ReadAllText($resolvedPath)
            }
        } elseif ($InputObject -as [xml]) {
            # If the input was castable to XML, cast it to XML.
            $InputObject = $InputObject -as [xml]
        }

        # If the input isn't XML at this point, error out.
        if ($InputObject -isnot [xml] -and $InputObject -isnot [Xml.XmlDocument]) {
            Write-Error "Could not convert input to XML"
            return
        }

        # If it was an xmldocument, instead of an element
        if ($InputObject -is [xml]) {
            $InputObject = # set the input to be the first non-whitespace non-declaration child.            
                foreach ($xChild in $InputObject.ChildNodes) {
                    if ($xChild.NodeType -in 'XmlDeclaration', 'Whitespace') {
                        continue
                    }
                    $xChild
                    break
                }            
        }

        # Recursively convert this element to a PSSVG script
        $scriptText  = @($InputObject | ToPSSVG) -join ''
        # and try to create a script block
        $ScriptBlock = [ScriptBlock]::Create($scriptText)
        if ($ScriptBlock) {
            $ScriptBlock
        } else {
            $scriptText
        }
    }
}
