[ValidatePattern('SVG\.+?Palette')]
param()
function SVG.ColorPalette
{
    <#
    .SYNOPSIS
        SVG Color Palette
    .DESCRIPTION
        Imports a [4bitcss](https://4bitcss.com) color palette into SVG.    
    .NOTES
        Imported Palettes will not render when SVGs are linked as images.

        To use an imported palette, either load the SVG alone in it's own frame or embed the SVG directly in HTML.
    .LINK
        SVG.Style
    .LINK
        SVG.StyleSheet
    .EXAMPLE
        SVG @(            
            $boxSize = [Ordered]@{Width = 80; Height = 80}
            svg -ViewBox 640, 160 @(
                SVG.ColorPalette -PaletteName "Jellybeans"
                foreach ($n in 0..7) {
                    svg.rect -X ($boxSize.Width * $n) -Y 0 -Class "ansi$n-fill" @boxSize
                }
                foreach ($n in 8..15) {
                    svg.rect -X ($boxSize.Width * ($n - 8)) -Y 79 -Class "ansi$n-fill" @boxSize
                }
                SVG.Text -Text "Jellybeans" -X 50% -Y 50% -TextAnchor 'middle' -Class "foreground"
            )            
        ) -Viewbox 100,100 -OutputPath .\PalettePreview.svg
    #>
    [inherit('SVG.Style', Abstract,Dynamic,ExcludeParameter='Type')]
    [Alias('SVG.Palette')]
    param(
    # The name of the palette.
    [Parameter(ValueFromPipelineByPropertyName)]
    [Alias('Palette','ColorScheme','ColorPalette')]
    [string]
    $PaletteName
    )

    process {
        $null = $PSBoundParameters.Remove('FontName')
        $extraContent = ''
        if ($PaletteName) {
            $PaletteUri = 
                if ($PaletteName -like 'http*') {
                    $PaletteName
                } else {
                    "https://cdn.jsdelivr.net/gh/2bitdesigns/4bitcss@latest/css/$($PaletteName -replace '\.css$').css"
                }
            if ($PSBoundParameters['Content']) {
                $extraContent = $PSBoundParameters['Content']
            }
        }
        elseif ($PSBoundParameters['Content'] -match '^http') {
            $paletteUri = $PSBoundParameters['Content']
            $null = $PSBoundParameters.Remove('Content')
        } elseif ($PSBoundParameters['Content']) {
            "https://cdn.jsdelivr.net/gh/2bitdesigns/4bitcss@latest/css/$($content -replace '\.css$').css"
        }
        $PSBoundParameters['type'] = 'text/css'
        $stylesheetContent = "@import url('$paletteUri')"
        if ($extraContent) {
            $PSBoundParameters['Content'] = @(@($stylesheetContent) + $extraContent) -join [Environment]::NewLine
        } else {
            $PSBoundParameters['Content'] = $stylesheetContent
        }        
        SVG.style @PSBoundParameters
    }
}
