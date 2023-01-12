function SVG.Spiral
{
    <#
    .SYNOPSIS
        Draws an SVG Spiral
    .DESCRIPTION
        Creates an SVG spiral as an SVG path.
    .LINK
        SVG.path
    #>
    [inherit('SVG.path', ExcludeParameter='D','Fill', Dynamic, Abstract)]
    param(
    # The number of steps in the spiral
    [Parameter(ValueFromPipelineByPropertyName)]
    [Uint32]
    $NumSteps = 1000,
    
    # The value for theta
    [Parameter(ValueFromPipelineByPropertyName)]
    [double]
    $Theta = [MATH]::pi * 50,

    # The value for alpha (not to be confused with transparency, that's -Opacity)
    [Parameter(ValueFromPipelineByPropertyName)]
    [Double]
    $Alpha = 200,

    # The scale of the spiral along the horizontal axis
    [Parameter(ValueFromPipelineByPropertyName)]
    [Alias('ScaleHorizontal')]
    [double]
    $ScaleX = 1,

    # The scale of the spiral along the vertical axis
    [Parameter(ValueFromPipelineByPropertyName)]
    [Alias('ScaleVertical')]
    [double]
    $ScaleY = 1
    )

    process {
        $Margin  = $Alpha * 1.25
        $width = $margin * 2
        $height = $margin * 2 
        
        $svgPoints = @(
            "M $margin $margin"    
            foreach ($n in 0..$numSteps) {
                $t = ($theta/$numSteps) * $n 
                $a = ($alpha/$numSteps) * $n 
                $px = $margin+($a*[Math]::Cos($t) * $ScaleX)
                $py = $margin+($a*[Math]::Sin($t) * $ScaleY)
                "L $px $py"                
            }
        )

        $baseCommandParameters = [Ordered]@{}
        foreach ($paramName in $PSBoundParameters.Keys) {
            if ($baseCommand.Parameters.$paramName) {
                $baseCommandParameters[$paramName] = $PSBoundParameters[$paramName]
            }
        }

        $baseCommandParameters.D = $svgPoints
        $baseCommandParameters.Fill = 'Transparent'
                
        =<svg.path> @baseCommandParameters        
    }
}
