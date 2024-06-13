[ValidatePattern('SVG\.Slideshow')]
param()
function SVG.Slideshow {
    <#
    .SYNOPSIS
        Displays a slideshow of images.
    .DESCRIPTION
        Displays a slideshow of images.  This Animates the href attribute of an image over time.
    .LINK
        SVG.Image
    #>
    [inherit('SVG.image', Abstract, Dynamic,ExcludeParameter='Href')]
    param(
    # One or more image URLs.
    [vbn()]
    [alias('Uri','Url')]
    [uri[]]
    $Href,

    # The duration to display each image.
    [vbn()]
    [TimeSpan]
    $EachDuration = '00:00:07',

    # The total duration of the slideshow.
    # (if this is provided, it will override the EachDuration parameter)
    [vbn()]
    [timespan]
    $TotalDuration
    )

    process {
        $svgSplat = [Ordered]@{} + $PSBoundParameters

        foreach ($key in @($svgSplat.Keys)) {
            if (-not $baseCommand.Parameters[$key]) {
                $svgSplat.Remove($key)
            }
        }

        $svgSplat.Remove('Href')
        $newContent = @(
            if ($svgSplat.Content) {
                $svgSplat.Content
            }
            SVG.animate -Dur $(
                if ($TotalDuration) {
                    $TotalDuration.TotalSeconds
                } else {
                    $EachDuration.TotalSeconds * $Href.Length
                }
            ) -RepeatCount 'indefinite' -Values $($href -join ';') -AttributeName 'href'
        )
        $svgSplat.Content = $newContent
        & $baseCommand @svgSplat                
    }
}
