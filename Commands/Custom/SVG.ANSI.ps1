function SVG.ANSI {
    <#
    
    .SYNOPSIS    
        SVG ANSI Text    
    .DESCRIPTION    
        Renders Text containing ANSI escape sequences as SVG.        
    .LINK    
        SVG.svg    
    
    #>
        
    param(
    # The spacing between lines, in font-emphasis.    
    # By default, 1.2.    
    [Parameter(ValueFromPipelineByPropertyName)]
    [double]
    $LineSpacing = 1.2,

    # The foreground color.  By default, white.    
    # All elements that use the -ForegroundColor will also use the CSS class foreground-fill.        
    [string]$ForegroundColor = 'white',

    # The background color.  By default, black.    
    # All items colored in black will also use the class background-fill.    
    [string]$BackgroundColor = 'black',

    <#    
    The console color palette.    
        
    ANSI colors use a 3 bit palette (0-7), with an additional bit for brightness.    
        
    This array contains default color used to fill each of the items in a 3-bit palette.    
        
    By default, in order:    
    
    * black    
    * red    
    * green    
    * yellow    
    * blue    
    * magenta    
    * cyan    
    * white    
    
    Each 3 or 4 bit ANSI color will also use the css class ansi$n-fill, where n is a number between 0 and 15.    
    #>    
        
    [string[]]
    $ConsolePalette = @("black", "red", "green","yellow", "blue", "magenta", "cyan", "white")
    )
    dynamicParam {
    $baseCommand = 
        if (-not $script:SVGSvg) {
            $script:SVGSvg = 
                $executionContext.SessionState.InvokeCommand.GetCommand('SVG.Svg','Function')
            $script:SVGSvg
        } else {
            $script:SVGSvg
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
        begin {
        # We start off by declaring a big Regex to match ANSI Styles.
        # (thanks [Irregular](https://github.com/StartAutomating/Irregular) ! )
        ${?<ANSI_Style>} = [Regex]::new(@'
        (?>
          (?<ANSI_Reset>
        \e                                                                                     # An Escape
        \[                                                                                     # Followed by a bracket
        (?<Reset>0m)                                                                           # 0m indicates reset
        
        )
          |
          (?<ANSI_Bold>
        \e                                                                                     # An Escape
        \[                                                                                     # Followed by a bracket
        (?>
          (?<BoldStart>1m)  |
          (?<BoldEnd>22m))
        )
          |
          (?<ANSI_Blink>
        \e                                                                                     # An Escape
        \[                                                                                     # Followed by a bracket
        (?>
          (?>
          (?<BlinkStart>(?<BlinkSlow>5m)                                                       # 5m starts a slow blink
            |
            (?<BlinkFast>6m)                                                                   # 6m starts a slow blink
        ))  |
          (?<BlinkEnd>25m)                                                                     # 25m stops blinks
        )
        )
          |
          (?<ANSI_Faint>
        \e                                                                                     # An Escape
        \[                                                                                     # Followed by a bracket
        (?>
          (?<FaintStart>2m)                                                                    # 2m starts faint
          |
          (?<FaintEnd>22m)                                                                     # 22m stops faint
        )
        )
          |
          (?<ANSI_Italic>
        \e                                                                                     # An Escape
        \[                                                                                     # Followed by a bracket
        (?>
          (?<ItalicStart>3m)                                                                   # 3m starts italic
          |
          (?<ItalicEnd>23m)                                                                    # 23m stops italic
        )
        )
          |
          (?<ANSI_Invert>
        \e                                                                                     # An Escape
        \[                                                                                     # Followed by a bracket
        (?>
          (?<InvertStart>7m)                                                                   # 7m starts invert
          |
          (?<InvertEnd>27m)                                                                    # 27m stops invert
        )
        )
          |
          (?<ANSI_Hide>
        \e                                                                                     # An Escape
        \[                                                                                     # Followed by a bracket
        (?>
          (?<HideStart>8m)                                                                     # 8m starts hide
          |
          (?<HideEnd>28m)                                                                      # 28m stops hide
        )
        )
          |
          (?<ANSI_Strikethrough>
        \e                                                                                     # An Escape
        \[                                                                                     # Followed by a bracket
        (?>
          (?<StrikethroughStart>9m)                                                            # 9m starts Strikethrough
          |
          (?<StrikethroughEnd>29m)                                                             # 29m stops Strikethrough
        )
        )
          |
          (?<ANSI_Underline>
        \e                                                                                     # An Escape
        \[                                                                                     # Followed by a bracket
        (?>
          (?<UnderlineStart>4m)                                                                # 4m starts underline
          |
          (?<DoubleUnderlineStart>21m)                                                         # 21m start a double underline
          |
          (?<UnderlineEnd>24m)                                                                 # 24m stops underline
        )
        )
          |
          (?<ANSI_24BitColor>
        (?-i)\e                                                                                # An Escape
        \[                                                                                     # Followed by a bracket
        (?>
          (?<IsForegroundColor>38)  |
          (?<IsBackgroundColor>48)  |
          (?<IsUnderlineColor>58));2;(?<Color>(?<Red>(?>[0-2][0-5][0-5]|[0-1]\d\d|\d{1,2}))    # Red is the first 0-255 value
        ;(?<Green>(?>[0-2][0-5][0-5]|[0-1]\d\d|\d{1,2}))                                       # Green is the second 0-255 value
        ;(?<Blue>(?>[0-2][0-5][0-5]|[0-1]\d\d|\d{1,2}))                                        # Blue is the third 0-255 value
        m)
        )
          |
          (?<ANSI_8BitColor>
        (?-i)\e                                                                                # An Escape
        \[                                                                                     # Followed by a bracket
        (?>
          (?<IsForegroundColor>38)  |
          (?<IsBackgroundColor>48)  |
          (?<IsUnderlineColor>58));5;(?<Color>(?>
          (?<StandardColor>[0-7])                                                              # 0 -7 are standard colors
        m  |
          (?<BrightColor>(?>[8-9]|1[0-5]))                                                     # 8-15 are bright colors
        m  |
          (?<CubeColor>(?>[0-2][0-3][0-1]|[0-1]\d\d|\d{1,2}))                                  # 16-231  are cubed colors
        m  |
          (?<GrayscaleColor>(?>[0-2][0-5][0-5]|[0-1]\d\d|\d{1,2}))                             # 232-255 are grayscales
        m))
        )
          |
          (?<ANSI_4BitColor>
        \e                                                                                     # An Escape
        \[                                                                                     # Followed by a bracket
        (?<Color>(?>
          (?<IsBright>1)?\;{0,1}                                                               # A 1 and a semicolon indicate a bright color
        (?<IsForegroundColor>3)                                                                # A number that starts with 3 indicates foreground color
          |
          (?<IsBright>(?<IsForegroundColor>9))                                                 # OR it could be a less common bright foreground color, which starts with 9
          |
          (?<IsBright>1)?\;{0,1}                                                               # A 1 and a semicolon indicate a bright color
        (?<IsBackgroundColor>4)                                                                # A number that starts with 3 indicates foreground color
          |
          (?<IsBright>(?<IsBackgroundColor>10))                                                # OR it could be a less common bright foreground color, which starts with 9
        )(?<ColorNumber>[0-7])                                                                 # The color number will be between 0 and 7
        (?:\;{0,1}(?<IsBright>1)?)?                                                            # Brightness can also come after a color
        m)
        )
          |
          (?<ANSI_DefaultColor>
        (?-i)\e                                                                                # An Escape
        \[                                                                                     # Followed by a bracket
        (?<Color>(?>
          (?<DefaultForeground>39)                                                             # 39 Represents the default foreground color
        m  |
          (?<DefaultForeground>49)                                                             # 49 Represents the default background color
        m))
        )
        )
'@, 'IgnoreCase,IgnorePatternWhitespace', '00:00:05')

        $allContent = @()
    
    }
        process {
        # We collect all piped in content
        $allContent += $psBoundParameters['Content']
    
    }
    end {
               
        $content = $allContent
        if (-not $Content) { return }
        # Default the font size to 12 if not provided.
        $fontSize = 
            if ($psBoundParameters['FontSize']) {
                ($psBoundParameters['FontSize'] -replace '[\D - [\.]]') -as [double]
            } else { 12 }

        # Set up a 'base' splat of all settings we always want to provide.
        $styleSplatBase = [Ordered]@{
            XmlSpace = 'preserve'        
        }
        # Create a copy of that splat for the current style.    
        $styleSplat = [Ordered]@{} + $styleSplatBase
        # and prepare to go thru the string.
        $index = 0
        $contentString = $content -join [Environment]::NewLine
        # We'll need a bunch of SVG 'spans' (TSpans, to be exact)
        $svgSpans = @()
        # We'll need to know what line number we're on
        $lineNumber = 0
        # how long each line is.
        $lineLength = 0
        # and what the longest line is.
        $maxLineLength = 0
        # We also want to force -LineSpacing into 'emphasis' units.
        $lineSpacer = "${lineSpacing}em"

        # Now find all ANSI Styles
        $ansiStyleMatches = @(${?<ANSI_Style>}.Matches($Content))
        if ($ansiStyleMatches) {
            # If there were any replace them and figure out how many lines of actual content we have
            $totalLines = @(${?<ANSI_Style>}.Replace($content, '') -split '(?>\r\n|\n)' -ne '')
            foreach ($lineToCount in $totalLines) {
                # and what is the longest line.
                if ($maxLineLength -lt $lineToCount.Length) {
                    $maxLineLength = $lineToCount.Length
                }
            }
        } else {
            # Otherwise, make sure we count how many lines we have in total, so we can set the viewbox.
            $totalLines = @($content -split '(?>\r\n|\n)' -ne '')
        }

        # Walk over each match
        foreach ($match in $ansiStyleMatches) {
            # Find all of the ext between now and the last match.
            $textSpan = if ($match.Index -gt $index) {
                $contentString.Substring($index, $match.Index  - $index)
            } else { '' }
            $index = $match.Index + $match.Length
            # If there was any previous text, now we turn it into a span.
            if ($textSpan) {
                $textSpanLines = @($textSpan -split '(?>\r\n|\n)')
                # Or, more properly, _several_ spans, spending on how many lines it crosses.
                for ($textSpanLineNumber = 0; $textSpanLineNumber -lt $textSpanLines.Length; $textSpanLineNumber++) {
                  $lineLength   = $textSpanLines[$textSpanLineNumber].Length
                  if ($maxLineLength -lt $lineLength) {
                      $maxLineLength = $lineLength
                  }
                  $textSpanLine = $textSpanLines[$textSpanLineNumber]
                    
                  $svgSpans +=                  
                      if ($textSpanLineNumber) {
                          =<svg.tspan> -Content $textSpanLine @styleSplat -Dy $lineSpacer -X 0
                          $lineNumber++
                      } else {
                          if ($svgSpans[-1].InnerText) {
                              =<svg.tspan> -Content $textSpanLine @styleSplat -DX '-.5em'
                          } else {
                              =<svg.tspan> -Content $textSpanLine @styleSplat
                          }                                
                      }
                }                
            }

            # If the result was followed by a newline
            if ($match.Result('$`') -match '[\r\n]$') {
                # create one more span to drop the line down.
                $svgSpans += =<svg.tspan> -Content ([Environment]::NewLine) @styleSplat -Dy $lineSpacer -X 0 
                $lineNumber++
            }
            
            # Now we apply various ANIS styles to change the current style.

            # If we're Resetting
            if ($match.Groups['Reset'].Success) {
                $styleSplat = @{} + $styleSplatBase # reset the splat.
            }

            # If we're starting bold or are a 'bright' color
            if ($match.Groups['BoldStart'].Success -or $match.Groups['IsBright'].Success) {
                $styleSplat.FontWeight = 'Bold' # make the font bold.
            }
            # If we're stopping bold.
            if ($match.Groups['BoldEnd'].Success) {
                $styleSplat.Remove('FontWeight') # make the font unbold.
            }
            # If we're rendering faintly
            if ($match.Groups['FaintStart'].Success) {
                $styleSplat.Opacity = 0.5 # make it half opacity.
            }
            # If we're no longer rendering faintly
            if ($match.Groups['FaintEnd'].Success) {
                $styleSplat.Remove('Opacity') # Make it normal opacity.
            }
            # If it should be italic
            if ($match.Groups['ItalicStart'].Success) {
                $styleSplat.FontStyle = 'Italic' # make it so.
            }
            # If it should no longer be italic.
            if ($match.Groups['ItalicEnd'].Success) {
                $styleSplat.Remove('FontStyle') # make it so.
            }

            # If it should be hidden
            if ($match.Groups["HideStart"].Success) {
                $styleSplat.Opacity = 0 # drop opacity to 0.
            }
            # If it should no longer be hidden
            if ($match.Groups['HideEnd'].Success) {
                $styleSplat.Remove('Opacity') # remove opacity.
            }
            # If it should be struck thru
            if ($match.Groups['StrikethroughStart'].Success) {
                $styleSplat.TextDecoration = 'line-through' # add the line-through text decoration.
            }
            # If it should no longer be struck thru
            if ($match.Groups['StrikethroughEnd'].Success) {
                $styleSplat.Remove('TextDecoration') # remove the text decoration.
            }
            # For the moment, both double and single underline
            if ($match.Groups['UnderlineStart'].Success -or 
                $match.Groups['DoubleUnderlineStart'].Success) {
                $styleSplat.TextDecoration = 'underline' # will simply underline.
            }
            # And the end of an underling
            if ($match.Groups['UnderlineEnd'].Success) {
                $styleSplat.Remove('TextDecoration') # should remove all text decorations.
            }
            # For 24-bit color
            if ($match.Groups['ANSI_24BitColor'].Success) {
                # Parse out the foreground color
                if ($match.Groups["IsForegroundColor"].Success) {
                    # and set that as the fill.
                    $styleSplat.Fill = "#{0:x2}{1:x2}{2:x2}" -f @(
                        $match.Groups['Red'].Value, $match.Groups['Green'].Value, $match.Groups['Blue'].Value -as [int[]]
                    )
                }
                if ($match.Groups["IsBackgroundColor"].Success) {
                    # There's nothing to be done about background colors without a lot of pain
                    # since background colors are not an aspect of SVG text.
                    <#
                    if (-not $styleSplat.Style) { $styleSplat.Style = @{} }
                    $styleSplat.Style.'background-color' = "#{0:x2}{1:x2}{2:x2}" -f @(
                        $match.Groups['Red'].Value, $match.Groups['Green'].Value, $match.Groups['Blue'].Value -as [int[]]
                    )
                    #>
                }
            }

            # If we had a 4-bit color
            if ($match.Groups["ANSI_4BitColor"].Success) {
                # determine the color number
                $colorNumber = $match.Groups["ColorNumber"].Value -as [int]
                # and find it's name in the -ConsolePalette.
                $realColor = $ConsolePalette[$colorNumber]
                if ($match.Groups["IsForegroundColor"].Success) {
                    # The named color is what we set for -Fill
                    $styleSplat.Fill = $realColor
                    # and we also set a css class, so we can stylize the color scheme
                    # with something like [4bitcss](https://4bitcss.com).
                    $cssClassName = @(
                        $styleSplat.Class
                        if ($match.Groups["IsBright"].Success) {
                            "ansi" + ($colorNumber + 8) + "-fill"
                        } else {
                            "ansi" + ($colorNumber) + "-fill"
                        }
                    ) -ne '' -join ' '
                    $styleSplat.Class = $cssClassName
                }

                # SVG text does not support background colors.
                # we can only paint a rectangle beneath the whole output.
                if ($match.Groups["IsBackgroundColor"].Success) {
                    if (-not $styleSplat.Style) { $styleSplat.Style = @{} }
                    # $styleSplat.Style.'background-color' = $realColor
                }
            }
            
            # If we're explicitly resetting the foreground color
            if ($match.Groups["DefaultForegroundColor"].Success) {
                $styleSplat.Remove('Fill') # clear the fill.
            }

            if ($match.Groups["DefaultBackgroundColor"].Success) {
                if ($styleSplat.Style.'background-color') {
                    $styleSplat.Style.Remove('background-color')
                }
            }            
        }

        # If we have anything left in the string, render it normally.
        if ($index -lt $contentString.Length) {            
            $textSpan = $contentString.Substring($index)
            # we still need to go line by line
            $textSpanLines = @($textSpan -split '(?>\r\n|\n)')
            for ($textSpanLineNumber = 0; $textSpanLineNumber -lt $textSpanLines.Length; $textSpanLineNumber++) {
                $textSpanLine = $textSpanLines[$textSpanLineNumber]
                # and it is possible we do not yet have a max line length (if no ANSI content was detected).
                if ($maxLineLength -lt $textSpanLine.Length) {
                    $maxLineLength = $textSpanLine.Length
                }
                $svgSpans += 
                    if ($textSpanLineNumber) {
                        =<svg.tspan> -Content $textSpanLine @styleSplat -Dy $lineSpacer -X 0
                        $lineNumber++
                    } else {
                        if ($svgSpans[-1].InnerText) {
                            =<svg.tspan> -Content $textSpanLine @styleSplat -DX '-.5em'
                        } else {
                            =<svg.tspan> -Content $textSpanLine @styleSplat
                        }                                
                    }
            }
        }

        # Now, copy my parameters.
        $myParams = [Ordered]@{} + $PSBoundParameters
        # and remove parameters that do not apply to the base command.
        $myParams.Remove('LineSpacing')
        $myParams.Remove('Content')
        if (-not $myParams.'FontFamily') {
            $myParams.FontFamily = 'Monospace'
        }
        # Make sure we set a default behavior for text fill.
        $textSplat = [Ordered]@{}
        $textSplat.Fill = $ForegroundColor
        if (-not $myParams.ViewBox) {
            $goldenRatio   = (1 + [Math]::Sqrt(5)) / 2
            $viewBoxHeight = [Math]::Ceiling(($maxLineLength * $fontSize)/$goldenRatio)
            $viewBoxWidth  = [Math]::Ceiling(($totalLines.Length + 2) * $fontSize * $LineSpacing)
            $myParams.ViewBox = "0 0 $viewBoxHeight $viewBoxWidth"
        }
        =<svg> @(
            # And drop in a background color rectangle if one was provided.
            if ($BackgroundColor -and $BackgroundColor -ne 'transparent') {
                # make it thrice as tall, and start at -100% (to remove vertical color bleeds)
                =<svg.rect> -Width 100% -Height 300% -Fill $BackgroundColor -Y -100%
            }          
            =<svg.text> -Content $svgSpans -FontSize $fontSize @textSplat
        ) @myParams
    
    }
}
