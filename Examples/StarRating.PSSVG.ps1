#requires -Module PSSVG

=<svg> @(
    =<svg.symbol> -content (
        =<svg.text> -Content '⭐' -X 50% -Y 50% -FontSize 5 -TextAnchor middle # -DominantBaseline middle -TextAnchor middle
    ) -id Star -ViewBox 25,25
    
    $scaledSize = [Ordered]@{Width=15;Height=15}
    =<svg.use> -Href '#Star' -X 0 @scaledSize
    =<svg.use> -Href '#Star' -X 20 @scaledSize 
    =<svg.use> -Href '#Star' -X 40 @scaledSize
    =<svg.use> -Href '#Star' -X 60 @scaledSize 
    =<svg.use> -Href '#Star' -X 80 @scaledSize
) -ViewBox 0,0,125,50 -OutputPath (Join-Path $psScriptRoot .\StarRating.svg)

