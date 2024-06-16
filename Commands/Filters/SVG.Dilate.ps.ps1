[ValidatePattern('SVG\.Dilat(e|ion)')]
param()

function SVG.Dilate
{
    <#
    .SYNOPSIS
        Dilate Filter
    .DESCRIPTION
        Creates a Dilate filter in SVG.

        This controls how Dilated an image should be.
    .EXAMPLE
        SVG -ViewBox 200 @(
            SVG.Defs @(
                SVG.Dilate -Content @(
                    SVG.Animate -AttributeName 'radius' -values '0;21;0' -dur '4.2s' -repeatCount 'indefinite'
                )
            )
            SVG.Circle -R 100 -CX 100 -CY 100 -Fill '#4488ff' -Filter 'url(#Dilate)'
        ) -OutputPath .\Dilate.svg
    .LINK
        https://developer.mozilla.org/en-US/docs/Web/SVG/Element/feMorphology
    #>
    [inherit('SVG.filter', Dynamic, Abstract)]
    [Alias('SVG.Dilation')]
    param(
    # The amount to dilate the image.
    [vbn()]
    [Alias('Dilate')]
    [double]
    $Dilation = 1
    )
    begin {
        $animationElements = 'animate','set','animateTransform','animateMotion'
        $defaultId = 'erode'
        $notFilterParameters = 'Dilation'
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

        # Create the filter (using [feMorhology](https://developer.mozilla.org/en-US/docs/Web/SVG/Element/feMorhology))
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
        foreach ($notFilterParameter in $notFilterParameters) {
            $null = $filterSplat.Remove($notFilterParameter)
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
