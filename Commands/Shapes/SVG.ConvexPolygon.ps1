function SVG.ConvexPolygon {
    <#
    
    .SYNOPSIS    
        SVG Convex Polygon    
    .DESCRIPTION    
        Creates a Regular Convex Polygon of an number of sides.    
    .LINK    
        SVG.Path    
    .LINK    
        SVG.Star    
    
    #>
            
    [CmdletBinding(PositionalBinding=$false)]
    param(
    # The number of sides in the polygon    
    # This is also aliased to -PointCount for consistent use with SVG.Star.    
    [Parameter(ValueFromPipelineByPropertyName,Position=0)]
    [Alias('NumberOfSides','SC','Sides','NumSides','PC','D','PointCount')]
    [ValidateRange(3,360)]
    [int]
    $SideCount,
    # The initial rotation of the polygon.    
    [Parameter(ValueFromPipelineByPropertyName)]
    [Alias('Rotation')]
    [double]
    $Rotate = 0,
    # The center X coordinate for the polygon.    
    [Parameter(ValueFromPipelineByPropertyName)]
    [Alias('CX')]
    [double]
    $CenterX = 1,
    # The center Y coordinate for the polygon.    
    [Parameter(ValueFromPipelineByPropertyName)]
    [Alias('CY')]
    [double]
    $CenterY = 1,
    # The radius of the polygon.    
    [Parameter(ValueFromPipelineByPropertyName)]
    [Alias('R')]
    [double]
    $Radius = 1
    )
    dynamicParam {
    $baseCommand = 
        if (-not $script:SVGPath) {
            $script:SVGPath = 
                $executionContext.SessionState.InvokeCommand.GetCommand('SVG.Path','Function')
            $script:SVGPath
        } else {
            $script:SVGPath
        }
    $IncludeParameter = @()
    $ExcludeParameter = 'D'
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
            if ($sideNumber -eq 1) {
                "M $pointX $pointY"
            } else {
                "L $pointX $pointY"
            }            
            $angle += $anglePerPoint
        }) -join ' '
        $myParams = [Ordered]@{} + $PSBoundParameters
        $myParams["D"] = "$points Z"
        $myParams.Remove('SideCount')
        $myParams.Remove('Rotate')
        $myParams.Remove('Radius')
        $myParams.Remove('CenterX')
        $myParams.Remove('CenterY')
              
        svg.Path @myParams  
    
    }
}
