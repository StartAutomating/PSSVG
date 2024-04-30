SVG.Button
----------

### Synopsis
SVG Button

---

### Description

Creates a button in SVG.

---

### Related Links
* [SVG.a](SVG.a.md)

---

### Examples
> EXAMPLE 1

```PowerShell
SVG -ViewBox 300,100 @(    
    SVG.Button -ButtonText "Click Me!"    
)
```

---

### Parameters
#### **ButtonText**
The button text

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |1       |true (ByPropertyName)|

#### **ButtonWidth**
The width of the button, expressed as a percentage.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |2       |true (ByPropertyName)|

#### **ButtonHeight**
The height of the button, expressed as a percentage.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |3       |true (ByPropertyName)|

#### **TextColor**
The text color

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |4       |true (ByPropertyName)|

#### **BackgroundFill**
The fill color of the button.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |5       |true (ByPropertyName)|

#### **BorderStroke**
The stroke color of the border.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |6       |true (ByPropertyName)|

#### **BorderThickness**
The thickness of the border.    
(the strokethickness of the shape that makes up the button)

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |7       |true (ByPropertyName)|

#### **CornerRadius**
The corner radius of the button.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |8       |true (ByPropertyName)|

#### **HoverCornerRadius**
The corner radius of the button when hovered.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |9       |true (ByPropertyName)|

#### **HoverAnimationDuration**
The duration of the hover animation.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[TimeSpan]`|false   |10      |true (ByPropertyName)|

#### **ClickAnimationDuration**
The duration of the click animation

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[TimeSpan]`|false   |11      |true (ByPropertyName)|

#### **HoverFontSize**
The font size of the button text, when hovering.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |12      |true (ByPropertyName)|

#### **ClickFontSize**
The font size of the button text, when clicked.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |13      |true (ByPropertyName)|

#### **ClickCornerRadius**
The corner radius of the button when clicked.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |14      |true (ByPropertyName)|

---

### Notes
The button is a rectangle with text in the middle.    
The button has a hover animation that changes the corner radius of the button.    
The button has a click animation that changes the corner radius and font size of the button text.

---

### Syntax
```PowerShell
SVG.Button [[-ButtonText] <String>] [[-ButtonWidth] <String>] [[-ButtonHeight] <String>] [[-TextColor] <String>] [[-BackgroundFill] <String>] [[-BorderStroke] <String>] [[-BorderThickness] <String>] [[-CornerRadius] <String>] [[-HoverCornerRadius] <String>] [[-HoverAnimationDuration] <TimeSpan>] [[-ClickAnimationDuration] <TimeSpan>] [[-HoverFontSize] <String>] [[-ClickFontSize] <String>] [[-ClickCornerRadius] <String>] [<CommonParameters>]
```
