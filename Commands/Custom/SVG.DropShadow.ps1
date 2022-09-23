function SVG.DropShadow {
<#
    .LINK
        SVG.filter
    .LINK
        SVG.feOffset
    .LINK
        SVG.Merge
    .LINK
        SVG.MergeMode
    
#>
    
[CmdletBinding(PositionalBinding=$false)]
    param(
[Alias('DX')]
    [double]
    $DistanceX = 0.5,
[Alias('DY')]
    [double]
    $DistanceY = 0.5
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
        $DropShadow = @(            
            =<svg.feOffset> -dx $DistanceX -dy $DistanceY
            =<svg.feMerge> @(
                =<svg.feMergeNode>
                =<svg.feMergeNode> -In 'SourceGraphic'
            )            
        )
        if ($PSBoundParameters['Content']) {
            $PSBoundParameters['Content'] = $DropShadow + $PSBoundParameters['Content']
        } else {
            $PSBoundParameters['Content'] = $DropShadow
        }
        if (-not $PSBoundParameters['ID']) {
            $PSBoundParameters['ID'] = 'dropShadow'
        }
        $null = $PSBoundParameters.Remove('DistanceX')
        $null = $PSBoundParameters.Remove('DistanceY')
        & $baseCommand @PSBoundParameters
    
}
}
