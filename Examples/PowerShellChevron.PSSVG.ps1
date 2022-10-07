#requires -Module PSSVG

=<svg> -ViewBox 100,100 -Content @(
    =<svg.symbol> -Id psChevron -Content @(
        =<svg.polygon> -Points (@(
            "40,20"
            "45,20"
            "60,50"
            "35,80"
            "32.5,80"
            "55,50"
        ) -join ' ')
    ) -ViewBox 100, 100

    =<svg.use> -Href '#psChevron' -Fill '#4488ff'
) -OutputPath (Join-Path $PSScriptRoot PowerShellChevron.svg)
