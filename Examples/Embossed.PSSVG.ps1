#requires -Module PSSVG


param(
# The message to emboss
[string]    
$Message = "Embossed",

# The fill color of the text
[string]
$Fill = '#4488ff',

# The css classes to apply to the image
[string[]]
$Class,

# The font size of the text
[string]
$FontSize = "26em",

# The embossing level
[int]
$Emboss = 5
)
svg @(
    svg.filter -id embossed @(
        svg.feConvolveMatrix -KernelMatrix "
        $Emboss 0 0
        0 0 0
        0 0 -$($Emboss * -1)
"
        svg.feMerge @(
            svg.feMergeNode
            svg.feMergeNode -In 'SourceGraphic'
        )          
    )
        
    svg.text "
Embossed
" -TextAnchor middle -DominantBaseline middle -Fill $Fill -FontSize $FontSize -X 50% -Y 50% -Filter 'url(#embossed)'
) -Class $class -ViewBox 0,0,300,100 -OutputPath (Join-Path $PSScriptRoot .\Embossed.svg)