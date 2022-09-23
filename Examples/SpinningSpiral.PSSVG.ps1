#requires -Module PSSVG

[Timespan]$RotateEvery = '00:00:10'


@(foreach ($n in 15, 636, 741, 901) {
    New-Object PSObject -Property @{
        Theta = [MATH]::PI * $n
        N =  $n 
    }    
}) | ForEach-Object {
    $n = $_.N     
    =<svg> -content (
        $_ | =<svg.Spiral> -Stroke '#4488ff' -Content @(
            if ($RotateEvery.TotalSeconds) {
                =<svg.animatetransform> -AttributeName transform -From "0 250 250"  -To "360 250 250" -dur "$($RotateEvery.TotalSeconds)s" -RepeatCount indefinite -AttributeType xml -type rotate
            }            
        )
    ) -ViewBox 0,0,500,500 -OutputPath (
        Join-Path $psScriptRoot "SpinningSpiral$n.svg"
    )
}
