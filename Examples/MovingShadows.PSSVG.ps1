#requires -Module PSSVG

param(
[string]
$Fill = '#4488ff',

[string[]]
$Class,

[timespan]
$Duration = '00:00:02.5',

[double[]]
$ShadowX = @(0.5, -.5, 0.5),

[double[]]
$ShadowY = @(0.75, -.75, 0.75)
)

svg @(
    svg.filter -id dropShadow @(
        svg.feDropShadow -dx $ShadowX[0] -dy $ShadowY[0] -StdDeviation 0 @(
            svg.animate -AttributeName dx -Values $($ShadowX -join ';') -Dur $Duration -RepeatCount 'indefinite'
            svg.animate -AttributeName dY -Values $($Shadowy -join ';') -Dur $Duration -RepeatCount 'indefinite'
        )
        svg.feMerge @(
            svg.feMergeNode
            svg.feMergeNode -In 'SourceGraphic'
        )
    )
        
    svg.text "
Moving Shadows
" -TextAnchor middle -DominantBaseline middle -Fill $fill -Class $Class -FontSize 16 -X 50% -Y 50% -Filter 'url(#dropShadow)'     
) -ViewBox 0,0,300,100 -OutputPath (Join-Path $PSScriptRoot .\MovingsShadows.svg) 