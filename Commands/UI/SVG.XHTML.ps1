[ValidatePattern("SVG\.x?html")]
param()

function SVG.XHTML {
    <#
    
    .SYNOPSIS    
        Embeds HTML in SVG    
    .DESCRIPTION    
        Embeds HTML (technically, XHTML) in an SVG element.    
    .NOTES    
        The HTML is wrapped in an XHTML element.    
        The XHTML is then passed to SVG.foreignObject to render the SVG.    
    
    #>
            
    [Alias('SVG.HTML')]
    param(
    # The HTML. For this to work properly, it should be XHTML    
    [Parameter(ValueFromPipelineByPropertyName)]
    [Alias('XHTML')]
    [string]
    $HTML
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
