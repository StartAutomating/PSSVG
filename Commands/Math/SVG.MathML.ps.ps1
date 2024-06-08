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
    [inherit('SVG.ForeignObject',Dynamic,Abstract)]
    [CmdletBinding(PositionalBinding=$false)]
    param(    
    )

    end {
        $svgSplat = [Ordered]@{} + $PSBoundParameters

        $mathContent = @($input)
        if (-not $mathContent) {
            $mathContent = @($svgSplat['Content'])
        }
        return if -not $mathContent

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
            continue if -not $mathContentItem
            continue if -not $mathContentItem.math
            $mathContentItem.math.setAttribute('display',$display)
            $mathContentItem
        })

        return if -not $mathItems        

        
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
