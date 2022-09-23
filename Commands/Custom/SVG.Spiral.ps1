function SVG.Spiral {
<#
    .SYNOPSIS
        Draws an SVG Spiral
    .DESCRIPTION
        Creates an SVG spiral as an SVG path.
    .LINK
        SVG.path
    
#>
    
[CmdletBinding(PositionalBinding=$false)]
    param(
# The number of steps in the spiral
    [Parameter(ValueFromPipelineByPropertyName)]
    [Uint32]
    $NumSteps = 1000,
# The value for theta
    [Parameter(ValueFromPipelineByPropertyName)]
    [double]
    $Theta = [MATH]::pi * 50,
# The value for alpha (not to be confused with transparency, that's -Opacity)
    [Parameter(ValueFromPipelineByPropertyName)]
    [Double]
    $Alpha = 200
    )
dynamicParam {
    $baseCommand = 
        if (-not $script:SVGpath) {
            $script:SVGpath = 
                $executionContext.SessionState.InvokeCommand.GetCommand('SVG.path','Function')
            $script:SVGpath
        } else {
            $script:SVGpath
        }
    $IncludeParameter = @()
    $ExcludeParameter = 'D','Fill'
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
    process {
        $Margin  = $Alpha * 1.25
        $width = $margin * 2
        $height = $margin * 2 
        
        $svgPoints = @(
            "M $margin,$margin"    
            foreach ($n in 0..$numSteps) {
                $t = ($theta/$numSteps) * $n 
                $a = ($alpha/$numSteps) * $n 
                $px = $margin+($a*[Math]::Cos($t))
                $py = $margin+($a*[Math]::Sin($t))
                "L $px,$py"                
            }
        )
        $baseCommandParameters = [Ordered]@{}
        foreach ($paramName in $PSBoundParameters.Keys) {
            if ($baseCommand.Parameters.$paramName) {
                $baseCommandParameters[$paramName] = $PSBoundParameters[$paramName]
            }
        }
        $baseCommandParameters.D = $svgPoints
        $baseCommandParameters.Fill = 'Transparent'
                
        =<svg.path> @baseCommandParameters        
    
}
}

