function SVG.animate  {
<#
.Synopsis
    Creates SVG animate elements
.Description
    The SVG **`<animate>`** element provides a way to animate an attribute of an element over time.
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./Animate.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./Animate.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./AnimateColor.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./AnimateColor.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./AnimateColor.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./AnimatedShapes.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./AnimatedShapes.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./AnimatedShapes.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./AnimatedShapes.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./AnimatedShapes.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./BPMAnimate.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./BPMAnimate.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./BPMAnimate.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./BPMAnimate.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./BPMAnimate.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./BPMAnimate.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./BPMAnimate.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./BPMAnimate.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./BPMAnimate.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./BPMAnimate.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./BPMAnimate.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./BPMAnimate.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./BPMAnimate.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./BPMAnimate.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./BPMAnimate.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./BPMAnimate.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./BPMAnimate.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./BPMAnimate.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./BPMAnimate.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./BPMAnimate.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./BPMAnimate.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./BPMAnimate.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./BPMAnimate.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./BPMAnimate.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./BPMMorph.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./BPMTriangleMorph.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./CloudAnimation.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./CloudAnimation.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./CloudAnimation.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./FadeIn.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./LinearGradientAnimated.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./LinearGradientAnimated.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./ManyAnimatedRectangles.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./ManyAnimatedRectangles.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./Morphing.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./MorphingConvexPolygon.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./MorphingRose.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./MovingGradient.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./MovingGradient.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./MovingGradient.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./MovingGradient.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./MovingShadows.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./MovingShadows.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./RadialGradientAnimated.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./RepeatedShapes.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./StopUsingGIFs.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./StopUsingGIFs.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./StopUsingGIFs.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./ViewBoxAnimation.PSSVG.ps1
    Pop-Location
.Link
    https://pssvg.start-automating.com/SVG.animate
.Link
    https://developer.mozilla.org/en-US/web/svg/element/animate/
.Link
    Write-SVG
#>
[Reflection.AssemblyMetadata('SVG.ElementName', 'animate')]
[CmdletBinding(PositionalBinding=$false)]
[OutputType([Xml.XmlElement])]
param(
# The Contents of the animate element
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
# The SystemLanguage attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','SystemLanguage')]
[PSObject]
$SystemLanguage,
# The RequiredExtensions attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','RequiredExtensions')]
[PSObject]
$RequiredExtensions,
# The Tabindex attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Tabindex')]
[PSObject]
$Tabindex,
# The Id attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Id')]
[PSObject]
$Id,
# The Style attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Style')]
[PSObject]
$Style,
# The Class attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Class')]
[PSObject]
$Class,
# The Lang attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Lang')]
[PSObject]
$Lang,
# The Xlinkrole attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Xlinkrole')]
[PSObject]
$Xlinkrole,
# The Xlinkactuate attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Xlinkactuate')]
[PSObject]
$Xlinkactuate,
# The Begin attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Begin')]
[PSObject]
$Begin,
# The CalcMode attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','CalcMode')]
[PSObject]
$CalcMode,
# The Additive attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Additive')]
[PSObject]
$Additive,
# The ExternalResourcesRequired attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','ExternalResourcesRequired')]
[PSObject]
$ExternalResourcesRequired,
# The AttributeName attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','AttributeName')]
[PSObject]
$AttributeName,
# The From attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','From')]
[PSObject]
$From,
# The To attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','To')]
[PSObject]
$To,
# The Dur attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Dur')]
[PSObject]
$Dur,
# The RepeatCount attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','RepeatCount')]
[PSObject]
$RepeatCount,
# The Accumulate attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Accumulate')]
[PSObject]
$Accumulate,
# The By attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','By')]
[PSObject]
$By,
# The Fill attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Fill')]
[PSObject]
$Fill,
# The RepeatDur attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','RepeatDur')]
[PSObject]
$RepeatDur,
# The Href attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Href')]
[PSObject]
$Href,
# The KeySplines attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','KeySplines')]
[PSObject]
$KeySplines,
# The Colorinterpolation attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Colorinterpolation')]
[PSObject]
$Colorinterpolation,
# The End attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','End')]
[PSObject]
$End,
# The Min attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Min')]
[PSObject]
$Min,
# The Restart attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Restart')]
[PSObject]
$Restart,
# The KeyPoints attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','KeyPoints')]
[PSObject]
$KeyPoints,
# The Values attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Values')]
[PSObject]
$Values,
# The Max attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Max')]
[PSObject]
$Max,
# The KeyTimes attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','KeyTimes')]
[PSObject]
$KeyTimes
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

