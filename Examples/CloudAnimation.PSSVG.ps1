#requires -Module PSSVG

$AnimationTimeframe = [Ordered]@{
    Dur = '2s'
    RepeatCount = 'indefinite'
}
=<SVG> -viewBox 1920,1080 -Content @(
    =<SVG.filter> -id 'noise1' -x '0' -y '0' -width '100%' -height '100%' -Content @(
        =<SVG.feTurbulence> -baseFrequency '0.025' @(
            =<svg.animate> -AttributeName numOctaves -Values '1;6;1' @AnimationTimeframe
            =<svg.animate> -AttributeName seed -Values '0;5;0' @AnimationTimeframe
        ) -NumOctaves 4 -Type fractalNoise
        =<svg.feBlend> -In 'SourceGraphic' -Mode color-burn
    )
    =<SVG.rect> -x '0' -y '0' -width 100% -height 100% -style 'filter: url(#noise1);' -Fill '#4488ff' -Opacity .2
) -OutputPath (Join-Path $psScriptRoot "CloudAnimation.svg")