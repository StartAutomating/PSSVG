[ValidatePattern('SVG\.HueRotate')]
param()

function SVG.HueRotate
{
    <#
    .SYNOPSIS
        Hue Rotate Filter
    .DESCRIPTION
        Creates a hue rotate filter in SVG.
    .EXAMPLE
        SVG -ViewBox 200 @(
            SVG.Defs @(
                SVG.HueRotate -HueRotate 180
            )
            SVG.Circle -R 100 -CX 100 -CY 100 -Fill 'red' -Filter 'url(#hueRotate)'
        ) -OutputPath .\HueRotate.svg
        
    #>
    [inherit('SVG.filter', Dynamic, Abstract)]
    param(
    [Alias('Angle','A')]
    [double]
    $HueRotate = 0
    )

    begin {
        $animationElements = 'animate','set','animateTransform','animateMotion'
        $defaultId = 'hueRotate'
        $notFilterParameters = 'HueRotate'
    }

    process {
        # Create the splat for the filter and filter entry
        $feSplat = [Ordered]@{type='hueRotate';Values=$HueRotate}
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
