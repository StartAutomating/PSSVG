function SVG.RegularPolygon {
<#
    .SYNOPSIS
        SVG Regular Polygon
    .DESCRIPTION
        Creates a Regular Polygon of an number of sides.
    .LINK
        SVG.Polygon
    
#>
    
[CmdletBinding(PositionalBinding=$false)]
    param(
# The number of sides in the polygon
    [Parameter(ValueFromPipelineByPropertyName)]
    [Alias('NumberOfSides','SC','Sides','NumSides')]
    [int]
    $SideCount,
# The initial rotation of the polygon.
    [Alias('Rotation')]
    [double]
    $Rotate = 0,
# The center X coordinate for the polygon.
    [Alias('CX')]
    [double]
    $CenterX = 1,
# The center Y coordinate for the polygon.
    [Alias('CY')]
    [double]
    $CenterY = 1,
# The radius of the polygon.
    [Alias('R')]
    [double]
    $Radius = 1
    )
dynamicParam {
    $baseCommand = 
        if (-not $script:SVGPolygon) {
            $script:SVGPolygon = 
                $executionContext.SessionState.InvokeCommand.GetCommand('SVG.Polygon','Function')
            $script:SVGPolygon
        } else {
            $script:SVGPolygon
        }
    $IncludeParameter = @()
    $ExcludeParameter = 'Points'
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
        # We can construct a regular polygon by creating N points along a unit circle
        $anglePerPoint = 360 / $SideCount
        $r = $Radius
        $angle = $Rotate
        $points = @(
        foreach ($sideNumber in 1..$SideCount) {
            $pointY = $centerY + $r * [math]::round([math]::cos($angle * [Math]::PI/180),15)
            $pointX = $centerX + $r * [math]::round([math]::sin($angle * [Math]::PI/180),15)
            "$pointX, $pointY"
            $angle += $anglePerPoint
        }) -join ' '
        $myParams = @{} + $PSBoundParameters
        $myParams["Points"] = $points
        $myParams.Remove('SideCount')
        $myParams.Remove('Rotate')
        $myParams.Remove('Radius')
        $myParams.Remove('CenterX')
        $myParams.Remove('CenterY')
              
        svg.Polygon @myParams  
    
}
}
