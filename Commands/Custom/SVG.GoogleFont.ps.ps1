function SVG.GoogleFont
{
    <#
    .SYNOPSIS
        SVG Google Font
    .DESCRIPTION
        Imports a Google Font into SVG.
    .NOTES
        Imported Google Fonts will not render when SVGs are linked as images.

        To use an imported Google Fonts, either load the SVG alone in it's own frame or embed the SVG directly in HTML.
    .LINK
        SVG.Style
    .LINK
        SVG.StyleSheet
    .EXAMPLE
        SVG @(
            SVG.Defs @(
                SVG.GoogleFont -FontName Abel
            )
            
            SVG.Text -Text "Abel" -X 50% -Y 50% -TextAnchor 'middle'
        ) -Viewbox 100,100 -OutputPath .\abel.svg
    #>
    [inherit('SVG.Style', Abstract,Dynamic,ExcludeParameter='Type')]
    param(
    # The name of the font.
    [Parameter(ValueFromPipelineByPropertyName)]
    [string]
    $FontName
    )

    process {
        $null = $PSBoundParameters.Remove('FontName')
        $extraContent = ''
        if ($FontName) {
            if ($FontName -like 'http*') {
                $fontUri = $FontName
            } else {
                "https://fonts.googleapis.com/css?family=$fontName"
            }
            if ($PSBoundParameters['Content']) {
                $extraContent = $PSBoundParameters['Content']
            }
        }
        elseif ($PSBoundParameters['Content'] -match '^http') {
            $fontUri = $PSBoundParameters['Content']
            $null = $PSBoundParameters.Remove('Content')
        }
        $PSBoundParameters['type'] = 'text/css'
        $stylesheetContent = "@import url('$fontUri')"
        if ($extraContent) {
            $PSBoundParameters['Content'] = @(@($stylesheetContent) + $extraContent) -join [Environment]::NewLine
        } else {
            $PSBoundParameters['Content'] = $stylesheetContent
        }        
        SVG.style @PSBoundParameters
    }
}
