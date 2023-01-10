function SVG.Arc {
<#
    .SYNOPSIS
        Draws an SVG arc.
    .DESCRIPTION
        Draws an SVG arc path.
    .LINK
        SVG.Path
    
#>
        
[CmdletBinding(PositionalBinding=$false)]
    param(
# The X-starting point of the arc.
    # If -StartY point is not provided, -StartY will be -StartX
    [Parameter(ValueFromPipelineByPropertyName)]
    [Alias('Start')]
    [double]
    $StartX,
# The Y-starting point of the arc.
    # If -StartX point is not provided, -StartX will be -StartY
    [Parameter(ValueFromPipelineByPropertyName)]
    [double]
    $StartY,
# The X-radius of the arc.
    # If -RadiusX is not provided, -RadiusY will be -RadiusX
    [Parameter(ValueFromPipelineByPropertyName)]
    [Alias('Radius')]
    [double]
    $RadiusX,
# The Y-radius of the arc.
    # If -RadiusY is not provided, -RadiusX will be -RadiusY
    [Parameter(ValueFromPipelineByPropertyName)]
    [double]
    $RadiusY,
# The Arc Rotation along the X axis.
    [Parameter(ValueFromPipelineByPropertyName)]
    [Alias('XAxisRotation')]
    $ArcRotation = 0,
# If set, the arc will be considered a "Large arc"
    [Parameter(ValueFromPipelineByPropertyName)]
    [Alias('IsLargeArc','LargeArc')]
    [switch]
    $Large,
# If set, the arc will sweep the circle.
    [Parameter(ValueFromPipelineByPropertyName)]
    [switch]
    $Sweep,
# The end X point of the arc.
    [Parameter(ValueFromPipelineByPropertyName)]
    [double]
    $EndX,
# The end Y point of the arc.
    [Parameter(ValueFromPipelineByPropertyName)]
    [double]
    $EndY
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
        $arcPath = @(
            if ($psBoundParameters.Keys -match 'Start(?>X|Y)') {                
                if ($PSBoundParameters.ContainsKey('StartX') -and
                    $PSBoundParameters.ContainsKey('StartY')
                ) {
                    "M", $startX, $startY
                }
                elseif ($PSBoundParameters.ContainsKey('StartY')) {
                    "M", $startY, $startY
                }
                else {
                    "M", $StartX, $StartX
                }
            }
            "A"
            if ($RadiusX -and $RadiusY) {
                $RadiusX, $RadiusY
            } elseif ($RadiusX) {
                $RadiusX, $RadiusX
            } elseif ($RadiusY) {
                $RadiusY, $RadiusY
            } else {
                1,1
            }
            $ArcRotation
            if ($Large) { 1 } else { 0 }
            if ($Sweep) { 1 } else { 0 }
            if ($null -ne $EndX -and $null -eq $EndY ) {
                $EndX,$EndX
            } elseif ($null -ne $EndY -and $null -eq $EndX) {
                $EndY, $EndY
            } elseif ($null -eq $EndX -and $null -eq $EndY) {
                0, 0
            } else {
                $EndX
                $EndY
            }            
        ) -join ' '
        
        $PSBoundParameters['D'] = $existingPath + $arcPath
        $baseSplat = [Ordered]@{}
        foreach ($k in $PSBoundParameters.Keys) {
            if ($baseCommand.Parameters[$k]) {
                $baseSplat[$k]  = $PSBoundParameters[$k]
            }
        }
        
        SVG.Path @baseSplat
    
}
}


