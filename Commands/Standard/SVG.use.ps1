function SVG.use  {
<#
.Synopsis
    Creates SVG use elements
.Description
    The **`<use>`** element takes nodes from within the SVG document, and duplicates them somewhere else.
    The effect is the same as if the nodes were deeply cloned into a non-exposed DOM, then pasted where the `use` element is, much like cloned [template elements](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/template).
.Example
    svg -ViewBox 100,100 -Content @(
        svg.symbol -Id psChevron -Content @(
            svg.polygon -Points (@(
                "40,20"
                "45,20"
                "60,50"
                "35,80"
                "32.5,80"
                "55,50"
            ) -join ' ')
        ) -ViewBox 100, 100
    
        svg.use -Href '#psChevron' -Fill '#4488ff'
    )
.Example
    svg -viewBox 300, 100 -Content @(
        svg.symbol -Id psChevron -Content @(
            svg.polygon -Points (@(
                "40,20"
                "45,20"
                "60,50"
                "35,80"
                "32.5,80"
                "55,50"
            ) -join ' ')
        ) -ViewBox 100, 100
        svg.use -Href '#psChevron' -Fill '#4488ff' -X -7.5%
        svg.text @(
            svg.tspan -Content 'Start' -LetterSpacing .15em -AlignmentBaseline 'middle'
            svg.tspan -Content 'Automating' -LetterSpacing .2em -AlignmentBaseline 'middle' -Dx 0.5em
        ) -FontFamily 'monospace' -AlignmentBaseline 'middle' -X 27.5% -Y 50% -Fill '#4488ff'
        # svg.text -Content 'Automating' -FontFamily 'monospace' -AlignmentBaseline 'middle' -X 45% -Y 55% -Fill '#4488ff' -LetterSpacing .1em
    )
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
    https://pssvg.start-automating.com/SVG.use
.Link
    https://developer.mozilla.org/en-US/web/svg/element/use/
.Link
    Write-SVG
#>
[Reflection.AssemblyMetadata('SVG.ElementName', 'use')]
[CmdletBinding(PositionalBinding=$false)]
[OutputType([Xml.XmlElement])]
param(
# The Contents of the use element
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
# The URL to an element/fragment that needs to be duplicated. See [Usage notes](https://developer.mozilla.org#usage_notes) for details on common pitfalls.<br/> _Value type_: [**`<URL>`**](https://developer.mozilla.org/en-US/docs/Web/SVG/Content_type#url) ; _Default value_: none; _Animatable_: **yes**
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','href')]
[Reflection.AssemblyMetaData('SVG.Value', '<url>')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'True')]
[PSObject]
$Href,
# An [`<IRI>`](https://developer.mozilla.org/en-US/docs/Web/SVG/Content_type#iri) reference to an element/fragment that needs to be duplicated. If both href and xlink:href are present, the value given by href is used.<br/> _Value type_: [**`<IRI>`**](https://developer.mozilla.org/en-US/docs/Web/SVG/Content_type#iri) ; _Default value_: none; _Animatable_: **yes**
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','xlink:href')]
[Reflection.AssemblyMetaData('SVG.Value', '<iri>')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'True')]
[PSObject]
$XlinkHref,
# The x coordinate of an additional final offset transformation applied to the `<use>` element.<br/> _Value type_: [**`<coordinate>`**](https://developer.mozilla.org/en-US/docs/Web/SVG/Content_type#coordinate) ; _Default value_: `0`; _Animatable_: **yes**
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','x')]
[Reflection.AssemblyMetaData('SVG.Value', '<length> | <percentage>')]
[ValidatePattern('(?>|\d+)')]
[ArgumentCompleter({
    param ( $commandName,$parameterName,$wordToComplete,$commandAst,$fakeBoundParameters )    

    $validSet = '<length>','<percentage>'
    if ($wordToComplete) {        
        $toComplete = $wordToComplete -replace "^'" -replace "'$"
        return @($validSet -like "$toComplete*" -replace '^', "'" -replace '$',"'")
    } else {
        return @($validSet -replace '^', "'" -replace '$',"'")
    }
})]
[Reflection.AssemblyMetaData('SVG.Default value', '0')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'True')]
[PSObject]
$X,
# The y coordinate of an additional final offset transformation applied to the `<use>` element.<br/> _Value type_: [**`<coordinate>`**](https://developer.mozilla.org/en-US/docs/Web/SVG/Content_type#coordinate) ; _Default value_: `0`; _Animatable_: **yes**
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','y')]
[Reflection.AssemblyMetaData('SVG.Value', '<length> | <percentage>')]
[ValidatePattern('(?>|\d+)')]
[ArgumentCompleter({
    param ( $commandName,$parameterName,$wordToComplete,$commandAst,$fakeBoundParameters )    

    $validSet = '<length>','<percentage>'
    if ($wordToComplete) {        
        $toComplete = $wordToComplete -replace "^'" -replace "'$"
        return @($validSet -like "$toComplete*" -replace '^', "'" -replace '$',"'")
    } else {
        return @($validSet -replace '^', "'" -replace '$',"'")
    }
})]
[Reflection.AssemblyMetaData('SVG.Default value', '0')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'True')]
[PSObject]
$Y,
# The width of the use element.<br/> _Value type_: [**`<length>`**](https://developer.mozilla.org/en-US/docs/Web/SVG/Content_type#length) ; _Default value_: `0`; _Animatable_: **yes**
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','width')]
[Reflection.AssemblyMetaData('SVG.Value', 'auto | <length> | <percentage>')]
[ValidatePattern('(?>|\d+)')]
[ArgumentCompleter({
    param ( $commandName,$parameterName,$wordToComplete,$commandAst,$fakeBoundParameters )    

    $validSet = 'auto','<length>','<percentage>'
    if ($wordToComplete) {        
        $toComplete = $wordToComplete -replace "^'" -replace "'$"
        return @($validSet -like "$toComplete*" -replace '^', "'" -replace '$',"'")
    } else {
        return @($validSet -replace '^', "'" -replace '$',"'")
    }
})]
[Reflection.AssemblyMetaData('SVG.Default value', 'auto (treated as 0)')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'True')]
[PSObject]
$Width,
# The height of the use element.<br/> _Value type_: [**`<length>`**](https://developer.mozilla.org/en-US/docs/Web/SVG/Content_type#length) ; _Default value_: `0`; _Animatable_: **yes**
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','height')]
[Reflection.AssemblyMetaData('SVG.Value', 'auto | <length> | <percentage>')]
[ValidatePattern('(?>|\d+)')]
[ArgumentCompleter({
    param ( $commandName,$parameterName,$wordToComplete,$commandAst,$fakeBoundParameters )    

    $validSet = 'auto','<length>','<percentage>'
    if ($wordToComplete) {        
        $toComplete = $wordToComplete -replace "^'" -replace "'$"
        return @($validSet -like "$toComplete*" -replace '^', "'" -replace '$',"'")
    } else {
        return @($validSet -replace '^', "'" -replace '$',"'")
    }
})]
[Reflection.AssemblyMetaData('SVG.Default value', 'auto (treated as 0)')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'True')]
[PSObject]
$Height,
# The Ceight attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Ceight')]
[PSObject]
$Ceight,
# The Seight attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Seight')]
[PSObject]
$Seight,
# The Eeight attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Eeight')]
[PSObject]
$Eeight,
# The Teight attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Teight')]
[PSObject]
$Teight,
# The Xeight attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Xeight')]
[PSObject]
$Xeight
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

