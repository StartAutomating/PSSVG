#requires -Module PSSVG


=<svg> -content $(
    $commonParameters = @{
        Fill        = '#4488FF'
        Stroke      = 'black'
        StrokeWidth = '0.05'
    }
    @(    
        =<svg.text> -Text '>' -X 20 -Y 50 -FontSize 48 -Rotate -7 -FontFamily monospace @commonParameters
        =<svg.text> -Text 'PS' -X 40 -Y 50 -FontSize 52 -FontFamily monospace @commonParameters
        =<svg.text> -Text 'SVG' -X 100 -Y 50 -FontSize 42 -FontFamily sans-serif -FontStretch "10%" -FontWeight 150 @commonParameters
    )
) -ViewBox 0, 0, 200, 100 -OutputPath (
    Join-Path (Join-Path $PSScriptRoot Assets) .\PSSVG.svg
)