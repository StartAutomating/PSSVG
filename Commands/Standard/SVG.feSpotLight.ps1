function SVG.feSpotLight {
<#
.Synopsis
    Creates SVG feSpotLight elements
.Description
    The **`<feSpotLight>`** [SVG](https://developer.mozilla.org/en-US/docs/Web/SVG) filter primitive defines a light source that can be used to create a spotlight effect.
    It is used within a lighting filter primitive: `feDiffuseLighting` or `feSpecularLighting`.
.Link
    https://pssvg.start-automating.com/SVG.feSpotLight
.Link
    https://developer.mozilla.org/en-US/web/svg/element/fespotlight/
.Link
    Write-SVG
#>
[Reflection.AssemblyMetadata('SVG.ElementName', 'feSpotLight')]
[CmdletBinding(PositionalBinding=$false)]
param(
# The Contents of the feSpotLight element
[Parameter(Position=0,ValueFromPipelineByPropertyName)]
[Alias('InputObject','Text', 'InnerText', 'Contents')]
$Content,
# A dictionary containing data.  This data will be embedded in data- attributes.
[Parameter(ValueFromPipelineByPropertyName)]
[Collections.IDictionary]
$Data,
# A dictionary of attributes.  This can set any attribute not exposed in other parameters.
[Parameter(ValueFromPipelineByPropertyName)]
[Alias('Attributes')]
[Collections.IDictionary]
$Attribute = [Ordered]@{},
# 
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','x')]
[Reflection.AssemblyMetaData('SVG.Value', '<number>')]
[Reflection.AssemblyMetaData('SVG.Default value', '0')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'True')]
$X,
# 
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','y')]
[Reflection.AssemblyMetaData('SVG.Value', '<number>')]
[Reflection.AssemblyMetaData('SVG.Default value', '0')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'True')]
$Y,
# 
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','z')]
[Reflection.AssemblyMetaData('SVG.Value', '{{cssxref("number")}}')]
[Reflection.AssemblyMetaData('SVG.Default value', '1')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'True')]
$Z,
# 
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','pointsAtX')]
[Reflection.AssemblyMetaData('SVG.Default value', '0')]
[Reflection.AssemblyMetaData('SVG.Value', '{{cssxref("number")}}')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'True')]
$PointsAtX,
# 
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','pointsAtY')]
[Reflection.AssemblyMetaData('SVG.Default value', '0')]
[Reflection.AssemblyMetaData('SVG.Value', '{{cssxref("number")}}')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'True')]
$PointsAtY,
# 
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','pointsAtZ')]
[Reflection.AssemblyMetaData('SVG.Default value', '0')]
[Reflection.AssemblyMetaData('SVG.Value', '{{cssxref("number")}}')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'True')]
$PointsAtZ,
# 
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','specularExponent')]
[Reflection.AssemblyMetaData('SVG.Value', '{{cssxref("number")}}')]
[Reflection.AssemblyMetaData('SVG.Default value', '1')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'True')]
$SpecularExponent,
# 
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','limitingConeAngle')]
[Reflection.AssemblyMetaData('SVG.Value', '{{cssxref("number")}}')]
[Reflection.AssemblyMetaData('SVG.Default value', '0')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'True')]
$LimitingConeAngle,
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
# > **Note:** Instead of using the `xml:space` attribute, use the white-space CSS property.
# 
# This attribute influences how browsers parse text content and therefore changes the way the DOM is built. Therefore, changing this attribute's value through the DOM API may have no effect.
# 
# You can use this attribute with any SVG element.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','xml:space')]
[Reflection.AssemblyMetaData('SVG.Deprecated',$true)]
[Reflection.AssemblyMetaData('SVG.Value', 'default | preserve')]
[ArgumentCompleter({
    param ( $commandName,$parameterName,$wordToComplete,$commandAst,$fakeBoundParameters )    

    $validSet = 'default','preserve'
    if ($wordToComplete) {        
        $toComplete = $wordToComplete -replace "^'" -replace "'$"
        return @($validSet -like "$toComplete*" -replace '^', "'" -replace '$',"'")
    } else {
        return @($validSet -replace '^', "'" -replace '$',"'")
    }
})]
[Reflection.AssemblyMetaData('SVG.Default value', 'default')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'False')]
$XmlSpace
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

        if (-not $attribute[$paramCopy.Keys]) {
            $attribute += $paramCopy
        } else {
            foreach ($pc in $paramCopy.GetEnumerator()) {
                $attribute[$pc.Key] = $pc.Value
            }
        }

        $writeSvgSplat = @{
            ElementName = $elementName
            Attribute   = $attribute
        }

        if ($content) {
            $writeSvgSplat.Content = $content
        }
        if ($OutputPath) {
            $writeSvgSplat.OutputPath = $OutputPath
        }

        if ($data) {
            $writeSvgSplat.Data = $data
        }

        Write-SVG @writeSvgSplat
    
}

} 

