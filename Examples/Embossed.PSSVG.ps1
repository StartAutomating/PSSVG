#requires -Module PSSVG

=<svg> @(
    =<svg.filter> -id embossed @(
        =<svg.feConvolveMatrix> -KernelMatrix '
        5 0 0
        0 0 0
        0 0 -5       
'
        =<svg.feMerge> @(
            =<svg.feMergeNode>
            =<svg.feMergeNode> -In 'SourceGraphic'
        )          
    )
        
    =<svg.text> "
Embossed
" -TextAnchor middle -DominantBaseline middle -Fill '#4488ff' -FontSize 16 -X 50% -Y 50% -Filter 'url(#embossed)'  
) -ViewBox 0,0,300,100 -OutputPath (Join-Path $PSScriptRoot .\Embossed.svg) 