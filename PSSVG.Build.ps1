<#
.SYNOPSIS
    Generates PSSVG
.DESCRIPTION
    Generates PSSVG, a module for creating svg images with PowerShell.

    PSSVG allows you to create Scalable Vector Graphics using PowerShell commands.

    To make these commands, we will read the Markdown source for the Mozilla Developer Network's documentation on SVG.
.NOTES
    This script should build several scripts, each of which correlate to a given element.  Deprecated elements will be skipped.

    Most elements have a partial list of attributes followed by a series of common attribute groups.

    As such, we have to do a few fairly complex things here:

    1. Get the list of all elements
    2. Get the list of all attributes (and all of their metadata)
    3. Get the defined attribute groups
    4. Parse the documentation for each element
    5. Expand out the grouped attributes defined for each element
    6. Take the combined content and generate a function

    This script uses Irregular to assist in the first several steps.
    It then uses PipeScript to create the final function.
.LINK
    https://github.com/mdn/content/blob/main/LICENSE.md
#>


foreach ($moduleRequirement in 'Irregular','PipeScript','PSDevOps','ugit') {
    $requireLatest = $false
    $ModuleLoader  = $null
    # If the module requirement was a string
    if ($moduleRequirement -is [string]) {
        # see if it's already loaded
        $foundModuleRequirement = Get-Module $moduleRequirement
        if (-not $foundModuleRequirement) {
            # If it wasn't,
            $foundModuleRequirement = try { # try loading it
                Import-Module -Name $moduleRequirement -PassThru -Global -ErrorAction SilentlyContinue 
            } catch {                
                $null
            }
        }
        # If we found a version but require the latest version,
        if ($foundModuleRequirement -and $requireLatest) {
            # then find if there is a more recent version.
            Write-Verbose "Searching for a more recent version of $($foundModuleRequirement.Name)@$($foundModuleRequirement.Version)"
            if (-not $script:FoundModuleVersions) {
                $script:FoundModuleVersions = @{}
            }
            if (-not $script:FoundModuleVersions[$foundModuleRequirement.Name]) {
                $script:FoundModuleVersions[$foundModuleRequirement.Name] = Find-Module -Name $foundModuleRequirement.Name            
            }
            $foundModuleInGallery = $script:FoundModuleVersions[$foundModuleRequirement.Name]
            if ($foundModuleInGallery -and 
                ([Version]$foundModuleInGallery.Version -gt [Version]$foundModuleRequirement.Version)) {
                Write-Verbose "$($foundModuleInGallery.Name)@$($foundModuleInGallery.Version)"
                # If there was a more recent version, unload the one we already have
                $foundModuleRequirement | Remove-Module # Unload the existing module
                $foundModuleRequirement = $null
            } else {
                Write-Verbose "$($foundModuleRequirement.Name)@$($foundModuleRequirement.Version) is the latest"
            }
        }
        # If we have no found the required module at this point
        if (-not $foundModuleRequirement) {
            if ($moduleLoader) { # load it using a -ModuleLoader (if provided)
                $foundModuleRequirement = . $moduleLoader $moduleRequirement
            } else {
                # or install it from the gallery.
                Install-Module -Name $moduleRequirement -Scope CurrentUser -Force -AllowClobber
                if ($?) {
                    # Provided the installation worked, try importing it
                    $foundModuleRequirement =
                        Import-Module -Name $moduleRequirement -PassThru -Global -ErrorAction SilentlyContinue
                }
            }
        } else {
            $foundModuleRequirement
        }
    }
}
     

# Initialize some collections for us to use:

# * The SVGCommonAttributes
if (-not $svgCommonAttributes) {
    $svgCommonAttributes = [Ordered]@{}    
}

# * Any SavedMarkdown files (so we can save time and bandwidth)
if (-not $savedMarkdown) {
    $savedMarkdown = [Ordered]@{}
}

# * If any markdown was not found (to avoid repeated failure)
if (-not $markdownNotFound) {
    $markdownNotFound = [Ordered]@{}
}

# * The combined metadata about each element
if (-not $svgElementData) {
    $svgElementData = [Ordered]@{}
}

# If we had a GITHUB_TOKEN, use it as $ghp
if ($env:GIT_TOKEN) {
    $ghp = $env:GIT_TOKEN
}

<#if (-not $ghp) {
    Write-Error "Must have defined a GitHub Personal Access Token in `$ghp"
    return
}#>

if ($env:GITHUB_WORKSPACE) {
    git fetch --unshallow
}

$myLastChange = git log -n 1 $MyInvocation.MyCommand.ScriptBlock.File | Select-Object -ExpandProperty CommitDate

$mdnLastChange = $(
    try { Invoke-GitHubRestAPI -Uri https://api.github.com/repos/mdn/content } catch { $null }
).updated_at

$lastFileUpdate = 
    Join-Path $pwd Commands |
    Join-Path -ChildPath 'Standard' |
    Get-ChildItem |
    git log -n 1 |
    Select-Object -ExpandProperty CommitDate |
    Sort-Object -Descending | 
    Select-Object -First 1

if (-not $mdnLastChange) {
    "Could not get MDN last change" | Out-Host
    $mdnLastChange = $lastFileUpdate
}
"LastFileUpdate @ $lastFileUpdate" | Out-Host
"MyLastChange   @ $myLastChange  " | Out-Host
"MDNLastChange  @ $mdnLastChange " | Out-Host
if ($lastFileUpdate -ge $myLastChange -and $lastFileUpdate -ge $mdnLastChange ) {
    "Up to Date" | Out-Host
    Import-Module .\PSSVG.psd1 -Global -Force -PassThru | Out-Host
    if (Test-Path content) {
        Remove-Item -Recurse -Force content
    }
    return
}

git clone https://github.com/mdn/content.git --depth 1 --progress

$mdnContentRoot = Join-Path $pwd content
$mdnContentsRoot = Join-Path $mdnContentRoot 'contents'

# If we don't know the list of elements
if (-not $svgElements) {
    # we can go to the repo and get the JSON.
    $svgData = Join-Path $mdnContentRoot "files" |
        Join-Path -ChildPath jsondata |
        Join-Path -ChildPath SVGData.json |
        Get-Content -Raw -Path { $_ } |
        ConvertFrom-Json    
    $svgElements = $svgData
}

$findSvgElement = [Regex]::new("\{\{SVGElement\(['`"](?<e>[^'`"]+)")
$findSvgAttr = [Regex]::new("\{\{SVGAttr\(['`"](?<a>[^'`"]+)")
$replaceMDNContent = "\{\{\s{0,}(?>$(@('Glossary', 'cssxref', 'domxref', 'HTTPMethod', 'htmlelement','svgelement', 'svgattr','htmlattrxref','cssxref')  -join '|')[^\)]{0,})\(" + 
        '["''](?<s>[^"'']+)["'']\)\s{0,}\}\}'


function ConvertSVGMetadataToParameterAttribute {
    param([Parameter(ValueFromPipeline,Position=0)][string]$EdiValue)
    $hadNumbers = $false
    $hadUri     = $false
    $hadColor   = $false
    $hadUnknown = $false
    $tabCompletionRedundant = $false
    if ($ediValue -notmatch '\|') {
        if ($ediValue -match '\<(?<t>[^\>])>') {
            if ($matches.t -as [type]) {
                "[$($matches.t)]"
            }
        }
        return
    }
    $setDescriptors = @($ediValue -split '\|' -replace '^\s{0,}' -replace '\s{0,}$')
    $validSet = @(foreach ($validValue in $setDescriptors) {
        if ($validValue -as [int] -or $validValue -match 'number') {
            $hadNumbers = $true
        } 
        elseif ($validValue -match 'uri') {
            $hadUri = $true
        }
        elseif ($ediValue -match 'length') {
            $hadNumbers = $true
        }
        elseif ($ediValue -match 'color') {
            $hadColor = $true
        }
        elseif ($ediValue -match '\<.+\>') {
            $hadUnknown = $true
        }
        else {
            $validValue
        }        
    }) -join "','"
    if ($hadNumbers) {
        "[ValidatePattern('(?>$($validSet -split "','" -join '|')|\d+)')]"
    }
    elseif ($hadUri -and $validSet) {
        "[ValidateScript({`$_ -in '$validSet' -or `$_ -as [uri]})]"
    }
    elseif ($hadColor) {
        "[ValidateScript({`$_ -in '$validSet' -or `$_ -match '\#[0-9a-f]{3}' -or `$_ -match '\#[0-9a-f]{6}' -or `$_ -notmatch '\W'})]"
    }
    elseif ($validSet -and -not $hadUnknown -and -not ($validSet -match '\p{P}')) {
        $tabCompletionRedundant = $true
        "[ValidateSet('$validSet')]"
    }
    
    if ($setDescriptors -and -not $tabCompletionRedundant) {        
'[ArgumentCompleter({
    param ( $commandName,$parameterName,$wordToComplete,$commandAst,$fakeBoundParameters )    
' + "
    `$validSet = '$($setDescriptors -replace $replaceMDNContent, '<${s}>' -replace "'", "''" -join "','")'
" + @'   
    if ($wordToComplete) {        
        $toComplete = $wordToComplete -replace "^'" -replace "'$"
        return @($validSet -like "$toComplete*" -replace '^', "'" -replace '$',"'")
    } else {
        return @($validSet -replace '^', "'" -replace '$',"'")
    }
})]
'@
    }
}

function ImportSvgAttribute {
    param(
    [Parameter(ValueFromPipeline,Position=0)]
    [uri]
    $SVGAttributeUri
    )
    $markdownPath = (Join-Path $mdnContentRoot ($SVGAttributeUri.PathAndQuery -replace '.+contents/'))
    $elementOrSetName = $SVGAttributeUri.Segments[-2] -replace '^/' -replace '/$'
    if (-not $savedMarkdown["$SVGAttributeUri"]) {
        $savedMarkdown["$SVGAttributeUri"] = if (Test-Path $markdownPath) {
            Get-Content -Path $markdownPath -Raw
        } else {
            $markdownNotFound["$svgAttributeUri"] = $true
        }
    }
    $elementMarkdown = $savedMarkdown["$SVGAttributeUri"]
    if (-not $elementMarkdown) {
        Write-Verbose "Did not get content for $elementOrSetName"
        return
    }    
    
    $start, $end = 0, 0
    $globalAttrStart, $globalAttrEnd = 0, 0 
    $exampleStart, $exampleEnd = 0, 0
    $svgRefIndex = $elementMarkdown.IndexOf("{{SVGRef}}") 
    $animationAttributeStart, $animationAttributeEnd = 0, 0
    $elementDescription = ''
    $groupedAttributes = @()
    foreach ($heading in $elementMarkdown | ?<Markdown_Heading>) {
        $headingName = $heading.Groups["HeadingName"].Value
        if ($svgRefIndex -ge 0 -and -not $elementDescription -and $heading.Index -ge $svgRefIndex) {
            $svgRefIndex += + "{{SVGRef}}".Length
            $elementDescription = 
                $elementMarkdown.Substring($svgRefIndex, $heading.Index - $svgRefIndex) -replace $replaceMDNContent, '`${s}`' | 
                ?<Markdown_Link> -ReplaceEvaluator {
                    param($match)
                    "[$($match.Groups["Text"])](https://developer.mozilla.org$($match.Groups['Uri']))"
                }                
        }
        if ($headingName -eq 'Example') {
            $exampleStart = $heading.Groups["HeadingName"].Index
            $exampleEnd = $heading.NextMatch().Index
        }
        if ($headingName -eq 'Attributes' -or $headingName -eq 'Specific attributes') {
            $start = $heading.Index
            $end = $heading.NextMatch().Index            
        }
        if ($headingName -match $trailingAttributes -and $attributeGroups[$headingName -replace $trailingAttributes -replace '\s']) {
            $attributeGroupName = $headingName -replace $trailingAttributes -replace '\s'
            $groupedAttributes += [PSCustomObject]@{
                Name  = $attributeGroupName
                Group = $attributeGroups[$attributeGroupName]
            }
        }
        else {
            if ($headingName -eq 'Animation Attributes') {
                $animationAttributeStart =$heading.Index
                $animationAttributeEnd = $heading.NextMatch().Index
            }
            
            if ($heading.Groups["HeadingName"].Value -eq 'Global attributes') {
                $globalAttrStart = $heading.Index
                $globalAttrEnd   = $heading.NextMatch().Index            
            }
        }            
    }
    
    $elementAttributeContent = $elementMarkdown.Substring($start, $end - $start) -replace $replaceMDNContent, '${s}'
    $elementAttributes = $elementAttributeContent | ImportSvgElementAttribute
    $globalAttributes  = @()
    if ($globalAttrStart) {
        $elementGlobalAttributeContent = 
            $elementMarkdown.Substring($globalAttrStart, $globalAttrEnd - $globalAttrStart) -replace $replaceMDNContent, '${s}'
        
        $elementGlobalAttributeContent | 
            ?<Markdown_Link> -extract | 
            Where-Object Text -match $trailingAttributes |             
            ForEach-Object {                
                $attributeGroupName = $_.Text -replace $trailingAttributes -replace '\s' -replace 'Styling', 'Style'
                if ($attributeGroups[$attributeGroupName]) {
                    $groupedAttributes += [PSCustomObject]@{
                        Name  = $attributeGroupName
                        Group = $attributeGroups[$attributeGroupName]
                    }
                }
            }
    }
        
    $allAttributeHelp = [Ordered]@{} + $elementAttributes.Help
    $allAttributeData = [Ordered]@{} + $elementAttributes.Data
    $allAttributeNames = @() + $elementAttributes.AttributeNames
    if ($groupedAttributes) {
        foreach ($attrInGroup in $groupedAttributes.Group) {
            if ($attrMetadata[$attrInGroup]) {
                if (-not $allAttributeData[$attrInGroup]) {
                    $allAttributeData += @{                        
                        $attrInGroup =                         
                            if ($attrMetadata[$attrInGroup].properties -isnot [Object[]]) {
                                $attrMetadata[$attrInGroup].Properties
                            } else {
                                foreach ($ht in $attrMetadata[$attrInGroup].properties) { 
                                    if ($ht.AppliesTo -contains $elementOrSetName) { $ht;break }
                                }
                            }
                    }
                }
                if (-not $allAttributeHelp[$attrInGroup]) {
                    $allAttributeHelp += @{
                        $attrInGroup = $attrMetadata[$attrInGroup].Description
                    }
                }                  
                                
                $allAttributeNames += $attrInGroup
            }
        }
    }
    $elementContentInfo = $svgElements.elements.$elementOrSetName.content           
    [PSCustomObject][Ordered]@{
        Name            = $elementOrSetName
        Description     = $elementDescription
        AttributeNames  = $allAttributeNames
        Help            = $allAttributeHelp
        Data            = $allAttributeData
        Content         = $elementContentInfo
        SourceUri       = $SVGAttributeUri
    }
}

function ImportSvgElementAttribute {
    param(
    [Parameter(Position=0,ValueFromPipeline)]
    [string]
    $elementAttributeContent
    )
    process {
        $elementAttributeLines = $elementAttributeContent -split "(?>\r\n|\n)"
        $attributeName = ''
        
        $attributeLine     = '^-\s'
        $attributeHelpLine = '^\s+-\s\:'
        $attributeDataLine = '^\s+_'
        $quotedString  = [Regex]::new(@'
(?<=["'])[^"']*?(?=["'])
'@, 'IgnoreCase,IgnorePatternWhitespace')
        $attributeHelp = [Ordered]@{}
        $attributeData = [Ordered]@{}
        $attributeNames = @()
        foreach ($elementAttributeLine in $elementAttributeLines) {
            if ($elementAttributeLine -match $attributeLine) {
                $attributeName = $quotedString.Matches($elementAttributeLine) |
                    Select-Object -First 1 |
                    ForEach-Object { $_.ToString()}
                if (-not $attributeName) {
                    $attributeName = $elementAttributeLine -replace $attributeLine
                }
                if ($attributeName){
                    if ($attributeName -match ',' -and $elementAttributeLine -match ':') {
                        $nameList, $description = $elementAttributeLine -replace $attributeLine -split ':', 2
                        $attributeName = @($nameList -split ',' -replace '^\s{0,}' -replace '\s{0,}$')
                        $attributeNames += $attributeName
                        $attributeHelp[$attributeName] = $description
                    } else {
                        $attributeName = @($attributeName -split ' ')[0] -replace '\*' -replace '\:$'
                    
                        $attributeNames += $attributeName
                    }                    
                }
                if ($attrMetadata[$attributeName]) {
                    $attributeData[$attributeName] = 
                        if ($attrMetadata[$attributeName].properties -isnot [Object[]]) {
                            $attrMetadata[$attributeName].Properties
                        } else {
                            foreach ($ht in $attrMetadata[$attributeName].properties) { 
                                if ($ht.AppliesTo -contains $elementOrSetName) { $ht;break }
                            }
                        }                    
                }
            }
            elseif ($attributeName -and $elementAttributeLine -match $attributeHelpLine) {            
                $attributeHelp[$attributeName] = $elementAttributeLine -replace $attributeHelpLine                
            }            
        }
        [PSCustomObject][Ordered]@{
            Help = $attributeHelp
            Data = $attributeData
            AttributeNames = $attributeNames
        }
    }
}

function InitializeSvgAttributeData {
    <#
    if (-not $savedMarkdown[$attributeListUri]) {
        $savedMarkdown[$attributeListUri] = [Text.Encoding]::utf8.getString([Convert]::FromBase64String(
                $(try {
                    Invoke-GitHubRestApi -Uri $attributeListUri -ErrorAction SilentlyContinue -PersonalAccessToken $ghp
                } catch {
                    Write-Warning "$SVGAttributeUri : $_"                
                }).Content
            ))
    }
    #>
    $attributeListUri = "https://api.github.com/repos/mdn/content/contents/files/en-us/web/svg/attribute/index.md"
    $attributeListMarkdown = Join-Path $mdnContentRoot files |
        Join-Path -ChildPath en-us | 
        Join-Path -ChildPath web |
        Join-Path -ChildPath svg |
        Join-Path -ChildPath attribute |
        Join-Path -ChildPath index.md |
        Get-Content -Raw -Path { $_ }
    $savedMarkdown[$attributeListUri] = $attributeListMarkdown
    $headingList         = @($attributeListMarkdown | ?<Markdown_Heading> -Split -IncludeMatch)
    $attributeGroups     = [Ordered]@{}
    $attributeGroupsText = [Ordered]@{}
    $trailingAttributes  = '\s{0,}attributes\s{0,}$'
    for ($hln = 0; $hln -lt $headingList.Count; $hln++) {
        if ($headingList[$hln] -match $trailingAttributes) {
            $attributeGroupName = ($headingList[$hln] -replace '^[\s\r\n]{0,}\#{0,}' -replace $trailingAttributes).Trim()
            $attributeGroupContent = $headingList[$hln + 1]    
            $attributeGroups[$attributeGroupName] = @(foreach ($attrMatch in $findSvgAttr.Matches($attributeGroupContent)) {            
                $attrMatch.Groups["a"].Value
            })
            $attributeGroupsText[$attributeGroupName] = $attributeGroupContent
        }
    }
    foreach ($groupWithSubGroups in 'Generic', 'Animation') {
        $genericGroupsText = $attributeGroupsText.$groupWithSubGroups
        $genericGroupsList = @($genericGroupsText | ?<Markdown_List> -Split -IncludeMatch)
        for ($genericIndex = 0; $genericIndex -lt $genericGroupsList.Length; $genericIndex++) {
            if ($genericGroupsList[$genericIndex] -match $trailingAttributes) {
                $attributeGroupName = ($genericGroupsList[$genericIndex] -replace '^[\s-]+' -replace $trailingAttributes -replace '\s')            
                
                for ($endGenericIndex = $genericIndex + 1; $endGenericIndex -lt $genericGroupsList.Length; $endGenericIndex++) {
                    if ($genericGroupsList[$endGenericIndex] -match $trailingAttributes) {
                        $endGenericIndex--
                        break
                    }
                }
                $attributeGroups[$attributeGroupName] =
                    @(foreach ($attrMatch in $findSvgAttr.Matches("$($genericGroupsList[$genericIndex..$endGenericIndex])")) {            
                        $attrMatch.Groups["a"].Value
                    })
            }
        }
    }
    
    $attrsFound = [Ordered]@{}
    foreach ($match in $findSvgAttr.Matches($savedMarkdown[$attributeListUri])) {
        $attrName = $match.Groups["a"].Value
        if (-not $attrsFound[$attrName]) {
            $attrUriPart = $attrName.ToLower() -replace '\:', '_colon_'
            
            $attrsFound[$attrName] = 
                Join-Path $mdnContentRoot -ChildPath files |
                Join-Path -ChildPath en-us |
                Join-Path -ChildPath web |
                Join-Path -ChildPath svg |
                Join-Path -ChildPath attribute |
                Join-Path -ChildPath $attrUriPart |
                Join-Path -ChildPath index.md
        }    
    }
    
    $findSvgElement = [Regex]::new("\{\{SVGElement\(['`"](?<e>[^'`"]+)")
    $attrMetadata   = [Ordered]@{}
    
    foreach ($attrKv in $attrsFound.GetEnumerator()) {
        $attrUri = $attrKv.Value
        if (-not $savedMarkdown[$attrUri] -and -not $markdownNotFound[$attrUri]) {
            
            $savedMarkdown[$attrUri] = if (Test-Path $attrUri) {
                $attrUri | Get-Content -Raw -Path { $_ }
            } else {
                $markdownNotFound[$attrUri] = $true
            }
        }
    
        if (-not $savedMarkdown[$attrUri]) {
            continue
        }
    
        $attributeTables   = @($savedMarkdown[$attrUri] | ?<HTML_StartOrEndTag> -Tag table)
        $allAttributeProperties = @() 
        for ($ati = 0; $ati -lt $attributeTables.Count; $ati++) {
            $appliesToElements = @()
            if ($attributeTables.Count -gt 2) {
                $previousHeading = $savedMarkdown[$attrUri] | ?<Markdown_Heading> -RightToLeft -Count 1 -StartAt $attributeTables[$ati].Index
                $previousHeadingEnd = $previousHeading.Index + $previousHeading.Length
                $appliesToElements = @($findSvgElement.Matches(
                    $previousHeading.Value
                ))
                if ($appliesToElements) {
                    $appliesToElements = @(foreach ($appliesTo in $appliesToElements) {
                        $appliesTo.Groups['e'].Value
                    })
                }                
            }
            
            $attributeProperties = [Ordered]@{}
            if ($attributeTables[$ati] -match 'properties') {
                
                $attrTable = 
                    $savedMarkdown[$attrUri].Substring(
                        $attributeTables[$ati].Index,  $attributeTables[$ati + 1].Index + $attributeTables[$ati + 1].Length - $attributeTables[$ati].Index
                    )
                $attrTableXml = $attrTable -as [xml]
                $tableRows = @($attrTableXml.table.tbody.tr)
                $tableKeys = @($tableRows.th.'#text')                
                
                for ($tri = 0 ; $tri -lt $tableKeys.Length; $tri++) {
                    $tableRowData = $tableRows[$tri].td
                    if (-not $tableKeys[$tri])  { continue }
                    $attributeProperties[$tableKeys[$tri]] = 
                        if ($tableRowData -is [string]) {
                            if ($tableRowData -eq 'yes') {
                                $true
                            }
                            elseif ($tableRowData -eq 'no') {
                                $false
                            }
                            else {
                                $tableRowData
                            }
                        } elseif ($tableRowData) {
                            (@(foreach ($innerText in $tableRowData.InnerText) {
                                "$innerText" -split '(?>\r\n|\n)' -replace '^\s{1,}', ' ' -replace '\s{1,}$'
                            }) -join '').Trim()
                        }
                }
                if ($attributeProperties['Default value'] -eq 'None') {
                    $attributeProperties.Remove('Default Value')
                }
                if ($appliesToElements) {
                    $attributeProperties['AppliesTo'] = $appliesToElements
                }
                $allAttributeProperties += $attributeProperties                
            }
    
        }
        
        $headingList       = $savedMarkdown[$attrUri] | ?<Markdown_Heading> -Split -IncludeMatch        
        
        $attrMetadata[$attrKv.key] = [PSCustomObject]@{
            Name = $attrKv.Key
            Elements = @(
                foreach ($elementMatch in $findSvgElement.Matches($savedMarkdown[$attrUri])) {
                    $elementMatch.Groups["e"].Value
                }
            )
            Description = $(
                foreach ($heading in $headingList) {
                    if ($heading -match '\{\{SVGRef\}\}') {
                        $heading -replace '\{\{SVGRef\}\}' -replace $replaceMDNContent, '${s}'
                        break
                    }
                }
            )
            Properties = $(
                if ($allAttributeProperties.Count -eq 1) {
                    $allAttributeProperties[0]
                } else {
                    $allAttributeProperties
                }
            )
        }
    }    
}

. InitializeSvgAttributeData


<#
$eventAttributeListUri = "https://api.github.com/repos/mdn/content/contents/files/en-us/web/svg/attribute/events/index.md"
if (-not $savedMarkdown[$eventAttributeListUri]) {
    $savedMarkdown[$eventAttributeListUri] = [Text.Encoding]::utf8.getString([Convert]::FromBase64String(
            $(try {
                Invoke-GitHubRestApi -Uri $eventAttributeListUri -ErrorAction SilentlyContinue -PersonalAccessToken $ghp
            } catch {
                Write-Warning "$_"
            }).Content
        ))
}#>


$c, $t, $id = 0, @($svgElements.elements.psobject.properties).Length, (Get-Random)
foreach ($svgElement in $svgElements.elements.psobject.properties) {
    $elementName = $svgElement.Name
    $elementData = $svgElement.Value
    $c++
    Write-Progress "Getting Element Data" "$elementName " -Id $id -PercentComplete ($c * 100 / $t)
    
    if (-not $svgElementData[$elementName]) {
        $elementAttributes = 
            "https://api.github.com/repos/mdn/content/contents/files/en-us/web/svg/element/$($elementName.ToLower())/index.md" | 
                ImportSvgAttribute
    
        $svgElementData[$elementName] = $elementAttributes
    }
}


$examplesRoot = Join-Path $PSScriptRoot Examples

$knownParameterAliases = @{
    'Dur' = 'Duration'
}

$destFolder  = Join-Path $PSScriptRoot "Commands"
$destFolder  = Join-Path $destFolder "Standard"

if (-not (Test-Path $destFolder)) {
    $createdFolder = New-Item $destFolder -Type Directory -Force
    if (-not $createdFolder) {
        Write-Error "Could not create $destFolder"
        return
    }
}

foreach ($elementKV in $svgElementData.GetEnumerator()) {
    $docsLink = "https://pssvg.start-automating.com/SVG.$($elementKV.Key)"
    $mdnLink  = "https://developer.mozilla.org/" + (@($elementKV.Value.SourceUri -split 'files/')[1] -replace 'en-us', 'en-US' -replace 'index.md$')
    if (-not $elementKV.Value) { continue }

    $newPipeScriptSplat = @{
        Synopsis    = "Creates SVG $($elementKV.Key) elements"
        Description = $elementKV.Value.Description.Trim()
        Link = $docsLink, $mdnLink, 'Write-SVG'
    }
    $relevantExampleFiles = Get-ChildItem -Filter *.ps1 -Path $examplesRoot |
        Select-String "\<svg.$($elementKv.Key)\>" | 
        Select-Object -ExpandProperty Path
    if ($relevantExampleFiles) {        
        $newPipeScriptSplat.Example = @(
            foreach ($exampleFile in $relevantExampleFiles) {
                ((Get-Content -Raw $exampleFile) -replace '\#requires -Module PSSVG' -replace '\s-OutputPath(?:.|\s){0,}?(?=\z|$)').Trim()
            }
        )        
    }


    if ($newPipeScriptSplat.Description -match 'The table below') {
        $newPipeScriptSplat.Description = @($newPipeScriptSplat.Description -split "The table below")[0]
    }

    if ($newPipeScriptSplat.Description -match '\{\{deprecated_header\}\}') {
        continue
    }
    
    $parameters = [Ordered]@{}

    if ($elementKV.Value.Content) {
        $content = $elementKV.Value.Content        
        $parameters.Content = @(
            "# The Contents of the $($elementKv.Key) element"
            if ($content.Description -eq 'characterDataElementsInAnyOrder') {
                "[Reflection.AssemblyMetaData('SVG.IsCData', `$$true)]"                
            }
            "[Parameter(Position=0,ValueFromPipelineByPropertyName)]"
            "[Alias('InputObject','Text', 'InnerText', 'Contents')]"
            '$Content'
        )        
    }
    
    $parameters['Data'] = @(
        "# A dictionary containing data.  This data will be embedded in data- attributes."        
        "[Parameter(ValueFromPipelineByPropertyName)]"
        "[Alias('DataAttribute','DataAttributes')]"
        "[Collections.IDictionary]"
        '$Data'
    )

    $parameters['Attribute'] = @(
        "# A dictionary of attributes.  This can set any attribute not exposed in other parameters."        
        "[Parameter(ValueFromPipelineByPropertyName)]"
        "[Alias('SVGAttributes','SVGAttribute')]"
        "[Collections.IDictionary]"
        '$Attribute = [Ordered]@{}'
    )
    
    foreach ($attrName in $elementKV.Value.AttributeNames) {
        $paramName = [regex]::Replace($attrName, '\W(?<w>\w+)', {
            param($match)
            $match.Groups['w'].Value.Substring(0,1).ToUpper() + 
                $match.Groups['w'].Value.Substring(1)
        })        
        $paramName = $paramName.Substring(0,1).ToUpper() + $paramName.Substring(1)
        $paramMetadata = $attrMetadata[$attrName]
        $paramIsDeprecated = $false
        $parameters[$paramName ] = @(
            $attrHelp = $elementKv.Value.Help.$attrName
          
            $paramIsDeprecated = $attrHelp -match '\{\{Deprecated_Header\}\}'
            $attrHelp = $attrHelp -replace $replaceMDNContent, '${s}' -replace '\{\{Deprecated_Header\}\}' -replace '^[\s\r\n]{0,}' -replace '[\s\r\n]{0,}$'
                
            if ($attrHelp -match 'You can use this attribute with the following SVG elements') {
                $attrHelp = @($attrHelp -split "You can use this attribute with the following SVG elements:[\s\r\n]")[0]
            }            

            foreach ($line in $attrHelp -split '(?>\r\n|\n)') {
                $line = $line.Trim()
                if ($line) {                 
                    $line = $line | ?<Markdown_Link> -ReplaceEvaluator {
                        param($match)
                        "[$($match.Groups["Text"])](https://developer.mozilla.org$($match.Groups['Uri']))"
                    }                
                }
                                
                "# " + $line
            }
            "[Parameter(ValueFromPipelineByPropertyName)]"            
            "[Reflection.AssemblyMetaData('SVG.AttributeName','$attrName')]"
            if ($paramIsDeprecated) {
                "[Reflection.AssemblyMetaData('SVG.Deprecated',`$true)]"
            }
            
            $elementData = $elementKV.Value.Data[$attrName]
            
            if ($elementData) {
                foreach ($dataKv in $elementData.GetEnumerator()) {
                    if ($dataKv.Key -eq 'AppliesTo') { continue }
                    "[Reflection.AssemblyMetaData('SVG.$($dataKv.Key)', '$($dataKv.Value.ToString().Replace("'", "''"))')]"
                    if ($dataKv.Key -eq 'Value' -and $dataKv.Value) {
                        $dataKv.Value | ConvertSVGMetadataToParameterAttribute
                    }
                }
            }
            
            if ($knownParameterAliases[$paramName]) {
                "[Alias('$($knownParameterAliases[$paramName] -replace "'", "''" -join "','")')]"
            }
            
            "`$$paramName"
        )
    }
    
    $newPipeScriptSplat.parameter = $parameters
    $elementName = $elementKv.Key.Substring(0,1).ToUpper() + $elementKV.Key.Substring(1)
    $newPipeScriptSplat.functionName = "SVG.$($elementKV.Key)"    
    $newPipeScriptSplat.attribute = @(
        "[Reflection.AssemblyMetadata('SVG.ElementName', '$($elementKV.Key)')]"
        '[CmdletBinding(PositionalBinding=$false)]'
        '[OutputType([Xml.XmlElement])]'
    )
    if ($elementName -eq 'SVG') {
        $newPipeScriptSplat.parameter += @{
            OutputPath = @(
@'
# The output path.
# If provided, will return a file, rather than an element.
[Parameter(ValueFromPipelineByPropertyName)]
[string]
$OutputPath                
'@
            )
        }
        $newPipeScriptSplat.attribute += @(
            '[OutputType([IO.FileInfo])]'
        )
    }
    $newPipeScriptSplat.Process = {
        # Copy the bound parameters
        $paramCopy = [Ordered]@{} + $PSBoundParameters
        # and get a reference to yourself.
        $myCmd = $MyInvocation.MyCommand

        # Use that self-reference to determine the element name.
        $elementName = foreach ($myAttr in $myCmd.ScriptBlock.Attributes) {
            if ($myAttr.Key -eq 'SVG.ElementName') {
                $myAttr.Value
                break
            }
        }
        # If we could not determine this, return.
        if (-not $elementName) { return }

        # If there were no keys found in -Attribute
        if (-not $attribute[$paramCopy.Keys]) {
            $attribute += $paramCopy # merge the values by adding hashtables.
        } else {
            # Otherwise copy into -Attribute one-by-one.
            foreach ($pc in $paramCopy.GetEnumerator()) {
                $attribute[$pc.Key] = $pc.Value
            }
        }

        # All commands will call Write-SVG.  Prepare a splat.
        $writeSvgSplat = @{
            ElementName = $elementName
            Attribute   = $attribute
        }

        # If content was provided
        if ($content) {
            # put it into the splat.
            $writeSvgSplat.Content = $content
        }
        # If we provided an -OutputPath
        if ($paramCopy['OutputPath']) {
            # put it into the splat.
            $writeSvgSplat.OutputPath = $paramCopy['OutputPath']
        }

        if ($data) {
            $writeSvgSplat.Data = $data
        }

        Write-SVG @writeSvgSplat
    }

    if (-not $parameters) { continue }    
    $destination = Join-Path $destFolder "$($newPipeScriptSplat.functionName).ps1"



    $newScript = New-PipeScript @newPipeScriptSplat 
    if ($newScript) {
        $newScript | 
            Set-Content -Path $destination
        Get-Item -Path $destination    
    }
    
}

Write-Progress "Getting Element Data" "$elementName " -Id $id -Completed

if (Test-Path content) {
    Remove-Item -Recurse -Force content
}

Import-Module .\PSSVG.psd1 -Global -Force -PassThru | Out-Host
