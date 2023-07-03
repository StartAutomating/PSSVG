function SVG.Rhombus {
    <#
    
    .SYNOPSIS    
        Generates a Rhombus in SVG    
    .DESCRIPTION    
        Generates a Rhombus in SVG.    
        A Rhombus is generated with a -Radius and an -InRadius.    
    .EXAMPLE    
        SVG -ViewBox 2,2 (    
            SVG.Rhombus -Fill "#4488ff"     
        ) -OutputPath .\Rhombus.svg    
    .EXAMPLE    
        SVG -ViewBox 2,2 (    
            SVG.Rhombus -Fill "#4488ff" @(    
                SVG.animate -AttributeName d -Values (    
                    @(    
                        SVG.Rhombus -Rotate 0    
                        SVG.Rhombus -Rotate 90    
                        SVG.Rhombus -Rotate 180    
                        SVG.Rhombus -Rotate 270                            
                    ).D -join ';'    
                ) -AttributeType XML -Dur 2s -RepeatCount indefinite -CalcMode spline    
            )     
        ) -OutputPath .\Rhombus-Morph.svg    
    
    #>
            
    [Alias('SVG.Rhombi')]    
    [CmdletBinding(PositionalBinding=$false)]
    param(
    # The initial rotation of the rhombus.    
    [Parameter(ValueFromPipelineByPropertyName)]
    [Alias('Rotation')]
    [double]
    $Rotate = 0,
    # The center X coordinate for the rhombus.    
    [Parameter(ValueFromPipelineByPropertyName)]
    [Alias('CX')]
    [double]
    $CenterX = 1,
    # The center Y coordinate for the rhombus.    
    [Parameter(ValueFromPipelineByPropertyName)]
    [Alias('CY')]
    [double]
    $CenterY = 1,
    # The out radius of the rhombus.    
    [Parameter(ValueFromPipelineByPropertyName)]
    [Alias('R','OR')]
    [double]
    $Radius = 1,
    # The in radius of the rhombus.    
    [Parameter(ValueFromPipelineByPropertyName)]
    [Alias('IR')]
    $InRadius = .5
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
        
    
    }
        process {        
        
        $pathData = @(
            # We want to start at the top
            $CurrentAngle = $Rotate - 90
            # Top
            "M"
            $centerY + $Radius * [math]::round([math]::cos($CurrentAngle * [Math]::PI/180),15)
            $centerX + $Radius * [math]::round([math]::sin($CurrentAngle * [Math]::PI/180),15)
            # Right
            $CurrentAngle += 90
            "L"            
            $centerY + $InRadius * [math]::round([math]::cos($CurrentAngle * [Math]::PI/180),15)
            $centerX + $InRadius * [math]::round([math]::sin($CurrentAngle * [Math]::PI/180),15)
            # Bottom
            "L"
            $CurrentAngle += 90
            $centerY + $Radius * [math]::round([math]::cos($CurrentAngle * [Math]::PI/180),15)
            $centerX + $Radius * [math]::round([math]::sin($CurrentAngle * [Math]::PI/180),15)
            # Left
            "L"
            $CurrentAngle += 90
            $centerY + $InRadius * [math]::round([math]::cos($CurrentAngle * [Math]::PI/180),15)
            $centerX + $InRadius * [math]::round([math]::sin($CurrentAngle * [Math]::PI/180),15)
            # Close
            "Z"
        )
        
        $myParams = [Ordered]@{} + $PSBoundParameters
        $myParams["D"] = $pathData -join ' '        
        $myParams.Remove('Rotate')
        $myParams.Remove('Radius')
        $myParams.Remove('InRadius')
        $myParams.Remove('CenterX')
        $myParams.Remove('CenterY')
        $myParams.Data = $myPSSVGData
        SVG.Path @myParams  
    
    }
}
