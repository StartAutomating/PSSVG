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
    process {
        $HueRotateFilter = @(            
            SVG.feColorMatrix -Type 'hueRotate' -Values $HueRotate -In 'SourceGraphic'
        )
        if ($PSBoundParameters['Content']) {
            $PSBoundParameters['Content'] = $HueRotateFilter + $PSBoundParameters['Content']
        } else {
            $PSBoundParameters['Content'] = $HueRotateFilter
        }
        if (-not $PSBoundParameters['ID']) {
            $PSBoundParameters['ID'] = 'hueRotate'
        }        
        $null = $PSBoundParameters.Remove('HueRotate')
        SVG.filter @PSBoundParameters
    }
}
