[ValidatePattern("SVG\.Markdown")]
param()
function SVG.Markdown
{
    <#
    .SYNOPSIS
        Embeds Markdown in SVG
    .DESCRIPTION
        Converts from Markdown to HTML and embeds it into SVG.
    .NOTES
        The markdown is converted to HTML using ConvertFrom-Markdown, and then wrapped in an XHTML element.
        The XHTML is then passed to SVG.foreignObject to render the SVG.
    #>
    [Inherit('SVG.foreignObject',Abstract,Dynamic)]
    param(
    # The markdown.  The YAML header is currently ignored.
    [vbn()]
    [string]
    $Markdown
    )

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
        $xhtml = "<xhtml xmlns='http://www.w3.org/1999/xhtml'>$($convertedThisMarkdown.Html)</xhtml>" -as [xml]
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

