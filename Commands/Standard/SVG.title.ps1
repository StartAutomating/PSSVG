function SVG.title  {
<#
.Synopsis
    Creates SVG title elements
.Description
    The **`<title>`** element provides an accessible, short-text description of any SVG [container element](https://developer.mozilla.org/en-US/docs/Web/SVG/Element#container_elements) or [graphics element](https://developer.mozilla.org/en-US/docs/Web/SVG/Element#graphics_elements).
    
    Text in a `<title>` element is not rendered as part of the graphic, but browsers usually display it as a tooltip. If an element can be described by visible text, it is recommended to reference that text with an [`aria-labelledby`](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Attributes/aria-labelledby) attribute rather than using the `<title>` element.
    
    > **Note:** For backward compatibility with SVG 1.1, `<title>` elements should be the first child element of their parent.
.Example
    SVG -ViewBox 1.986,1 -Content @(
        $g = (1.986 * .4) / 12
        $e = (7/13)/10
    
        SVG.defs @(
            SVG.Star -PointCount 5 -Radius (1/13 * .4) -Fill white -CenterX 0 -CenterY 0 -Rotate 180 -Id Star -Comment "Each Star has a radius of 2/5ths a Bar."
        )
    
        SVG.title "American Flag"
    
        SVG.rect -Width 200% -Height 200% -x -50% -y -50% -Fill black
    
        1..13 |
            SVG.rect -Id {"bar$_"} -Fill {
                @("#FFFFFF", "#B22234")[$_ % 2]
            } -Width 100% -Height "$((1/13) * 100)%" -Y { "$((($_ -1)/13 * 100))%" } -Comment "Each Bar is 1/13th the height"
    
    
        SVG.rect -Fill "#3C3B6E" -Width 40% -Height "$((7/13 * 100))%" -X 0% -Y 0% -Id 'canton' -Comment "The Canton is 40% of the width and 7/13ths of the height"
    
        # Five rows of 6 stars
        1..30 |
            SVG.use -Id { "star$($_)" } -Href "#Star" -Comment "Five Rows of Six Stars" -Transform {
                $g = (1.986 * .4) / 12
                $e = (7/13)/10
                "translate($(
                    $g + ($g * 2 * ((($_ -1) % 6)))
                ) $(
                    $e + (
                        $e * 2 * (([Math]::Floor(($_ - 1)/ 6)))
                    )
                ))"
            }
    
        # Then interleaved with 4 rows of 5 stars
        1..20 |
            SVG.use -Id { "star$($_ + 30)" } -Href "#Star" -Width ($g/2) -Comment "Four Rows of Five Stars" -Children @(
                # SVG.animateTransform -Type 'translate' -From $($g/2) -To $($g/2) -RepeatCount 'indefinite' -Dur 1s -AttributeName transform
                # SVG.animateTransform -Type 'scale' -Values '.75;1.25;.75' -RepeatCount 'indefinite' -Dur ((60/128) * 2)s  -AttributeName transform -Additive 'sum'
            ) -Transform {
                $g = (1.986 * .4) / 12
                $e = (7/13)/10
                "translate($(
                    ($g * 2) + ($g * 2 * ((($_ -1) % 5)))
                ) $(
                    ($e * 2) + (
                        $e * 2 * (([Math]::Floor(($_ - 1)/ 5)))
                    )
                ))"
            }
    
    )
.Example
    param(
    # The smaller Star Size (as a ratio)
    [Alias('SmallerStarSize')]
    [double]
    $StarSizeSmall = .9,
    # The larger Star Size (as a ratio)
    [Alias('StarSizeBig','LargerStarSize')]
    [double]
    $StarSizeLarge = 1.1,
    # The duration of the animation, in seconds.
    # By default, two beats at 128 beats per minute.
    [Alias('Interval')]
    [double]
    $Duration = $((60/128) * 2)
    )
    
    
    SVG -ViewBox 1.986,1 -Content @(
        $g = (1.986 * .4) / 12
        $e = (7/13)/10
    
        SVG.defs @(
            SVG.Star -PointCount 5 -Radius (1/13 * .4) -Fill white -CenterX 0 -CenterY 0 -Rotate 180 -Id Star -Comment "Each Star has a radius of 2/5ths a Bar."
        )
    
        SVG.title "American Flag"
    
        SVG.rect -Width 200% -Height 200% -x -50% -y -50% -Fill black
    
        1..13 |
            SVG.rect -Id {"bar$_"} -Fill {
                @("#FFFFFF", "#B22234")[$_ % 2]
            } -Width 100% -Height "$((1/13) * 100)%" -Y { "$((($_ -1)/13 * 100))%" } -Comment "Each Bar is 1/13th the height"
    
    
        SVG.rect -Fill "#3C3B6E" -Width 40% -Height "$((7/13 * 100))%" -X 0% -Y 0% -Id 'canton' -Comment "The Canton is 40% of the width and 7/13ths of the height"
    
    
        # Five rows of 6 stars
        1..30 |
            SVG.use -Id { "star$($_)" } -Href "#Star" -Comment "Five Rows of Six Stars" -Transform {
                $g = (1.986 * .4) / 12
                $e = (7/13)/10
                "translate($(
                    $g + ($g * 2 * ((($_ -1) % 6)))
                ) $(
                    $e + (
                        $e * 2 * (([Math]::Floor(($_ - 1)/ 6)))
                    )
                ))"
            } -Children @(
                SVG.animateTransform -Type 'scale' -Values "$StarSizeLarge;$StarSizeSmall;$StarSizeLarge" -RepeatCount 'indefinite' -Dur $Duration  -AttributeName transform -Additive 'sum'
            )
    
        # Then interleaved with 4 rows of 5 stars
        1..20 |
            SVG.use -Id { "star$($_ + 30)" } -Href "#Star" -Width ($g/2) -Comment "Four Rows of Five Stars" -Children @(
                SVG.animateTransform -Type 'scale' -Values "$StarSizeSmall;$StarSizeLarge;$StarSizeSmall" -RepeatCount 'indefinite' -Dur $Duration  -AttributeName transform -Additive 'sum'
            ) -Transform {
                $g = (1.986 * .4) / 12
                $e = (7/13)/10
                "translate($(
                    ($g * 2) + ($g * 2 * ((($_ -1) % 5)))
                ) $(
                    ($e * 2) + (
                        $e * 2 * (([Math]::Floor(($_ - 1)/ 5)))
                    )
                ))"
            }
    
    )
.Link
    https://pssvg.start-automating.com/SVG.title
.Link
    https://developer.mozilla.org/en-US/web/svg/element/title/
.Link
    Write-SVG
#>
[Reflection.AssemblyMetadata('SVG.ElementName', 'title')]
[CmdletBinding(PositionalBinding=$false)]
[OutputType([Xml.XmlElement])]
param(
# The Contents of the title element
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
# The CextLength attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','CextLength')]
[PSObject]
$CextLength,
# The SextLength attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','SextLength')]
[PSObject]
$SextLength
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

