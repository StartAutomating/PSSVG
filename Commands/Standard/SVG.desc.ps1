function SVG.desc {
<#
.Synopsis
    Creates SVG desc elements
.Description
    The **`<desc>`** element provides an accessible, long-text description of any SVG [container element](https://developer.mozilla.org/en-US/docs/Web/SVG/Element#container_elements) or [graphics element](https://developer.mozilla.org/en-US/docs/Web/SVG/Element#graphics_elements).
    
    Text in a `<desc>` element is not rendered as part of the graphic. If the element can be described by visible text, it is possible to reference that text with the [`aria-describedby`](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Attributes/aria-describedby) attribute. If `aria-describedby` is used, it will take precedence over `<desc>`.
    
    The hidden text of a `<desc>` element can also be concatenated with the visible text of other elements using multiple IDs in an `aria-describedby` value. In that case, the `<desc>` element must provide an ID for reference.
.Link
    https://pssvg.start-automating.com/SVG.desc
.Link
    https://developer.mozilla.org/en-US/web/svg/element/desc/
.Link
    Write-SVG
#>
[Reflection.AssemblyMetadata('SVG.ElementName', 'desc')]
[CmdletBinding(PositionalBinding=$false)]
[OutputType([Xml.XmlElement])]
param(
# The Contents of the desc element
[Parameter(Position=0,ValueFromPipeline,ValueFromPipelineByPropertyName)]
[Alias('InputObject','Text', 'InnerText', 'Contents')]
$Content,
# A dictionary containing data.  This data will be embedded in data- attributes.
[Parameter(ValueFromPipelineByPropertyName)]
[Alias('DataAttribute','DataAttributes')]
[Collections.IDictionary]
$Data,
# A dictionary or object containing event handlers.
# Each key or property name will be the name of the event
# Each value will be the handler.
[Parameter(ValueFromPipelineByPropertyName)]
$On,
# A dictionary of attributes.  This can set any attribute not exposed in other parameters.
[Parameter(ValueFromPipelineByPropertyName)]
[Alias('SVGAttributes','SVGAttribute')]
[Collections.IDictionary]
$Attribute = [Ordered]@{},
# A comment that will appear before the element.
[Parameter(ValueFromPipelineByPropertyName)]
[Alias('Comments')]
[String]
$Comment,
# One or more child elements.  These will be treated as if they were content.
[Parameter(ValueFromPipelineByPropertyName)]
[Alias('Child')]
[Management.Automation.PSObject]
$Children,
# The **`id`** attribute assigns a unique name to an element.
# 
# You can use this attribute with any SVG element.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','id')]
[Reflection.AssemblyMetaData('SVG.Value', '<id>')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'False')]
[PSObject]
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
[PSObject]
$Lang,
# The **`tabindex`** attribute allows you to control whether an element is focusable and to define the relative order of the element for the purposes of sequential focus navigation.
# 
# You can use this attribute with any SVG element.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','tabindex')]
[Reflection.AssemblyMetaData('SVG.Value', 'valid integer')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'False')]
[PSObject]
$Tabindex,
# The **`xml:base`** attribute specifies a base IRI other than the base IRI of the document or external entity.
# 
# You can use this attribute with any SVG element.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','xml:base')]
[Reflection.AssemblyMetaData('SVG.Deprecated',$true)]
[Reflection.AssemblyMetaData('SVG.Value', '<iri>')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'False')]
[PSObject]
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
[PSObject]
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
[PSObject]
$XmlSpace,
# « [SVG Attribute reference home](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute)
# 
# Assigns a class name or set of class names to an element. You may assign the same class name or names to any number of elements, however, multiple class names must be separated by whitespace characters.
# 
# An element's class name serves two key roles:
# 
# - As a style sheet selector, for when an author assigns style information to a set of elements.
# - For general use by the browser.
# 
# You can use this class to style SVG content using CSS.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','class')]
[Reflection.AssemblyMetaData('SVG.Categories', 'None')]
[Reflection.AssemblyMetaData('SVG.Value', '<list-of-class-names>')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'True')]
[Reflection.AssemblyMetaData('SVG.Normative document', 'SVG 1.1 (2nd Edition): The class attribute')]
[PSObject]
$Class,
# The **`style`** attribute allows to style an element using CSS declarations. It functions identically to [the `style` attribute in HTML](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/style).
# 
# You can use this attribute with any SVG element.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','style')]
[Reflection.AssemblyMetaData('SVG.Value', '<style>')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'False')]
[PSObject]
$Style
)
process {
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
        if ($null -ne $content) {
            # put it into the splat.
            $writeSvgSplat.Content = $content
        }
        # If comments were provided
        if ($comment) {
            # put it into the splat.
            $writeSvgSplat.Comment = $comment
        }
        # If any children were provided
        if ($children) {
            # put them in the splat.
            $writeSvgSplat.Children = $children
        }
        # If we provided an -OutputPath
        if ($paramCopy['OutputPath']) {
            # put it into the splat.
            $writeSvgSplat.OutputPath = $paramCopy['OutputPath']
        }
        # If we provided any -Data attributes
        if ($data) {
            # put it into the splat.
            $writeSvgSplat.Data = $data
        }
        # If we provided any -On events
        if ($on) {
            # put it into the splat.
            $writeSvgSplat.On = $on
        }
        . Write-SVG @writeSvgSplat
    
}
} 

