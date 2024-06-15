[ValidatePattern('SVG\.Ero(de|sion)')]
param()

function SVG.Erode {
    <#
    
    .SYNOPSIS    
        Erode Filter    
    .DESCRIPTION    
        Creates a erode filter in SVG.    
        This controls how eroded an image should be.    
    .EXAMPLE    
        SVG -ViewBox 200 @(    
            SVG.Defs @(    
                SVG.Erode -Content @(    
                    SVG.Animate -AttributeName 'radius' -values '0;40;0' -dur '4s' -repeatCount 'indefinite'    
                )    
            )    
            SVG.Circle -R 100 -CX 100 -CY 100 -Fill '#4488ff' -Filter 'url(#erode)'    
        ) -OutputPath .\Erode.svg    
    .LINK    
        https://developer.mozilla.org/en-US/docs/Web/SVG/Element/feMorphology    
    
    #>
            
    [Alias('SVG.Erosion')]
    param(
    [Parameter(ValueFromPipelineByPropertyName)]
    [Alias('Erode','E')]
    [double]
    $Erosion = 1
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
        $ErosionFilter = @(            
            SVG.feMorphology -Operator 'erode' -Radius $Erosion -In 'SourceGraphic' -Content $PSBoundParameters['Content']
        )        
        $PSBoundParameters['Content'] = $ErosionFilter        
        if (-not $PSBoundParameters['ID']) {
            $PSBoundParameters['ID'] = 'erode'
        }        
        $null = $PSBoundParameters.Remove('erosion')
        SVG.filter @PSBoundParameters
    
    }
}

