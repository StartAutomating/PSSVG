[ValidatePattern('(?>SVG\.Copy|Copy\p{P}SVG)')]
param()
function Copy-SVG {
    <#
    .SYNOPSIS
        Copies SVG content.
    .DESCRIPTION
        Makes multiple copies of one or more SVG elements.
    .EXAMPLE
        Copy-SVG -CopyCount 4 -Content @(    
            SVG.Circle -R 100 -CX 100 -CY 100 -Fill currentColor                
        ) -OutputPath .\CircleCopies.svg 
    .EXAMPLE
        @(
            SVG.Circle -r 100 -fill currentColor
            SVG.Circle -r 100 -stroke currentColor
        ) | Copy-SVG -CopyCount 25 -Viewbox 1kb -OutputPath .\MultipleCircleCopies.svg
    #>
    [inherit('SVG',Abstract,Dynamic)]
    [Alias('SVG.Copy')]
    param(
    # The number of copies of each item to show.
    [vbn()]
    [Alias('NumberOfCopies','Count')]
    [int]
    $CopyCount,

    # The number of rows to display.
    # If this is not provided, it will be calculated based on the number of columns.
    # If columns are not provided, it will be calculated based on the number of copies.
    [vbn()]
    [int]
    $RowCount,

    # The number of columns to display.
    # If this is not provided, it will be calculated based on the number of rows.
    # If rows are not provided, it will be calculated based on the number of copies.
    [vbn()]
    [int]
    $ColumnCount,

    # If set, will overlap multiple content items in 2d or 3d.  
    # By default, multiple content items will be interleaved.
    [vbn()]
    [switch]
    $Overlap        
    )

    end {
        # Get all of the accumulated `$input`,
        $ContentToCopy = @($input)
        if (-not $ContentToCopy) { # or the `-Content` parameter.
            $ContentToCopy = $PSBoundParameters['Content']
        }
        # Return if there is no content to copy.
        return if -not $ContentToCopy

        # Copy our parameters
        $svgSplat = [Ordered]@{} + $PSBoundParameters
        # and then remove any that are not in the base command.
        $svgCommand = $baseCommand
        foreach ($parameterName in @($svgSplat.Keys)) {
            if (-not $svgCommand.Parameters[$parameterName]) {
                $svgSplat.Remove($parameterName)
            }
        }

        
        # If no `CopyCount` was provided and we're not overlapping.
        if ($CopyCount -lt $contentToCopy.Length -and -not $Overlap)
        {
            # default to the number of content items.
            $CopyCount = $contentToCopy.Length
        } elseif (-not $CopyCount)
        {
            # Otherwise, display the image at least once.
            $CopyCount = 1 
        }
		
        # If neither a row or column was provided, default to a square.
		if (-not $RowCount -and -not $ColumnCount) {
            $copyCountSquareRoot = [int][math]::Ceiling([math]::Sqrt($copyCount))
            $RowCount = $ColumnCount = $copyCountSquareRoot
        }
        # If no column was provided, calculate it based on the row.
        elseif (-not $ColumnCount) {
            $ColumnCount = [int][math]::Ceiling($CopyCount / $RowCount)
        }
        # If no row was provided, calculate it based on the column.
        elseif (-not $RowCount) {
            $RowCount = [int][math]::Ceiling($CopyCount / $ColumnCount)
        }

        # Create our symbols.
        $symbols = @(            
            $symbolNumber = 1
            foreach ($contentItem in $ContentToCopy) {

                # If they provided a string, we need to convert it to an XML element.
                if ($ContentItem -is [string]) {
                    $ContentItemAsXml = $contentItem -as [xml]
                    if ($ContentItemAsXml) {
                        $contentItem = $ContentItemAsXml
                    }
                }                    

                # If they directly provided an element without points, we need to determine a viewbox.
                # (this is potentially error prone and a bit slower, so please provide a viewbox)
                $pointProperties = @(
                    $contentItem.d                    
                    $contentItem.points                                        
                ) -split '[\D-[\.]]+' -notmatch '^\s{0,}$'
                # If we have points, we need to determine the maximum point.
                if ($pointProperties) {
                    $maxPoint = 0.0
                    foreach ($pointProperty in $pointProperties) {
                        if ($maxPoint -lt $pointProperty) {
                            $maxPoint = $pointProperty -as [double]
                        }
                    }
                    # and then enclose the content in an SVG with a viewbox.
                    $contentItem = 
                        SVG -ViewBox $maxPoint -Width 100% -Height 100% -Content @($contentItem.OuterXml -replace '\<\?xml.+?\?\>')
                } elseif ($contentItem.OuterXml) {
                    # If they provided an XML string, just use that (minus the XML declaration)
                    $contentItem = 
                        $contentItem.OuterXml -replace '\<\?xml.+?\?\>'
                }                               
                $symbolSplat = [Ordered]@{
                    id = "symbol-$symbolNumber"
                    content = $contentItem                        
                }
                $symbolNumber++
                (SVG.symbol @symbolSplat).OuterXml
            }
        )

        $shapeNumber = 1
        $useOfSymbols = 
        @(foreach ($n in 1..$copyCount) {
			$svgAttributes = if ($copyCount -gt 1) {
				$copyColumn = ($n - 1) % $ColumnCount
				$copyRow    = [math]::Floor(($n - 1) / $ColumnCount)
				$useSplat = [Ordered]@{
					x = "$([Math]::Round(($copyColumn * 100 / $ColumnCount), 10))%"
					y = "$([Math]::Round(($copyRow * 100 / $RowCount), 10))%"
                    width = "$([Math]::Round((100 / $ColumnCount),10))%"
                    height = "$([Math]::Round((100 / $RowCount),10))%"
                    # 'transform-origin' = '50% 50%' # leaving the origin alone until more wallpapering is done.
				}                
                
				@(foreach ($key in $useSplat.Keys) { "$key='$($useSplat[$key])'" }) -join ' '
			}
			if ($overlap) {
				if ($n -eq 1) {
					"<svg id='shape$shapeNumber' $svgAttributes>$($ContentToCopy.OuterXml)</svg>"
				} else {
					"<use href='#shape-$shapeNumber' $svgAttributes/>"
				}
			} else {
				$contentIndex = ($n - 1) % $ContentToCopy.Length
				"<use href='#symbol-$($contentIndex + 1)' $svgAttributes />"
			}
		})

        if (-not $svgSplat['Width']) {
            $svgSplat['Width'] = '100%'
        }

        if (-not $svgSplat['Height']) {
            $svgSplat['Height'] = '100%'
        }

        SVG @svgSplat -Content @(
            if (-not $Overlap) {
                $symbols
            }            
            $useOfSymbols
        )
    }
}
