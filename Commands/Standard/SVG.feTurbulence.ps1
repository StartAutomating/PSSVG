function SVG.feTurbulence  {
<#
.Synopsis
    Creates SVG feTurbulence elements
.Description
    The **`<feTurbulence>`** [SVG](https://developer.mozilla.org/en-US/docs/Web/SVG) filter primitive creates an image using the [Perlin turbulence function](https://developer.mozilla.orghttps://en.wikipedia.org/wiki/Perlin_noise). It allows the synthesis of artificial textures like clouds or marble. The resulting image will fill the entire filter primitive subregion.
.Example
    $AnimationTimeframe = [Ordered]@{
        Dur = '2s'
        RepeatCount = 'indefinite'
    }
    
    SVG -viewBox 1920,1080 -Content @(
        SVG.filter -id 'noise1' -x '0' -y '0' -width '100%' -height '100%' -Content @(
            SVG.feTurbulence -baseFrequency '0.025' @(
                SVG.animate -AttributeName numOctaves -Values '1;6;12' @AnimationTimeframe
                SVG.animate -AttributeName seed -Values '0;5;0' @AnimationTimeframe
            ) -NumOctaves 4 -Type fractalNoise
            SVG.feGaussianBlur -stdDeviation 0.9 @(
                SVG.animate -AttributeName stdDeviation -Values '1.1;3.3;1.1' @AnimationTimeframe
            )
            SVG.feBlend -In 'SourceGraphic' -Mode color-burn
        )
        SVG.rect -x '0' -y '0' -width 100% -height 100% -style 'filter: url(#noise1);' -Fill '#4488ff' -Opacity .4
    )
.Example
    #.SYNOPSIS
    #    Generates clouds using SVG
    #.DESCRIPTION
    #    Generates a cloud effect using fractal noise and blending modes.
    
    SVG -viewBox 1920, 1080 -Content @(
        SVG.filter -id 'noise1' -x '0' -y '0' -width '100%' -height '100%' -Content @(
            SVG.feTurbulence -baseFrequency '0.025' -Type 'fractalNoise' -NumOctaves 4
            SVG.feGaussianBlur -stdDeviation 0.9
            SVG.feBlend -In 'SourceGraphic' -Mode color-burn
        )
        SVG.rect -x '0' -y '0' -width 100% -height 100% -style 'filter: url(#noise1);' -Fill '#4488ff' -Opacity .2
    )
.Link
    https://pssvg.start-automating.com/SVG.feTurbulence
.Link
    https://developer.mozilla.org/en-US/web/svg/element/feturbulence/
.Link
    Write-SVG
#>
[Reflection.AssemblyMetadata('SVG.ElementName', 'feTurbulence')]
[CmdletBinding(PositionalBinding=$false)]
[OutputType([Xml.XmlElement])]
param(
# The Contents of the feTurbulence element
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
[PSObject]
$On,
# The slot attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Alias("SlotName")]
[string]
$Slot,
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
<#
If provided, will decorate outputted objects with a typename.
This can allow for custom formatting and extended types.        
If nothing was provided, each output will be decorated with it's ElementName.
#>
[Parameter(ValueFromPipelineByPropertyName)]
[Alias('PSTypeName','PSTypeNames','TypeName','TypeNames','Decoration','Decorations')]
[String]
$Decorate,
# One or more child elements.  These will be treated as if they were content.
[Parameter(ValueFromPipelineByPropertyName)]
[Alias('Child')]
[Management.Automation.PSObject]
$Children,
# 
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','baseFrequency')]
[Reflection.AssemblyMetaData('SVG.Value', '<number-optional-number>')]
[Reflection.AssemblyMetaData('SVG.Default value', '0')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'True')]
[PSObject]
$BaseFrequency,
# 
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','numOctaves')]
[Reflection.AssemblyMetaData('SVG.Value', '{{cssxref("integer")}}')]
[Reflection.AssemblyMetaData('SVG.Default value', '1')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'True')]
[PSObject]
$NumOctaves,
# 
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','seed')]
[Reflection.AssemblyMetaData('SVG.Value', '{{cssxref("number")}}')]
[Reflection.AssemblyMetaData('SVG.Default value', '0')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'True')]
[PSObject]
$Seed,
# 
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','stitchTiles')]
[Reflection.AssemblyMetaData('SVG.Value', 'noStitch | stitch')]
[ArgumentCompleter({
    param ( $commandName,$parameterName,$wordToComplete,$commandAst,$fakeBoundParameters )    

    $validSet = 'noStitch','stitch'
    if ($wordToComplete) {        
        $toComplete = $wordToComplete -replace "^'" -replace "'$"
        return @($validSet -like "$toComplete*" -replace '^', "'" -replace '$',"'")
    } else {
        return @($validSet -replace '^', "'" -replace '$',"'")
    }
})]
[Reflection.AssemblyMetaData('SVG.Default value', 'noStitch')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'True')]
[PSObject]
$StitchTiles,
# 
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','type')]
[Reflection.AssemblyMetaData('SVG.Categories', 'None')]
[Reflection.AssemblyMetaData('SVG.Value', 'fractalNoise | turbulence')]
[ArgumentCompleter({
    param ( $commandName,$parameterName,$wordToComplete,$commandAst,$fakeBoundParameters )    

    $validSet = 'fractalNoise','turbulence'
    if ($wordToComplete) {        
        $toComplete = $wordToComplete -replace "^'" -replace "'$"
        return @($validSet -like "$toComplete*" -replace '^', "'" -replace '$',"'")
    } else {
        return @($validSet -replace '^', "'" -replace '$',"'")
    }
})]
[Reflection.AssemblyMetaData('SVG.Animatable', 'True')]
[Reflection.AssemblyMetaData('SVG.Normative document', 'SVG 1.1 (2nd Edition)')]
[PSObject]
$Type,
# The Cype attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Cype')]
[PSObject]
$Cype,
# The Sype attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Sype')]
[PSObject]
$Sype
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

        if ($paramCopy.Id) {
            $attribute.Id = $paramCopy.Id
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

        if ($slot) {
            $writeSvgSplat.Slot = $slot
        }        

        . Write-SVG @writeSvgSplat
    
}

} 

