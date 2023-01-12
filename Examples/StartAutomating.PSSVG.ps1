
svg -viewBox 300, 100 -Content @(
    svg.symbol -Id psChevron -Content @(
        svg.polygon -Points (@(
            "40,20"
            "45,20"
            "60,50"
            "35,80"
            "32.5,80"
            "55,50"
        ) -join ' ')
    ) -ViewBox 100, 100
    svg.use -Href '#psChevron' -Fill '#4488ff' -X -7.5%
    svg.text @(
        svg.tspan -Content 'Start' -LetterSpacing .15em -AlignmentBaseline 'middle'
        svg.tspan -Content 'Automating' -LetterSpacing .2em -AlignmentBaseline 'middle' -Dx 0.5em
    ) -FontFamily 'monospace' -AlignmentBaseline 'middle' -X 27.5% -Y 50% -Fill '#4488ff'
    # svg.text -Content 'Automating' -FontFamily 'monospace' -AlignmentBaseline 'middle' -X 45% -Y 55% -Fill '#4488ff' -LetterSpacing .1em
) -OutputPath (Join-Path $PSScriptRoot "StartAutomating.svg")