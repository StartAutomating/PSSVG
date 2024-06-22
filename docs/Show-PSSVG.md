Show-PSSVG
----------

### Synopsis

---

### Description

---

### Examples
> EXAMPLE 1

```PowerShell
Show-PSSVG -Content @(
	SVG -viewbox 200 @(
		SVG.Rect -Fill currentColor -Width 100 -Height 100
		SVG.Rect -Fill currentColor -Width 50 -Height 50 -X 100 -Y 100
	)	
) -CopyCount 4 > 4squared.html
```
> EXAMPLE 2

```PowerShell
if (-not $script:4bitcssPaletteList) {
	$script:4bitcssPaletteList = Invoke-RestMethod -Uri https://cdn.jsdelivr.net/gh/2bitdesigns/4bitcss@latest/docs/Palette-List.json
}
Show-PSSVG -Content @(
	$randomRoseMorph = SVG -Viewbox 200 @(
		@(
			$k = (Get-Random -Minimum 2 -Maximum 14)
			$r = ((Get-Random -Minimum 5 -Maximum 50) * 5)
			$rose1 = SVG.Rose -Frequency $k -Radius $r -Stroke currentColor
			$rose1
			SVG.Rose -Frequency ($k * (Get-Random -Min 1 -Max 2)) -Rotate (Get-Random -Min 0 -Max 360) -Radius ($r * 1.25) -CenterX 100 -CenterY 100  -Stroke currentColor
			$rose1
		) | SVG.Morph -dur 1.68 -repeatCount indefinite
	) -Width 100% -Height 100%
	$randomRoseMorph
) -PaletteName (
	$script:4bitcssPaletteList | Get-Random
) -CopyCount $(
	Get-Random -Minimum 2 -Maximum 9
) -RowCount $(
	Get-Random -Minimum 1 -Maximum 3
) -ColumnCount (
	Get-Random -Minimum 1 -Maximum 3
)  -In3D -CopyCount3D (
	Get-Random -Minimum 100 -Maximum 512
) -TransitionTime "00:00:00.42" -OrbitSpeed $(
	(Get-Random -Min 1 -Max 100)*.01
) -View3D (
	'table','cube','sphere','helix' | Get-Random
)  > 4.html
```
> EXAMPLE 3

```PowerShell
Show-PSSVG -Content @(
       SVG -Viewbox 200 @(
           @(
               $k = (Get-Random -Minimum 2 -Maximum 12)
               $r = ((Get-Random -Minimum 5 -Maximum 20) * 5)
               $rose1 = SVG.Rose -Frequency $k -Radius $r -Stroke currentColor
               $rose1
               SVG.Rose -Frequency ($k * (Get-Random -Min 1 -Max 3)) -Rotate (Get-Random -Min 0 -Max 360) -Radius ($r * 1.25)  -Stroke currentColor
               $rose1
           ) | SVG.Morph -dur 1.68 -repeatCount indefinite
       )        
   ) -PaletteName (
       $script:4bitcssPaletteList | Get-Random
   )  -CopyCount $(
       Get-Random -Minimum 2 -Maximum 8
   ) -RowCount $(
       Get-Random -Minimum 1 -Maximum 3
   ) -ColumnCount (
       Get-Random -Minimum 1 -Maximum 3
   )  -In3D -CopyCount3D (
       Get-Random -Minimum 100 -Maximum 512
   ) -TransitionTime "00:00:00.42" -OrbitSpeed $(
       (Get-Random -Min 1 -Max 100)*.01
   ) -View3D (
       'table','cube','sphere','helix' | Get-Random
   )  > 8.html
```
> EXAMPLE 4

```PowerShell
$bpm = 128
Show-PSSVG -Content @(
       SVG -ViewBox 200 @(
		@(
			# Because any polar equation uses an equal number of points, we can morph between them.
			$freq = Get-Random -min 2 -Max 16
			$rotate1 = Get-Random -min 0 -Max 360
			$rotate2 = Get-Random -min 0 -Max 360
			SVG.PolarEquation -Radius 100 -Equation { $Radius } -Fill currentColor -Fillrule evenodd
			SVG.PolarEquation -Radius 100 -Equation { $Radius * [Math]::Cos($Frequency * $Step * $Radian) } -Rotate $rotate1 -Data @{Frequency=$freq}
			SVG.PolarEquation -Radius 100 -Equation { $Radius }				
			SVG.PolarEquation -Radius 100 -Equation { $Radius * [Math]::Cos($Frequency * $Step * $Radian) } -Rotate $rotate1 -Data @{Frequency=$freq*2}				
			SVG.PolarEquation -Radius 100 -Equation { $Radius }
			SVG.PolarEquation -Radius 100 -Equation { $Radius * [Math]::Cos($Frequency * $Step * $Radian) } -Rotate $rotate1 -Data @{Frequency=$freq}
			SVG.PolarEquation -Radius 100 -Equation { $Radius }
		) | SVG.Morph -Dur (8*(60/$bpm)) -RepeatCount indefinite
   	) 	        
   ) -PaletteName (
       $script:4bitcssPaletteList | Get-Random
   )  -CopyCount $(
       Get-Random -Minimum 2 -Maximum 8
   ) -RowCount $(
       Get-Random -Minimum 1 -Maximum 3
   ) -ColumnCount (
       Get-Random -Minimum 1 -Maximum 3
   )  -In3D -CopyCount3D (
       Get-Random -Minimum 100 -Maximum 512
   ) -TransitionTime ([TimeSpan]::Frommilliseconds(30000 / $bpm)) -OrbitSpeed $(
       (Get-Random -Min 1 -Max 100)*.01
   ) -View3D (
       'cube','sphere','helix' | Get-Random
   )  -BeatPerMinute 128 -OnBeat "
	if ((beatCount % 8) == 0) { document.getElementById('sphere').click();}
	else if ((beatCount % 4) == 0) { document.getElementById('cube').click(); }
	else if ((beatCount % 2) == 0) { document.getElementById('random').click();}
" > b12.html
```

---

### Parameters
#### **Content**
The content to show.  This should be any number of SVG elements.

|Type          |Required|Position|PipelineInput |
|--------------|--------|--------|--------------|
|`[PSObject[]]`|false   |1       |true (ByValue)|

#### **Metadata**
Any metadata.  These will become `<meta>` tags in an HTML frame, or `<metadata>` elements in the SVG.

|Type          |Required|Position|PipelineInput        |
|--------------|--------|--------|---------------------|
|`[PSObject[]]`|false   |2       |true (ByPropertyName)|

#### **DataRow**
The data to show in the table.  This should be an array of objects.

|Type          |Required|Position|PipelineInput        |Aliases               |
|--------------|--------|--------|---------------------|----------------------|
|`[PSObject[]]`|false   |3       |true (ByPropertyName)|DataRows<br/>DataTable|

#### **Title**
The title of the SVG or the HTML frame.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |4       |true (ByPropertyName)|

#### **CopyCount**
The number of copies of each item to show.

|Type     |Required|Position|PipelineInput        |Aliases                 |
|---------|--------|--------|---------------------|------------------------|
|`[Int32]`|false   |5       |true (ByPropertyName)|NumberOfCopies<br/>Count|

#### **RowCount**
The number of rows to display.
If this is not provided, it will be calculated based on the number of columns.
If columns are not provided, it will be calculated based on the number of copies.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |6       |true (ByPropertyName)|

#### **ColumnCount**
The number of columns to display.
If this is not provided, it will be calculated based on the number of rows.
If rows are not provided, it will be calculated based on the number of copies.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |7       |true (ByPropertyName)|

#### **Overlap**
If set, will overlap multiple content items in 2d or 3d.  
By default, multiple content items will be interleaved.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|

#### **PaletteName**
The name of the palette.

|Type      |Required|Position|PipelineInput        |Aliases                                 |
|----------|--------|--------|---------------------|----------------------------------------|
|`[String]`|false   |8       |true (ByPropertyName)|Palette<br/>ColorScheme<br/>ColorPalette|

#### **FontName**
The [Google Font](https://fonts.google.com/) name.

|Type      |Required|Position|PipelineInput        |Aliases   |
|----------|--------|--------|---------------------|----------|
|`[String]`|false   |9       |true (ByPropertyName)|GoogleFont|

#### **CodeFont**
The Google Font name to use for code blocks.
(this should be a [monospace font](https://fonts.google.com/?classification=Monospace))

|Type      |Required|Position|PipelineInput        |Aliases                                 |
|----------|--------|--------|---------------------|----------------------------------------|
|`[String]`|false   |10      |true (ByPropertyName)|PreFont<br/>CodeFontName<br/>PreFontName|

#### **In3D**
If set, will render a 3D scene containing each of the SVG elements.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|

#### **View3D**
The default 3d view of the items.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |11      |true (ByPropertyName)|

#### **CopyCount3D**
The number of copies of each item to show in the 3D scene.
If this is not provided, it will be the number of items in the table.
If this is provided, the table will be repeated as necessary.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |12      |true (ByPropertyName)|

#### **SpatialProperty**
The spatial property map for the 3D scene.
This maps the data properties to the spatial properties.
Values can be provided as a dictionary or object.

|Type        |Required|Position|PipelineInput        |Aliases                                                          |
|------------|--------|--------|---------------------|-----------------------------------------------------------------|
|`[PSObject]`|false   |13      |true (ByPropertyName)|SpatialProperties<br/>SpatialPropertyMap<br/>SpatialPropertiesMap|

#### **CameraX**
The X position of the camera.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Double]`|false   |14      |true (ByPropertyName)|

#### **CameraY**
The Y position of the camera.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Double]`|false   |15      |true (ByPropertyName)|

#### **CameraZ**
The Z position of the camera.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Double]`|false   |16      |true (ByPropertyName)|

#### **Near**
The near clipping plane of the camera.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Double]`|false   |17      |true (ByPropertyName)|

#### **Far**
The far clipping plane of the camera.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Double]`|false   |18      |true (ByPropertyName)|

#### **OrbitSpeed**
The speed at which the camera will automatically orbit the scene.

|Type      |Required|Position|PipelineInput        |Aliases        |
|----------|--------|--------|---------------------|---------------|
|`[Double]`|false   |19      |true (ByPropertyName)|AutoRotateSpeed|

#### **OrbitNear**
The minimum distance the camera can be from the scene.
If not provided, will default to the `-Near` parameter.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Double]`|false   |20      |true (ByPropertyName)|

#### **OrbitFar**
The maximum distance the camera can be from the scene.
If not provided, will default to the `-Far` parameter.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Double]`|false   |21      |true (ByPropertyName)|

#### **FieldOfView**
The field of view for the 3D scene.
This is a string so that it might be a dynamic javascript value.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Double]`|false   |22      |true (ByPropertyName)|

#### **SphereRadius**
The raidus of the 3d sphere.  By default, 1 kilobyte.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Double]`|false   |23      |true (ByPropertyName)|

#### **SphereScale**
The scale of the sphere.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Double]`|false   |24      |true (ByPropertyName)|

#### **CubeRadius**
The radius of the entire cube.  By default, 1 kilobyte.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Double]`|false   |25      |true (ByPropertyName)|

#### **HelixRadius**
The raidus of the 3d helix.  By default, 1 kilobyte.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Double]`|false   |26      |true (ByPropertyName)|

#### **HelixScaleX**
The scale of each item in the helix, in the X direction.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Double]`|false   |27      |true (ByPropertyName)|

#### **HelixScaleY**
The scale of each item in the helix, in the Y direction.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Double]`|false   |28      |true (ByPropertyName)|

#### **HelixScaleZ**
The scale of each item in the helix, in the Z direction.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Double]`|false   |29      |true (ByPropertyName)|

#### **HelixPitch**
The pitch of the helix.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Double]`|false   |30      |true (ByPropertyName)|

#### **CellWidth**
The height of the cells in the 3D scene.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Double]`|false   |31      |true (ByPropertyName)|

#### **CellHeight**
The width of the cells in the 3D scene.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Double]`|false   |32      |true (ByPropertyName)|

#### **TableWidth**
The width of the 3d table.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Double]`|false   |33      |true (ByPropertyName)|

#### **TableHeight**
The height of the 3d table.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Double]`|false   |34      |true (ByPropertyName)|

#### **TableRowCount**
The number of rows in the 3d table.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |35      |true (ByPropertyName)|

#### **TableColumnCount**
The number of columns in the 3d table.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |36      |true (ByPropertyName)|

#### **ItemMultiple**
The number of items it takes to grow the radius of the space for items.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |37      |true (ByPropertyName)|

#### **GrowthFactor**

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Double]`|false   |38      |true (ByPropertyName)|

#### **Viewport**

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |39      |true (ByPropertyName)|

#### **OnSelect**
The scripts to run when an item is selected.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |40      |true (ByPropertyName)|

#### **BaseUrl**
The base URL for the links.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |41      |true (ByPropertyName)|

#### **InitialRandomness**
The initial randomness of the 3D scene.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Double]`|false   |42      |true (ByPropertyName)|

#### **BeatPerMinute**
The beats per minute of the 3d scene.

|Type      |Required|Position|PipelineInput        |Aliases               |
|----------|--------|--------|---------------------|----------------------|
|`[Double]`|false   |43      |true (ByPropertyName)|BeatsPerMinute<br/>BPM|

#### **OnBeat**
One or more scripts to run on every beat.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |44      |true (ByPropertyName)|

#### **TransitionTime**
The duration of the transition between views.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[TimeSpan]`|false   |45      |true (ByPropertyName)|

#### **No3DViewMenu**
If set, will not render the 3d view menu.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|

---

### Syntax
```PowerShell
Show-PSSVG [[-Content] <PSObject[]>] [[-Metadata] <PSObject[]>] [[-DataRow] <PSObject[]>] [[-Title] <String>] [[-CopyCount] <Int32>] [[-RowCount] <Int32>] [[-ColumnCount] <Int32>] [-Overlap] [[-PaletteName] <String>] [[-FontName] <String>] [[-CodeFont] <String>] [-In3D] [[-View3D] <String>] [[-CopyCount3D] <Int32>] [[-SpatialProperty] <PSObject>] [[-CameraX] <Double>] [[-CameraY] <Double>] [[-CameraZ] <Double>] [[-Near] <Double>] [[-Far] <Double>] [[-OrbitSpeed] <Double>] [[-OrbitNear] <Double>] [[-OrbitFar] <Double>] [[-FieldOfView] <Double>] [[-SphereRadius] <Double>] [[-SphereScale] <Double>] [[-CubeRadius] <Double>] [[-HelixRadius] <Double>] [[-HelixScaleX] <Double>] [[-HelixScaleY] <Double>] [[-HelixScaleZ] <Double>] [[-HelixPitch] <Double>] [[-CellWidth] <Double>] [[-CellHeight] <Double>] [[-TableWidth] <Double>] [[-TableHeight] <Double>] [[-TableRowCount] <Int32>] [[-TableColumnCount] <Int32>] [[-ItemMultiple] <Int32>] [[-GrowthFactor] <Double>] [[-Viewport] <String>] [[-OnSelect] <String[]>] [[-BaseUrl] <String>] [[-InitialRandomness] <Double>] [[-BeatPerMinute] <Double>] [[-OnBeat] <String[]>] [[-TransitionTime] <TimeSpan>] [-No3DViewMenu] [<CommonParameters>]
```
