#requires -Module PSSVG

=<svg> @(
    =<svg.filter> -id dropShadow @(
        =<svg.feDropShadow> -dx 0.5 -dy 0.75 -StdDeviation 0 @(
            =<svg.animate> -AttributeName dx -Values '.5;-.5;.5' -Dur 1s -RepeatCount 'indefinite'
        )
        =<svg.feMerge> @(
            =<svg.feMergeNode>
            =<svg.feMergeNode> -In 'SourceGraphic'
        )    
    )
        
    =<svg.text> @"
Moving Shadows
"@ -TextAnchor middle -DominantBaseline middle -Fill '#4488ff' -FontSize 16 -X 50% -Y 50% -Filter 'url(#dropShadow)'    
) -ViewBox 0,0,300,100 -OutputPath (Join-Path $PSScriptRoot .\MovingsShadows.svg) 