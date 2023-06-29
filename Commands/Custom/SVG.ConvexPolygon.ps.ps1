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
    [inherit(Command={
        Import-Module ../../PSSVG.psd1 -Global
        'SVG.Path'
    }, Abstract,Dynamic, ExcludeParameter='D')]
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
        $myParams["D"] = $points
        $myParams.Remove('SideCount')
        $myParams.Remove('Rotate')
        $myParams.Remove('Radius')
        $myParams.Remove('CenterX')
        $myParams.Remove('CenterY')
              
        svg.Path @myParams  
    }
}