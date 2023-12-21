function SVG.Kite {
    <#
    
    .SYNOPSIS    
        Generates a Kite in SVG    
    .DESCRIPTION    
        Generates a Kite in SVG.    
        A Kite is generated with a -Radius and an -InnerRadius and an -OuterRadius.    
    .EXAMPLE    
        SVG -ViewBox 2,2 (    
            SVG.Kite -Fill "#4488ff"    
        ) -OutputPath .\Kite.svg    
    .EXAMPLE    
        SVG -ViewBox 200,200 (    
            SVG.Kite -Fill "#4488ff" -CenterX 100 -CenterY 100 -Radius 33 -InnerRadius 25 -OuterRadius 66     
        ) -OutputPath .\Ready-To-Fly-Kite.svg    
    .EXAMPLE    
        SVG -ViewBox 2,2 (    
            SVG.Kite -Fill "#4488ff" @(    
                SVG.animate -AttributeName d -Values (    
                    @(    
                        SVG.Kite -Rotate 0    
                        SVG.Kite -Rotate 90    
                        SVG.Kite -Rotate 180    
                        SVG.Kite -Rotate 270    
                    ).D -join ';'    
                ) -AttributeType XML -Dur 2s -RepeatCount indefinite -CalcMode linear    
            )     
        ) -OutputPath .\Kite-Morph.svg    
    
    #>
            
    [Alias('SVG.Rhombi','SVG.Rhombuses')]    
    [CmdletBinding(PositionalBinding=$false)]
    param(
    # The initial rotation of the rhombus.    
    [Parameter(ValueFromPipelineByPropertyName)]
    [Alias('Rotation')]
    [double]
    $Rotate = 0,

    # The center X coordinate for the kite.    
    [Parameter(ValueFromPipelineByPropertyName)]
    [Alias('CX')]
    [double]
    $CenterX = 1,

    # The center Y coordinate for the kite.    
    [Parameter(ValueFromPipelineByPropertyName)]
    [Alias('CY')]
    [double]
    $CenterY = 1,

    # The radius of the kite.    
    # This is the distance to either constant side of the kite.    
    [Parameter(ValueFromPipelineByPropertyName)]
    [Alias('R')]
    [double]
    $Radius = .5,

    # The inner radius of the kite.    
    # This is the distance from the center of the kite to the top.    
    [Parameter(ValueFromPipelineByPropertyName)]
    [Alias('IR','InRadius')]
    [double]
    $InnerRadius = 1,

    # The outer radius of the kite.    
    # This is the distance from the center of the kite to the bottom.    
    [Parameter(ValueFromPipelineByPropertyName)]
    [Alias('OR','OutRadius')]
    [double]
    $OuterRadius = .5
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
            $centerY + ($InnerRadius * [math]::round([math]::cos($CurrentAngle * [Math]::PI/180),15))
            $centerX + ($InnerRadius * [math]::round([math]::sin($CurrentAngle * [Math]::PI/180),15))
            # Right
            $CurrentAngle += 90
            "L"            
            $centerY + ($Radius * [math]::round([math]::cos($CurrentAngle * [Math]::PI/180),15))
            $centerX + ($Radius * [math]::round([math]::sin($CurrentAngle * [Math]::PI/180),15))
            # Bottom
            "L"
            $CurrentAngle += 90
            $centerY + ($OuterRadius * [math]::round([math]::cos($CurrentAngle * [Math]::PI/180),15))
            $centerX + ($OuterRadius * [math]::round([math]::sin($CurrentAngle * [Math]::PI/180),15))
            # Left
            "L"
            $CurrentAngle += 90
            $centerY + ($Radius * [math]::round([math]::cos($CurrentAngle * [Math]::PI/180),15))
            $centerX + ($Radius * [math]::round([math]::sin($CurrentAngle * [Math]::PI/180),15))
            # Close
            "Z"
        )
        

        $myParams = [Ordered]@{} + $PSBoundParameters
        $myParams["D"] = $pathData -join ' '        
        $myParams.Remove('Rotate')
        $myParams.Remove('Radius')
        $myParams.Remove('InnerRadius')
        $myParams.Remove('OuterRadius')
        $myParams.Remove('CenterX')
        $myParams.Remove('CenterY')
        $myParams.Data = $myPSSVGData
        SVG.Path @myParams  
    
    }
}
