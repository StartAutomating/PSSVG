#requires -Module PSSVG

=<svg> (
    =<svg.text> -X 0 -Y 48 -Fontsize 48 "Hello World"
) -OutputPath (Join-Path $psScriptRoot .\HelloWorld.svg)
