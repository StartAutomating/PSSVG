[ValidatePattern('WavyCircle')]
param()

function SVG.WavyCircle
{
    <#
    .SYNOPSIS
        Creates a circle with a wavy edge in SVG.
    .DESCRIPTION
        Creates a circle with a wavy edge in SVG by drawing a circle and then adding a sine wave to the radius.
    .EXAMPLE
        SVG @(
            SVG.WavyCircle -Radius 40 -Amplitude 10 -Frequency 8 -CenterX 50 -CenterY 50 -Fill transparent -Stroke black
        ) -ViewBox 100,100 -OutputPath .\WavyCircle.svg
    #>
    [inherit('SVG.Path',Abstract,Dynamic,ExcludeParameter='D')]
    param(
    # The radius of the circle.    
    [vbn()]
    [Alias('R')]
    [double]
    $Radius = 1,
    
    # The amplitude of the wave.
    [vbn()]    
    [Alias('A')]
    [double]
    $Amplitude = .1,

    # The number of oscillations that should occur in the circle.
    # (while it is not a side count, it allows this function to work well with stars and convex polygons)
    [vbn()]
    [Alias('SideCount')]
    [double]
    $Frequency = 6,

    # The initial rotation of the circle.
    [vbn()]
    [Alias('Rotation')]
    [double]
    $Rotate = 0,

    # The number of revolutions to draw.
    # By default, one.
    [vbn()]
    [double]
    $RevolutionCount = 1,

    # The center X coordinate for the circle.
    [vbn()]
    [double]
    $CenterX,

    # The center Y coordinate for the circle.
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
        
        if ((-not $CenterX) -and (-not $CenterY)) {
            $CenterX = $CenterY = $Radius
        }
        # If only one center is provided, use that.
        if ((-not $CenterX) -and $CenterY) {
            $CenterX = $CenterY
        } elseif ((-not $CenterY) -and $CenterX) {
            $CenterY = $CenterX
        }

        # Determine the number of points to draw
        $PointCount = (360 * $RevolutionCount) + $(
            # (if we drew a full circle, we need to add one more point to close the path)
            if ($RevolutionCount % 360) { 0 } else { 0 }
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
                $r = $Radius + ([Math]::sin($stepNumber * $radian * $Frequency) * $Amplitude)
                
                # Calculate the point of the rose
                $wavyX, $wavyY         = 𝜑 $r $angle
                
                # Move the point to the center
                $CenterY + $wavyX
                $CenterX + $wavyY
            }
        )
        $svgSplat.D = $pathPoints -join ' '

        SVG.path @svgSplat

    }
}
