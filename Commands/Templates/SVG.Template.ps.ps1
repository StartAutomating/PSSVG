[ValidatePattern('SVG\.Template')]
param()
function SVG.Template
{
    <#
    .SYNOPSIS
        Creates a template element.
    .DESCRIPTION
        Creates a template element containing SVG.

        While templates are not _technically_ SVG elements, they're very useful when combined with SVGs.
    #>
    [inherit('SVG.svg',Dynamic,Abstract)]
    param()

    end {
        # Anything piped in is content to template.
        $ContentTotemplate = @($input)
        if (-not $ContentTotemplate) {
            # If no content is piped in, check the parameter.
            $ContentTotemplate = $PSBoundParameters['Content']
        }
        # Return if there is nothing to template.
        return if -not $ContentTotemplate

         # Create a splat of parameters to pass to the base command.
         $svgSplat = [Ordered]@{} + $PSBoundParameters
         $svgCommand = $baseCommand
         # Remove any of my parameters that are not in the base command.
         foreach ($parameterName in @($svgSplat.Keys)) {
             if (-not $svgCommand.Parameters[$parameterName]) {
                 $svgSplat.Remove($parameterName)
             }
         }
         # and remove `Content` for good measure.
         $svgSplat.Remove('Content')

         Write-SVG -ElementName template -Content @( & $baseCommand @svgSplat)
    }
}
