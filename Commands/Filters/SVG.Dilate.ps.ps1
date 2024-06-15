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
                    SVG.Animate -AttributeName 'radius' -values '0;40;0' -dur '4s' -repeatCount 'indefinite'
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
    [vbn()]
    [Alias('Dilate')]
    [double]
    $Dilation = 1
    )
    process {
        $DilationFilter = 
            SVG.feMorphology -Operator 'dilate' -Radius $Dilation -In 'SourceGraphic' -Content $PSBoundParameters['Content']     
        $PSBoundParameters['Content'] = $DilationFilter        
        if (-not $PSBoundParameters['ID']) {
            $PSBoundParameters['ID'] = 'dilate'
        }        
        $null = $PSBoundParameters.Remove('dilation')
        SVG.filter @PSBoundParameters
    }
}
