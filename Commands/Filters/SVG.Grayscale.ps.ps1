[ValidatePattern('SVG\.Grayscale')]
param()

function SVG.Grayscale
{
    <#
    .SYNOPSIS
        Grayscale Filter
    .DESCRIPTION
        Creates a grayscale filter in SVG.

        This uses a fixed saturation of zero, to remove all colors within the image.
    .EXAMPLE
        SVG -ViewBox 200 @(
            SVG.Circle -R 100 -CX 100 -CY 100 -Fill '#4488ff' -Filter 'url(#grayscale)' |
                SVG.Grayscale
        ) -OutputPath .\Grayscale.svg
    .LINK
        https://developer.mozilla.org/en-US/docs/Web/SVG/Element/feColorMatrix
    #>
    [inherit('SVG.filter', Dynamic, Abstract)]
    [CmdletBinding()]
    param(
    
    )

    begin {
        $animationElements = 'animate','set','animateTransform','animateMotion'
        $defaultId = 'grayscale'
    }
    
    process {
        # Create the splat for the filter and filter entry
        $feSplat = [Ordered]@{type='saturate';Values=0}
        $filterSplat = [Ordered]@{} + $PSBoundParameters

        # Check if we have any content
        $content = $filterSplat['Content']
        if ($content.LocalName) {
            # If it's not a filter
            if ($content.LocalName -ne 'filter') {
                # Set the input to SourceGraphic
                $feSplat['In'] = 'SourceGraphic'
                # If it's an animation element, set the content to the animation element
                if ($content.LocalName -in $animationElements) {
                    $feSplat['Content'] = $content
                }                
            }
        } else {
            # If there was no content, set the input to SourceGraphic
            $feSplat['In'] = 'SourceGraphic'
        }

        # Create the saturation filter (using [feColorMatrix](https://developer.mozilla.org/en-US/docs/Web/SVG/Element/feColorMatrix))
        $newFilter = SVG.feColorMatrix @feSplat
                
        $filterSplat['Content'] =
            # If the content is a filter, add the filter to the content
            if ($content.LocalName -eq 'Filter') {
                @($content.childNodes) + $newFilter
            } else {
                $newFilter
            }
        
        # If there's no ID, set it to $defaultId
        if (-not $filterSplat['ID']) {
            $filterSplat['ID'] = $defaultId
        }
        
        if ($content -and 
            $content.LocalName -ne 'filter' -and 
            $content.LocalName -notin $animationElements) {
            SVG.defs @(SVG.filter @filterSplat)
            if ($content.setAttribute) {
                $content.setAttribute('style',"filter:url('#$($filterSplat['ID'])')")
            }
            $content
        } else {
            SVG.filter @filterSplat
        }        
    }
}
