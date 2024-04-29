[ValidatePattern('\SVG.Button')]
param()

function SVG.Button {
    <#
    
    .SYNOPSIS    
        SVG Button    
    .DESCRIPTION    
        Creates a button in SVG.    
    .NOTES    
        The button is a rectangle with text in the middle.    
        The button has a hover animation that changes the corner radius of the button.    
        The button has a click animation that changes the corner radius and font size of the button text.    
    .LINK    
        SVG.a    
    .EXAMPLE    
        SVG -ViewBox 300,100 @(    
            SVG.Button -ButtonText "Click Me!"    
        )    
    
    #>
        
    param(
    # The button text    
    [Parameter(ValueFromPipelineByPropertyName)]    
    [string]
    $ButtonText,

    # The width of the button, expressed as a percentage.    
    [Parameter(ValueFromPipelineByPropertyName)]
    [ValidatePattern('^\d+(\.\d+)?%$')]
    [string]
    $ButtonWidth = '90%',

    # The height of the button, expressed as a percentage.    
    [Parameter(ValueFromPipelineByPropertyName)]
    [ValidatePattern('^\d+(\.\d+)?%$')]
    [string]
    $ButtonHeight = '90%',

    # The text color    
    [Parameter(ValueFromPipelineByPropertyName)]
    [string]
    $TextColor = "currentColor",

    # The fill color of the button.    
    [Parameter(ValueFromPipelineByPropertyName)]
    [string]
    $BackgroundFill = "transparent",

    # The stroke color of the border.    
    [Parameter(ValueFromPipelineByPropertyName)]
    [string]
    $BorderStroke = "currentColor",

    # The thickness of the border.    
    # (the strokethickness of the shape that makes up the button)    
    [Parameter(ValueFromPipelineByPropertyName)]
    [string]
    $BorderThickness = "0.25%",

    # The corner radius of the button.    
    [Parameter(ValueFromPipelineByPropertyName)]
    [string]
    $CornerRadius = "0%",

    # The corner radius of the button when hovered.    
    [Parameter(ValueFromPipelineByPropertyName)]
    [string]
    $HoverCornerRadius = "0%",

    # The duration of the hover animation.    
    [Parameter(ValueFromPipelineByPropertyName)]
    [TimeSpan]
    $HoverAnimationDuration = "00:00:00.1",

    # The duration of the click animation    
    [Parameter(ValueFromPipelineByPropertyName)]
    [TimeSpan]
    $ClickAnimationDuration = "00:00:00.2",

    # The font size of the button text, when hovering.    
    [Parameter(ValueFromPipelineByPropertyName)]
    [string]
    $HoverFontSize = "3.25em",

    # The font size of the button text, when clicked.    
    [Parameter(ValueFromPipelineByPropertyName)]
    [string]
    $ClickFontSize = "2.75em",

    # The corner radius of the button when clicked.    
    [Parameter(ValueFromPipelineByPropertyName)]
    [string]
    $ClickCornerRadius = "5%"
    )
    dynamicParam {
    $baseCommand = 
        if (-not $script:SVGa) {
            $script:SVGa = 
                $executionContext.SessionState.InvokeCommand.GetCommand('SVG.a','Function')
            $script:SVGa
        } else {
            $script:SVGa
        }
    $IncludeParameter = @()
    $ExcludeParameter = @()


    $DynamicParameters = [Management.Automation.RuntimeDefinedParameterDictionary]::new()            
    :nextInputParameter foreach ($paramName in ([Management.Automation.CommandMetaData]$baseCommand).Parameters.Keys) {
        if ($ExcludeParameter) {
            foreach ($exclude in $ExcludeParameter) {
                if ($paramName -like $exclude) { continue nextInputParameter}
            }
        }
        if ($IncludeParameter) {
            $shouldInclude = 
                foreach ($include in $IncludeParameter) {
                    if ($paramName -like $include) { $true;break}
                }
            if (-not $shouldInclude) { continue nextInputParameter }
        }
        
        $DynamicParameters.Add($paramName, [Management.Automation.RuntimeDefinedParameter]::new(
            $baseCommand.Parameters[$paramName].Name,
            $baseCommand.Parameters[$paramName].ParameterType,
            $baseCommand.Parameters[$paramName].Attributes
        ))
    }
    $DynamicParameters

    }
        process {
        $myParameterCopy = [Ordered]@{} + $PSBoundParameters                
        $myParameterCopy.Remove('Text')
        $myParameterCopy.Remove('CornerRadius')
        $myParameterCopy.Remove('HoverCornerRadius')
        $myParameterCopy.Remove('HoverAnimationDuration')
        $myParameterCopy.Remove('ClickAnimationDuration')
        $myParameterCopy.Remove('ClickCornerRadius')
        $myParameterCopy.Remove('BackgroundFill')
        $myParameterCopy.Remove('BorderStroke')
        $myParameterCopy.Remove('BorderThickness')
        $myParameterCopy.Remove('TextColor')
        $myParameterCopy.Remove('ButtonText')
        $myParameterCopy.Remove('ButtonWidth')
        $myParameterCopy.Remove('ButtonHeight')
        $myParameterCopy.Remove('ButtonText')
        $AnimateHoverSplat = [Ordered]@{            
            Dur = $HoverAnimationDuration.TotalSeconds
            Fill = 'freeze'                        
        }
        $AnimateHoverStart = [Ordered]@{
            Begin = 'mouseover'
            Values = "$($CornerRadius);$($HoverCornerRadius)"
        } + $AnimateHoverSplat

        $animateHoverEnd = [Ordered]@{
            Begin = 'mouseout'
            Values = "$($HoverCornerRadius);$($CornerRadius)"
        } + $AnimateHoverSplat
        
        
        $FontSize = if (-not $myParameterCopy.FontSize) {
            '3em'
        } else {
            $myParameterCopy.FontSize
        }

        

        $buttonContent = @(
            if (-not $myParameterCopy.Content) {
                $buttonWidthNumber = ($ButtonWidth -replace '[\D-[\.]]','') -as [double]
                $buttonHeightNumber = ($ButtonHeight -replace '[\D-[\.]]','') -as [double]                
                $buttonX = (100 - $buttonWidthNumber) / 2
                $buttonY = (100 - $buttonHeightNumber) / 2
                SVG.rect -X "$buttonX%" -Y "$buttonY%" -Width $buttonWidth -Height $buttonHeight @(
                    SVG.animate -AttributeName rx @AnimateHoverStart
                    SVG.animate -AttributeName ry @AnimateHoverStart                    
                    SVG.animate -AttributeName rx @animateHoverEnd
                    SVG.animate -AttributeName ry @animateHoverEnd
                    SVG.animate -AttributeName rx -Values "$($CornerRadius);$($ClickCornerRadius);$($CornerRadius)" -Dur "$($ClickAnimationDuration.TotalSeconds)s" -Begin 'click'
                    SVG.animate -AttributeName ry -Values "$($CornerRadius);$($ClickCornerRadius);$($CornerRadius)" -Dur "$($ClickAnimationDuration.TotalSeconds)s" -Begin 'click'
                ) -Stroke $BorderStroke -StrokeWidth $BorderThickness -Fill $BackgroundFill
                
            } else {
                $myParameterCopy.Content
            }
            if ($buttonText) {
                SVG.text -X 50% -Y 50% -TextAnchor middle -AlignmentBaseline 'middle' -DominantBaseline 'middle' -Style "user-select:none" -Content @(
                    $ButtonText
                    
                ) -Fill $TextColor
                SVG.animate -AttributeName font-size -Values "$FontSize;$HoverFontSize" -Dur "$($HoverAnimationDuration.TotalSeconds)s" -Begin 'mouseover'
                SVG.animate -AttributeName font-size -Values "$HoverFontSize;$fontSize" -Dur "$($HoverAnimationDuration.TotalSeconds)s" -Begin 'mouseover'
                SVG.animate -AttributeName font-size -Values "$FontSize;$ClickFontSize;$FontSize" -Dur "$($ClickAnimationDuration.TotalSeconds)s" -Begin 'click'
                SVG.set -AttributeName font-size -To $FontSize -Fill freeze
            }
        )
        
        $myParameterCopy['Content'] = $buttonContent
        SVG.a -Content $buttonContent @myParameterCopy
        
    
    }
}

