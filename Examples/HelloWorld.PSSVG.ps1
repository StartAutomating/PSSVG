#requires -Module PSSVG

=<svg> (
    =<svg.text> -X 50% -Y 50% -Fontsize 36 "Hello World" -DominantBaseline middle -TextAnchor middle -Fill '#4488ff'
) -ViewBox 0,0, 200, 100 -OutputPath (Join-Path $psScriptRoot .\HelloWorld.svg)
