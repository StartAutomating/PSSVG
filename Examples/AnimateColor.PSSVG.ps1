#requires -Module PSSVG

SVG -Content @(
    SVG.circle -cx 50 -cy 50 -r 50 -Fill red @(
        SVG.animate -AttributeName fill -dur 10s -Values 'red;orange;yellow;green;blue;indigo;violet;red' -RepeatCount indefinite -begin 1s
        SVG.animate -AttributeName stroke -dur 10s -Values 'orange;yellow;green;blue;indigo;violet;red;orange' -RepeatCount indefinite -begin 1s
    ) -Stroke orange    
)  -ViewBox 0,0,100,100 -OutputPath (Join-Path $psScriptRoot AnimateColor.svg)
