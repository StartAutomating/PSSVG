function SVG.ColorPalette {
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
            
    [Alias('SVG.Palette')]
    param(
    # The name of the palette.    
    [Parameter(ValueFromPipelineByPropertyName)]
    [Alias('Palette','ColorScheme','ColorPalette')]
    [string]
    $PaletteName
    )
    dynamicParam {
    $baseCommand = 
        if (-not $script:SVGStyle) {
            $script:SVGStyle = 
                $executionContext.SessionState.InvokeCommand.GetCommand('SVG.Style','Function')
            $script:SVGStyle
        } else {
            $script:SVGStyle
        }
    $IncludeParameter = @()
    $ExcludeParameter = 'Type'


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
        process {
        $null = $PSBoundParameters.Remove('FontName')
        $extraContent = ''
        if ($PaletteName) {
            $fontUri = 
                if ($FontName -like 'http*') {
                    $FontName
                } else {
                    "https://cdn.jsdelivr.net/gh/2bitdesigns/4bitcss@latest/css/$($PaletteName -replace '\.css$').css"
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

