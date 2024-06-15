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
    [Alias('Erode','E')]
    [double]
    $Erosion = 1
    )
    process {
        $ErosionFilter = @(            
            SVG.feMorphology -Operator 'erode' -Radius $Erosion -In 'SourceGraphic' -Content $PSBoundParameters['Content']
        )        
        $PSBoundParameters['Content'] = $ErosionFilter        
        if (-not $PSBoundParameters['ID']) {
            $PSBoundParameters['ID'] = 'erode'
        }        
        $null = $PSBoundParameters.Remove('erosion')
        SVG.filter @PSBoundParameters
    }
}
