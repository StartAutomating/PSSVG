function SVG.feConvolveMatrix  {
<#
.Synopsis
    Creates SVG feConvolveMatrix elements
.Description
    The **`<feConvolveMatrix>`** [SVG](https://developer.mozilla.org/en-US/docs/Web/SVG) filter primitive applies a matrix convolution filter effect. A convolution combines pixels in the input image with neighboring pixels to produce a resulting image. A wide variety of imaging operations can be achieved through convolutions, including blurring, edge detection, sharpening, embossing and beveling.
    
    A matrix convolution is based on an n-by-m matrix (the convolution kernel) which describes how a given pixel value in the input image is combined with its neighboring pixel values to produce a resulting pixel value. Each result pixel is determined by applying the kernel matrix to the corresponding source pixel and its neighboring pixels. The basic convolution formula which is applied to each color value for a given pixel is:
    
    <math display="block"><semantics><mrow><mi>C</mi><mi>O</mi><mi>L</mi><mi>O</mi><msub><mi>R</mi><mrow><mi>X</mi><mo separator="true">,</mo><mi>Y</mi></mrow></msub><mo>=</mo><mfrac><mrow><msubsup><mo movablelimits="false">∑</mo><mrow><mi>I</mi><mo>=</mo><mn>0</mn></mrow><mrow><mi>o</mi><mi>r</mi><mi>d</mi><mi>e</mi><mi>r</mi><mi>X</mi><mo>−</mo><mn>1</mn></mrow></msubsup><msubsup><mo movablelimits="false">∑</mo><mrow><mi>J</mi><mo>=</mo><mn>0</mn></mrow><mrow><mi>o</mi><mi>r</mi><mi>d</mi><mi>e</mi><mi>r</mi><mi>X</mi><mo>−</mo><mn>1</mn></mrow></msubsup><mrow><mo fence="true" form="prefix">(</mo><mi>S</mi><mi>O</mi><mi>U</mi><mi>R</mi><mi>C</mi><msub><mi>E</mi><mrow><mi>X</mi><mo>−</mo><mi>t</mi><mi>a</mi><mi>r</mi><mi>g</mi><mi>e</mi><mi>t</mi><mi>X</mi><mo>+</mo><mi>J</mi><mo separator="true">,</mo><mi>Y</mi><mo>−</mo><mi>t</mi><mi>a</mi><mi>r</mi><mi>g</mi><mi>e</mi><mi>t</mi><mi>Y</mi><mo>+</mo><mi>I</mi></mrow></msub><mo>\*</mo><mi>k</mi><mi>e</mi><mi>r</mi><mi>n</mi><mi>e</mi><mi>l</mi><mi>M</mi><mi>a</mi><mi>t</mi><mi>r</mi><mi>i</mi><msub><mi>x</mi><mrow><mi>o</mi><mi>r</mi><mi>d</mi><mi>e</mi><mi>r</mi><mi>X</mi><mo>−</mo><mi>J</mi><mo>−</mo><mn>1</mn><mo separator="true">,</mo><mi>o</mi><mi>r</mi><mi>d</mi><mi>e</mi><mi>r</mi><mi>Y</mi><mo>−</mo><mi>I</mi><mo>−</mo><mn>1</mn></mrow></msub><mo fence="true" form="postfix">)</mo></mrow></mrow><mrow><mi>d</mi><mi>i</mi><mi>v</mi><mi>s</mi><mi>o</mi><mi>r</mi><mo>+</mo><mi>b</mi><mi>i</mi><mi>a</mi><mi>s</mi><mo>\*</mo><mi>A</mi><mi>L</mi><mi>P</mi><mi>H</mi><msub><mi>A</mi><mrow><mi>X</mi><mo separator="true">,</mo><mi>Y</mi></mrow></msub></mrow></mfrac></mrow><annotation encoding="TeX">COLOR\_{X,Y} = \frac{ \sum\_{I=0}^{orderX-1} \sum\_{J=0}^{orderX-1}{\left( SOURCE\_{X-targetX+J, Y-targetY+I} \* kernelMatrix\_{orderX-J-1, orderY-I-1} \right)}}{divisor + bias \* ALPHA\_{X, Y}}</annotation></semantics></math>
    
    where "orderX" and "orderY" represent the X and Y values for the [`order`](https://developer.mozilla.orghttps://www.w3.org/TR/SVG11/filters.html#feConvolveMatrixElementOrderAttribute) attribute, "targetX" represents the value of the [`targetX`](https://developer.mozilla.orghttps://www.w3.org/TR/SVG11/filters.html#feConvolveMatrixElementTargetXAttribute) attribute, "targetY" represents the value of the [`targetY`](https://developer.mozilla.orghttps://www.w3.org/TR/SVG11/filters.html#feConvolveMatrixElementTargetYAttribute) attribute, "kernelMatrix" represents the value of the [`kernelMatrix`](https://developer.mozilla.orghttps://www.w3.org/TR/SVG11/filters.html#feConvolveMatrixElementKernelMatrixAttribute) attribute, "divisor" represents the value of the [`divisor`](https://developer.mozilla.orghttps://www.w3.org/TR/SVG11/filters.html#feConvolveMatrixElementDivisorAttribute) attribute, and "bias" represents the value of the [`bias`](https://developer.mozilla.orghttps://www.w3.org/TR/SVG11/filters.html#feConvolveMatrixElementBiasAttribute) attribute.
    
    Note in the above formulas that the values in the kernel matrix are applied such that the kernel matrix is rotated 180 degrees relative to the source and destination images in order to match convolution theory as described in many computer graphics textbooks.
    
    To illustrate, suppose you have an input image which is 5 pixels by 5 pixels, whose color values for one of the color channels are as follows:
    
    ```plain
    0    20  40 235 235
    100 120 140 235 235
    200 220 240 235 235
    225 225 255 255 255
    225 225 255 255 255
    ```
    
    and you define a 3-by-3 convolution kernel as follows:
    
    ```plain
    1 2 3
    4 5 6
    7 8 9
    ```
    
    Let's focus on the color value at the second row and second column of the image (source pixel value is 120). Assuming the simplest case (where the input image's pixel grid aligns perfectly with the kernel's pixel grid) and assuming default values for attributes ['divisor'](https://developer.mozilla.orghttps://www.w3.org/TR/SVG11/filters.html#feConvolveMatrixElementDivisorAttribute), ['targetX'](https://developer.mozilla.orghttps://www.w3.org/TR/SVG11/filters.html#feConvolveMatrixElementTargetXAttribute) and ['targetY'](https://developer.mozilla.orghttps://www.w3.org/TR/SVG11/filters.html#feConvolveMatrixElementTargetYAttribute), then resulting color value will be:
    
    ```plain
    (9*0   + 8*20  + 7*40 +
     6*100 + 5*120 + 4*140 +
     3*200 + 2*220 + 1*240) / (9+8+7+6+5+4+3+2+1)
    ```
.Example
    param(
    # The message to emboss
    [string]
    $Message = "Embossed",
    
    # The fill color of the text
    [string]
    $Fill = '#4488ff',
    
    # The css classes to apply to the image
    [string[]]
    $Class,
    
    # The font size of the text
    [string]
    $FontSize = "26em",
    
    # The embossing level
    [int]
    $Emboss = 5
    )
    svg @(
        svg.filter -id embossed @(
            svg.feConvolveMatrix -KernelMatrix "
            $Emboss 0 0
            0 0 0
            0 0 -$($Emboss * -1)
    "
            svg.feMerge @(
                svg.feMergeNode
                svg.feMergeNode -In 'SourceGraphic'
            )
        )
    
        svg.text "
    Embossed
    " -TextAnchor middle -DominantBaseline middle -Fill $Fill -FontSize $FontSize -X 50% -Y 50% -Filter 'url(#embossed)'
    ) -Class $class -ViewBox 0,0,300,100
.Link
    https://pssvg.start-automating.com/SVG.feConvolveMatrix
.Link
    https://developer.mozilla.org/en-US/web/svg/element/feconvolvematrix/
.Link
    Write-SVG
#>
[Reflection.AssemblyMetadata('SVG.ElementName', 'feConvolveMatrix')]
[CmdletBinding(PositionalBinding=$false)]
[OutputType([Xml.XmlElement])]
param(
# The Contents of the feConvolveMatrix element
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
[Reflection.AssemblyMetaData('SVG.AttributeName','in')]
[Reflection.AssemblyMetaData('SVG.Value', 'SourceGraphic | SourceAlpha | BackgroundImage | BackgroundAlpha | FillPaint | StrokePaint | <filter-primitive-reference>')]
[ArgumentCompleter({
    param ( $commandName,$parameterName,$wordToComplete,$commandAst,$fakeBoundParameters )    

    $validSet = 'SourceGraphic','SourceAlpha','BackgroundImage','BackgroundAlpha','FillPaint','StrokePaint','<filter-primitive-reference>'
    if ($wordToComplete) {        
        $toComplete = $wordToComplete -replace "^'" -replace "'$"
        return @($validSet -like "$toComplete*" -replace '^', "'" -replace '$',"'")
    } else {
        return @($validSet -replace '^', "'" -replace '$',"'")
    }
})]
[Reflection.AssemblyMetaData('SVG.Default value', 'SourceGraphic for first filter primitive, otherwise result of previous filter primitive')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'True')]
[PSObject]
$In,
# 
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','order')]
[Reflection.AssemblyMetaData('SVG.Value', '<number-optional-number>')]
[Reflection.AssemblyMetaData('SVG.Default value', '3')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'True')]
[PSObject]
$Order,
# 
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','kernelMatrix')]
[Reflection.AssemblyMetaData('SVG.Value', '<list of numbers>')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'True')]
[PSObject]
$KernelMatrix,
# 
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','divisor')]
[Reflection.AssemblyMetaData('SVG.Value', '{{cssxref("number")}}')]
[Reflection.AssemblyMetaData('SVG.Default value', 'Sum of all values in {{SVGAttr("kernelMatrix")}} or 1 if sum is 0')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'True')]
[PSObject]
$Divisor,
# 
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','bias')]
[Reflection.AssemblyMetaData('SVG.Value', '<number>')]
[Reflection.AssemblyMetaData('SVG.Default value', '0')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'True')]
[PSObject]
$Bias,
# 
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','targetX')]
[Reflection.AssemblyMetaData('SVG.Value', '{{cssxref("integer")}}')]
[Reflection.AssemblyMetaData('SVG.Default value', 'floor({{SVGAttr("order")}}X / 2)')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'True')]
[PSObject]
$TargetX,
# 
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','targetY')]
[Reflection.AssemblyMetaData('SVG.Value', '{{cssxref("integer")}}')]
[Reflection.AssemblyMetaData('SVG.Default value', 'floor({{SVGAttr("order")}}Y / 2)')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'True')]
[PSObject]
$TargetY,
# 
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','edgeMode')]
[Reflection.AssemblyMetaData('SVG.Value', 'duplicate | wrap | none')]
[ArgumentCompleter({
    param ( $commandName,$parameterName,$wordToComplete,$commandAst,$fakeBoundParameters )    

    $validSet = 'duplicate','wrap','none'
    if ($wordToComplete) {        
        $toComplete = $wordToComplete -replace "^'" -replace "'$"
        return @($validSet -like "$toComplete*" -replace '^', "'" -replace '$',"'")
    } else {
        return @($validSet -replace '^', "'" -replace '$',"'")
    }
})]
[Reflection.AssemblyMetaData('SVG.Default value', 'duplicate')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'True')]
[PSObject]
$EdgeMode,
# 
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','kernelUnitLength')]
[Reflection.AssemblyMetaData('SVG.Value', '<number-optional-number>')]
[Reflection.AssemblyMetaData('SVG.Default value', 'Pixel in offscreen bitmap')]
[Reflection.AssemblyMetaData('SVG.Animatable', 'True')]
[PSObject]
$KernelUnitLength,
# The PreserveAlpha attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','PreserveAlpha')]
[PSObject]
$PreserveAlpha,
# The TreserveAlpha attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','TreserveAlpha')]
[PSObject]
$TreserveAlpha,
# The IreserveAlpha attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','IreserveAlpha')]
[PSObject]
$IreserveAlpha,
# The SreserveAlpha attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','SreserveAlpha')]
[PSObject]
$SreserveAlpha,
# The CreserveAlpha attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','CreserveAlpha')]
[PSObject]
$CreserveAlpha,
# The LreserveAlpha attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','LreserveAlpha')]
[PSObject]
$LreserveAlpha,
# The FreserveAlpha attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','FreserveAlpha')]
[PSObject]
$FreserveAlpha,
# The BreserveAlpha attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','BreserveAlpha')]
[PSObject]
$BreserveAlpha,
# The MreserveAlpha attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','MreserveAlpha')]
[PSObject]
$MreserveAlpha,
# The VreserveAlpha attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','VreserveAlpha')]
[PSObject]
$VreserveAlpha,
# The DreserveAlpha attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','DreserveAlpha')]
[PSObject]
$DreserveAlpha,
# The OreserveAlpha attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','OreserveAlpha')]
[PSObject]
$OreserveAlpha,
# The WreserveAlpha attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','WreserveAlpha')]
[PSObject]
$WreserveAlpha,
# The UreserveAlpha attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','UreserveAlpha')]
[PSObject]
$UreserveAlpha,
# The AreserveAlpha attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','AreserveAlpha')]
[PSObject]
$AreserveAlpha,
# The HreserveAlpha attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','HreserveAlpha')]
[PSObject]
$HreserveAlpha,
# The XreserveAlpha attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','XreserveAlpha')]
[PSObject]
$XreserveAlpha,
# The RreserveAlpha attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','RreserveAlpha')]
[PSObject]
$RreserveAlpha,
# The YreserveAlpha attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','YreserveAlpha')]
[PSObject]
$YreserveAlpha
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

