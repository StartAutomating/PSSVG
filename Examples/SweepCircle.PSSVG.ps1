#requires -Module PSSVG


$Radius = 35
$Center = 50
$RotateEvery = [Timespan]::FromSeconds(1.5)
=<svg> -ViewBox 0,0, ($center * 2), ($center * 2) @(
    =<svg.circle> -Fill transparent -Stroke '#4488ff' -Cx $center -Cy $center -R 35
    =<svg.line> -Stroke '#4488ff' -X1 $center -x2 ($center + $radius) -Y1 $center -Y2 $center @(
        =<svg.animatetransform> -AttributeName transform -From "0 $center $center"  -To "360 $center $center" -dur "$($RotateEvery.TotalSeconds)s" -RepeatCount indefinite -AttributeType xml -type rotate
    ) -Opacity 0.8
) -OutputPath (Join-Path $PSScriptRoot .\SweepCircle.svg)
