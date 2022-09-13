#requires -Module PSSVG

=<svg> -ViewBox 0,0,100,100 -Content (
    =<svg.g> -Content @(
        =<svg.text> -Y "50%" -X "50%" -DominantBaseline middle -TextAnchor middle -Text "Fading in" -Fill '#4488ff'
        
        # If you only want to fade in once, remove the -RepeatCount
        =<svg.animate> -Values '0;1' -AttributeName opacity -Begin '0s' -End '1s' -Dur '1s' -RepeatCount 'indefinite'
    )        
) -OutputPath (Join-Path $psScriptRoot .\FadeIn.svg)
