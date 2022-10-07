function SVG.DropShadow
{
    <#
    .LINK
        SVG.filter
    .LINK
        SVG.feDropShadow
    .LINK
        SVG.feMerge
    .LINK
        SVG.feMergeNode
    #>
    [inherit('SVG.filter', Dynamic, Abstract)]
    param(
    [Alias('DX')]
    [double]
    $DistanceX = 0.5,

    [Alias('DY')]
    [double]
    $DistanceY = 0.5,

    [Alias('StdDeviation')]
    [double]
    $StandardDeviation
    )

    process {
        $DropShadow = @(            
            =<svg.feDropShadow> -dx $DistanceX -dy $DistanceY -StdDeviation $StandardDeviation
            =<svg.feMerge> @(
                =<svg.feMergeNode>
                =<svg.feMergeNode> -In 'SourceGraphic'
            )            
        )
        if ($PSBoundParameters['Content']) {
            $PSBoundParameters['Content'] = $DropShadow + $PSBoundParameters['Content']
        } else {
            $PSBoundParameters['Content'] = $DropShadow
        }
        if (-not $PSBoundParameters['ID']) {
            $PSBoundParameters['ID'] = 'dropShadow'
        }
        $null = $PSBoundParameters.Remove('DistanceX')
        $null = $PSBoundParameters.Remove('DistanceY')
        & $baseCommand @PSBoundParameters
    }
}