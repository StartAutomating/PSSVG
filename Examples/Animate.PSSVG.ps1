#requires -Module PSSVG

$original = @"
<svg viewBox="0 0 10 10" xmlns="http://www.w3.org/2000/svg">
  <rect width="10" height="10">
    <animate attributeName="rx" values="0;5;0" dur="10s" repeatCount="indefinite" />
  </rect>
</svg>
"@

=<svg> -ViewBox 0,0,10,10 (
    =<svg.rect> -Width 10 -Height 10 (
        =<svg.animate> -AttributeName rx -Values "0;5;0" -Dur "10s" -RepeatCount indefinite
    )    
) -OutputPath (Join-Path $psScriptRoot Animate.svg)

