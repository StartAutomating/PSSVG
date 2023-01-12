#requires -Module PSSVG

$AnimationTimeframe = [Ordered]@{
    Dur = '2s'
    RepeatCount = 'indefinite'
}

SVG -viewBox 1920,1080 -Content @(
    SVG.filter -id 'noise1' -x '0' -y '0' -width '100%' -height '100%' -Content @(
        SVG.feTurbulence -baseFrequency '0.025' @(
            SVG.animate -AttributeName numOctaves -Values '1;6;12' @AnimationTimeframe
            SVG.animate -AttributeName seed -Values '0;5;0' @AnimationTimeframe
        ) -NumOctaves 4 -Type fractalNoise
        SVG.feGaussianBlur -stdDeviation 0.9 @(
            SVG.animate -AttributeName stdDeviation -Values '1.1;3.3;1.1' @AnimationTimeframe
        )
        SVG.feBlend -In 'SourceGraphic' -Mode color-burn
    )
    SVG.rect -x '0' -y '0' -width 100% -height 100% -style 'filter: url(#noise1);' -Fill '#4488ff' -Opacity .4
) -OutputPath (Join-Path $psScriptRoot "CloudAnimation.svg")