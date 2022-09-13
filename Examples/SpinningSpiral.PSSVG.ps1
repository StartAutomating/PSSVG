#requires -Module PSSVG

function svgspinningspiral
{
    param(
    [Parameter(ValueFromPipelineByPropertyName)]
    [Uint32]
    $NumSteps = 1000,
    
    [Parameter(ValueFromPipelineByPropertyName)]
    [double]
    $Theta = [MATH]::pi * 50,

    [Parameter(ValueFromPipelineByPropertyName)]
    [Double]
    $Alpha = 200,

    [Timespan]
    $RotateEvery = '00:00:10'
    )

    process {
        $Margin  = $Alpha * 1.25
        $width = $margin * 2
        $height = $margin * 2 
        
        $svgPath = @()
        $svgPath += "M $margin $margin"

    
        foreach ($n in 0..$numSteps) {
            $t = ($theta/$numSteps) * $n 
            $a = ($alpha/$numSteps) * $n 
            $px = $margin+($a*[Math]::Cos($t))
            $py = $margin+($a*[Math]::Sin($t))
            $svgPath += "L $px $py"                
        }
                
        =<svg.path> -D ($svgPath -join ' ') -Fill transparent -Stroke '#4488ff' -Content @(
            if ($RotateEvery.TotalSeconds) {
                =<svg.animatetransform> -AttributeName transform -From "0 $margin $margin"  -To "360 $margin $margin" -dur "$($RotateEvery.TotalSeconds)s" -RepeatCount indefinite -AttributeType xml -type rotate
            }            
        )
    }
}





@(foreach ($n in 15, 636, 741, 901) {
    New-Object PSObject -Property @{
        Theta = [MATH]::PI * $n
        N =  $n 
    }    
}) | ForEach-Object {
    $n = $_.N     
    =<svg> -content (
        $_ | svgspinningspiral
    ) -ViewBox 0,0,500,500 -OutputPath (
        Join-Path $psScriptRoot "SpinningSpiral$n.svg"
    )
}
