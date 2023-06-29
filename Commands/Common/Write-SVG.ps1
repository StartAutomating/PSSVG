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

    # A dictionary of content.
    [Parameter(ValueFromPipelineByPropertyName)]
    [PSObject]
    $Content,

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
        $elementCmd = $ExecutionContext.SessionState.InvokeCommand.GetCommand("SVG.$elementName", 'Function')

        if ($Attribute['Style'] -and $Attribute['Style'] -isnot [string]) {
            if ($Attribute['Style'] -is [Collections.IDictionary]) {
                $Attribute['Style'] =
                    @(foreach ($kv in $Attribute['Style'].GetEnumerator()) {
                        "$($kv.Key):$($kv.Value)"
                    }) -join ';'
            }
            else {
                $Attribute['Style'] = @(foreach ($prop in $Attribute['Style'].psobject.properties) {
                    "$($prop.Name):$($kv.Value)"
                }) -join ';'
            }
        }        

        $elementText = "<$elementName "
        :nextParameter foreach ($kv in $Attribute.GetEnumerator()) {
            if ($myCmd.Parameters[$kv.Key]) { continue }
            $paramValue = $kv.Value
            $paramName  = $kv.Key
            if ($paramName -eq 'Viewbox') {
                $viewBoxLeft, $viewBoxTop, $viewBoxRight, $viewBoxBottom = $paramValue -as [double[]]
                $paramValue = @(if (-not $viewBoxTop) {
                    if ($viewBoxLeft -lt 0) {
                        $viewBoxLeft;$viewBoxLeft;$viewBoxLeft*-1;$viewBoxLeft*-1;
                    } else {
                        0,0,$viewBoxLeft,$viewBoxLeft
                    }
                } elseif (-not $viewBoxRight) {
                    0,0,$viewBoxLeft,$viewBoxTop                    
                } elseif (-not $viewBoxBottom) {
                    $viewBoxLeft, $viewBoxTop, $viewBoxRight, $viewBoxTop
                } else {
                    $viewBoxLeft, $viewBoxTop, $viewBoxRight, $viewBoxBottom
                })
            }

            if ($paramValue -is [timespan]) {
                $paramValue = "$($paramValue.TotalSeconds)s"
            }
            foreach ($attr in $elementCmd.Parameters[$kv.Key].Attributes) {                
                if ($attr.Key -eq 'SVG.AttributeName') {
                    if ($inputObject -and $inputObject.psobject.properties[$attr.Key]) {
                        $inputObject.psobject.properties.Remove($attr.Key)
                    }
                    $elementText += "$($attr.Value)='$([Web.HttpUtility]::HtmlAttributeEncode($paramValue))' "
                    continue nextParameter
                }
            }
            $elementText += "$($kv.Key)='$([Web.HttpUtility]::HtmlAttributeEncode($kv.Value))' "
        }

        if ($data -and $data.Count) {
            foreach ($kv in $data.GetEnumerator()) {
                $dataKey = ${?<CamelCaseSpace>}.Replace($kv.Key, '-').Replace('_','-')
                $dataKey = "data-$($dataKey.ToLower())"
                $dataValue = [Web.HttpUtility]::HtmlAttributeEncode($kv.Value)
                $elementText += "$dataKey='$dataValue' "
            }
        }

        if ($On) {
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

        if (-not $content) {
            $elementText += " />"
        } else {
            $isCData = $false
            foreach ($attr in $elementCmd.Parameters.Content.Attributes) {
                if ($attr.Key -eq 'SVG.IsCData' -and $attr.Value -eq 'true') {
                    $isCData = $true
                }
            }            

            $elementText += ">"            
            $elementText +=
                foreach ($pieceOfContent in $Content) {
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
        $svgOutput  =         
            if ($elementXml -and $elementXml.$ElementName) {
                $o = $elementXml.$ElementName
                if ($o -is [string]) {
                    $o = $elementXml
                }
                $o.pstypenames.clear()
                $o.pstypenames.add('SVG.Element')
                $o                
            } else {
                $elementText
            }

        $myParams = @{} + $PSBoundParameters
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
