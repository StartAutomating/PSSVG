[ValidatePattern('SVG\.Saturat(e|ion)')]
param()

function SVG.Saturate
{
    <#
    .SYNOPSIS
        Saturate Filter
    .DESCRIPTION
        Creates a saturation filter in SVG.

        This controls how saturated color are within the image.
    .EXAMPLE
        SVG -ViewBox 200 @(
            SVG.Defs @(
                SVG.Saturate -Saturation .2
            )
            SVG.Circle -R 100 -CX 100 -CY 100 -Fill 'red' -Filter 'url(#saturate)'
        ) -OutputPath .\Saturate.svg
    .LINK
        https://developer.mozilla.org/en-US/docs/Web/SVG/Element/feColorMatrix
    #>
    [inherit('SVG.filter', Dynamic, Abstract)]
    [Alias('SVG.Saturation')]
    param(
    [Alias('Saturate','Saturation','Sat','S')]
    [double]
    $Saturation = 1
    )
    process {
        $SaturationFilter = @(            
            SVG.feColorMatrix -Type 'saturate' -Values $Saturation -In 'SourceGraphic'
        )
        if ($PSBoundParameters['Content']) {
            $PSBoundParameters['Content'] = $SaturationFilter + $PSBoundParameters['Content']
        } else {
            $PSBoundParameters['Content'] = $SaturationFilter
        }
        if (-not $PSBoundParameters['ID']) {
            $PSBoundParameters['ID'] = 'saturate'
        }        
        $null = $PSBoundParameters.Remove('saturation')
        SVG.filter @PSBoundParameters
    }
}
