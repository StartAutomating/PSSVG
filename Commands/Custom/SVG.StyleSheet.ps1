function SVG.StyleSheet {
<#
    .SYNOPSIS
        SVG StyleSheet
    .DESCRIPTION
        Imports a StyleSheet into SVG.
    .NOTES
        Imported stylesheets will not render when SVGs are linked as images.
        To use an imported stylesheet, either load the SVG alone in it's own frame or embed the SVG directly in HTML.
    .LINK
        SVG.Style
    .LINK
        SVG.GoogleFont
    .EXAMPLE
        SVG @(
            SVG.Defs @(
                SVG.StyleSheet -StyleSheetURI https://4bitcss.com/Konsolas.css
            )
            # When viewed in it's own frame, this rectangle will be Konsolas's version of 'red'
            # When viewed in an <img> tag, it will be red.
            SVG.Rect -Width 200% -Height 100% -Fill red -Class ansi1-fill -X -50%
        ) -Viewbox 100,100 -OutputPath .\test.svg
    
#>
    
[CmdletBinding(PositionalBinding=$false)]
    param(
# The URI to a StyleSheet
    [Parameter(ValueFromPipelineByPropertyName)]
    [Alias('StyleSheetUrl', 'CSSUrl', 'CSSUri')]
    [uri]
    $StyleSheetUri
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
        $null = $PSBoundParameters.Remove('StylesheetUri')
        $extraContent = ''
        if (-not $styleSheetUri -and $PSBoundParameters['Content'] -match '^http') {
            $StyleSheetUri = $PSBoundParameters['Content']
            $null = $PSBoundParameters.Remove('Content')
        } elseif ($PSBoundParameters['Content']) {
            $extraContent += $PSBoundParameters['Content']
        }
        $PSBoundParameters['type'] = 'text/css'
        $stylesheetContent = "@import url('$styleSheetUri')"
        
        if ($extraContent) {
            $PSBoundParameters['Content'] = @(@($stylesheetContent) + $extraContent) -join [Environment]::NewLine
        } else {
            $PSBoundParameters['Content'] = $stylesheetContent
        }
        SVG.style @PSBoundParameters
    
}
}

