function Write-SVG
{
    <#
    .SYNOPSIS
        Writes a SVG element
    .DESCRIPTION
        Writes a Scalable Vector Graphics element.
    .Notes
        While this function can be used directly, it is designed to be the core function that other SVG creation functions call.
    #>
    param(
    # The name of the SVG element.
    [Parameter(Mandatory)]
    [string]
    $ElementName,

    # A dictionary of attributes.
    [Parameter(ValueFromPipelineByPropertyName)]
    [Collections.IDictionary]
    $Attribute = [Ordered]@{},

    # A dictionary of data.
    [Parameter(ValueFromPipelineByPropertyName)]
    [Collections.IDictionary]
    $Data = [Ordered]@{},

    # An object containing content.
    # If this content is XML, it will be added as a child element.    
    [Parameter(ValueFromPipelineByPropertyName)]
    [PSObject]
    $Content,

    # One or more child elements.  These will be treated as if they were content.
    [Parameter(ValueFromPipelineByPropertyName)]
    [Alias('Child')]
    $Children,

    # A comment that will appear before the element.  
    [Parameter(ValueFromPipelineByPropertyName)]
    [Alias('Comments')]
    [string]
    $Comment,

    # A dictionary or object containing event handlers.
    # Each key or property name will be the name of the event
    # Each value will be the handler.
    [Parameter(ValueFromPipelineByPropertyName)]
    $On,

    # An output path.
    [Parameter(ValueFromPipelineByPropertyName)]
    [string]
    $OutputPath   
    )

    begin {
        $myCmd = $MyInvocation.MyCommand
        ${?<CamelCaseSpace>} = [Regex]::new('(?<CamelCaseSpace>(?<=[a-z])(?=[A-Z]))')
    }

    process {        
        # Determine what command we're using to create the elements.
        $elementCmd = $ExecutionContext.SessionState.InvokeCommand.GetCommand("SVG.$elementName", 'Function')

        $myParams = [Ordered]@{} + $PSBoundParameters

        # If -Style was passed (and was not a string)
        if ($Attribute['Style'] -and $Attribute['Style'] -isnot [string]) {
            # Turn dictionaries into simple CSS,
            if ($Attribute['Style'] -is [Collections.IDictionary]) {
                $Attribute['Style'] =
                    @(foreach ($kv in $Attribute['Style'].GetEnumerator()) {
                        "$($kv.Key):$($kv.Value)"
                    }) -join ';'
            }
            else {
                # and do the same for other PSObjects.
                $Attribute['Style'] = @(foreach ($prop in $Attribute['Style'].psobject.properties) {
                    "$($prop.Name):$($kv.Value)"
                }) -join ';'
            }
        }        

        # Keep track of which attributes are bound.
        $boundAttributes = @()
        
        # Start creating a tag for our element.
        $elementText = "<$elementName "
        # Next, walk over the attributes of the command
        :nextParameter foreach ($kv in $Attribute.GetEnumerator()) {
            # skip any parameters from Write-SVG.
            if ($myCmd.Parameters[$kv.Key]) { continue }
            $paramValue = $kv.Value
            $paramName  = $kv.Key
            # The only attribute we treat that specially is -Viewbox.
            if ($paramName -eq 'Viewbox') {
                # For that, we basically pad out whatever list was provided to make four coordinates.
                $viewBoxLeft, $viewBoxTop, $viewBoxRight, $viewBoxBottom = $paramValue -as [double[]]
                $paramValue = @(if ($null -eq $viewBoxTop) {                    
                    0,0,$viewBoxLeft,$viewBoxLeft                    
                } elseif ($null -eq $viewBoxRight) {
                    0,0,$viewBoxLeft,$viewBoxTop
                } elseif ($null -eq $viewBoxBottom) {
                    $viewBoxLeft, $viewBoxTop, $viewBoxRight, $viewBoxTop
                } else {
                    $viewBoxLeft, $viewBoxTop, $viewBoxRight, $viewBoxBottom
                })
            }

            # For timespan values, we want to use the total number of seconds
            if ($paramValue -is [timespan]) {
                $paramValue = "$($paramValue.TotalSeconds)s"
            }

            # If the parameter value was a script block, run it.
            if ($paramValue -is [scriptblock]) {
                if ($null -ne $content) { # (if we had -Content, set $_ first)
                    $this = $_ = $psItem = $content
                    $scriptOut = . ([ScriptBlock]::Create($paramValue))
                    $paramValue = $scriptOut
                } else {
                    $paramValue = . ([ScriptBlock]::Create($paramValue))
                }                
            }

            # Now we refer to the element command and find the actual name of the attribute.
            foreach ($attr in $elementCmd.Parameters[$kv.Key].Attributes) {                
                if ($attr.Key -eq 'SVG.AttributeName') {
                    
                    if ($inputObject -and $inputObject.psobject.properties[$attr.Key]) {
                        $inputObject.psobject.properties.Remove($attr.Key)
                    }
                    # and append it to the XML.
                    $boundAttributes += $paramName
                    $elementText += "$($attr.Value)='$([Web.HttpUtility]::HtmlAttributeEncode($paramValue))' "
                    continue nextParameter
                }
            }
            
            $elementText += "$($kv.Key)='$([Web.HttpUtility]::HtmlAttributeEncode($kv.Value))' "
        }

        if ($data -and $data.Count) {
            if ($content.Data) { $boundAttributes += "data"}
            foreach ($kv in $data.GetEnumerator()) {
                $dataKey = ${?<CamelCaseSpace>}.Replace($kv.Key, '-').Replace('_','-')
                $dataKey = "data-$($dataKey.ToLower())"
                $dataValue = [Web.HttpUtility]::HtmlAttributeEncode($kv.Value)
                $elementText += "$dataKey='$dataValue' "
            }
        }

        if ($On) {
            if ($content.Data) { $boundAttributes += "on"}
            $eventNames = @(
                if ($on -is [Collections.IDictionary]) {
                    $on.Keys    
                } else {
                    $on.psobject.properties.name
                }
            )
            foreach ($eventName in $eventNames) {
                $svgEventName = $eventName -replace '^On' -replace '^[_-]'
                $eventValue   = if ($on -is [Collections.IDictionary]) {
                    $on[$eventName]
                } else {
                    $on.$eventName
                }
                $elementText +=
                    "on" + $svgEventName.ToLower() + "=`"" + $(
                        [Web.HttpUtility]::HtmlAttributeEncode($eventValue)
                    ) + '" '
            }
        }

        if ($elementName -eq 'svg') {
            $elementText += 'xmlns:xlink="http://www.w3.org/1999/xlink" xmlns="http://www.w3.org/2000/svg"'
        }

        $elementText = $elementText -replace '\s{0,1}$'

        if (
            # If there is no content
            (-not $content) -or 
            # or the content is an int
            ($content -is [int]) -or            
            # or the content is a custom object (but not XML or string or array).
            ($content -is [PSCustomObject] -and 
                -not ($content -as [xml]) -and 
                -not ($content -is [string]) -and
                -not ($content -is [array]) -and
                -not ($content -is [Xml.XmlElement])
            )
        ) {
            # If there were children
            if ($children) {
                # close the opening tag.
                $elementText += ">"
                # and the animation
                $elementText += $(@(foreach ($child in $children) {
                    if ($child.OuterXml) {
                        $child.OuterXml
                    } 
                    elseif ($child -is [scriptblock]) {
                        $scriptOut = if ($null -ne $content) { # (if we had -Content, set $_ first)
                            $this = $_ = $psItem = $content
                            . ([ScriptBlock]::Create($child))                            
                        } else {
                            . ([ScriptBlock]::Create($child))
                        }
                        foreach ($scriptOutput in $scriptOut) {
                            if ($scriptOutput.OuterXml) {
                                $scriptOutput.OuterXml
                            } else {
                                [Security.SecurityElement]::Escape("$scriptOutput")
                            }
                        }
                    }
                    else {
                        [Security.SecurityElement]::Escape("$child")
                    }                    
                }) -join ([Environment]::NewLine))

                # and close the tag.
                $elementText += "</$elementName>"
            } else {
                # ignore -Content and close the element.
                $elementText += " />"
            }

            
        } else {
            $isCData = $false
            foreach ($attr in $elementCmd.Parameters.Content.Attributes) {
                if ($attr.Key -eq 'SVG.IsCData' -and $attr.Value -eq 'true') {
                    $isCData = $true
                }
            }

            $elementText += ">"
            # If there were children,
            if ($children) {
                # then children first.
                $elementText += $(@(foreach ($child in $children) {
                    if ($child.Comment) {
                        "<!-- $($child.Comment) -->"
                    }
                    if ($child.OuterXml) {
                        $child.OuterXml
                    } else {
                        [Security.SecurityElement]::Escape("$child")
                    }                    
                }) -join ([Environment]::NewLine))
            }            
            $elementText +=
                foreach ($pieceOfContent in $Content) {
                    if ($pieceOfContent.Comment) {
                        "<!-- $($pieceOfContent.Comment) -->"
                    }
                    if ($isCData -and -not 
                        ($pieceOfContent -as [xml.xmlelement]) -and 
                        ($pieceOfContent -notmatch '^\s{0,}\<')
                    ) {
                        [Security.SecurityElement]::Escape("$pieceOfContent")
                    }
                    elseif ($pieceOfContent.Outerxml) {
                        $pieceOfContent.Outerxml
                    }
                    else {
                        "$pieceOfContent"
                    }
                }
            $elementText += "</$elementName>"                    
        }

        $elementXml = $elementText -as [xml]

        # If we have not provided a comment and the element is SVG
        if ((-not $myParams.Comment) -and ($ElementName -eq 'svg')) {
            $Comment = "<!-- Generated with PSSVG $((Get-Module PSSVG).Version) -->"
        }

        if ($elementXml -and $Comment) {
            $elementXml = "<!-- $comment -->$elementText" -as [xml]
        }
        $svgOutput  =         
            if ($elementXml -and ($null -ne $elementXml.$ElementName)) {                
                $o = $elementXml.$ElementName
                if ($o -is [string]) {
                    $o = $elementXml
                }
                if ($comment) {
                    Add-Member -InputObject $o NoteProperty Comment $comment -Force
                }
                $o.pstypenames.clear()
                $o.pstypenames.add('SVG.Element')
                $o                
            } else {
                $elementText
            }

        
        if ($myParams['OutputPath']) {
            $unresolvedOutput = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($OutputPath)
            if ($unresolvedOutput -and $svgOutput.ParentNode.Save) {
                $svgOutput.ParentNode.PreserveWhitespace = $true
                $memoryStream = [io.memorystream]::new()
                $streamWriter = [io.streamWriter]::new($memoryStream)
                $writerSettings = [Xml.XmlWriterSettings]::new()
                $writerSettings.Encoding = [Text.Encoding]::UTF8
                $writerSettings.Indent = $true                
                $writer = [Xml.XmlWriter]::Create($streamWriter, $writerSettings)                
                $svgOutput.ParentNode.Save($writer)                
                [Text.Encoding]::UTF8.GetString($memoryStream.ToArray()) | 
                    Set-Content -Path $OutputPath -Encoding UTF8
                $writer.Dispose()
                $streamWriter.Dispose()
                $memoryStream.Dispose()
                Get-Item $OutputPath
            } elseif ($unresolvedOutput -and $svgOutput) {
                $svgOutput | Set-Content -Path $OutputPath
                Get-Item $OutputPath
            }
        } else {
            $svgOutput
        }
    }
}
