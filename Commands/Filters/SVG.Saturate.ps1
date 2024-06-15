[ValidatePattern('SVG\.Saturat(e|ion)')]
param()

function SVG.Saturate {
    <#
    
    .SYNOPSIS    
        Saturate Filter    
    .DESCRIPTION    
        Creates a saturation filter in SVG.    
        This controls how saturated color are within the image.    
    .EXAMPLE    
        SVG -ViewBox 200 @(    
            SVG.Defs @(    
                SVG.Saturate -Saturation .2    
            )    
            SVG.Circle -R 100 -CX 100 -CY 100 -Fill 'red' -Filter 'url(#saturate)'    
        ) -OutputPath .\Saturate.svg    
    .LINK    
        https://developer.mozilla.org/en-US/docs/Web/SVG/Element/feColorMatrix    
    
    #>
            
    [Alias('SVG.Saturation')]
    param(
    [Alias('Saturate','Saturation','Sat','S')]
    [double]
    $Saturation = 1
    )
    dynamicParam {
    $baseCommand = 
        if (-not $script:SVGfilter) {
            $script:SVGfilter = 
                $executionContext.SessionState.InvokeCommand.GetCommand('SVG.filter','Function')
            $script:SVGfilter
        } else {
            $script:SVGfilter
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
        $SaturationFilter = @(            
            SVG.feColorMatrix -Type 'saturate' -Values $Saturation -In 'SourceGraphic'
        )
        if ($PSBoundParameters['Content']) {
            $PSBoundParameters['Content'] = $SaturationFilter + $PSBoundParameters['Content']
        } else {
            $PSBoundParameters['Content'] = $SaturationFilter
        }
        if (-not $PSBoundParameters['ID']) {
            $PSBoundParameters['ID'] = 'saturate'
        }        
        $null = $PSBoundParameters.Remove('saturation')
        SVG.filter @PSBoundParameters
    
    }
}

