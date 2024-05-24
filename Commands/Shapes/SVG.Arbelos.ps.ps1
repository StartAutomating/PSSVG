[ValidatePattern('SVG\.Arbelos')]
param()

function SVG.Arbelos
{
    <#
    .SYNOPSIS
        Creates an arbelos in SVG.
    .DESCRIPTION
        Creates an arbelos in SVG by drawing a major semicircle, a minor semicircle, and a circle tangent to both.
    .EXAMPLE
        SVG -Viewbox 200, 100 @(
            SVG.Arbelos -Radius 90 -CenterX 100 -CenterY 100
        )
    .LINK
        https://en.wikipedia.org/wiki/Arbelos
    #>
    [inherit('SVG.Path', Abstract,Dynamic, ExcludeParameter='D')]
    param(
    # The radius of the arbelos.
    [vbn()]
    [double]
    $Radius,

    # The midpoint of the arbelos.
    [vbn()]    
    [double]
    $Midpoint = 0.25,

    # The center X coordinate for the arbelos.
    [vbn()]
    [Alias('CX')]
    [double]
    $CenterX,

    # The center Y coordinate for the arbelos.
    [vbn()]
    [Alias('CY')]
    [double]
    $CenterY,

    # The rotation of the arbelos.
    [vbn()]
    [double]
    $Rotate = 0
    )


    begin {
            
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
        # Default to a currentColor stroke.
        if (-not $svgSplat.Stroke) {
            $svgSplat.Stroke = 'currentcolor'
        }
        
        # If no center is provided, use the radius.
        if (-not $PSBoundParameters.ContainsKey('CenterX') -and -not $PSBoundParameters.ContainsKey('CenterY')) {
            $CenterX = $CenterY = $Radius
        }
        # If only center is provided, use that for both.
        elseif ((-not $CenterX) -and $PSBoundParameters.ContainsKey('CenterY')) {
            $CenterX = $CenterY
        } elseif ((-not $CenterY) -and $PSBoundParameters.ContainsKey('CenterX')) {
            $CenterY = $CenterX
        }

        $pathPoints = @(
            # Major semicircle start
            $startX, $startY = 𝜑 $radius $rotate
            "M"
            $centerX + $startX
            $centerY + $startY
            
            # Major semicircle end
            $endX, $endY = 𝜑 $radius ($rotate + 180)
            "A $Radius $Radius 0 0 0"

                        
            $centerX + $endX
            $centerY + $endY            

            $MidCircleRadius = ($radius * 2 * $Midpoint)
            "A $MidCircleRadius $MidCircleRadius 0 0 1"

            $midEndX, $midEndY = 𝜑 ($radius * $Midpoint) $rotate
            $centerX + $midEndX
            $centerY + $midEndY

            $MidCircleRadius2 = [Math]::Abs($radius * 2 * -$Midpoint)
            "A $MidCircleRadius2 $MidCircleRadius2 0 0 1"

            $centerX + $startX
            $centerY + $startY                        
        )

        svg.path @svgSplat -D ($pathPoints -join ' ')
    }
}
