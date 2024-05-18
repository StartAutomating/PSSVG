[ValidatePattern('WavyCircle')]
param()

function SVG.WavyCircle {
    <#
    
    .SYNOPSIS    
        Creates a circle with a wavy edge in SVG.    
    .DESCRIPTION    
        Creates a circle with a wavy edge in SVG by drawing a circle and then adding a sine wave to the radius.    
    .EXAMPLE    
        SVG @(    
            SVG.WavyCircle -Radius 40 -Amplitude 10 -Frequency 8 -CenterX 50 -CenterY 50 -Fill transparent -Stroke black    
        ) -ViewBox 100,100 -OutputPath .\WavyCircle.svg    
    .EXAMPLE    
        SVG @(    
            SVG.defs @(    
                SVG.marker -id 'Head' -ViewBox 100,100 @(    
                    svg.polygon -Points (@(    
                        "30,0"    
                        "35,0"    
                        "60,50"    
                        "15,100"    
                        "12.5,100"    
                        "55,50"    
                    ) -join ' ') -Fill '#4488ff' -Class 'foreground-fill'    
                ) -MarkerWidth 75 -MarkerHeight 75 -RefX 50 -RefY 50 -Orient 'auto-start-reverse'    
            )                
            $w = SVG.WavyCircle -Radius 90 -Amplitude 10 -Frequency 4.2 -RevolutionCount 8 -CenterX 100 -CenterY 100 -Fill transparent -Stroke black -MarkerStart 'url(#Head)' -MarkerEnd 'url(#Head)' -MarkerMid 'url(#Head)'    
            $w    
            SVG.circle -r 1 -Fill red (    
               SVG.animateMotion -Dur 30s -RepeatCount 'indefinite' -Path $w.D    
            )    
        ) -OutputPath .\OddRevolutions.svg -viewbox 200    
    
    #>
        
    param(
    # The radius of the circle.        
    [Parameter(ValueFromPipelineByPropertyName)]
    [Alias('R')]
    [double]
    $Radius = 1,

    # The amplitude of the wave.    
    [Parameter(ValueFromPipelineByPropertyName)]    
    [Alias('A')]
    [double]
    $Amplitude = .1,

    # The number of oscillations that should occur in the circle.    
    # (while it is not a side count, it allows this function to work well with stars and convex polygons)    
    [Parameter(ValueFromPipelineByPropertyName)]
    [Alias('SideCount')]
    [double]
    $Frequency = 6,

    # The initial rotation of the circle.    
    [Parameter(ValueFromPipelineByPropertyName)]
    [Alias('Rotation')]
    [double]
    $Rotate = 0,

    # The number of revolutions to draw.    
    # By default, one.    
    [Parameter(ValueFromPipelineByPropertyName)]
    [double]
    $RevolutionCount = 1,

    # The center X coordinate for the circle.    
    [Parameter(ValueFromPipelineByPropertyName)]
    [double]
    $CenterX,

    # The center Y coordinate for the circle.    
    [Parameter(ValueFromPipelineByPropertyName)]
    [double]
    $CenterY
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

