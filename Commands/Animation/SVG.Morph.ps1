[ValidatePattern('SVG\.Morph')]
param()
function SVG.Morph {
    <#
    
    .SYNOPSIS    
        Morphs attributes.    
    .DESCRIPTION    
        Morphs attributes from one value into subsequent values.    
        If a path or a polygon has the same number of points, it will morph from one to the other.    
        If a path or a polygon has a different number of points, it will switch between the two.    
        If multiple items are piped into this command, it will morph each one in turn.    
        If only two items are piped in, it will morph from the first to the second.    
    .EXAMPLE    
        SVG -Viewbox 200 @(    
            SVG.Morph -RepeatCount indefinite -Duration .84 @(    
                SVG.Rose -Frequency 4 -Radius 100 -Stroke currentColor -Rotate 45    
                SVG.Rose -Frequency 2 -Radius 100 -Stroke currentColor -Rotate 180    
                SVG.Rose -Frequency 4 -Radius 100 -Stroke currentColor -Rotate 45    
            )                        
        ) -OutputPath .\RoseMorph.svg    
    .EXAMPLE    
        SVG -Viewbox 200 @(    
            @(    
                SVG.Arbelos -Radius 100 -Stroke currentColor -Midpoint 0.3    
                SVG.Arbelos -Radius 50 -CenterX 100 -CenterY 100 -Stroke currentColor -Midpoint 0.7 -Rotate 90    
                SVG.Arbelos -Radius 100 -Stroke currentColor -Midpoint .3     
            ) |    
                SVG.Morph -RepeatCount indefinite -Duration 1.1    
        ) -OutputPath .\ArbelosMorph.svg    
    .EXAMPLE    
        SVG -Viewbox 200 @(    
            @(    
                SVG -Viewbox 100 @(    
                    SVG.Rect -Width 100 -Height 100 -Fill currentColor    
                ) -X 50% -Y 50%    
                svg -viewbox 200    
                svg -viewbox 100    
            ) |    
                SVG.Morph -RepeatCount indefinite -Duration 1.1    
        ) -OutputPath .\ViewBoxMorph.svg    
    
    #>
            
    [CmdletBinding(PositionalBinding=$false)]
    param(
    # The names of one or more attributes to morph.    
    # If none are provided, the command will attempt to morph any `points`, `d`, or `viewbox` attributes.    
    [Parameter(ValueFromPipelineByPropertyName)]
    [string[]]
    $AttributeName
    )
    dynamicParam {
    $baseCommand = 
        if (-not $script:SVGanimate) {
            $script:SVGanimate = 
                $executionContext.SessionState.InvokeCommand.GetCommand('SVG.animate','Function')
            $script:SVGanimate
        } else {
            $script:SVGanimate
        }
    $IncludeParameter = @()
    $ExcludeParameter = 'AttributeName','Values','To'


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
    end {

        # Anything piped in is content to morph.
        $ContentToMorph = @($input)
        if (-not $ContentToMorph) {
            # If no content is piped in, check the parameter.
            $ContentToMorph = $PSBoundParameters['Content']
        }
        # Return if there is nothing to morph.
        if (-not $ContentToMorph) { return }

        # Create a splat of parameters to pass to the base command.
        $svgSplat = [Ordered]@{} + $PSBoundParameters
        $svgCommand = $baseCommand
        # Remove any of my parameters that are not in the base command.
        foreach ($parameterName in @($svgSplat.Keys)) {
            if (-not $svgCommand.Parameters[$parameterName]) {
                $svgSplat.Remove($parameterName)
            }
        }
        # and remove `Content` for good measure.
        $svgSplat.Remove('Content')

        # Create a collection of morphable values.
        $morphableValues = [Ordered]@{}
        # If no attribute was provided, default to `points`, `d`, and `viewBox`.
        if (-not $AttributeName) { $AttributeName = 'points','d','viewBox'}
                        
        # Go through each content item 
        foreach ($contentItem in $ContentToMorph) {
            # and check for each attribute name
            foreach ($name in $AttributeName) {
                if ($contentItem.$name) {
                    # If we found the attribute
                    if (-not $morphableValues[$name]) {
                        # correct the case of the name to the first item in the list.
                        if ($contentItem -is [Collections.IDictionary]) {
                            $name = @($contentItem.Keys) -eq $name
                        } else {
                            $name = $contentItem.psobject.properties[$name].Name
                        }
                        # and create a list to hold the values.
                        $morphableValues[$name] = [Collections.Generic.List[PSObject]]::new()
                    }
                    # Then add the value to the list.
                    $morphableValues[$name].Add(($contentItem.$name))
                }
            }
        }
        
        # Collect all of our morph animations
        $morphAnimations = @(            
            foreach ($morphableKey in $morphableValues.Keys) {
                $morphs = $morphableValues[$morphableKey]
                $morphArray = @($morphs.ToArray())
                # Fix viewbox parameters
                if ($morphableKey -eq 'viewbox' -and $morphArray -notmatch '\d+\s{4}') {
                    $morphArray = @(foreach ($viewbox in $morphArray) {
                        if ($viewbox -notmatch '\d+\s{4}') {
                            if ($viewbox -match '\d+\s{0,}\d+') {
                                $viewbox = "0 0 $viewbox"
                            } else {
                                $viewbox = "0 0 $viewbox $viewbox"
                            }
                        } else {
                            $viewbox
                        }
                    })
                }
                # If we only have two points to morph to, use the `To` attribute.
                if ($morphArray.Length -eq 2)
                {
                    SVG.animate @svgSplat -To $morphs[1] -AttributeName $morphableKey
                } 
                # If we have more than two points, use the `Values` attribute.
                elseif ($morphArray.Length -gt 2) 
                {
                    SVG.animate @svgSplat -Values "$($morphArray -join ';')" -AttributeName $morphableKey
                }
            }
        )

        # Get the first content item
        $firstContentItem = @($ContentToMorph)[0]
        if ($morphAnimations) {     
            # Add the animations to the first content item.
            $firstContentItem.InnerXml += $morphAnimations.OuterXml
        }

        # Return the first content item.
        $firstContentItem
    
    }
}

