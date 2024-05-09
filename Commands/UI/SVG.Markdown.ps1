[ValidatePattern("SVG\.Markdown")]
param()
function SVG.Markdown {
    <#
    
    .SYNOPSIS    
        Embeds Markdown in SVG    
    .DESCRIPTION    
        Converts from Markdown to HTML and embeds it into SVG.    
    .NOTES    
        The markdown is converted to HTML using ConvertFrom-Markdown, and then wrapped in an body element with the XHTML namespace.    
        The XHTML is then passed to SVG.foreignObject to render the SVG.    
    
    #>
        
    param(
    # The markdown.  The YAML header is currently ignored.    
    [Parameter(ValueFromPipelineByPropertyName)]
    [string]
    $Markdown
    )
    dynamicParam {
    $baseCommand = 
        if (-not $script:SVGforeignObject) {
            $script:SVGforeignObject = 
                $executionContext.SessionState.InvokeCommand.GetCommand('SVG.foreignObject','Function')
            $script:SVGforeignObject
        } else {
            $script:SVGforeignObject
        }
    $IncludeParameter = @()
    $ExcludeParameter = @()


    $DynamicParameters = [Management.Automation.RuntimeDefinedParameterDictionary]::new()            
    :nextInputParameter foreach ($paramName in ([Management.Automation.CommandMetaData]$baseCommand).Parameters.Keys) {
        if ($ExcludeParameter) {
            foreach ($exclude in $ExcludeParameter) {
                if ($paramName -like $exclude) { continue nextInputParameter}
            }
        }
        if ($IncludeParameter) {
            $shouldInclude = 
                foreach ($include in $IncludeParameter) {
                    if ($paramName -like $include) { $true;break}
                }
            if (-not $shouldInclude) { continue nextInputParameter }
        }
        
        $DynamicParameters.Add($paramName, [Management.Automation.RuntimeDefinedParameter]::new(
            $baseCommand.Parameters[$paramName].Name,
            $baseCommand.Parameters[$paramName].ParameterType,
            $baseCommand.Parameters[$paramName].Attributes
        ))
    }
    $DynamicParameters

    }
        begin {
        ${?<Markdown_YamlHeader} = [Regex]::New('
        (?<Markdown_YAMLHeader>
        (?m)\A\-{3,}                      # At least 3 dashes mark the start of the YAML header
        (?<YAML>(?:.|\s){0,}?(?=\z|\-{3,} # And anything until at least three dashes is the content
        ))\-{3,}                          # Include the dashes in the match, so that the pointer is correct.
        )', 'IgnorePatternWhitespace,IgnoreCase')
    
    }
        process {
        if (-not $Markdown) { return }
        $myParameterCopy = [Ordered]@{} + $PSBoundParameters
        $ThisMarkdownHeader = ${?<Markdown_YamlHeader}.Match($Markdown)
        if ($ThisMarkdownHeader.Success) {
            $YamlHeader = $ThisMarkdownHeader.Groups['YAML'].Value
            $Markdown = $Markdown -replace ${?<Markdown_YamlHeader}
        }
        $convertedThisMarkdown = ConvertFrom-Markdown -InputObject $Markdown
        $xhtml = "<body class='markdown-svg'>xmlns='http://www.w3.org/1999/xhtml'>$($convertedThisMarkdown.Html)</body>" -as [xml]
        if (-not $xhtml) {
            return $convertedThisMarkdown.Html
        }
        $myParameterCopy.Remove('Markdown')
        if ($myParameterCopy.Content) {
            $myParameterCopy.Content = @($myParameterCopy.Content) + $xhtml
        } else {
            $myParameterCopy.Add('Content', $xhtml)
        }

        if (-not $myParameterCopy['Width']) {
            $myParameterCopy.Add('Width', '100%')
        }

        if (-not $myParameterCopy['Height']) {
            $myParameterCopy.Add('Height', '100%')
        }
        
        SVG.foreignObject @myParameterCopy
    
    }
}


