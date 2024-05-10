[ValidatePattern("SVG\.Markdown")]
param()
function SVG.Markdown
{
    <#
    .SYNOPSIS
        Embeds Markdown in SVG
    .DESCRIPTION
        Converts from Markdown to HTML and embeds it (and a style) into SVG.

        By default:
        * Width and Height are set to 100%
        * The body style will be set to full height and automatic overflow
        * Any direct children of the body will be given a margin of 1em and font-size of 1.25em
        * Tables will be made full width

    .NOTES
        In order to provide a better aesthetic experience, certain parameters are set by default:

        * Width and Height are set to 100%
        * The body style will be set to full height and automatic overflow
        * Any direct children of the body will be given a margin of 1em and font-size of 1.25em
        * Tables will be made full width and have a border-collapse of collapse

        The markdown is converted to HTML using ConvertFrom-Markdown, and then wrapped in an body element with the XHTML namespace.

        The XHTML is then passed to SVG.foreignObject to render the SVG.
    #>
    [Inherit('SVG.svg',Abstract,Dynamic,ExcludeParameter='Style')]
    param(
    # The markdown.
    # The YAML header is currently ignored.
    [vbn()]
    [string]
    $Markdown,

    # The [Google Font](https://fonts.google.com/) name.
    [vbn()]
    [Alias('GoogleFont')]
    [string]
    $FontName,

    # The Google Font name to use for code blocks.
    # (this should be a [monospace font](https://fonts.google.com/?classification=Monospace))
    [vbn()]
    [Alias('PreFont','CodeFontName','PreFontName')]
    [string]
    $CodeFont,
    
    # The name of the palette.    
    [vbn()]
    [Alias('Palette','ColorScheme','ColorPalette')]
    [ArgumentCompleter({
        param ($commandName,$parameterName,$wordToComplete,$commandAst,$fakeBoundParameters )
        if (-not $script:4bitcssPaletteList) {
            $script:4bitcssPaletteList = Invoke-RestMethod -Uri https://cdn.jsdelivr.net/gh/2bitdesigns/4bitcss@latest/docs/Palette-List.json
        }
        if ($wordToComplete) {
            $script:4bitcssPaletteList -match "$([Regex]::Escape($wordToComplete) -replace '\\\*', '.{0,}')"
        } else {
            $script:4bitcssPaletteList 
        }        
    })]
    [string]
    $PaletteName,

    <#
    The style applied to the markdown.
    By default:
    
    * Width and Height are set to 100%
    * The body style will be set to full height and automatic overflow, and a font-size of 1.25em
    * Any direct children of the body will be given a margin of 1em
    * Tables will be made full width and have a border-collapse of collapse
    #>
    [vbn()]
    [PSObject]
    $Style
    )

    begin {
        ${?<Markdown_YamlHeader} = [Regex]::New('
        (?<Markdown_YAMLHeader>
        (?m)\A\-{3,}                      # At least 3 dashes mark the start of the YAML header
        (?<YAML>(?:.|\s){0,}?(?=\z|\-{3,} # And anything until at least three dashes is the content
        ))\-{3,}                          # Include the dashes in the match, so that the pointer is correct.
        )', 'IgnorePatternWhitespace,IgnoreCase')
        $svgForeignObject = $ExecutionContext.SessionState.InvokeCommand.GetCommand('SVG.foreignObject', 'Function')
    }

    process {
        if (-not $Markdown) { return }
        # Copy the parameters into two splats
        $svgSplat = [Ordered]@{} + $PSBoundParameters
        $svgForeignSplat = [Ordered]@{} + $PSBoundParameters
        
        # and strip off any parameters that are not applicable to the base command        
        $svgCmd = $baseCommand
        foreach ($parameterName in @($svgSplat.Keys)) {
            if (-not $svgForeignObject.Parameters[$parameterName]) {
                $svgForeignSplat.Remove($parameterName)
            }
            if (-not $svgCmd.Parameters[$parameterName]) {
                $svgSplat.Remove($parameterName)
            }
            if ($svgForeignSplat[$parameterName]) {
                $svgSplat.Remove($parameterName)
            }
        }        
                        
        
        $ThisMarkdownHeader = ${?<Markdown_YamlHeader}.Match($Markdown)
        if ($ThisMarkdownHeader.Success) {
            $YamlHeader = $ThisMarkdownHeader.Groups['YAML'].Value
            $Markdown = $Markdown -replace ${?<Markdown_YamlHeader}
        }
        $convertedThisMarkdown = ConvertFrom-Markdown -InputObject $Markdown
        $xhtml = "<body class='markdown-svg' xmlns='http://www.w3.org/1999/xhtml'>$($convertedThisMarkdown.Html)</body>" -as [xml]
        if (-not $xhtml) {
            return $convertedThisMarkdown.Html
        }
        $allNodesInOrder = @($xhtml.SelectNodes("//*"))
        $nodeIndex = 0
        foreach ($node in $allNodesInOrder) {
            if ($node.SetAttribute) { $node.SetAttribute('data-index', $nodeIndex) }
            if ($node.GetAttribute('disabled')) { $node.RemoveAttribute('disabled') }
            $nodeIndex++
        }        
        
        if ($svgForeignSplat.Content) {
            $svgForeignSplat.Content = @($svgForeignSplat.Content) + $xhtml
        } else {
            $svgForeignSplat.Add('Content', $xhtml)
        }
        $svgForeignSplat.Remove("Style")
        if (-not $svgForeignSplat['Width']) {
            $svgForeignSplat.Add('Width', '100%')
        }

        if (-not $svgForeignSplat['Height']) {
            $svgForeignSplat.Add('Height', '100%')
        }
        

        SVG @svgSplat -Content @(
            if ($FontName) {
                $fontImport = SVG.GoogleFont -FontName $FontName
                $fontImport
            }
            if ($CodeFont) {
                $codeFontImport = SVG.GoogleFont -FontName $CodeFont
                $codeFontImport
            }
            if ($PaletteName) {
                $paletteImport = SVG.Palette -PaletteName $PaletteName
                $paletteImport
            }
            if (-not $style) {
                $style = "                
                body { height: 100%; overflow: auto; font-size: 1.25em; $(
                    if ($fontImport.InnerText -match 'family=(?<family>.+?)''\p{Pe}') { "font-family: '$($matches.family)'"}
                ) }$(
                    if ($codeFontImport.InnerText -match 'family=(?<family>.+?)''\p{Pe}') { "
                code { font-family: '$($matches.family)' }
                "}
                )
                body > * { margin: 1em; }
                table { width: 100%; border-collapse: collapse; }                
                "
            }
            SVG.style -Content $Style
            SVG.foreignObject @svgForeignSplat
        )
    }

}

