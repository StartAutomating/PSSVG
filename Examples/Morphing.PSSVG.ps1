#requires -Module PSSVG 

svg -Content @(    
    svg.polygon -Points "25,50 50,75 75,50 50,25" -Fill '#4488ff' @(
        svg.animate -AttributeName points -Values "25,50 50,75 75,50 50,25;0,0 0,100 100,100, 100,0; 25,50 50,75 75,50 50,25" -Dur 2s -Id morph1 -RepeatCount 'indefinite' -AttributeType XML
    )
) -ViewBox 100,100 -OutputPath (
    Join-Path $PSScriptRoot "Morphing.svg"
)
