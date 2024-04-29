function SVG.GoogleFont {
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
                SVG.GoogleFont -FontName "La Belle Aurore"    
            )    
            SVG.Text -Text "Fancy Text" -X 50% -Y 50% -TextAnchor 'middle' -Style "font-family: 'La Belle Aurore'"    
        ) -Viewbox 100,100 -OutputPath .\FancyText.svg    
    
    #>
        
    param(
    # The name of the font.    
    [Parameter(ValueFromPipelineByPropertyName)]
    [string]
    $FontName
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
        if ($FontName) {
            $fontUri = 
                if ($FontName -like 'http*') {
                    $FontName
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

