function SVG.mpath {
<#
.Synopsis
    Creates SVG mpath elements
.Description
    The **`<mpath>`** sub-element for the animateMotion element provides the ability to reference an external path element as the definition of a motion path.
#>
[Reflection.AssemblyMetadata('SVG.ElementName', 'mpath')]
[CmdletBinding(PositionalBinding=$false)]
param(
# The Contents of the mpath element
[Parameter(Position=0,ValueFromPipelineByPropertyName)]
[Alias('InputObject','Text', 'InnerText', 'Contents')]
$Content,
# The **`xlink:href`** attribute defines a reference to a resource as a reference IRI. The exact meaning of that link depends on the context of each element using it.
# 
# > **Note:** SVG 2 removed the need for the `xlink` namespace, so instead of `xlink:href` you should use href. If you need to support earlier browser versions, the deprecated `xlink:href` attribute can be used as a fallback in addition to the `href` attribute, e.g. `<use href="some-id" xlink:href="some-id" x="5" y="5" />`.
# 
# 
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','xlink:href')]
[Reflection.AssemblyMetaData('SVG.Deprecated',$true)]
[Reflection.AssemblyMetaData('SVG.Value', '<iri>')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'True')]
$XlinkHref,
# The **`id`** attribute assigns a unique name to an element.
# 
# You can use this attribute with any SVG element.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','id')]
[Reflection.AssemblyMetaData('SVG.Value', '<id>')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'False')]
$Id,
# The **`lang`** attribute specifies the primary language used in contents and attributes containing text content of particular elements.
# 
# There is also an xml:lang attribute (with namespace). If both of them are defined, the one with namespace is used and the one without is ignored.
# 
# In SVG 1.1 there was a `lang` attribute defined with a different meaning and only applying to glyph elements. That attribute specified a list of languages according to {{RFC(5646, "Tags for Identifying Languages (also known as BCP 47)")}}. The glyph was meant to be used if the `xml:lang` attribute exactly matched one of the languages given in the value of this parameter, or if the `xml:lang` attribute exactly equaled a prefix of one of the languages given in the value of this parameter such that the first tag character following the prefix was "-".
# 
# You can use this attribute with any SVG element.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','lang')]
[Reflection.AssemblyMetaData('SVG.Value', '<language-tag>')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'False')]
$Lang,
# The **`tabindex`** attribute allows you to control whether an element is focusable and to define the relative order of the element for the purposes of sequential focus navigation.
# 
# You can use this attribute with any SVG element.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','tabindex')]
[Reflection.AssemblyMetaData('SVG.Value', 'valid integer')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'False')]
$Tabindex,
# The **`xml:base`** attribute specifies a base IRI other than the base IRI of the document or external entity.
# 
# You can use this attribute with any SVG element.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','xml:base')]
[Reflection.AssemblyMetaData('SVG.Deprecated',$true)]
[Reflection.AssemblyMetaData('SVG.Value', '<iri>')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'False')]
$XmlBase,
# The **`xml:lang`** attribute specifies the primary language used in contents and attributes containing text content of particular elements.
# 
# It is a universal attribute allowed in all XML dialects to mark up the natural human language that an element contains.
# 
# There is also a lang attribute (without namespace). If both of them are defined, the one with namespace is used and the one without is ignored.
# 
# You can use this attribute with any SVG element.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','xml:lang')]
[Reflection.AssemblyMetaData('SVG.Deprecated',$true)]
[Reflection.AssemblyMetaData('SVG.Value', '<language-tag>')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'False')]
$XmlLang,
# SVG supports the built-in XML **`xml:space`** attribute to handle whitespace characters inside elements. Child elements inside an element may also have an `xml:space` attribute that overrides the parent's one.
# 
# > **Note:** Instead of using the `xml:space` attribute, use the {{cssxref("white-space")}} CSS property.
# 
# This attribute influences how browsers parse text content and therefore changes the way the DOM is built. Therefore, changing this attribute's value through the DOM API may have no effect.
# 
# You can use this attribute with any SVG element.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','xml:space')]
[Reflection.AssemblyMetaData('SVG.Deprecated',$true)]
[Reflection.AssemblyMetaData('SVG.Value', 'default | preserve')]
[ValidateSet('default','preserve')]
[Reflection.AssemblyMetaData('SVG.Default value', 'default')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'False')]
$XmlSpace,
# The **`xlink:type`** attribute identifies the type of XLink being used. In SVG, only simple links are available.
# 
# 
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','xlink:type')]
[Reflection.AssemblyMetaData('SVG.Deprecated',$true)]
[Reflection.AssemblyMetaData('SVG.Value', 'simple')]
[Reflection.AssemblyMetaData('SVG.Default value', 'simple')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'False')]
$XlinkType,
# The **`xlink:arcrole`** attribute specifies a contextual role for the element and corresponds to the RDF Primer notion of a property.
# 
# This contextual role can differ from the meaning of the resource when taken outside the context of this particular arc. For example, a resource might generically represent a "person," but in the context of a particular arc it might have the role of "mother" and in the context of a different arc it might have the role of "daughter."
# 
# 
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','xlink:arcrole')]
[Reflection.AssemblyMetaData('SVG.Deprecated',$true)]
[Reflection.AssemblyMetaData('SVG.Value', '<iri>')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'False')]
$XlinkArcrole,
# The **`xlink:title`** attribute is used to describe the meaning of a link or resource in a human-readable fashion.
# 
# The use of this information is highly dependent on the type of processing being done. It may be used, for example, to make titles available to applications used by visually impaired users, or to create a table of links, or to present help text that appears when a user lets a mouse pointer hover over a starting resource.
# 
# > **Note:** New content should use a title child element rather than a `xlink:title` attribute.
# 
# 
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','xlink:title')]
[Reflection.AssemblyMetaData('SVG.Deprecated',$true)]
[Reflection.AssemblyMetaData('SVG.Value', '<anything>')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'False')]
$XlinkTitle,
# The **`xlink:show`** attribute indicates how a linked resource should be opened and is meant for XLink-aware processors. In case of a conflict, the target attribute has priority, since it can express a wider range of values.
# 
# 
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','xlink:show')]
[Reflection.AssemblyMetaData('SVG.Deprecated',$true)]
[Reflection.AssemblyMetaData('SVG.Value', 'new | replace | embed | other | none')]
[ValidateSet('new','replace','embed','other','none')]
[Reflection.AssemblyMetaData('SVG.Default value', 'replace')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'False')]
$XlinkShow
)


process {

        $paramCopy = [Ordered]@{} + $PSBoundParameters
        $myCmd = $MyInvocation.MyCommand

        $inputObject = $_
        $elementName = foreach ($myAttr in $myCmd.ScriptBlock.Attributes) {
            if ($myAttr.Key -eq 'SVG.ElementName') {
                $myAttr.Value
                break
            }
        }
        if (-not $elementName) { return }
        
        # If we had an input object, create a copy
        if ($inputObject) {
            $inputObject = [PSObject]::new($inputObject)
        }
        # (this way, we can take off any properties that were provided by name)
        
        if ($paramCopy['Style'] -and $paramCopy['Style'] -isnot [string]) {
            if ($paramCopy['Style'] -is [Collections.IDictionary]) {
                $paramCopy['Style'] = 
                    @(foreach ($kv in $paramCopy['Style'].GetEnumerator()) {
                        "$($kv.Key):$($kv.Value)"
                    }) -join ';'                
            }
            else {
                $paramCopy['Style'] = @(foreach ($prop in $paramCopy['Style'].psobject.properties) {
                    "$($prop.Name):$($kv.Value)"
                }) -join ';'
            }
        }

        $elementText = "<$elementName "
        :nextParameter foreach ($kv in $paramCopy.GetEnumerator()) {
            foreach ($attr in $myCmd.Parameters[$kv.Key].Attributes) {
                if ($attr.Key -eq 'SVG.AttributeName') {
                    if ($inputObject -and $inputObject.psobject.properties[$attr.Key]) {
                        $inputObject.psobject.properties.Remove($attr.Key)
                    }
                    $elementText += "$($attr.Value)='$([Web.HttpUtility]::HtmlAttributeEncode($kv.Value))' "
                }
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
            foreach ($attr in $myCmd.Parameters.Content.Attributes) {
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

        if ($elementName -eq 'svg' -and $OutputPath) {
            $elementText | Set-Content -Path $OutputPath
            Get-Item $OutputPath
        } else {        
            $elementText
        }
    
}

} 

