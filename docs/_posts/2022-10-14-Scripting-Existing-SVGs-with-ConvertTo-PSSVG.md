---

title: Scripting Existing SVGs with ConvertTo PSSVG
author: StartAutomating
sourceURL: https://github.com/StartAutomating/PSSVG/issues/53
tag: enhancement
---
# ConvertTo-PSSVG 

PSSVG would be much more useful if it could easily convert any SVG off of the internet into a PSSVG file.

So, as of [PSSVG 0.2.4](https://pssvg.start-automating.com/2022/10/14/PSSVG-0.2.4/), you can ConvertTo-PSSVG

## What it does

ConvertTo-PSSVG takes an SVG from a file, url, string, or xml document and converts it into a PSSVG script.

For example, if I download the [feather icon](https://feathericons.com) for anchor and then run

~~~PowerShell
ConvertTo-PSSVG Anchor.svg
~~~

It will output:

~~~PowerShell
=<SVG> -width '24' -height '24' -viewBox '0 0 24 24' -fill 'none' -stroke 'currentColor' -strokewidth '2' -strokelinecap 'round' -strokelinejoin 'round' -class 'feather feather-anchor' -Content @(
    =<SVG.circle> -cx '12' -cy '5' -r '3'
    =<SVG.line> -x1 '12' -y1 '22' -x2 '12' -y2 '8'
    =<SVG.path> -d 'M5 12H2a10 10 0 0 0 20 0h-3'
)
~~~

## How it works

This is actually fairly trivial.  

First we get the XML form of the input, then we:

1. Go thru to the first node
2. Replace text nodes with their text.
3. Find the appropriate command
4. Replace attributes with parameters (if found)
5. Replace child nodes recursively (effectively goto step 1).

For bonus points, we indent.

## What we can do with this

Being able to ConvertTo-PSSVG gives you an easy way to integrate any existing design into your scripts.  This can help, say, [establish a visual leitmotif](https://pssvg.start-automating.com/2022/10/07/Making-a-Visual-Leitmotif-for-PowerShell-with-PSSVG/).  

Hope this Helps
