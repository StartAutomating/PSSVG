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
    # The name of the SVG element/
    [Parameter(Mandatory)]
    [string]
    $ElementName,

    # A dictionary of attributes.
    [Parameter(ValueFromPipelineByPropertyName)]
    [Collections.IDictionary]
    $Attribute = @{},

    # A dictionary of data.
    [Parameter(ValueFromPipelineByPropertyName)]
    [Collections.IDictionary]
    $Data = @{},

    # A dictionary of content.
    [Parameter(ValueFromPipelineByPropertyName)]
    [PSObject]
    $Content,

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
            foreach ($attr in $elementCmd.Parameters[$kv.Key].Attributes) {
                
                if ($attr.Key -eq 'SVG.AttributeName') {
                    if ($inputObject -and $inputObject.psobject.properties[$attr.Key]) {
                        $inputObject.psobject.properties.Remove($attr.Key)
                    }
                    $elementText += "$($attr.Value)='$([Web.HttpUtility]::HtmlAttributeEncode($kv.Value))' "
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
            if ($isCData) {
                $escapedContent = [Security.SecurityElement]::Escape("$content")
                $elementText += ">" + "$escapedContent" + "</$elementName>"
            } else {
                $elementText += ">" + "$Content" + "</$elementName>"
            }                    
        }

        if ($OutputPath) {
            $elementText | Set-Content -Path $OutputPath
            Get-Item $OutputPath
        } else {        
            $elementText
        }
    }
}
