#requires -Module PSSVG 

=<svg> -Content @(    
    =<svg.polygon> -Points "25,50 50,75 75,50 50,25" -Fill '#4488ff' @(
        =<svg.animate> -AttributeName points -to "0,0 0,100 100,100, 100,0" -Dur 2s -Id morph1 -Begin '0s;morph2.end' -AttributeType XML
        =<svg.animate> -AttributeName opacity -Values '0' -Dur '0.0s' -Begin 'morph1.end' -AttributeType XML 
        =<svg.animate> -AttributeName opacity -Values '1' -Dur '0.0s' -Begin 'morph1.end' -AttributeType XML 
    )
    =<svg.polygon> -Points "0,0 0,100 100,100, 100,0" -Fill '#4488ff' @(
        =<svg.animate> -AttributeName opacity -Values '1' -Dur '0.0s' -Begin 'morph1.end' -AttributeType XML 
        =<svg.animate> -AttributeName points -to "25,50 50,75 75,50 50,25" -Dur 2s -Id morph2 -Begin 'morph1.end' -AttributeType XML
        =<svg.animate> -AttributeName opacity -Values '0' -Dur '0.0s' -Begin 'morph2.end' -AttributeType XML 
    ) -Opacity 0

) -ViewBox 100,100 -OutputPath (
    Join-Path $PSScriptRoot "Morphing.svg"
)
