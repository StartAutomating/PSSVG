function SVG.Star {
    <#
    .SYNOPSIS
        SVG Star
    .DESCRIPTION
        Creates a Star of an number of points.
    .LINK
        SVG.Path
    .LINK
        SVG.ConvexPolygon
    #>
    [inherit('SVG.Path', Abstract,Dynamic, ExcludeParameter='D')]
    [CmdletBinding(PositionalBinding=$false)]
    param(
    # The number of points in the star.
    # This is also aliased to -SideCount for consistent use with SVG.ConvexPolygon,
    # (even if this is not mathematically accurate).
    [Parameter(ValueFromPipelineByPropertyName,Position=0)]
    [ValidateRange(3,360)]
    [Alias('PC','Points','SC','SideCount','Sides','NumSides')]
    [int]
    $PointCount = 5,

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

    process {        
        # We can construct a regular polygon by creating N points along a unit circle
        $anglePerPoint = 360 / $PointCount
        $r = $Radius
        $angle = $Rotate
        $q = 2
        $points = @()
        $vertices = @(
        foreach ($sideNumber in 1..$PointCount) {
            $pointY = $centerY + $r * [math]::round([math]::cos($angle * [Math]::PI/180),15)
            $pointX = $centerX + $r * [math]::round([math]::sin($angle * [Math]::PI/180),15)
            "$pointX $pointY"
            $angle += $anglePerPoint
        })

        if ($vertices.Count % 2) {
            for ($pointIndex = 0; $points.Length -lt $PointCount; $pointIndex += $q) {
                
                $vertex = $vertices[$pointIndex % $vertices.Count]
                
                if (-not $points) {
                    $points += "M $($vertices[$pointIndex % $vertices.Count])"
                } else {
                    $points += "L $($vertices[$pointIndex % $vertices.Count])"
                }                
            }
            $points += "L $($vertices[0])"
        } else {
            for ($pointIndex = 0; $pointIndex -le $vertices.Count; $pointIndex += $q) {
                $points += 
                    if ($pointIndex -eq 0) {
                        "M $($vertices[$pointIndex % $vertices.Count])"
                    } else {
                        "L $($vertices[$pointIndex % $vertices.Count])"
                    }
            }
            for ($pointIndex = 1; $pointIndex -le ($vertices.Count + 1); $pointIndex += $q) {
                $points += 
                    if ($pointIndex -eq 1) {
                        "M $($vertices[$pointIndex % $vertices.Count])"
                    } else {
                        "L $($vertices[$pointIndex % $vertices.Count])"
                    }
                
            }
        }

        
        $myParams = [Ordered]@{} + $PSBoundParameters
        $myParams["D"] = $points -join ' '
        $myParams.Remove('PointCount')
        $myParams.Remove('Rotate')
        $myParams.Remove('Radius')
        $myParams.Remove('CenterX')
        $myParams.Remove('CenterY')
        svg.Path @myParams  
    
    }
}