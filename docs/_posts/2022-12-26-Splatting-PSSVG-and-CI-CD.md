---

title: Splatting PSSVG and CI CD
author: StartAutomating
sourceURL: https://github.com/StartAutomating/PSSVG/issues/74
tag: FAQ
---
I'm using PSSVG in workflows _a lot_.  Almost every project gets a logo, and PSSVG is a really great way to ensure that the logo is always up-to-date and where it needs to be.

Additionally, I've been using a PowerShell technique to help improve consistency within SVGs:  Splatting.

Splatting is when you provide a dictionary or list of parameters to a command in PowerShell.

So, for instance, I could write:

~~~PowerShell
SVG.text -FontSize 12 -FontFamily monospace -Content "Hello World"
~~~

Or I could write:

~~~PowerShell
$FontSettings = @{FontSize=12;FontFamily="Monospace"}
SVG.text @FontSettings -Content "Hello World"
~~~

Why do things that second way?  Well, imagine if you decided you didn't like the font.  Would you like to change your code in N places, or in 1?

Hopefully the benefit of this approach is now clear.

Unfortunately, I've discovered a slight drawback which will require a bit of explaining.

In PowerShell, you create hashtables with `@{}`, and _ordered hashtables can be created with `[ordered]@{}`.

Why are there two ways to do this?

Because .NET hashtables do not guarantee order.

Why do we care?

Because, when we use an unordered hashtable to splat, the parameters might be passed in different orders.

In turn, this means git will see the file as having changed, even if it hasn't visually changed at all.

That means that when you we run PSSVG in CI-CD and use splatting, we'll sometimes see random checkins.

This is _really_ easy to work around.

Make sure your hashtables `@{}` are `[ordered]@{}`.

Hope this Helps!
