function SVG.Curve
{
    <#
    .SYNOPSIS
        Draws an SVG curve.
    .DESCRIPTION
        Draws an SVG curve path.
    .EXAMPLE
        =<svg> -OutputPath .\Curves.svg @(
            =<svg.Curve> -Start 10 -ControlPoint 15,5,20,40  -End 30,30 -fill transparent -stroke black
        ) -viewbox 50, 50
    .LINK
        SVG.Path
    #>    
    [inherit('SVG.path', Dynamic, Abstract)]
    param(
    # One or two control points.
    # If two control points are provided, it will be assumed to be a Bezier curve.
    # If only one control point is provided, it will be assumed to be a Quadratic curve.    
    [Parameter(ValueFromPipelineByPropertyName)]
    [double[]]
    $ControlPoint,

    # The start point of the curve.
    # If only one value is provided, it will be used as the X and Y coordinate.
    [Parameter(ValueFromPipelineByPropertyName)]
    [double[]]
    $Start,

    # The end point of the curve.
    # If only one value is provided, it will be used as the X and Y coordinate.
    [Parameter(ValueFromPipelineByPropertyName)]
    [double[]]
    $End,

    # If set, will attempt to draw a smooth bezier curve.
    [Parameter(ValueFromPipelineByPropertyName)]
    [switch]
    $Smooth,

    # If set, will draw a multi-quadratic line.
    # This can only be used if preceeded by another curve.
    [Parameter(ValueFromPipelineByPropertyName)]
    [switch]
    $MultiQuadratic,

    # If set, will draw a quadratic bezier curve.
    # This is the default, as it only requires a single control point.
    [Parameter(ValueFromPipelineByPropertyName)]
    [switch]
    $Quadratic
    )

    process {
        $existingPath = ''
        if ($PSBoundParameters.D) {
            $existingPath = $PSBoundParameters.D + ' '
        }
        
        if ($ControlPoint.Length -eq 1) {
            $ControlPoint = $ControlPoint[0], $ControlPoint[0]
        }

        if ($ControlPoint.Length -gt 4) {
            Write-Error "Up to two control points can be provided"
            return
        }

        $arcPath = @(
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
            if ($ControlPoint.Length -ge 4) {
                "C" # Bezier curves have 2 control points
            } else {
                if ($Smooth) {
                    "S"
                }
                elseif ($MultiQuadratic) {
                    "T"
                } else{
                    "Q"
                }
            }
            
            for ($cpIndex =0 ; $cpIndex -lt $ControlPoint.Length; $cpIndex+=2 ) {
                $ControlPoint[$cpIndex]
                $ControlPoint[$cpIndex + 1]
                ","
            }            
            if ($end.Length -gt 2) {
                Write-Error "-End can only contain one or two values."
                return
            }
            elseif ($end.Length -eq 2 ) {
                $End[0],$end[1]
            } elseif ($end.Length -eq 1) {
                $End[0],$end[0]
            } else {
                0, 0
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
