[ValidatePattern('SVG\.HueRotate')]
param()

function SVG.HueRotate {
    <#
    
    .SYNOPSIS    
        Hue Rotate Filter    
    .DESCRIPTION    
        Creates a hue rotate filter in SVG.    
    .EXAMPLE    
        SVG -ViewBox 200 @(    
            SVG.Defs @(    
                SVG.HueRotate -HueRotate 180    
            )    
            SVG.Circle -R 100 -CX 100 -CY 100 -Fill 'red' -Filter 'url(#hueRotate)'    
        ) -OutputPath .\HueRotate.svg    
    
    #>
        
    param(
    [Alias('Angle','A')]
    [double]
    $HueRotate = 0
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
        $HueRotateFilter = @(            
            SVG.feColorMatrix -Type 'hueRotate' -Values $HueRotate -In 'SourceGraphic'
        )
        if ($PSBoundParameters['Content']) {
            $PSBoundParameters['Content'] = $HueRotateFilter + $PSBoundParameters['Content']
        } else {
            $PSBoundParameters['Content'] = $HueRotateFilter
        }
        if (-not $PSBoundParameters['ID']) {
            $PSBoundParameters['ID'] = 'hueRotate'
        }        
        $null = $PSBoundParameters.Remove('HueRotate')
        SVG.filter @PSBoundParameters
    
    }
}

