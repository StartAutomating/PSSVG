[ValidatePattern('SVG\.Slideshow')]
param()
function SVG.Slideshow {
    <#
    
    .SYNOPSIS    
        Displays a slideshow of images.    
    .DESCRIPTION    
        Displays a slideshow of images.  This Animates the href attribute of an image over time.    
    .LINK    
        SVG.Image    
    
    #>
        
    param(
    # One or more image URLs.    
    [Parameter(ValueFromPipelineByPropertyName)]
    [alias('Uri','Url')]
    [uri[]]
    $Href,

    # The duration to display each image.    
    [Parameter(ValueFromPipelineByPropertyName)]
    [TimeSpan]
    $EachDuration = '00:00:07',

    # The total duration of the slideshow.    
    # (if this is provided, it will override the EachDuration parameter)    
    [Parameter(ValueFromPipelineByPropertyName)]
    [timespan]
    $TotalDuration
    )
    dynamicParam {
    $baseCommand = 
        if (-not $script:SVGimage) {
            $script:SVGimage = 
                $executionContext.SessionState.InvokeCommand.GetCommand('SVG.image','Function')
            $script:SVGimage
        } else {
            $script:SVGimage
        }
    $IncludeParameter = @()
    $ExcludeParameter = 'Href'


    $DynamicParameters = [Management.Automation.RuntimeDefinedParameterDictionary]::new()            
    :nextInputParameter foreach ($paramName in ([Management.Automation.CommandMetaData]$baseCommand).Parameters.Keys) {
        if ($ExcludeParameter) {
            foreach ($exclude in $ExcludeParameter) {
                if ($paramName -like $exclude) { continue nextInputParameter}
            }
        }
        if ($IncludeParameter) {
            $shouldInclude = 
                foreach ($include in $IncludeParameter) {
                    if ($paramName -like $include) { $true;break}
                }
            if (-not $shouldInclude) { continue nextInputParameter }
        }
        
        $DynamicParameters.Add($paramName, [Management.Automation.RuntimeDefinedParameter]::new(
            $baseCommand.Parameters[$paramName].Name,
            $baseCommand.Parameters[$paramName].ParameterType,
            $baseCommand.Parameters[$paramName].Attributes
        ))
    }
    $DynamicParameters

    }
        process {
        $svgSplat = [Ordered]@{} + $PSBoundParameters

        foreach ($key in @($svgSplat.Keys)) {
            if (-not $baseCommand.Parameters[$key]) {
                $svgSplat.Remove($key)
            }
        }

        $svgSplat.Remove('Href')
        $newContent = @(
            if ($svgSplat.Content) {
                $svgSplat.Content
            }
            SVG.animate -Dur $(
                if ($TotalDuration) {
                    $TotalDuration.TotalSeconds
                } else {
                    $EachDuration.TotalSeconds * $Href.Length
                }
            ) -RepeatCount 'indefinite' -Values $($href -join ';') -AttributeName 'href'
        )
        $svgSplat.Content = $newContent
        & $baseCommand @svgSplat                
    
    }
}

