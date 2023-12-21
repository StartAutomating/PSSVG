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
    [Alias('SVG.Pentagon',
    'SVG.Hexagon','SVG.Heptagon','SVG.Octagon',
    'SVG.Nonagon','SVG.Decagon','SVG.Decagon',
    'SVG.Hendecagon', 'SVG.Dodecagon','SVG.Tridecagon',
    'SVG.Tetradecagon','SVG.Pentadecagon','SVG.Hexadecagon',
    'SVG.Heptadecagon','SVG.Octadecagon','SVG.Enneadecagon',
    'SVG.Icosagon','SVG.Icosikaihenagon','SVG.Icosikaidigon',
    'SVG.Icositrigon','SVG.Icositetragon','SVG.Icosikaipentagon',
    'SVG.Icosikaihexagon','SVG.Icosikaiheptagon','SVG.Icosikaioctagon',
    'SVG.Icosikaienneagon','SVG.Triacontagon')]
    param(
    # The number of sides in the polygon
    # This is also aliased to -PointCount for consistent use with SVG.Star.
    [Parameter(ValueFromPipelineByPropertyName,Position=0)]
    [Alias('NumberOfSides','SC','Sides','NumSides','PC','D','PointCount')]
    [ValidateRange(3,360)]
    [int]
    $SideCount = 3,

    # The formal name of the shape, for example Pentagon.
    # Note, for ease of calculation, only shapes with sides between three and thirty accept their names.
    # (aka, No Hectagons or Megagons)
    [Parameter(ValueFromPipelineByPropertyName)]
    [ValidateSet('Triangle','Rectangle','Pentagon',
        'Hexagon','Heptagon','Octagon',
        'Nonagon','Decagon','Decagon',
        'Hendecagon', 'Dodecagon','Tridecagon',
        'Tetradecagon','Pentadecagon','Hexadecagon',
        'Heptadecagon','Octadecagon','Enneadecagon',
        'Icosagon','Icosikaihenagon','Icosikaidigon',
        'Icositrigon','Icositetragon','Icosikaipentagon',
        'Icosikaihexagon','Icosikaiheptagon','Icosikaioctagon',
        'Icosikaienneagon','Triacontagon'
        )]
    [string]
    $ShapeName,

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
        $myInv = $MyInvocation
        if (-not $PSBoundParameters['SideCount'] -and 
            ($myInv.InvocationName -ne $myInv.MyCommand.Name)) {
            
            $shapeValues = @($myInv.MyCommand.Parameters['ShapeName'].Attributes.ValidValues)
            $myName = $myInv.InvocationName
            if ($myName -eq '&') {
                $MyName, $myArgs = $MyInv.Line.Substring($MyInv.OffsetInLine) -replace '^[\&\.]?\s{0,}' -split '\s',2
                if ($MyName -match '^\$') {
                    $MyName = $ExecutionContext.SessionState.PSVariable.Get($MyName -replace '\$').Value
                }
            }

            for ($shapeNumber = 0; $shapeNumber -lt $shapeValues.Length;$shapeNumber++) {                
                if ("SVG.$($shapeValues[$shapeNumber])" -eq $MyName) {
                    $SideCount = $shapeNumber + 3
                    break
                }                
            }            
        }
        
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