#requires -Module PSSVG

param(
# The Message to display
[string]
$Message = "Fading in",

# The fill color of the text    
[string]
$Fill = '#4488ff',

[string[]]
$Class,

# The duration of the animation.
[Timespan]
$Duration = "00:00:02",

[string]
$RepeatCount = 'indefinite'
)

svg -ViewBox 0,0,100,100 -Content (
    svg.g -Content @(
        svg.text -Y "50%" -X "50%" -DominantBaseline middle -TextAnchor middle -Text $Message -Fill $fill -Class $Class
        
        # If you only want to fade in once, remove the -RepeatCount
        svg.animate -Values '0;1' -AttributeName opacity -Begin '0s' -End "$($Duration.TotalSeconds)" -Dur "$($duration.TotalSeconds)s" -RepeatCount $RepeatCount
    )        
) -OutputPath (Join-Path $psScriptRoot .\FadeIn.svg)
