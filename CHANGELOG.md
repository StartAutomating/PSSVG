### PSSVG 0.2.10:

* Write-SVG - Fixing -ViewBox for string values (#127)
* Adding -ShapeName and many aliases to SVG.ConvexPolygon (#132)
* Adding HexagonPattern Example (#133)
* Adding more RepeatedShapes (with less black background) (#129)

---

### PSSVG 0.2.9:

* New Examples:
  * US-Flag / US-FlagAnimated (#118) (Happy 4th!)
* PSSVG Can Now Be Sponsored (#119) (please show your support)
* Improved Pipeline Friendliness
  * Commands support ValueFromPipelineByPropertyName (#124)
  * Added -Comment (#112), -Children (#116) to all commands.
* New Shapes!
  * SVG.Kite (Fixes #111)
  * SVG.Rhombus (Fixes #110)
* Shape Updates
  * SVG.ConvexPolygons are now closed (#106)  
* Build Fixes
  * Filtering Examples More Effectively (#123)
  * Skipping parameter validation when there are unknowns (#107)
* ConvertTo-PSSVG:
  * Improving Fault Tolerance (#102)
  * Not Using Tag Form (#117)
* Write-SVG
  * Added -Comment (#112), -Children (#116)
  * -ViewBox Improvements (#105)
  * Empty Element Improvement (#113)
  * Not rendering integer content (#112)
  * Leaving a note (#99)

---

### PSSVG 0.2.8:

* General Improvements:
  * General Event support on every command with -On (Fixes #91)
  * Reduced Warnings in GitHub Action (Fixes #94)
* New Commands:
  * SVG.ANSI (Fixes #82)
  * SVG.StyleSheet (Fixes #83)
  * SVG.GoogleFont (Fixes #84)
  * Demystifying Path syntax
    * SVG.ArcPath (Fixes #80)
    * SVG.CurvePath (Fixes #81)
    * SVG.LinePath (Fixes #90)
* Pipeline improvements:
  * Allowing -Content to be provided from the pipeline 
  * Removing 'Attributes' parameter alias (Fixes #85)
* Command Improvements
  * SVG.Sprial can -ScaleX/-ScaleY (Fixes #77)
* Example Updates
  * New Examples
  * Examples avoid tag-style syntax (Fixes #95)

---

### PSSVG 0.2.7:
* Adding SVG.Star (Fixes #68)
* Fixing OutputPath issue (Fixes #67)
* Renaming SVG.RegularPolygon to SVG.ConvexPolygon (Fixes #70)
* Improving README and docs

---

### PSSVG 0.2.6:
* Adding SVG.RegularPolygon (Fixes #65)

---

### PSSVG 0.2.5:
* ConvertTo-PSSVG improvements:
  * Better at handling malformed XML (#59)
  * Better at handling file input (#60, #61)

---

### PSSVG 0.2.4:
* Adding ConvertTo-PSSVG (Fixes #53)
* Updated Logo to use PowerShell Chevron (Fixes #52)
* Using [GitPub](https://github.com/StartAutomating/GitPub) to generate blog (Fixes #51)

---

### PSSVG 0.2.3:
* Adding SVG.Triangle (#47)
* Updating SVG.DropShadow (#48)
* Adding PowerShell Chevron Example (#49)

---

### PSSVG 0.2.2:
* More Examples:  
  * Blur (#39)
  * BPMAnimate/Morph (#40)
  * DropShadow (#43)
  * Morphing (#36)
  * SweepCircle (#44)
* Added new custom SVG commands:
  * SVG.Spiral (Fixes #42 Fixes #41)
  * SVG.DropShadow (Fixes #43 Fixes #41)
* Generator Improvements:
  * All commands now have -Attribute (Fixes #32)
  * Improved Generation of attributes with multiple contexts (Fixes #31)
* Write-SVG improvements:
  * Outputs objects by default (Fixes #33) (with nice formatting (Fixes #35))
  * Prettifies -OutputPath (Fixes #45)
  * Handles [TimeSpan] values (Fixes #34)

---

### PSSVG 0.2.1
* Improved Command Help
  * Adding More Examples (Fixes #21)
  * Adding Example/README.md (Fixes #26)
* Write-SVG: Allowing 2 value ViewBox (Fixes #28)
* All SVG.* commands allow elements (Fixes #25 )
* All SVG.* commands now have argument completers (Fixes #24)

---           

### PSSVG 0.2
* All SVG. commands now support -Data attributes (Fixes #12)
* Improved Command Help
  * Linking to docs and MDN (Get-Help SVG.a -Online) (Fixes #15)
  * Adding .Examples (Fixes #18)  
* Adding Write-SVG (Fixes #14)

---

### PSSVG 0.1
* Initial Release of PSSVG, including:
  * A command for every SVG element (fixes #1)
  * Lots of examples (fixes #2)
  * CI/CD (fixes #3) with tests (fixes #4)
  * automatically generated documentation (fixes #5), thanks to [HelpOut](https://github.com/StartAutomating/HelpOut)
  * A GitHub action (fixes #6), thanks to [PSDevOps](https://github.com/StartAutomating/PSDevOps)
  * It's own logo (fixes #7)
  * The script used to generate every SVG element (fixes #8)
  * [A github page](https://PSSVG.start-automating.com) (fixes #9)

---