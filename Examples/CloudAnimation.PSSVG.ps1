#requires -Module PSSVG

$AnimationTimeframe = [Ordered]@{
    Dur = '2s'
    RepeatCount = 'indefinite'
}
=<SVG> -viewBox '0 0 200 200' -Content @(
    =<SVG.filter> -id 'noise1' -x '0' -y '0' -width '100%' -height '100%' -Content @(
        =<SVG.feTurbulence> -baseFrequency '0.025' @(
            =<svg.animate> -AttributeName numOctaves -Values '1;6;1' @AnimationTimeframe
            =<svg.animate> -AttributeName seed -Values '0;2;0' @AnimationTimeframe
        ) -NumOctaves 4 -Type fractalNoise
        =<svg.feBlend> -In 'SourceGraphic' -Mode color
    )
    =<SVG.rect> -x '0' -y '0' -width '200' -height '200' -style 'filter: url(#noise1);' -Fill '#4488ff' -Opacity .5 # -Clip   
) -OutputPath (Join-Path $psScriptRoot "CloudAnimation.svg")