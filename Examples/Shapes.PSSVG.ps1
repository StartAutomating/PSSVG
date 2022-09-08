=<svg> @(
    $animationSettings = @{
        Dur = '2s'
        RepeatCount='indefinite'
    }
    =<svg.circle> -CX 25 -CY 25 -r 10 -Fill black @(
        =<svg.animate> -values '1;10;1' -AttributeName r @animationSettings
    )
    =<svg.rect> -X 0 -Y 50 -Width 50 -Height 50 -Fill Black @(
        =<svg.animate> -values '0;50;0' -AttributeName width @animationSettings
        =<svg.animate> -values '50;0;50' -AttributeName height @animationSettings
    )
    =<svg.ellipse> -Cx 25 -Cy 100 -Rx 10 -Ry 5 -Fill black @(
        =<svg.animate> -values '10;1;10' -AttributeName rx @animationSettings
        =<svg.animate> -values '5;10;5' -AttributeName ry @animationSettings
    )    
) -ViewBox 0, 0, 100, 150 -OutputPath (Join-Path $psScriptRoot Shapes.svg)
