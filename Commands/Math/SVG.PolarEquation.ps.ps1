[ValidatePattern('SVG\.Polar(?>Equation|Formula)')]
param()

function SVG.PolarEquation
{
    <#
    .SYNOPSIS
        Draws a polar equation in SVG.
    .DESCRIPTION
        Draws a polar formula in SVG.

        The equation used to draw the polar formula and all relevant parameters are stored in the Data attributes of the path.
    .EXAMPLE
        SVG -Viewbox 200 -Width 100% -Height 100% @(
            SVG.PolarEquation -Radius 100 -Equation { $Radius }
        ) -OutputPath .\PolarCircle.svg
    .EXAMPLE
        SVG -Viewbox 200 -Width 100% -Height 100% @(
            SVG.PolarEquation -Radius 100 -Equation { $Radius * [Math]::Cos($Frequency * $Step * $Radian) } -Rotate 15 -Data @{Frequency=3.0}
        ) -OutputPath .\PolarRose.svg
    .EXAMPLE
        # Cartoid
        SVG -Viewbox 200 @(
            SVG.PolarEquation -Radius 100 -Equation {
                $Radius * [Math]::sin(
                    ($Step * $Radian) / 2
                )                                
            }
        ) -OutputPath .\PolarCartoid.svg
    .EXAMPLE
        # Lemniscate
        SVG -Viewbox 200 @(
            SVG.PolarEquation -Radius 100 -Equation {
                $Radius/2 * [Math]::Pow(
                    [Math]::Cos($StepRadian), 4  
                )                                
            }
        ) -OutputPath .\PolarLemniscate.svg
    .EXAMPLE
        SVG -ViewBox 200 @(            
            @(
                # Because any polar equation uses an equal number of points, we can morph between them.
                SVG.PolarEquation -Radius 100 -Equation { $Radius }
                SVG.PolarEquation -Radius 100 -Equation { $Radius * [Math]::Cos($Frequency * $Step * $Radian) } -Rotate 15 -Data @{Frequency=3.0}
                SVG.PolarEquation -Radius 100 -Equation { $Radius }
                SVG.PolarEquation -Radius 100 -Equation { $Radius/2 * [Math]::Pow( [Math]::Cos($StepRadian), 4 ) } -Rotate 45
                SVG.PolarEquation -Radius 100 -Equation { $Radius }        
                SVG.PolarEquation -Radius 100 -Equation { $Radius * [Math]::Cos($Frequency * $Step * $Radian) } -Rotate 15 -Data @{Frequency=6.0}
                SVG.PolarEquation -Radius 100 -Equation { $Radius/2 * [Math]::Pow( [Math]::Sin($StepRadian), 4 ) } -Rotate 90
                SVG.PolarEquation -Radius 100 -Equation { $Radius }
                SVG.PolarEquation -Radius 100 -Equation { $Radius * [Math]::Cos($Frequency * $Step * $Radian) } -Rotate -15 -Data @{Frequency=9.0}
                SVG.PolarEquation -Radius 100 -Equation { $Radius }
            ) | SVG.Morph -Dur 4.2 -RepeatCount indefinite
        ) -OutputPath .\PolarMorph.svg
    #>
    [inherit('SVG.Path',Abstract,Dynamic,ExcludeParameter='D')]
    [Alias('SVG.PolarFormula')]
    param(
    # The radius of the polar path
    [vbn()]
    [Alias('R')]
    [double]
    $Radius,

    # The frequency of the polar path.
    [vbn()]
    [Alias('CX')]
    [double]
    $CenterX,

    # The frequency of the polar path.
    [vbn()]
    [Alias('CY')]
    [double]
    $CenterY,

    # The number of revolutions to draw.
    # By default, one.
    # This is not the number of petals, but the number of times the rose is drawn.    
    [vbn()]
    [double]
    $RevolutionCount = 1,
    
    # If set, will draw the rose in reverse.    
    [vbn()]
    [Alias('CounterClockwise')]
    [switch]
    $Reverse,

    # The initial rotation of the path.
    [vbn()]
    [Alias('Rotation')]
    [double]
    $Rotate = 0,

    # The equation to draw the polar path.
    # For simplicity, translatability, and security, only Math expressions are allowed.
    # No loops are allowed, no commands are allowed, no assignments are allowed.
    [ValidateScriptBlock(
        AstCondition={
            param($ast)
            if ($ast -is [Management.Automation.Language.CommandAst]) {
                throw "No Commands Allowed!"
            }
            if ($ast -is [Management.Automation.Language.TypeExpressionAst] -and $ast.TypeName.Name -ne 'Math') {
                throw "Only [Math] allowed!"
            }
            if ($ast -is [Management.Automation.Language.AssignmentStatementAst]) {
                throw "No Assignments Allowed!"            
            }
            if ($ast -is [Management.Automation.Language.ExpandableStringExpressionAst]) {
                throw "No Expandable Strings Allowed!"
            }
            if ($ast -is [Management.Automation.Language.LoopStatementAst]) {
                throw "No Loops Allowed!"
            }
            return $true
        }
    )]
    [Alias('Formula')]
    [ScriptBlock]
    $Equation
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
        
        # and strip off any parameters that are not from the base command.
        $svgCmd = $baseCommand
        foreach ($parameterName in @($svgSplat.Keys)) {
            if (-not $svgCmd.Parameters[$parameterName]) {
                $svgSplat.Remove($parameterName)
            }
        }

        # Now, get my own command metadata, to discover any unique parameters.
        $myCommandMetadata = $MyInvocation.MyCommand -as [Management.Automation.CommandMetaData]
        $myParameterNames = @($myCommandMetadata.Parameters.Keys)

        # If there were any data attributes passed in, they may also serve as parameters.
        if ($svgSplat['Data']) {
            if ($svgSplat['Data'] -is [Collections.IDictionary]) {
                foreach ($dataKeyValue in $svgSplat['Data'].GetEnumerator()) {
                    $numericalValue = $dataKeyValue.Value -as [double]
                    if ($numericalValue) {
                        $myParameterNames += $dataKeyValue.Key
                        $ExecutionContext.SessionState.PSVariable.Set($dataKeyValue.Key, $dataKeyValue.Value -as [double])
                    }
                }
            } else {
                foreach ($dataProperty in $svgSplat['Data'].psobject.properties) {
                    $numericalValue = $dataProperty.Value -as [double]
                    if ($numericalValue) {
                        $myParameterNames += $dataProperty.Name
                        $ExecutionContext.SessionState.PSVariable.Set($dataKeyValue.Key, $dataKeyValue.Value -as [double])
                    }
                }
            }
        }

        # Default to a transparent fill.
        if (-not $svgSplat.Fill) {
            $svgSplat.Fill = 'transparent'
        }
        if (-not $svgSplat.Stroke) {
            $svgSplat.Stroke = 'currentColor'
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
            if ($RevolutionCount % 360) { 0 } else { 1 }            
        )

        $localEquation = [ScriptBlock]::Create("$Equation")

        # Generate the path points
        $pathPoints = @(            
            for ($step = $stepNumber = 0; $step -le $PointCount; $step++) {
                # Move to the first point
                if ($step -eq 0) {
                    "M"   
                }
                # every other point can simply be emitted from here on out.

                # To reverse the rose's direction, we simply reverse the steps per angle.
                $angle = $Rotate + $(
                    $step * $(if ($Reverse) { -1 } else { 1 })
                )
                
                $angleRadians = $angleRadian = $radians = $stepRadian =  $angle * $radian

                # Calculate the radius of the formula at this moment
                $momentRadius = . $localEquation
                
                # Calculate the point of the formula
                $momentX, $momentY = 𝜑 $momentRadius $angle
                
                # Move the point to the center
                $CenterY + $momentX
                $CenterX + $momentY
            }
        )
        $svgSplat.D = $pathPoints -join ' '
        $svgSplat.Data = [Ordered]@{PolarEquation = "$Equation"}
        foreach ($parameterName in $myParameterNames) {
            $svgSplat.Data.$parameterName = $ExecutionContext.SessionState.PSVariable.Get($parameterName).Value
        }
        SVG.path @svgSplat
    }
}
