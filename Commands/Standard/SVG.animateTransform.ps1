function SVG.animateTransform  {
<#
.Synopsis
    Creates SVG animateTransform elements
.Description
    The `animateTransform` element animates a transformation attribute on its target element, thereby allowing animations to control translation, scaling, rotation, and/or skewing.
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./AnimateMotion.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./MorphingRose.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./PatternAnimation.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./PatternAnimation.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./PatternMask.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./RepeatedShapes.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./SpinningSpiral.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./Stars.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./Stars.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./Stars.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./Stars.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./Stars.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./Stars.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./SweepCircle.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./US-Flag.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./US-Flag.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./US-FlagAnimated.PSSVG.ps1
    Pop-Location
.Example
    Get-Module PSSVG | Split-Path | Join-Path -ChildPath Examples | Push-Location
    ./US-FlagAnimated.PSSVG.ps1
    Pop-Location
.Link
    https://pssvg.start-automating.com/SVG.animateTransform
.Link
    https://developer.mozilla.org/en-US/web/svg/element/animatetransform/
.Link
    Write-SVG
#>
[Reflection.AssemblyMetadata('SVG.ElementName', 'animateTransform')]
[CmdletBinding(PositionalBinding=$false)]
[OutputType([Xml.XmlElement])]
param(
# The Contents of the animateTransform element
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
[Reflection.AssemblyMetaData('SVG.AttributeName','by')]
[Reflection.AssemblyMetaData('SVG.Value', 'See below')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'False')]
[PSObject]
$By,
# 
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','from')]
[Reflection.AssemblyMetaData('SVG.Value', 'See below')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'False')]
[PSObject]
$From,
# 
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','to')]
[Reflection.AssemblyMetaData('SVG.Value', '<value>')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'False')]
[PSObject]
$To,
# 
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','type')]
[Reflection.AssemblyMetaData('SVG.Categories', 'None')]
[Reflection.AssemblyMetaData('SVG.Value', 'translate | scale | rotate | skewX | skewY')]
[ArgumentCompleter({
    param ( $commandName,$parameterName,$wordToComplete,$commandAst,$fakeBoundParameters )    

    $validSet = 'translate','scale','rotate','skewX','skewY'
    if ($wordToComplete) {        
        $toComplete = $wordToComplete -replace "^'" -replace "'$"
        return @($validSet -like "$toComplete*" -replace '^', "'" -replace '$',"'")
    } else {
        return @($validSet -replace '^', "'" -replace '$',"'")
    }
})]
[Reflection.AssemblyMetaData('SVG.Animatable', 'False')]
[Reflection.AssemblyMetaData('SVG.Normative document', 'SVG 1.1 (2nd Edition)')]
[PSObject]
$Type,
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
# The Accumulate attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Accumulate')]
[PSObject]
$Accumulate,
# The Dur attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Dur')]
[PSObject]
$Dur,
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
# The AttributeName attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','AttributeName')]
[PSObject]
$AttributeName,
# The KeySplines attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','KeySplines')]
[PSObject]
$KeySplines,
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
# The RepeatCount attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','RepeatCount')]
[PSObject]
$RepeatCount,
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

