[ValidatePattern('SVG\.Slot')]
param()
function SVG.Slot
{
    <#
    .SYNOPSIS
        Creates a slot element.
    .DESCRIPTION
        Creates a slot element containing SVG.

        While slots are not _technically_ SVG elements, they're very useful when combined with SVGs.
    #>
    [inherit('SVG.svg',Dynamic,Abstract)]
    [CmdletBinding()]
    param(
    # The name of the slot.
    [vbn()]
    [string]
    $Name
    )

    end {
        # Anything piped in is content to slot.
        $ContentToslot = @($input)
        if (-not $ContentToslot) {
            # If no content is piped in, check the parameter.
            $ContentToslot = $PSBoundParameters['Content']
        }        

        # Create a splat of parameters to pass to the base command.
        $svgSplat = [Ordered]@{} + $PSBoundParameters

        $propagateToslot = 'class','id','lang','style', 'data', 'attribute','slot','name'
        $elementSplat = [Ordered]@{
            ElementName='slot'
            Attribute = [Ordered]@{}
        }
        foreach ($parameterName in $propagateToslot) {
            if ($svgSplat[$parameterName]) {
                $elementSplat.Attribute[$parameterName] = $svgSplat[$parameterName]
                $svgSplat.Remove($parameterName)
            }
        }

        $svgCommand = $baseCommand
        # Remove any of my parameters that are not in the base command.
        foreach ($parameterName in @($svgSplat.Keys)) {
            if (-not $svgCommand.Parameters[$parameterName]) {
                $svgSplat.Remove($parameterName)
            }
        }
        # and remove `Content` for good measure.
        $svgSplat.Remove('Content')
        if ($ContentToslot) {
            $svgSplat.Content = $ContentToslot
        }
        
        Write-SVG @elementSplat -Content @( & $baseCommand @svgSplat)
    }
}
