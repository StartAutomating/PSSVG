#requires -Module PSSVG

param(
    [double]
    $DistanceY = 0.75,

    [double]
    $DistanceX = 0
)
SVG @(
    SVG.DropShadow -DistanceY $DistanceY  -DistanceX $DistanceX
        
    SVG.text "
Dropping Shadows
" -TextAnchor middle -DominantBaseline middle -Fill '#4488ff' -FontSize 16 -X 50% -Y 50% -Filter 'url(#dropShadow)'
    
) -ViewBox 0,0,300,100 -OutputPath (Join-Path $PSScriptRoot .\DropShadow.svg)