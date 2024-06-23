function SVG.oEmbed {
    <#
    .SYNOPSIS
        Embeds content with oEmbed.
    .DESCRIPTION
        Embeds content in SVG from any oEmbed site.
    .EXAMPLE
        SVG.oEmbed -EmbedUrl https://giphy.com/gifs/community-donald-glover-handshake-Yggr0uQUbA79C
    .LINK
        https://oembed.com/
    #>
    [inherit('SVG',Dynamic,Abstract)]
    param(
    # The URL of the content to embed.
    [vbn()]
    [Alias('Url','Uri','Href','EmbedUri')]
    [uri]
    $EmbedUrl    
    )

    begin {
        if (-not $script:openEmbeddings) {
            $script:openEmbeddings = @(Invoke-RestMethod "https://oembed.com/providers.json").Endpoints.Url -as [uri[]]
        }
        $svgForeignObject = $ExecutionContext.SessionState.InvokeCommand.GetCommand('SVG.foreignObject', 'Function')

        filter oEmbedContent {
            $oEmbedInfo = $script:oEmbedCache[$EmbedUrl]
            # Sometimes oEmbed returns XML, sometimes it returns JSON.  We need to handle both.
            if ($oEmbedInfo -is [xml] -and $oEmbedInfo.oEmbed) {
                $oEmbedInfo = $oEmbedInfo.oEmbed # (this is pretty easy, just set the variable to the oEmbed node)
            }

            $htmlAsXml = $oEmbedInfo.Html -as [xml]
            if (-not $htmlAsXml -and $oEmbedInfo.html) {
                # If the HTML is not valid XML, we need to fix it.
                            
                # Try to fix the HTML by adding quotes around a closing attributes and escaping semicolons.
                $htmlAsXml = $oEmbedInfo.Html -replace '(?<=\w)[^''"]>', '="true">' -replace ';','&semi;' -as [xml]
            }

            if ($htmlAsXml -is [xml]) {
                return SVG.foreignObject @svgForeignSplat -Content ("<xhtml xmlns='http://www.w3.org/1999/xhtml'>$($htmlAsXml.OuterXml)</xhtml>")
            }
            
            $altAtribute = [Ordered]@{}
            if ($oEmbedInfo.title) {
                $altAtribute['alt'] = $oEmbedInfo.title
            }
    
            # There is some disagreement in implementations on the name of the thumbnail URL.
            if ($oEmbedInfo.thumbnail_url -or $oEmbedInfo.'thumbnail-url') {
                # just pick the first one if either are found.
                $thumbUrl = @($oEmbedInfo.thumbnail_url,$oEmbedInfo.'thumbnail-url' -ne $null)[0]
                # If the HTML is still not valid XML, we'll just use the thumbnail.                        
                return SVG.a -Href $EmbedUrl -Attribute $altAtribute -Content @(
                    SVG.image -Href $thumbUrl -Width $svgSplat['Width'] -Height $svgSplat['Height'] -Attribute $altAtribute
                )        
            }
    
            # If there is no thumbnail, we'll just use the URL.
            if ($oEmbedInfo.url) {                
                # If the URL is an image, we'll just use the image.
                if ($oEmbedInfo.url -match '\.(?>gif|jpe?g|a?png|svg)$') {                
                    return SVG.a -Href $EmbedUrl -Attribute $altAtribute -Content @(
                        SVG.image -Href $oEmbedInfo.url  -Width $svgSplat['Width'] -Height $svgSplat['Height'] -Attribute $altAtribute
                    )                
                }
                
                # If the URL is not an image, we'll just use the title.
                if ($oEmbedInfo.title) {                
                    return SVG.a -Href $EmbedUrl -Attribute $altAtribute -Content @(
                        SVG.text -Content $oEmbedInfo.title -X 50% -Y 50% -TextAnchor middle -DominantBaseline middle
                    )            
                }
            }
        }
    }

    process {
        return if -not $EmbedUrl
        
        if (-not $PSBoundParameters['Width']) { $PSBoundParameters.Add('Width', '100%') }
        if (-not $PSBoundParameters['Height']) { $PSBoundParameters.Add('Height', '100%') }
        # Copy the parameters into two splats
        $svgSplat = [Ordered]@{} + $PSBoundParameters
        $svgForeignSplat = [Ordered]@{} + $PSBoundParameters
        
        # and strip off any parameters that are not applicable to the base command        
        $svgCmd = $baseCommand
        foreach ($parameterName in @($svgSplat.Keys)) {
            if (-not $svgForeignObject.Parameters[$parameterName]) {
                $svgForeignSplat.Remove($parameterName)
            }
            if (-not $svgCmd.Parameters[$parameterName]) {
                $svgSplat.Remove($parameterName)
            }
            if ($svgForeignSplat[$parameterName]) {
                $svgSplat.Remove($parameterName)
            }
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
    
        $svgSplat['Content'] =  @(
            if ($script:oEmbedCache[$EmbedUrl].title) {
                SVG.title -Content ([Security.SecurityElement]::Escape($script:oEmbedCache[$EmbedUrl].title))
            }
            $script:oEmbedCache[$EmbedUrl] | oEmbedContent
        )
        
        & $baseCommand @svgSplat
    }
}
