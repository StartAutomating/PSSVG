[ValidatePattern('SVG\.MathML')]
param()

function SVG.MathML {
    <#
    
    .SYNOPSIS    
        Embeds MathML in SVG.    
    .DESCRIPTION    
        Embeds MathML content in an SVG image.    
    .EXAMPLE    
        # Embeds X + Y in an SVG image.    
        SVG (    
            SVG.MathML -Display block -Content "<math xmlns='http://www.w3.org/1998/Math/MathML'><mrow><mi>x</mi><mo>+</mo><mi>y</mi></mrow></math>"    
        ) -OutputPath .\XPlusY.svg    
    
    #>
            
    [CmdletBinding(PositionalBinding=$false)]
    param(
    
    )
    dynamicParam {
    $baseCommand = 
        if (-not $script:SVGForeignObject) {
            $script:SVGForeignObject = 
                $executionContext.SessionState.InvokeCommand.GetCommand('SVG.ForeignObject','Function')
            $script:SVGForeignObject
        } else {
            $script:SVGForeignObject
        }
    $IncludeParameter = @()
    $ExcludeParameter = @()


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

        $svgSplat = [Ordered]@{} + $PSBoundParameters

        $mathContent = @($input)
        if (-not $mathContent) {
            $mathContent = @($svgSplat['Content'])
        }
        if (-not $mathContent) { return }

        $display = if ($svgSplat['Display']) { $svgSplat['Display'] } else { 'block' }

        $mathItems = @(foreach ($mathContentItem in $mathContent) {
            if ($mathContentItem -isnot [xml]) {                
                $mathContentItem = 
                    if ($mathContentItem.OuterXml) {
                        $mathContentItem.OuterXml -as [xml]
                    } else {
                        $mathContentItem -as [xml]
                    }
            }            
            if (-not $mathContentItem) { continue } 
            if (-not $mathContentItem.math) { continue } 
            $mathContentItem.math.setAttribute('display',$display)
            $mathContentItem
        })

        if (-not $mathItems) { return }        

        
        $svgCmd = $baseCommand
        foreach ($parameterName in @($svgSplat.Keys)) {
            if (-not $svgCmd.Parameters[$parameterName]) {
                $svgSplat.Remove($parameterName)
            }
        }
        $svgSplat.Remove("Style")
        if (-not $svgSplat['Width']) { $svgSplat['Width'] ='100%' }
        if (-not $svgSplat['Height']) { $svgSplat['Height']= "$(100 / $mathItems.Length)%" }
        $originalSvgSplat = [Ordered]@{} + $svgSplat
        $mathItemIndex = 0 
        foreach ($mathItem in $mathItems) {
            $svgSplat = [Ordered]@{} + $originalSvgSplat
            $svgSplat['Y'] = "$((100 / $mathItems.Length) * $mathItemIndex)%"
            $svgSplat.Content = $mathItem.OuterXml
            $mathItemIndex++
            & $svgCmd @svgSplat
        }                
    
    }
}

