[ValidatePattern('SVG\.Saturat(e|ion)')]
param()

function SVG.Saturate {
    <#
    
    .SYNOPSIS    
        Saturate Filter    
    .DESCRIPTION    
        Creates a saturation filter in SVG.    
        This controls how saturated colors are within the image.    
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
    # The amount of color saturation.    
    [Parameter(ValueFromPipelineByPropertyName)]
    [Alias('Saturate','Sat')]
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
        begin {
        $animationElements = 'animate','set','animateTransform','animateMotion'
    
    }
        process {
        # Create the splat for the filter and filter entry
        $feSplat = [Ordered]@{type='saturate';Values=$Saturation}
        $filterSplat = [Ordered]@{} + $PSBoundParameters

        # Check if we have any content
        $content = $PSBoundParameters['Content']
        if ($content.LocalName) {
            # If it's not a filter
            if ($content.LocalName -ne 'filter') {
                # Set the input to SourceGraphic
                $feSplat['In'] = 'SourceGraphic'
                # If it's an animation element, set the content to the animation element
                if ($content.LocalName -in $animationElements) {
                    $feSplat['Content'] = $content
                }
                
            }
        } else {
            # If there was no content, set the input to SourceGraphic
            $feSplat['In'] = 'SourceGraphic'
        }

        # Create the saturation filter (using [feColorMatrix](https://developer.mozilla.org/en-US/docs/Web/SVG/Element/feColorMatrix))
        $SaturationFilter = SVG.feColorMatrix @feSplat
                
        $filterSplat['Content'] =
            # If the content is a filter, add the saturation filter to the content
            if ($content.LocalName -eq 'Filter') {
                @($content.childNodes) + $SaturationFilter
            } else {
                $SaturationFilter
            }
        
        # If there's no ID, set it to 'saturate'
        if (-not $filterSplat['ID']) {
            $filterSplat['ID'] = 'saturate'
        }
        # Remove parameters from the splat that don't apply to filter.
        $null = $filterSplat.Remove('saturation')
        
        if ($content -and 
            $content.LocalName -ne 'filter' -and 
            $content.LocalName -notin $animationElements) {
            SVG.defs @(SVG.filter @filterSplat)
            if ($content.setAttribute) {
                $content.setAttribute('style',"filter:url('#$($filterSplat['ID'])')")
            }
            $content
        } else {
            SVG.filter @filterSplat
        }        
    
    }
}

