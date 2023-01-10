=<svg> @(
    =<svg.ConvexPolygon> -SideCount 8 -Rotate (360/16) -Fill '#dd0000' -Stroke white -CenterX 100 -CenterY 100 -Radius 100
    
    =<svg.text> -X 50% -Y 50% -DominantBaseline 'middle' -TextAnchor 'middle' -FontSize 64 -FontFamily sans-serif -Fill white @(
        =<svg.tspan> -Content "STOP" -Id stop
        =<svg.animate> -Values '64;66;64' -Dur 5s -AttributeName font-size -RepeatDur 'indefinite'
    )

    =<svg.text> -X 50% -Y 65% -DominantBaseline 'middle' -TextAnchor 'middle' -FontSize 12 -FontFamily sans-serif -Fill white -Content @(
        =<svg.tspan> -Content "USING" -Id using
        =<svg.animate> -Values '12;13;12' -Dur 5s -AttributeName font-size -RepeatDur 'indefinite'
        
    )

    =<svg.text> -X 50% -Y 80% -DominantBaseline 'middle' -TextAnchor 'middle' -FontSize 32 -FontFamily sans-serif -Fill white -Content @(
        =<svg.tspan> -Content "GIFS" -Id gif
        =<svg.animate> -Values '28;30;28' -Dur 5s -AttributeName font-size -RepeatDur 'indefinite'        
    )
) -ViewBox 200,200 -OutputPath (Join-Path $PSScriptRoot .\StopUsingGIFs.svg)
