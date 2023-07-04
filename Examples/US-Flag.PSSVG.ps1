#requires -Module PSSVG

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
            "translate($(
                ($g * 2) + ($g * 2 * ((($_ -1) % 5)))
            ) $(
                ($e * 2) + (
                    $e * 2 * (([Math]::Floor(($_ - 1)/ 5)))
                )                
            ))"
        }
    
) -OutputPath (Join-Path $PSScriptRoot .\US-Flag.svg) -PreserveAspectRatio $true -Comment @'
Hoist (height) of the flag: A = 1.0
Fly (width) of the flag: B = 1.9[86]
Hoist (height) of the canton ("union"): C = 0.5385 (A × 7/13, spanning seven stripes)
Fly (width) of the canton: D = 0.76 (B × 2/5, two-fifths of the flag width)
E = F = 0.0538 (C/10, one-tenth of the height of the canton)
G = H = 0.0633 (D/12, one twelfth of the width of the canton)
Diameter of star: K = 0.0616 (approximately L × 4/5, four-fifths of the stripe width)
Width of stripe: L = 0.0769 (A/13, one thirteenth of the flag height)
'@ 
