#requires -Module PSSVG

<#
.SYNOPSIS
    Generates Repeated Convex Polygons and Stars
.DESCRIPTION
    Generates a Star or Convex Polygon -RepeatCount number of times
#>
param(
# The number of repetitions
[int]$RepeatCount = 80,
# The Center X coordinate of the shape
[float]$CenterX  = 100,
# The Center Y coordinate of the shape
[float]$CenterY  = 100,
# The radius coordinate of the shape.  This will decrease by 1/RepeatCount each time.
[float]$Radius   = 100,
# The number of sides
$SideCount  = 3,
# The total rotation of the innermost element,
$TotalRotation  = 180,
# The total duration of any animations.
[timespan]$duration = '00:00:03.75',
# A palette of colors to alternate thru
[string[]]$Color = @('#112244','#224488',"#4488ff"),
# The type of the shape. (either Star or ConvexPolygon)
[ValidateSet("Star", "ConvexPolygon")]
[string]
$ShapeType = 'ConvexPolygon',

# If set, will animate opacity between a low and high point, depending on the radius.
[switch]
$AnimateOpacity
)

$Splat = [Ordered]@{
    SideCount = $SideCount
    Fill = 'transparent'    
    CenterX = $CenterX
    CenterY = $CenterY
}

$shapeCommand = $ExecutionContext.SessionState.InvokeCommand.GetCommand("SVG.$ShapeType", "Function")
SVG -ViewBox (($CenterX * 2), ($CenterY * 2)) @(
    SVG.rect -Width 1000% -Height 1000% -X -500% -Y -500% -Fill 'black'
    
    0..($RepeatCount -1) |
        & $shapeCommand @Splat -Rotate {
                $_ * ($totalRotation / $RepeatCount)
        } -Radius {
            $Radius - (
                $_ * ($Radius / $RepeatCount)
            )
        } -Stroke {
            $Color[$_ % $color.Length]
        } -Children {
            $toRotation =  $(360 * ([Math]::Ceiling(($_ + 1)/10)))            
            SVG.animateTransform -From "0 $centerX $centerY" -To "$toRotation $centerX $centerY" -Dur $duration -AttributeName transform -Type 'rotate' -RepeatCount 'indefinite'
            $lowOpacity = [double]($_)/$RepeatCount
            $highOpacity = 1.0 - [double]($_)/$RepeatCount
            if ($AnimateOpacity) {
                SVG.animate -AttributeName opacity -Values "$highOpacity;$lowOpacity;$highOpacity" -Dur $dur -RepeatCount 'indefinite'
            }
        }
) -OutputPath (Join-Path $PSScriptRoot "RepeatedShapes$SideCount.svg") 

return
