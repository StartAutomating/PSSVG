[ValidatePattern('SVG\.Template')]
param()
function SVG.Template {
    <#
    
    .SYNOPSIS    
        Creates a template element.    
    .DESCRIPTION    
        Creates a template element containing SVG.    
        While templates are not _technically_ SVG elements, they're very useful when combined with SVGs.    
    
    #>
            
    [CmdletBinding()]
    param(
    
    )
    dynamicParam {
    $baseCommand = 
        if (-not $script:SVGsvg) {
            $script:SVGsvg = 
                $executionContext.SessionState.InvokeCommand.GetCommand('SVG.svg','Function')
            $script:SVGsvg
        } else {
            $script:SVGsvg
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
    end {

        # Anything piped in is content to template.
        $ContentTotemplate = @($input)
        if (-not $ContentTotemplate) {
            # If no content is piped in, check the parameter.
            $ContentTotemplate = $PSBoundParameters['Content']
        }
        # Return if there is nothing to template.
        if (-not $ContentTotemplate) { return }

        # Create a splat of parameters to pass to the base command.
        $svgSplat = [Ordered]@{} + $PSBoundParameters
        $svgCommand = $baseCommand
        # Remove any of my parameters that are not in the base command.
        foreach ($parameterName in @($svgSplat.Keys)) {
            if (-not $svgCommand.Parameters[$parameterName]) {
                $svgSplat.Remove($parameterName)
            }
        }
        # and remove `Content` for good measure.
        $svgSplat.Remove('Content')
         
        $propagateToTemplate = 'class','id','lang','style', 'data', 'attribute'
        $elementSplat = [Ordered]@{
            ElementName='template'
        }
        foreach ($parameterName in $propagateToTemplate) {
            if ($svgSplat[$parameterName]) {
                $elementSplat[$parameterName] = $svgSplat[$parameterName]
                $svgSplat.Remove($parameterName)
            }
        }

        Write-SVG @elementSplat -Content @( & $baseCommand @svgSplat)
    
    }
}

