#requires -Module PSSVG

#.SYNOPSIS
#    Generates clouds using SVG
#.DESCRIPTION
#    Generates a cloud effect using fractal noise and blending modes.


=<SVG> -viewBox 1920, 1080 -Content @(
    =<SVG.filter> -id 'noise1' -x '0' -y '0' -width '100%' -height '100%' -Content @(
        =<SVG.feTurbulence> -baseFrequency '0.025' -Type 'fractalNoise' -NumOctaves 4
        =<SVG.feGaussianBlur> -stdDeviation 0.9
        =<svg.feBlend> -In 'SourceGraphic' -Mode color-burn
    )
    =<SVG.rect> -x '0' -y '0' -width 100% -height 100% -style 'filter: url(#noise1);' -Fill '#4488ff' -Opacity .2
) -OutputPath (Join-Path $psScriptRoot "Clouds.svg") -Width '100%' -Height '100%'