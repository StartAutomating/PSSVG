[ValidatePattern('SVG\.Ero(de|sion)')]
param()

function SVG.Erode
{
    <#
    .SYNOPSIS
        Erode Filter
    .DESCRIPTION
        Creates a erode filter in SVG.

        This controls how eroded an image should be.
    .EXAMPLE
        SVG -ViewBox 200 @(
            SVG.Defs @(
                SVG.Erode -Content @(
                    SVG.Animate -AttributeName 'radius' -values '0;40;0' -dur '4s' -repeatCount 'indefinite'
                )
            )
            SVG.Circle -R 100 -CX 100 -CY 100 -Fill '#4488ff' -Filter 'url(#erode)'
        ) -OutputPath .\Erode.svg
    .LINK
        https://developer.mozilla.org/en-US/docs/Web/SVG/Element/feMorphology
    #>
    [inherit('SVG.filter', Dynamic, Abstract)]
    [Alias('SVG.Erosion')]
    param(
    [vbn()]
    [Alias('Erode')]
    [double]
    $Erosion = 1
    )

    begin {
        $animationElements = 'animate','set','animateTransform','animateMotion'
        $defaultId = 'erode'
    }

    process {
        # Create the splat for the filter and filter entry
        $feSplat = [Ordered]@{operator='erode';Radius=$Erosion}
        $filterSplat = [Ordered]@{} + $PSBoundParameters

        # Check if we have any content
        $content = $PSBoundParameters['Content']
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

        # Create the saturation filter (using [feMorhology](https://developer.mozilla.org/en-US/docs/Web/SVG/Element/feMorhology))
        $newFilter = SVG.feMorphology @feSplat
        
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
        # Remove parameters from the splat that don't apply to filter.
        $null = $filterSplat.Remove('saturation')

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
