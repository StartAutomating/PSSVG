[ValidatePattern("SVG\.HTML")]
param()

function SVG.HTML {
    <#
    .SYNOPSIS
        Embeds HTML in SVG
    .DESCRIPTION
        Embeds HTML (technically, XHTML) in an SVG element.
    .NOTES
        The HTML is wrapped in an XHTML element.
        The XHTML is then passed to SVG.foreignObject to render the SVG.
    #>
    [Inherit('SVG.foreignObject',Abstract,Dynamic)]
    param(
    # The HTML. For this to work properly, it should be XHTML
    [vbn()]
    [Alias('XHTML')]
    [string]
    $HTML
    )

    process {
        $myParameterCopy = [Ordered]@{} + $PSBoundParameters
        $xhtml = "<xhtml xmlns='http://www.w3.org/1999/xhtml'>$($HTML)</xhtml>" -as [xml]
        if (-not $xhtml) {
            Write-Warning "The HTML is not valid XHTML"
            return $Html
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