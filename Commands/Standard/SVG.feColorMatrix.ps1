function SVG.feColorMatrix  {
<#
.Synopsis
    Creates SVG feColorMatrix elements
.Description
    The **`<feColorMatrix>`** SVG filter element changes colors based on a transformation matrix. Every pixel's color value `[R,G,B,A]` is [matrix multiplied](https://developer.mozilla.orghttps://en.wikipedia.org/wiki/Matrix_multiplication) by a 5 by 5 color matrix to create new color `[R',G',B',A']`.
    
    > **Note:** The prime symbol **`'`** is used in mathematics indicate the result of a transformation.
    
    ```plain
    | R' |     | r1 r2 r3 r4 r5 |   | R |
    | G' |     | g1 g2 g3 g4 g5 |   | G |
    | B' |  =  | b1 b2 b3 b4 b5 | * | B |
    | A' |     | a1 a2 a3 a4 a5 |   | A |
    | 1  |     | 0  0  0  0  1  |   | 1 |
    ```
    
    In simplified terms, below is how each color channel in the new pixel is calculated. The last row is ignored because its values are constant.
    
    ```plain
    R' = r1*R + r2*G + r3*B + r4*A + r5
    G' = g1*R + g2*G + g3*B + g4*A + g5
    B' = b1*R + b2*G + b3*B + b4*A + b5
    A' = a1*R + a2*G + a3*B + a4*A + a5
    ```
    
    Take the amount of red in the new pixel, or `R'`:
    
    It is the sum of:
    
    - `r1` times the old pixel's red `R`,
    - `r2` times the old pixel's green `G`,
    - `r3` times of the old pixel's blue `B`,
    - `r4` times the old pixel's alpha `A`,
    - plus a shift `r5`.
    
    These specified amounts can be any real number, though the final **R'** will be clamped between 0 and 1. The same goes for **G'**, **B'**, and **A'**.
    
    ```plain
    R'      =      r1 * R      +        r2 * G      +       r3 * B      +       r4 * A       +       r5
    New red = [ r1 * old red ] + [ r2 * old green ] + [ r3 * old Blue ] + [ r4 * old Alpha ] + [ shift of r5 ]
    ```
    
    If, say, we want to make a completely black image redder, we can make the `r5` a positive real number _x_, boosting the redness on every pixel of the new image by _x_.
    
    An **identity matrix** looks like this:
    
    ```plain
         R G B A W
    R' | 1 0 0 0 0 |
    G' | 0 1 0 0 0 |
    B' | 0 0 1 0 0 |
    A' | 0 0 0 1 0 |
    ```
    
    In it, every new value is exactly 1 times its old value, with nothing else added. It is recommended to start manipulating the matrix from here.
.Link
    https://pssvg.start-automating.com/SVG.feColorMatrix
.Link
    https://developer.mozilla.org/en-US/web/svg/element/fecolormatrix/
.Link
    Write-SVG
#>
[Reflection.AssemblyMetadata('SVG.ElementName', 'feColorMatrix')]
[CmdletBinding(PositionalBinding=$false)]
[OutputType([Xml.XmlElement])]
param(
# The Contents of the feColorMatrix element
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
[PSObject]
$In,
# 
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','type')]
[PSObject]
$Type,
# The Values attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Values')]
[PSObject]
$Values,
# The Talues attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Talues')]
[PSObject]
$Talues,
# The Ialues attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Ialues')]
[PSObject]
$Ialues,
# The Salues attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Salues')]
[PSObject]
$Salues,
# The Calues attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Calues')]
[PSObject]
$Calues,
# The Lalues attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Lalues')]
[PSObject]
$Lalues,
# The Falues attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Falues')]
[PSObject]
$Falues,
# The Balues attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Balues')]
[PSObject]
$Balues,
# The Malues attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Malues')]
[PSObject]
$Malues,
# The Dalues attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Dalues')]
[PSObject]
$Dalues,
# The Oalues attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Oalues')]
[PSObject]
$Oalues,
# The Walues attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Walues')]
[PSObject]
$Walues,
# The Palues attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Palues')]
[PSObject]
$Palues,
# The Ualues attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Ualues')]
[PSObject]
$Ualues,
# The Aalues attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Aalues')]
[PSObject]
$Aalues,
# The Halues attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Halues')]
[PSObject]
$Halues,
# The Xalues attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Xalues')]
[PSObject]
$Xalues,
# The Ralues attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Ralues')]
[PSObject]
$Ralues,
# The Yalues attribute.
[Parameter(ValueFromPipelineByPropertyName)]
[Reflection.AssemblyMetaData('SVG.AttributeName','Yalues')]
[PSObject]
$Yalues
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

