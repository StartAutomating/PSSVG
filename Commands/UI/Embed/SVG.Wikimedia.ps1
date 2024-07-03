[ValidatePattern('SVG\.Wiki[mp]edia')]
param()
function SVG.Wikimedia {
    <#
    
    .SYNOPSIS    
        Embeds an image from Wikimedia Commons.    
    .DESCRIPTION    
        Embeds an image from Wikimedia Commons, or from a Wikipedia page.    
    .EXAMPLE    
        SVG.Wikimedia -WikimediaUrl "https://en.wikipedia.org/wiki/Gallery_of_sovereign_state_flags" -Title "Ukraine" -OutputPath .\Flag_Ukraine.svg -Inline    
    
    #>
        
    param(
    # The URL of the Wikimedia or Wikipedia page.    
    [Parameter(ValueFromPipelineByPropertyName)]
    [Alias('Url','Uri','Href','EmbedUri')]
    [uri]
    $WikimediaUrl,

    # The alt text of the image that identifies it.    
    [Parameter(ValueFromPipelineByPropertyName)]
    [Alias('Alternative','Alt')]
    [string]
    $Title,

    # If set, will embed the image inline (provided it is SVG).    
    [Parameter(ValueFromPipelineByPropertyName)]
    [switch]
    $Inline
    )
    dynamicParam {
    $baseCommand = 
        if (-not $script:SVG) {
            $script:SVG = 
                $executionContext.SessionState.InvokeCommand.GetCommand('SVG','Alias')
            $script:SVG
        } else {
            $script:SVG
        }
    $IncludeParameter = @()
    $ExcludeParameter = @()


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
        begin {
        $svgImage = $ExecutionContext.SessionState.InvokeCommand.GetCommand('SVG.image', 'Function')
    
    }
        process {
        if (-not $WikimediaUrl) { return }
        
        if (-not $PSBoundParameters['Width']) { $PSBoundParameters.Add('Width', '100%') }
        if (-not $PSBoundParameters['Height']) { $PSBoundParameters.Add('Height', '100%') }
        # Copy the parameters into two splats
        $svgSplat = [Ordered]@{} + $PSBoundParameters
        $svgImageSplat = [Ordered]@{} + $PSBoundParameters
        
        # and strip off any parameters that are not applicable to the base command        
        $svgCmd = $baseCommand
        foreach ($parameterName in @($svgSplat.Keys)) {
            if (-not $svgImage.Parameters[$parameterName]) {
                $svgImageSplat.Remove($parameterName)
            }
            if (-not $svgCmd.Parameters[$parameterName]) {
                $svgSplat.Remove($parameterName)
            }
            if ($svgImageSplat[$parameterName]) {
                $svgSplat.Remove($parameterName)
            }
        }                
        
        if ($WikimediaUrl.DnsSafeHost -notmatch 'wiki(media|pedia)\.org$') { return 
                    Write-Warning "Not a valid Wikimedia URL."
                }

        if (-not $script:wikiMediaCache) {
            $script:wikiMediaCache = [Ordered]@{}
        }
        if (-not $script:wikiMediaCache[$WikimediaUrl]) {
            $wikiMediaInfo = Invoke-WebRequest -Uri $WikimediaUrl
            $script:wikiMediaCache[$WikimediaUrl] = $wikiMediaInfo
        }

        $foundImage = $null
        foreach ($wikiMediaImage in $script:wikiMediaCache[$WikimediaUrl].images) {
            if ($wikiMediaImage.alt -eq $Title -or (
                $Title -as [regex] -and 
                $wikiMediaInfo.alt -match $Title
            )) {
                $foundImage = $wikiMediaImage                            
                break
            }
        }

        $foundImageUrl = $foundImage.src

        if (-not $foundImage) {
            Write-Warning "No image found with the title '$Title'."
            return
        }

        if ($foundImageUrl -match '\.svg\.w+$') {
            $foundImageUrl = $foundImageUrl -replace '\.svg\.w+$', '.svg'
        }
        if ($foundImageUrl -match '/\d+px[^/]+$') {
            $foundImageUrl = $foundImageUrl -replace '/\d+px[^/]+$'
        }
        if ($foundImageUrl -match '/thumb/') {
            $foundImageUrl = $foundImageUrl -replace '/thumb/', '/'
        }
        if ($foundImageUrl -match '^//upload\.wikimedia\.org/') {
            $foundImageUrl = "https:$foundImageUrl"
        }
        $svgImageSplat['Href'] = $foundImageUrl

        # Copy the splat to SVG
        $svgSplat = [Ordered]@{} + $PSBoundParameters
        # and strip off any parameters that are not from the base command.
        $svgCmd = $baseCommand
        foreach ($parameterName in @($svgSplat.Keys)) {
            if (-not $svgCmd.Parameters[$parameterName]) {
                $svgSplat.Remove($parameterName)
            }
        }
        # The -Style parameter needs to become it's own element to be properly applied.
        $svgSplat.Remove("Style")

        if (-not $svgImageSplat.'PreserveAspectRatio') {
            $svgImageSplat.Add('PreserveAspectRatio', 'xMidYMid meet')            
        }
        

        $svgSplat['Content'] =  @(            
            SVG.title -Content ([Security.SecurityElement]::Escape($foundImage.alt))
            if ($inline -and $foundImageUrl -match '\.svg$') {
                if (-not $script:inlineSvgCache) {
                    $script:inlineSvgCache = [Ordered]@{}
                }
                if (-not $script:inlineSvgCache[$foundImageUrl]) {
                    $svgContent = Invoke-RestMethod -Uri $foundImageUrl                                        
                    $script:inlineSvgCache[$foundImageUrl] = $svgContent
                }
                <#if ($svgImageSplat.PreserveAspectRatio -and -not $script:inlineSvgCache[$foundImageUrl].preserveAspectRatio) {
                    $script:inlineSvgCache[$foundImageUrl].svg.setAttribute('preserveAspectRatio', $svgImageSplat.PreserveAspectRatio)
                }#>
                $script:inlineSvgCache[$foundImageUrl].OuterXml -replace '<\?xml.*\?>'
            } else {
                SVG.image @svgImageSplat -Href $foundImageUrl
            }            
        )
        
        & $baseCommand @svgSplat
    
    }
}

