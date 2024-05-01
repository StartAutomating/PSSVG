[ValidatePattern('SVG\.SemiCircle')]
param()
function SVG.Semicircle {
    <#
    
    .SYNOPSIS    
        Creates a semicircle in SVG.    
    .DESCRIPTION    
        Creates a semicircle in SVG by drawing an arc path from the start to the end of a circle, and closing it.        
    
    #>
        
    param(
    # The radius of the semi-circle.    
    [Parameter(ValueFromPipelineByPropertyName)]
    [Alias('R')]
    [double]
    $Radius = 1,

    # The center X coordinate for the semi-circle.    
    [Parameter(ValueFromPipelineByPropertyName)]
    [Alias('CX')]
    [double]
    $CenterX,

    # The center Y coordinate for the semi-circle.    
    [Parameter(ValueFromPipelineByPropertyName)]
    [Alias('CY')]
    [double]
    $CenterY,

    # The start angle of the semi-circle.    
    [double]
    $Rotate = 0
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
        if ((-not $CenterX) -and (-not $CenterY)) {
            $CenterX = $centerY = $Radius            
        } elseif ((-not $CenterX) -and $CenterY) {
            # If one center is provided, use that.
            $CenterX = $CenterY
        } elseif ((-not $CenterY) -and $CenterX) {
            $CenterY = $CenterX
        }

        

        # Calculate the path for the semi-circle.
        $pathPoints = @(            
            # Start
            $startX, $startY = 𝜑 $radius $rotate
            "M"
            $centerX + $startX
            $centerY + $startY
            
            # End
            $endX, $endY = 𝜑 $radius ($rotate + 180)
            "A $Radius $Radius 0 0 0"
            $centerX + $endX
            $centerY + $endY
            
            # Close
            "Z"
        )

        svg.path @svgSplat -D ($pathPoints -join ' ')
    
    }
}

