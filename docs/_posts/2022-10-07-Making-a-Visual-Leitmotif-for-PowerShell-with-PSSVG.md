---

title: Making a Visual Leitmotif for PowerShell with PSSVG
author: StartAutomating
sourceURL: https://github.com/StartAutomating/PSSVG/issues/49
---
Because Start-Automating is a PowerShell shop, we have to make a lot of logos that visually hint at the relation between this project on PowerShell.

Doing this consistently across projects is a big benefit of building your assets with scripts.  Essentially, what we can do is create a reusable part of a design and reuse that part in project after project.

I call this sort of technique a "Visual Leitmotif" (a Leitmotif is a recurrent theme throughout a composition).

The SVG standard provides something that can make this a little easier, a Symbol.

Using PSSVG, we can create our Visual Leitmotif with just a few lines of code.

~~~PowerShell
=<svg> -ViewBox 100,100 -Content @(
    =<svg.symbol> -Id psChevron -Content @(
        =<svg.polygon> -Points (@(
            "40,20"
            "45,20"
            "60,50"
            "35,80"
            "32.5,80"
            "55,50"
        ) -join ' ')
    ) -ViewBox 100, 100

    =<svg.use> -Href '#psChevron' -Fill '[#4488](https://github.com/StartAutomating/PSSVG/issues/4488)ff'
)
~~~

The above code produces this little nifty graphic:

![PowerShell Cheron SVG](https://raw.githubusercontent.com/StartAutomating/PSSVG/main/Examples/PowerShellChevron.svg)

That's a nifty little image we can use again and again.

---

Here's the [ScriptDeck](https://github.com/StartAutomating/ScriptDeck) logo, which makes pretty prominent use of the PowerShell Chevron:

![ScriptDeck Logo](https://raw.githubusercontent.com/StartAutomating/ScriptDeck/main/Assets/ScriptDeck.svg)

---

Here it is again in the [GitPub](https://github.com/StartAutomating/GitPub) logo:

[![GitPub Logo](https://raw.githubusercontent.com/StartAutomating/GitPub/main/assets/GitPub.svg)](https://github.com/StartAutomating/GitPub/blob/main/GitPub.PSSVG.ps1)

---

And again in the [ugit](https://github.com/StartAutomating/ugit) logo:
[![ugit Logo](https://raw.githubusercontent.com/StartAutomating/ugit/main/assets/ugit.svg)](https://github.com/StartAutomating/ugit/blob/main/ugit.PSSVG.ps1)

---

And again in PSDevOps [PSDevOps](https://github.com/StartAutomating/PSDevOps) logo:
[![PSDevOps Logo](https://raw.githubusercontent.com/StartAutomating/PSDevOps/master/Assets/PSDevOps.svg)](https://github.com/StartAutomating/PSDevOps/blob/master/PSDevOps.PSSVG.ps1)


---
And, of course, in an updated [PSSVG](https://github.com/StartAutomating/PSSVG) logo:
[![PSSVG logo ](https://raw.githubusercontent.com/StartAutomating/PSSVG/main/Assets/PSSVG.svg)](https://github.com/StartAutomating/PSSVG/blob/main/PSSVG.PSSVG.ps1)

---


As a design technique, visual leitmotifs are a great way to remind people of a central brand without drawing too much attention to it.

With scripting, it's easy to establish that visual leitmotif and reuse it moving forward.

Just get it right once and include or copy and paste between project to project.

Hope this Helps
