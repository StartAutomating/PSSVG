SVG.MathML
----------

### Synopsis
Embeds MathML in SVG.

---

### Description

Embeds MathML content in an SVG image.

---

### Examples
Embeds X + Y in an SVG image.    

```PowerShell
SVG (    
    SVG.MathML -Display block -Content "<math xmlns='http://www.w3.org/1998/Math/MathML'><mrow><mi>x</mi><mo>+</mo><mi>y</mi></mrow></math>"    
) -OutputPath .\XPlusY.svg
```

---

### Syntax
```PowerShell
SVG.MathML [<CommonParameters>]
```
