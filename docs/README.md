### PSSVG

PowerShell tools for SVG.

PSSVG helps you create Scalable Vector Graphics using PowerShell.


There is a command for every tag of the SVG standard, complete with help and tab completion for every parameter.


For example, this script generates the image below it.

~~~PowerShell
=<svg> (
    =<svg.text> -Y 50 -Text "Hello World" -Fill "#4488FF"
) -ViewBox 0,0,200,100 -OutputPath .\HelloWorld.svg
~~~
![HelloWorld](HelloWorld.svg)

PSSVG is designed to act as a fairly complete domain specific language:  every aspect of the SVG standard should be reflected in the commands of PSSVG.

The following elements are supported:


|Element            |Function                                              |Aliases                   |
|-------------------|------------------------------------------------------|--------------------------|
|a                  |[SVG.a](SVG.a.ps1)                                    |=<svg.a>                  |
|animate            |[SVG.animate](SVG.animate.ps1)                        |=<svg.animate>            |
|animateMotion      |[SVG.animateMotion](SVG.animateMotion.ps1)            |=<svg.animateMotion>      |
|animateTransform   |[SVG.animateTransform](SVG.animateTransform.ps1)      |=<svg.animateTransform>   |
|circle             |[SVG.circle](SVG.circle.ps1)                          |=<svg.circle>             |
|clipPath           |[SVG.clipPath](SVG.clipPath.ps1)                      |=<svg.clipPath>           |
|defs               |[SVG.defs](SVG.defs.ps1)                              |=<svg.defs>               |
|desc               |[SVG.desc](SVG.desc.ps1)                              |=<svg.desc>               |
|discard            |[SVG.discard](SVG.discard.ps1)                        |=<svg.discard>            |
|ellipse            |[SVG.ellipse](SVG.ellipse.ps1)                        |=<svg.ellipse>            |
|feBlend            |[SVG.feBlend](SVG.feBlend.ps1)                        |=<svg.feBlend>            |
|feColorMatrix      |[SVG.feColorMatrix](SVG.feColorMatrix.ps1)            |=<svg.feColorMatrix>      |
|feComponentTransfer|[SVG.feComponentTransfer](SVG.feComponentTransfer.ps1)|=<svg.feComponentTransfer>|
|feComposite        |[SVG.feComposite](SVG.feComposite.ps1)                |=<svg.feComposite>        |
|feConvolveMatrix   |[SVG.feConvolveMatrix](SVG.feConvolveMatrix.ps1)      |=<svg.feConvolveMatrix>   |
|feDiffuseLighting  |[SVG.feDiffuseLighting](SVG.feDiffuseLighting.ps1)    |=<svg.feDiffuseLighting>  |
|feDisplacementMap  |[SVG.feDisplacementMap](SVG.feDisplacementMap.ps1)    |=<svg.feDisplacementMap>  |
|feDistantLight     |[SVG.feDistantLight](SVG.feDistantLight.ps1)          |=<svg.feDistantLight>     |
|feDropShadow       |[SVG.feDropShadow](SVG.feDropShadow.ps1)              |=<svg.feDropShadow>       |
|feFlood            |[SVG.feFlood](SVG.feFlood.ps1)                        |=<svg.feFlood>            |
|feFuncA            |[SVG.feFuncA](SVG.feFuncA.ps1)                        |=<svg.feFuncA>            |
|feFuncB            |[SVG.feFuncB](SVG.feFuncB.ps1)                        |=<svg.feFuncB>            |
|feFuncG            |[SVG.feFuncG](SVG.feFuncG.ps1)                        |=<svg.feFuncG>            |
|feFuncR            |[SVG.feFuncR](SVG.feFuncR.ps1)                        |=<svg.feFuncR>            |
|feGaussianBlur     |[SVG.feGaussianBlur](SVG.feGaussianBlur.ps1)          |=<svg.feGaussianBlur>     |
|feImage            |[SVG.feImage](SVG.feImage.ps1)                        |=<svg.feImage>            |
|feMerge            |[SVG.feMerge](SVG.feMerge.ps1)                        |=<svg.feMerge>            |
|feMergeNode        |[SVG.feMergeNode](SVG.feMergeNode.ps1)                |=<svg.feMergeNode>        |
|feMorphology       |[SVG.feMorphology](SVG.feMorphology.ps1)              |=<svg.feMorphology>       |
|feOffset           |[SVG.feOffset](SVG.feOffset.ps1)                      |=<svg.feOffset>           |
|fePointLight       |[SVG.fePointLight](SVG.fePointLight.ps1)              |=<svg.fePointLight>       |
|feSpecularLighting |[SVG.feSpecularLighting](SVG.feSpecularLighting.ps1)  |=<svg.feSpecularLighting> |
|feSpotLight        |[SVG.feSpotLight](SVG.feSpotLight.ps1)                |=<svg.feSpotLight>        |
|feTile             |[SVG.feTile](SVG.feTile.ps1)                          |=<svg.feTile>             |
|feTurbulence       |[SVG.feTurbulence](SVG.feTurbulence.ps1)              |=<svg.feTurbulence>       |
|filter             |[SVG.filter](SVG.filter.ps1)                          |=<svg.filter>             |
|foreignObject      |[SVG.foreignObject](SVG.foreignObject.ps1)            |=<svg.foreignObject>      |
|g                  |[SVG.g](SVG.g.ps1)                                    |=<svg.g>                  |
|image              |[SVG.image](SVG.image.ps1)                            |=<svg.image>              |
|line               |[SVG.line](SVG.line.ps1)                              |=<svg.line>               |
|linearGradient     |[SVG.linearGradient](SVG.linearGradient.ps1)          |=<svg.linearGradient>     |
|marker             |[SVG.marker](SVG.marker.ps1)                          |=<svg.marker>             |
|mask               |[SVG.mask](SVG.mask.ps1)                              |=<svg.mask>               |
|metadata           |[SVG.metadata](SVG.metadata.ps1)                      |=<svg.metadata>           |
|mpath              |[SVG.mpath](SVG.mpath.ps1)                            |=<svg.mpath>              |
|path               |[SVG.path](SVG.path.ps1)                              |=<svg.path>               |
|pattern            |[SVG.pattern](SVG.pattern.ps1)                        |=<svg.pattern>            |
|polygon            |[SVG.polygon](SVG.polygon.ps1)                        |=<svg.polygon>            |
|polyline           |[SVG.polyline](SVG.polyline.ps1)                      |=<svg.polyline>           |
|radialGradient     |[SVG.radialGradient](SVG.radialGradient.ps1)          |=<svg.radialGradient>     |
|rect               |[SVG.rect](SVG.rect.ps1)                              |=<svg.rect>               |
|script             |[SVG.script](SVG.script.ps1)                          |=<svg.script>             |
|set                |[SVG.set](SVG.set.ps1)                                |=<svg.set>                |
|stop               |[SVG.stop](SVG.stop.ps1)                              |=<svg.stop>               |
|style              |[SVG.style](SVG.style.ps1)                            |=<svg.style>              |
|svg                |[SVG.svg](SVG.svg.ps1)                                |=<svg> svg                |
|switch             |[SVG.switch](SVG.switch.ps1)                          |=<svg.switch>             |
|symbol             |[SVG.symbol](SVG.symbol.ps1)                          |=<svg.symbol>             |
|text               |[SVG.text](SVG.text.ps1)                              |=<svg.text>               |
|textPath           |[SVG.textPath](SVG.textPath.ps1)                      |=<svg.textPath>           |
|title              |[SVG.title](SVG.title.ps1)                            |=<svg.title>              |
|tspan              |[SVG.tspan](SVG.tspan.ps1)                            |=<svg.tspan>              |
|use                |[SVG.use](SVG.use.ps1)                                |=<svg.use>                |
|view               |[SVG.view](SVG.view.ps1)                              |=<svg.view>               |



(elements marked deprecated are not supported)

## Goals

PSSVG hopes to be a useful toolkit for generating SVG images from PowerShell.

SVG has many benefits as an image file format, for example:
* File Size
* Scalability
* Animations
* Clickability
* HTML/JavaScript/CSS integration
* OS Integration

However, it is not a complete programming language.

Thus the primary goal is to make SVG creation scriptable.

### Limitations 

At current, PSSVG does not support event or aria attributes.

### How PSSVG is Built

In order to provide an ideal PowerShell experience with rich help,  
PSSVG is currently built by reading the contents of the [Mozilla Developer Network's content repository](https://github.com/mdn/content).

It uses two PowerShell modules to read the repository and create the commands:

* [Irregular](https://github.com/StartAutomating/Irregular) is used to help parse the markdown contents of the repository
* [PipeScript](https://github.com/StartAutomating/PipeScript) is used to create the functions from the parsed data.





