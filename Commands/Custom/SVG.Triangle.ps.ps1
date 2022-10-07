function SVG.Triangle {
    <#
    .SYNOPSIS
        SVG Triangle
    .DESCRIPTION
        Creates a Triangle as an SVG.Polygon.
    .LINK
        SVG.Polygon
    #>
    [inherit('SVG.Polygon', Abstract,Dynamic)]
    param()

    process {
        $myParams = @{} + $PSBoundParameters
        $points = $myParams['Points']
        if (-not $points) { 
            Write-Error "Must provide -Points of a triangle."
            return
        }
        
        if ($points -as [double[]]) {
            $pointArray = $points -as [double[]]
            if ($pointArray.Count -ne 6) {
                Write-Error "Must provide 3 points in a triangle."
                return
            }
            $myParams["Points"] = 
                @(for ($i = 0; $i -lt $pointArray.Count; $i+=2) {
                    '' + $pointArray[$i] + ',' + $pointArray[$i+1]
                }) -join ' '
        }
        elseif ($points -as [Collections.Generic.List[double[]]]) {
            $pointList = $points -as [Collections.Generic.List[double[]]]
            if ($pointList.Count -ne 3) {
                Write-Error "Must provide 3 points in a triangle."
                return
            }
            $myParams["Points"] = 
                @(foreach ($point in $pointList) {
                    '' + $point[0] + ',' + $point[1]
                }) -join ' '
        }
        else {
            $pointRegex = [Regex]::new("(?<x>[\d\.]+),(?<y>[\d\.]+)")
            $pointMatches = @($pointRegex.Matches("$points"))
            if ($pointMatches.Length -ne 3) {
                Write-Error "Must provide 3 points in a triangle."
                return
            }
        }
        
        
        svg.Polygon @myParams
    }
}