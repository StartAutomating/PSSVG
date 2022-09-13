#requires -Module PSSVG

$path = "M20,50 C20,-50 180,150 180,50 C180-50 20,150 20,50 z"
=<svg> -viewBox "0 0 200 100" @(
    =<svg.path> -d $path -Fill none -Stroke lightgrey
    =<svg.circle> -r 5 -Fill red (
        =<svg.animateMotion> -Dur 10s -RepeatCount 'indefinite' -Path $path
    )
    =<svg.rect> -Width 2 -Height 2 -X -1 -Y -1 -Fill blue @(
        =<svg.animateMotion> -Dur 10s -RepeatCount 'indefinite' -Path $path
        =<svg.animateTransform> -AttributeName transform -From "0 0 0"  -To "360 0 0" -dur "5s" -RepeatCount indefinite -AttributeType xml -type rotate
    )
) -OutputPath (Join-Path $psScriptRoot AnimateMotion.svg)

