function SVG.oEmbed {
    [inherit('SVG.ForeignObject',Dynamic,Abstract)]
    param(
    # The URL of the content to embed.
    [vbn()]
    [Alias('Url','Uri','YouTubeUri','Href')]
    [uri]
    $EmbedUrl    
    )

    process {
        return if -not $EmbedUrl
        
        if (-not $script:openEmbeddings) {
            $script:openEmbeddings = @(Invoke-RestMethod "https://oembed.com/providers.json").Endpoints.Url -as [uri[]]
        }

        $openEmbeddingProvider = foreach ($openEmbedder in $script:openEmbeddings) {
            if ($openEmbedder.DnsSafeHost -match [Regex]::Escape($EmbedUrl.DnsSafeHost)) {
                $openEmbedder
                break
            }
        }
        
        return if -not $openEmbeddingProvider {
            Write-Warning "The URL provided is not a supported oEmbed URL."
        }

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

        if (-not $script:oEmbedCache) {
            $script:oEmbedCache = @{}
        }

        if (-not $script:oEmbedCache[$EmbedUrl]) {
            $script:oEmbedCache[$EmbedUrl] = 
                Invoke-RestMethod "$($openEmbeddingProvider)?url=$([Web.HttpUtility]::UrlEncode($EmbedUrl))" -Method Get
        }

        $htmlAsXml = $script:oEmbedCache[$EmbedUrl].Html -as [xml]
        if (-not $htmlAsXml -and $script:oEmbedCache[$EmbedUrl].html) {
            # If the HTML is not valid XML, we need to fix it.
                        
            # Try to fix the HTML by adding quotes around a closing attributes and escaping semicolons.
            $htmlAsXml = $script:oEmbedCache[$EmbedUrl].Html -replace '(?<=\w)[^''"]>', '="true">' -replace ';','&semi;' -as [xml]            
        }

        if (-not $svgSplat['Width']) { $svgSplat.Add('Width', '100%') }
        if (-not $svgSplat['Height']) { $svgSplat.Add('Height', '100%') }

        if (-not $htmlAsXml -and $script:oEmbedCache[$EmbedUrl].thumbnail_url) {
            # If the HTML is still not valid XML, we'll just use the thumbnail.            
            return (
                SVG.a -Href $EmbedUrl -Content @(
                    SVG.image -Href $script:oEmbedCache[$EmbedUrl].thumbnail_url -Width $svgSplat['Width'] -Height $svgSplat['Height']
                )
            )             
        }

        if (-not $htmlAsXml -and $script:oEmbedCache[$EmbedUrl].url) {
            # If the HTML is still not valid XML, we'll just use the thumbnail.
            
            if ($script:oEmbedCache[$EmbedUrl].url -match '\.(?>gif|jpe?g|a?png|svg)$') {
                return (
                    SVG.a -Href $EmbedUrl -Content @(
                        SVG.image -Href $script:oEmbedCache[$EmbedUrl].url -Width $svgSplat['Width'] -Height $svgSplat['Height']
                    )
                )
            } elseif ($script:oEmbedCache[$EmbedUrl].title) {
                return (
                    SVG.a -Href $EmbedUrl -Content @(
                        SVG.text -Content $script:oEmbedCache[$EmbedUrl].title -X 50% -Y 50% -TextAnchor middle -DominantBaseline middle
                    )
                )
            }
            
        }


        $svgSplat['Content'] = ("<xhtml xmlns='http://www.w3.org/1999/xhtml'>$($htmlAsXml.OuterXml)</xhtml>")
        
        & $baseCommand @svgSplat
    }
}
