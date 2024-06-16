[ValidatePattern('SVG\.Dilat(e|ion)')]
param()

function SVG.Dilate {
    <#
    
    .SYNOPSIS    
        Dilate Filter    
    .DESCRIPTION    
        Creates a Dilate filter in SVG.    
        This controls how Dilated an image should be.    
    .EXAMPLE    
        SVG -ViewBox 200 @(    
            SVG.Defs @(    
                SVG.Dilate -Content @(    
                    SVG.Animate -AttributeName 'radius' -values '0;40;0' -dur '4s' -repeatCount 'indefinite'    
                )    
            )    
            SVG.Circle -R 100 -CX 100 -CY 100 -Fill '#4488ff' -Filter 'url(#Dilate)'    
        ) -OutputPath .\Dilate.svg    
    .LINK    
        https://developer.mozilla.org/en-US/docs/Web/SVG/Element/feMorphology    
    
    #>
            
    [Alias('SVG.Dilation')]
    param(
    [Parameter(ValueFromPipelineByPropertyName)]
    [Alias('Dilate')]
    [double]
    $Dilation = 1
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
        $DilationFilter = 
            SVG.feMorphology -Operator 'dilate' -Radius $Dilation -In 'SourceGraphic' -Content $PSBoundParameters['Content']     
        $PSBoundParameters['Content'] = $DilationFilter        
        if (-not $PSBoundParameters['ID']) {
            $PSBoundParameters['ID'] = 'dilate'
        }        
        $null = $PSBoundParameters.Remove('dilation')
        SVG.filter @PSBoundParameters
    
    }
}

