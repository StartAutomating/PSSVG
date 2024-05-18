[ValidatePattern('SVG\.Rose')]
param()
function SVG.Rose {
    <#
    .SYNOPSIS
        Draws a Rose in SVG.
    .DESCRIPTION
        Draws a [Rose](https://en.wikipedia.org/wiki/Rose_(mathematics)) in SVG.
    .EXAMPLE
        SVG @(
            SVG.Rose -Amplitude 50 -Frequency 3 -CenterX 50 -CenterY 50 -RevolutionCount 2 -Fill transparent -Stroke black
        ) -ViewBox 100,100 -OutputPath .\Trifolium.svg
    #>
    [inherit('SVG.Path',Abstract,Dynamic,ExcludeParameter='D')]
    [Alias('SVG.Trifolium','SVG.Quadrifolium','SVG.Octafolium','SVG.Pentafolium')]
    param(
    # The radius of the rose.
    # This is the variable `a` in the equation r = a * cos(kθ).
    [vbn()]
    [Alias('Amplitude','a','r')]
    [double]
    $Radius = 1,

    # The frequency of the rose.
    # This is the variable `k` in the equation r = a * cos(kθ).
    # This is aliased to Angle, k, and SideCount.
    # (while it is not a side count, it allows this function to work well with stars and convex polygons)
    [vbn()]
    [Alias('Angle','k','SideCount')]
    [double]
    $Frequency = 2,

    # The number of revolutions to draw.
    # By default, one.
    # This is not the number of petals, but the number of times the rose is drawn.    
    [vbn()]
    [double]
    $RevolutionCount = 1,
    
    # If set, will draw the rose in reverse.
    [Alias('CounterClockwise')]
    [vbn()]
    [switch]
    $Reverse,

    # The initial rotation of the rhombus.
    [Parameter(ValueFromPipelineByPropertyName)]
    [Alias('Rotation')]
    [double]
    $Rotate = 0,
        
    # The center X coordinate for the rose.
    [vbn()]
    [double]
    $CenterX,

    # The center Y coordinate for the rose.
    [vbn()]
    [double]
    $CenterY
    )

    begin {

        # Get the size of a single radian
        $radian = [Math]::PI / 180

        # Declare this relatively simple function to calculate a polar coordinate.
        function 𝜑 {
            param($radius, $angle)
            $radius * [math]::round([math]::cos($angle * [Math]::PI / 180),15)
            $radius * [math]::round([math]::sin($angle * [Math]::PI / 180),15)
        }

        switch ($MyInvocation.InvocationName) {            
            SVG.Trifolium { $Frequency = 3}
            SVG.Quadrifolium { $Frequency = 2}
            SVG.Octafolium { $Frequency = 4}
            SVG.Pentafolium { $Frequency = 5}            
        }
    }

    process {

        # Copy the splat to SVG
        $svgSplat = [Ordered]@{} + $PSBoundParameters
        
        # and strip off any parameters that are not SVG's
        $myCommandMetadata = $MyInvocation.MyCommand -as [Management.Automation.CommandMetaData]
        $svgCmd = $baseCommand
        foreach ($parameterName in $myCommandMetadata.Parameters.Keys) {
            if (-not $svgCmd.Parameters[$parameterName]) {
                $svgSplat.Remove($parameterName)
            }
        }

        # Default to a transparent fill.
        if (-not $svgSplat.Fill) {
            $svgSplat.Fill = 'transparent'
        }
        
        # If no center is provided, use the radius.
        if (-not $PSBoundParameters.Contains('CenterX') -and -not $PSBoundParameters.Contains('CenterY')) {
            $CenterX = $CenterY = $Radius
        }
        # If only center is provided, use that for both.
        elseif ((-not $CenterX) -and $PSBoundParameters.Contains('CenterY')) {
            $CenterX = $CenterY
        } elseif ((-not $CenterY) -and $PSBoundParameters.Contains('CenterX')) {
            $CenterY = $CenterX
        }

        # Determine the number of points to draw
        $PointCount = (360 * $RevolutionCount) + $(
            # (if we drew a full circle, we need to add one more point to close the path)
            if ($RevolutionCount % 360) { 0 } else { 1 }            
        )

        
        # Generate the path points
        $pathPoints = @(            
            for ($stepNumber = 0; $stepNumber -le $PointCount; $stepNumber++) {
                # Move to the first point
                if ($stepNumber -eq 0) {
                    "M"   
                }
                # every other point can simply be emitted from here on out.

                # To reverse the rose's direction, we simply reverse the steps per angle.
                $angle = $Rotate + $(
                    $stepNumber * $(if ($Reverse) { -1 } else { 1 })
                )

                # Calculate the radius of the rose at this moment
                $r = $Radius * ([Math]::cos($Frequency * $stepNumber * $radian))
                
                # Calculate the point of the rose
                $roseX, $roseY         = 𝜑 $r $angle
                
                # Move the point to the center
                $CenterY + $roseX
                $CenterX + $roseY
            }
        )
        $svgSplat.D = $pathPoints -join ' '

        SVG.path @svgSplat
    }


}
