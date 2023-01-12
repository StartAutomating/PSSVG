function SVG.LinePath {
<#
    .SYNOPSIS
        Draws an SVG Line Path.
    .DESCRIPTION
        Draws a line in SVG Path Syntax.
    .EXAMPLE
        =<svg> -Viewbox 100, 100 (
            =<svg.LinePath> -Start 50 -End 75 -Stroke black
        ) -OutputPath .\Line1.svg
    .EXAMPLE
        =<svg> -Viewbox 60, 60 (
            =<svg.LinePath> -Start 10 -Horizontal -End 50 -Stroke black -Fill transparent |
                =<svg.LinePath> -Vertical -End 50 |
                =<svg.LinePath> -Horizontal -End 10 |
                =<svg.LinePath> -Vertical -End 10 -Close
        ) -OutputPath .\LineBox.svg 
    .LINK
        SVG.Path
    
#>
        
    [Alias('SVG.LinedPath','=<SVG.LinedPath>')]
[CmdletBinding(PositionalBinding=$false)]
    param(
# The Starting point of the arc.
    # If only one value is provided, it will be used as the X and Y coordinate.
    [Parameter(ValueFromPipelineByPropertyName)]
    [double[]]
    $Start,
# If set, will draw a horizontal line.
    # Only the first -End point will be evaluated.
    [Parameter(ValueFromPipelineByPropertyName)]
    [switch]
    $Horizontal,
# If set, will draw a vertical line.
    # -LineLength must also be provided.
    [Parameter(ValueFromPipelineByPropertyName)]
    [switch]
    $Vertical,
# If set, will close the path.
    [Parameter(ValueFromPipelineByPropertyName)]
    [switch]
    $Close,
# The end point of the line, or it's length
    # If this is provided, a line will be drawn to this point
    [Parameter(ValueFromPipelineByPropertyName)]    
    [double[]]
    $End
    )
dynamicParam {
    $baseCommand = 
        if (-not $script:SVGpath) {
            $script:SVGpath = 
                $executionContext.SessionState.InvokeCommand.GetCommand('SVG.path','Function')
            $script:SVGpath
        } else {
            $script:SVGpath
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
        $existingPath = ''
        if ($PSBoundParameters.D) {
            $existingPath = $PSBoundParameters.D + ' '
        }
        if ($_ -eq $PSBoundParameters.Content) {
            $null = $PSBoundParameters.Remove('Content')
        }
        $linePath = @(
            if ($psBoundParameters.Keys -eq 'Start') {
                "M"
                if ($start.Length -gt 2) {
                    Write-Error "-Start can only contain one or two values"
                    return
                }
                elseif ($start.Length -eq 2) {
                    $start[0],$start[1]
                }
                else {
                    $start[0],$start[0]
                }
            }
            if ($Vertical) {
                "V $(if ($end) { $end[0] } else { 0 })"
            }
            elseif ($Horizontal) {
                "H $(if ($end) { $end[0] } else { 0 })"
            }
            elseif ($End) {                                
                if ($end.Length -gt 2) {
                    for ($endIndex = 0 ; $endIndex -lt $end.Length; $endIndex += 2) {
                        "L"
                        $end[$endIndex]
                        if ($null -ne $end[$endIndex + 1]) {
                            $end[$endIndex + 1]
                        } else {
                            $end[$endIndex]
                        }
                    }
                }
                elseif ($end.Length -eq 2) {
                    "L"
                    $end
                } elseif ($end.Length -eq 1) {
                    "L"
                    $end * 2
                }
                
            }
            if ($Close) {
                "Z"
            }
                        
        ) -join ' '
        
        $PSBoundParameters['D'] = $existingPath + $linePath
        $baseSplat = [Ordered]@{}
        foreach ($k in $PSBoundParameters.Keys) {
            if ($baseCommand.Parameters[$k]) {
                $baseSplat[$k]  = $PSBoundParameters[$k]
            }
        }
        
        SVG.Path @baseSplat
    
}
}



