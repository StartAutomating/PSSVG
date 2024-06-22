<#
.EXAMPLE
	Show-PSSVG -Content @(
		SVG -viewbox 200 @(
			SVG.Rect -Fill currentColor -Width 100 -Height 100
			SVG.Rect -Fill currentColor -Width 50 -Height 50 -X 100 -Y 100
		)	
	) -CopyCount 4 > 4squared.html
.EXAMPLE
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
.EXAMPLE
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
.EXAMPLE
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
#>
[ValidatePattern('\p{P}Show')]
[Alias('Show.SVG','SVG.Show','Show-SVG')]
param(
# The content to show.  This should be any number of SVG elements.
[Parameter(ValueFromPipeline)]
[PSObject[]]
$Content,

# Any metadata.  These will become `<meta>` tags in an HTML frame, or `<metadata>` elements in the SVG.
[Parameter(ValueFromPipelineByPropertyName)]
[PSObject[]]
$Metadata,

# The data to show in the table.  This should be an array of objects.
[Parameter(ValueFromPipelineByPropertyName)]
[Alias('DataRows','DataTable')]
[PSObject[]]
$DataRow,

# The title of the SVG or the HTML frame.
[Parameter(ValueFromPipelineByPropertyName)]
[string]
$Title,

# The number of copies of each item to show.
[Parameter(ValueFromPipelineByPropertyName)]
[Alias('NumberOfCopies','Count')]
[int]
$CopyCount,

# The number of rows to display.
# If this is not provided, it will be calculated based on the number of columns.
# If columns are not provided, it will be calculated based on the number of copies.
[Parameter(ValueFromPipelineByPropertyName)]
[int]
$RowCount,

# The number of columns to display.
# If this is not provided, it will be calculated based on the number of rows.
# If rows are not provided, it will be calculated based on the number of copies.
[Parameter(ValueFromPipelineByPropertyName)]
[int]
$ColumnCount,

# If set, will overlap multiple content items in 2d or 3d.  
# By default, multiple content items will be interleaved.
[Parameter(ValueFromPipelineByPropertyName)]
[switch]
$Overlap,

# The name of the palette.
[Parameter(ValueFromPipelineByPropertyName)]
[Alias('Palette','ColorScheme','ColorPalette')]
[ArgumentCompleter({
    param ($commandName,$parameterName,$wordToComplete,$commandAst,$fakeBoundParameters )
    if (-not $script:4bitcssPaletteList) {
        $script:4bitcssPaletteList = Invoke-RestMethod -Uri https://cdn.jsdelivr.net/gh/2bitdesigns/4bitcss@latest/docs/Palette-List.json
    }
    if ($wordToComplete) {
        $script:4bitcssPaletteList -match "$([Regex]::Escape($wordToComplete) -replace '\\\*', '.{0,}')"
    } else {
        $script:4bitcssPaletteList 
    }        
})]
[string]
$PaletteName,

# The [Google Font](https://fonts.google.com/) name.
[Parameter(ValueFromPipelineByPropertyName)]
[Alias('GoogleFont')]
[string]
$FontName,

# The Google Font name to use for code blocks.
# (this should be a [monospace font](https://fonts.google.com/?classification=Monospace))
[Parameter(ValueFromPipelineByPropertyName)]
[Alias('PreFont','CodeFontName','PreFontName')]
[string]
$CodeFont,

# If set, will render a 3D scene containing each of the SVG elements.
[Parameter(ValueFromPipelineByPropertyName)]
[Alias('3d')]
[switch]
$In3D,

# The default 3d view of the items.
[Parameter(ValueFromPipelineByPropertyName)]
[Alias('3dView')]
[string]
$View3D = 'table',

# The number of copies of each item to show in the 3D scene.
# If this is not provided, it will be the number of items in the table.
# If this is provided, the table will be repeated as necessary.
[Parameter(ValueFromPipelineByPropertyName)]
[Alias('3dCount','3dCopies','3dCopyCount')]
[int]
$CopyCount3D = 0,

# The spatial property map for the 3D scene.
# This maps the data properties to the spatial properties.
# Values can be provided as a dictionary or object.
[Parameter(ValueFromPipelineByPropertyName)]
[Alias('SpatialProperties','SpatialPropertyMap','SpatialPropertiesMap')]
[PSObject]
$SpatialProperty,

# The X position of the camera.
[Parameter(ValueFromPipelineByPropertyName)]
[double]
$CameraX = 0,

# The Y position of the camera.
[Parameter(ValueFromPipelineByPropertyName)]
[double]
$CameraY = 0,

# The Z position of the camera.
[Parameter(ValueFromPipelineByPropertyName)]
[double]
$CameraZ = 3000,

# The near clipping plane of the camera.
[Parameter(ValueFromPipelineByPropertyName)]
[double]
$Near = 0.1,

# The far clipping plane of the camera.
[Parameter(ValueFromPipelineByPropertyName)]
[double]
$Far = 25kb,

# The speed at which the camera will automatically orbit the scene.
[Parameter(ValueFromPipelineByPropertyName)]
[Alias('AutoRotateSpeed')]
[double]
$OrbitSpeed = 2,

# The minimum distance the camera can be from the scene.
# If not provided, will default to the `-Near` parameter.
[Parameter(ValueFromPipelineByPropertyName)]
[double]
$OrbitNear,

# The maximum distance the camera can be from the scene.
# If not provided, will default to the `-Far` parameter.
[Parameter(ValueFromPipelineByPropertyName)]
[double]
$OrbitFar,

# The field of view for the 3D scene.
# This is a string so that it might be a dynamic javascript value.
[Parameter(ValueFromPipelineByPropertyName)]
[double]
$FieldOfView = 45,

# The raidus of the 3d sphere.  By default, 1 kilobyte.
[Parameter(ValueFromPipelineByPropertyName)]
[double]
$SphereRadius = 1kb,

# The scale of the sphere.
[Parameter(ValueFromPipelineByPropertyName)]
[double]
$SphereScale = 2,

# The radius of the entire cube.  By default, 1 kilobyte.
[Parameter(ValueFromPipelineByPropertyName)]
[double]
$CubeRadius = 1kb,

# The raidus of the 3d helix.  By default, 1 kilobyte.
[Parameter(ValueFromPipelineByPropertyName)]
[double]
$HelixRadius = 1kb,

# The scale of each item in the helix, in the X direction.
[Parameter(ValueFromPipelineByPropertyName)]
[double]
$HelixScaleX = 2,

# The scale of each item in the helix, in the Y direction.
[Parameter(ValueFromPipelineByPropertyName)]
[double]
$HelixScaleY = 1,

# The scale of each item in the helix, in the Z direction.
[Parameter(ValueFromPipelineByPropertyName)]
[double]
$HelixScaleZ = 2,

# The pitch of the helix.
[Parameter(ValueFromPipelineByPropertyName)]
[double]
$HelixPitch = 0.175,

# The height of the cells in the 3D scene.
[Parameter(ValueFromPipelineByPropertyName)]
[double]
$CellWidth = .25kb,

# The width of the cells in the 3D scene.
[Parameter(ValueFromPipelineByPropertyName)]
[double]
$CellHeight = .25kb,

# The width of the 3d table.
[Parameter(ValueFromPipelineByPropertyName)]
[double]
$TableWidth = 1.5kb,

# The height of the 3d table.
[Parameter(ValueFromPipelineByPropertyName)]
[double]
$TableHeight = 1.5kb,

# The number of rows in the 3d table.
[Parameter(ValueFromPipelineByPropertyName)]
[int]
$TableRowCount = 0,

# The number of columns in the 3d table.
[Parameter(ValueFromPipelineByPropertyName)]
[int]
$TableColumnCount = 0,

# The number of items it takes to grow the radius of the space for items.
[Parameter(ValueFromPipelineByPropertyName)]
[int]
$ItemMultiple = 256,

[Parameter(ValueFromPipelineByPropertyName)]
[double]
$GrowthFactor = 1.618,

[Parameter(ValueFromPipelineByPropertyName)]
[string]
$Viewport = 'width=device-width',

# The scripts to run when an item is selected.
[Parameter(ValueFromPipelineByPropertyName)]
[string[]]
$OnSelect,

# The base URL for the links.
[Parameter(ValueFromPipelineByPropertyName)]
[string]
$BaseUrl,

# The initial randomness of the 3D scene.
[Parameter(ValueFromPipelineByPropertyName)]
[double]
$InitialRandomness = 2kb,

# The beats per minute of the 3d scene.
[Parameter(ValueFromPipelineByPropertyName)]
[Alias('BeatsPerMinute','BPM')]
[double]
$BeatPerMinute,

# One or more scripts to run on every beat.
[Parameter(ValueFromPipelineByPropertyName)]
[string[]]
$OnBeat,

# The duration of the transition between views.
[Parameter(ValueFromPipelineByPropertyName)]
[timespan]
$TransitionTime = $([timespan]::FromSeconds(0.26)),

# The list of acceptable content types.
# If the first item is SVG, will prefer SVG over HTML (and will not render in 3d)
[Parameter(ValueFromPipelineByPropertyName)]
[Alias('ContentType','ContentTypes','AcceptTypes')]
[string[]]
$AcceptType = $(if ($request.AcceptTypes) { $request.AcceptTypes -split ';'} else { 'text/html','image/svg+xml' }),

# If set, will not render the 3d view menu.
[Parameter(ValueFromPipelineByPropertyName)]
[switch]
$No3DViewMenu
)

begin {
	$CopySvg = $ExecutionContext.SessionState.InvokeCommand.GetCommand('Copy-SVG', 'Function')
    function html {
    
            "<!DOCTYPE html>"
            "<html>"
            $(@($input) -join [Environment]::NewLine)
            "</html>"
        
    }

    filter head {
    
            "   <head>"
            if ($Title){ 
                "       <title>$Title</title>"
            }
    		"<meta name='viewport' content='$Viewport' />"
            if ($Metadata) {
                foreach ($metadataObject in $metadata) {
    				if ($metadataObject.OuterXml) {
    					$metadataObject.OuterXml -replace '\?<\?xml.*\?>'
    				} elseif ($metadataObject -is [Collections.IDictionary]) {
    					foreach ($_ in $metadataObject.Keys) {
    						"<meta name='$([Web.HttpUtility]::HtmlAttributeEncode($_))' content='$([Web.HttpUtility]::HtmlAttributeEncode($metadataObject[$_]))' />"
    					}
    				} else {
    					"<meta name='$metadataObject' />"
    				}
    			}
            }
            if ($PaletteName) {
                '<link type="text/css" rel="stylesheet" href="https://cdn.jsdelivr.net/gh/2bitdesigns/4bitcss@latest/css/.css" id="4bitcss" />' -replace '\.css', "$PaletteName.css"
            }
    		if ($CodeFont) {
    			"<link type='text/css' rel='stylesheet' href='https://fonts.googleapis.com/css?family=$CodeFont' id='codefont' />"
    		}
    		if ($FontName) {
    			"<link type='text/css' rel='stylesheet' href='https://fonts.googleapis.com/css?family=$FontName' id='fontname' />"
    		}			
            "<style>
    			html, body {
    				height:100%; $(if ($In3D) { 'overflow:hidden;'})$($(if ($FontName) { "font-family: '$FontName';" }))
    			}
    			$(if (-not $In3D) { '#container-2d { height: 100% }'})
    			$(if ($CodeFont) { "pre { font-family: $CodeFont }" })			
    		</style>"
    
    		"<script type='text/javascript'>"
    		"</script>"
    		
            if ($In3D) {
            '
            <script type="importmap">
                {
                    "imports": {
                    "three": "https://cdn.jsdelivr.net/npm/three@latest/build/three.module.js",
                    "three/addons/": "https://cdn.jsdelivr.net/npm/three@latest/examples/jsm/"
                    }
                }
            </script>    
            '
            }
    		if ($DataRow) {
    			$propertyNamesSelected = @()
    			$jsonRows = @(
    				foreach ($rowOfData in $DataRow) {
    					if ($rowOfData -is [Collections.IDictionary]) {
    						if (-not $propertyNamesSelected) {
    							$propertyNamesSelected = $rowOfData.Keys
    						}
    						foreach ($selectPropertyName in $propertyNamesSelected) {
    							$rowOfData[$selectPropertyName]
    						}
    					} else {
    						if (-not $propertyNamesFound) {
    							$propertyNamesSelected = @($rowOfData.psobject.Properties.Name)
    						}
    						foreach ($selectPropertyName in $propertyNamesSelected) {
    							$rowOfData.psobject.properties[$selectPropertyName].Value
    						}
    					}
    				}
    			)
    			"<script id='data-columns' type='application/json'>"
    			$propertyNamesSelected | ConvertTo-Json -Compress
    			"</script>"
    			"<script id='data-rows' type='application/json'>"
    			ConvertTo-Json -InputObject $jsonRows
    			"</script>"			
    		}
    		
            "   </head>"        
        
    }

    filter body {
    
    		if (-not $prefersSvg) {
    			"   <body>"
    			"   <div id='container-2d' $(if ($In3D) {"style='display:none'"})>"
    		}        
    			
    		$originalCopyCount = $CopyCount
            if ($CopyCount -lt $contentToshow.Length -and -not $Overlap) {
    			$CopyCount = $contentToshow.Length
    		}
    		$copyParameters = [Ordered]@{}
    		foreach ($parameterName in $myParams.Keys) {
    			if ($CopySvg.Parameters[$parameterName]) {
    				$copyParameters[$parameterName] = $myParams[$parameterName]
    			}
    		}
    		$copyParameters.Remove('Content')
    		$svgCopies = ($ContentToShow | Copy-SVG @copyParameters).OuterXml -replace '\?<\?xml.*\?>'
    		if ($prefersSvg) {
    			return $svgCopies
    		} else {
    			$svgCopies
    		}
            "   </div>"
            if ($in3d) {
                "   <style>"
                "
    #menu-3d-views {
        position: fixed;
        bottom: 1%;
        width: 100%;
        text-align: center;
        $(if ($No3DViewMenu) { 'display:none;' } else { 'display:float;'})
    	z-index: 100;	
    }
    
    button {
        color: var(--foreground);
        background: transparent;
        outline: 1px solid var(--foreground);
        border: 0px;
        padding: 5px 10px;
        cursor: pointer;
    }
    
    #container-3d {
    	position: absolute;
    	top: 0;
    	left: 0;
    	width: 100%;
    	height: 100%;
    	overflow: hidden;
    	display: float;
    }
    "
                "   </style>"
    			'
                <menu id="menu-3d-views">
                    <button id="table">TABLE</button>
    				<button id="bubble">BUBBLE</button>
                    <button id="sphere">SPHERE</button>
                    <button id="helix">HELIX</button>
                    <button id="cube">CUBE</button>
    				<button id="random">RANDOM</button>
                </menu>
                '
                "<div id='container-3d'></div>"	
                "
                    <script type='module'>
    
                    import * as THREE from 'three';
    
                    import TWEEN from 'three/addons/libs/tween.module.js';
                    import { CSS3DRenderer, CSS3DObject } from 'three/addons/renderers/CSS3DRenderer.js';
                    import { OrbitControls } from 'three/addons/controls/OrbitControls.js';
    				import { TrackballControls } from 'three/addons/controls/TrackballControls.js';
                "            
    			
    			"const table = [];"
    			
                
    			"
    			const tableColumns = $(if ($DataRow) {
    				ConvertTo-Json -Compress -InputObject @($propertyNamesSelected)
    			} else {
    				ConvertTo-Json -Compress -InputObject @()
    			});
    			const spatialPropertyMap = $(
    				if ($SpatialProperty) {					
    					($SpatialProperty | ConvertTo-Json -Compress)
    				} else { '{}' }
    			);				
    			const hrefBase     = '$BaseUrl';
    
    			const tableRows = [];
    			const dataColumnsElement = document.getElementById('data-columns');
    			const dataRowElement = document.getElementById('data-rows');
    
    			if (dataRowElement && dataColumnsElement) {
    				const jsonTableRows = JSON.parse(dataRowElement.textContent)
    				const jsonTableColumns = JSON.parse(dataColumnsElement.textContent)
    				for ( let i = 0; i < jsonTableRows.length; i += jsonTableColumns.length ) {
    					const row = {};
    					for ( let j = 0; j < jsonTableColumns.length; j++ ) {
    						row[tableColumns[j]] = jsonTableRows[i + j];
    					}
    					tableRows.push(row);
    				}
    			}
    					
    
    			let tableColumnCount = $(
    				if ($TableColumnCount) { $TableColumnCount } else { 0 }
    			);
    			
    			let tableRowCount = $(
    				if ($TableRowCount) { $TableRowCount } else { 0 }
    			);
    
    			const svgSymbols = [];
    			var containerChildren = document.getElementById('container-2d').childNodes;
    			for ( let containerChildIndex = 0; containerChildIndex < containerChildren.length; containerChildIndex++ ) {
                        for (let grandChildIndex = 0; grandChildIndex < containerChildren[containerChildIndex].childNodes.length; grandChildIndex++ ) {
                        var containerChild = containerChildren[containerChildIndex].childNodes[grandChildIndex];
                        if (containerChild.nodeName == 'symbol') {
                            svgSymbols.push(containerChild);
                        }
                    }
                }
        
    			let totalItemCount = $(if ($CopyCount3D) { $CopyCount3D } elseif ($originalCopyCount -gt 1) { $originalCopyCount } else { 'tableRows.length'});
    			if (totalItemCount == 0) {
    				totalItemCount = svgSymbols.length;
    			}
    
    			if (tableColumnCount == 0 && tableRowCount == 0) {
    				tableColumnCount = Math.ceil(Math.sqrt(totalItemCount));
    				if (tableColumnCount > 0) {
    					tableRowCount = Math.ceil(totalItemCount / tableColumnCount);	
    				}				
    			} else if (tableColumnCount == 0) {
    				tableColumnCount = Math.ceil(totalItemCount / tableRowCount);
    			} else if (tableRowCount == 0) {
    				tableRowCount = Math.ceil(totalItemCount / tableColumnCount);
    			}
    			
    			const CellWidth = $CellWidth;
    			const CellHeight = $CellHeight;
    			"
                @"

            
            let camera, scene, renderer;
			let controls;
            

			const objects = [];
			const targets = { table: [], sphere: [], bubble:[], helix: [], cube: [], random: []};
			


			let lastBeatTime = new Date();
			let bpm = $($BeatPerMinute ? $BeatPerMinute : 0);
			let beatTime = $($BeatPerMinute ? 60000 / $BeatPerMinute : 0);
			let beatCount = 0;

			init();
			animate();

			function init() {
				camera = new THREE.PerspectiveCamera( $FieldOfView, window.innerWidth / window.innerHeight, $Near, $Far );
                camera.position.x = $CameraX;
                camera.position.y = $CameraY;
				camera.position.z = $CameraZ;

				scene = new THREE.Scene();

				for ( let i = 0; i < totalItemCount; i++ ) {					
					const element = document.createElement( 'div' );										
					$(if ($Overlap){
					"					
					for (let j = 0; j < svgSymbols.length; j++) {
						var svgElements = svgSymbols[j].getElementsByTagName('svg');
						for (let k = 0; k < svgElements.length; k++) {
							var svgClone = svgElements[k].cloneNode(true);
							svgClone.style.width = '100%' // CellWidth + 'px';
							svgClone.style.height = '100%' // CellHeight + 'px';
							element.appendChild(svgClone);
						}
					}
					"
					} else {
					"
					var svgElements = svgSymbols[i % svgSymbols.length].getElementsByTagName('svg');
					for (let k = 0; k < svgSymbols[i % svgSymbols.length].childNodes.length; k++) {
						if (svgElements.length > 0) {
							var svgClone = svgElements[0].cloneNode(true);
							svgClone.style.width = '100%' // CellWidth + 'px';
							svgClone.style.height = '100%' // CellHeight + 'px';
							element.appendChild(svgClone);	
						}											
					}					
					"
					})
					
					var tableIndex = 0;
					var tableItem = null;
					if (tableRows.length > 0) {
						tableIndex = i % tableRows.length;
						tableItem = tableRows[tableIndex];
					}
					
					for (let j = 0; j < tableColumns.length;j++) {
						element.dataset[tableColumns[j].replace(/\s/,'')] = tableItem[tableColumns[j]];
					}

					if (tableRows.length) {
						element.dataset['index'] = tableIndex;
					} else {
						element.dataset['index'] = i;
					}

					const objectCSS = new CSS3DObject( element );

					objectCSS.position.x = Math.random() * $($InitialRandomness * 2) - $($InitialRandomness);
					objectCSS.position.y = Math.random() * $($InitialRandomness * 2) - $($InitialRandomness);
					objectCSS.position.z = Math.random() * $($InitialRandomness * 2) - $($InitialRandomness);

					scene.add( objectCSS );

					objects.push( objectCSS );
					const totalTableWidth = (CellWidth + 1) * tableColumnCount;
					const totalTableHeight = (CellHeight + 1) * tableRowCount;
					const object = new THREE.Object3D();
					if (spatialPropertyMap['x'] && tableItem && tableItem[spatialPropertyMap['x']]) {
						object.position.x = (tableItem[spatialPropertyMap['x']] * CellWidth ) + totalTableWidth/2;
					} else {
						object.position.x = ((i % tableColumnCount) * CellWidth) - totalTableWidth/2
					}
					
					if (spatialPropertyMap['y'] && tableItem && tableItem[spatialPropertyMap['y']]) {
						object.position.y = - ( tableItem[spatialPropertyMap['y']] * CellHeight) + totalTableHeight/2;
					} else {
						object.position.y = - ((Math.floor(i / tableColumnCount)) * CellHeight) + totalTableHeight/2;
					}					

					targets.table.push( object );
				}

				// sphere

				const vector = new THREE.Vector3();
				
				let sphereRadius = $SphereRadius;

				for ( let i = 0, l = objects.length; i < l; i ++ ) {

					const phi = Math.acos( - 1 + ( $SphereScale * i ) / l );
					const theta = Math.sqrt( l * Math.PI ) * phi;

					var tableItem = null;
					if (tableRows.length > 0) {
						tableItem = tableRows[i % tableRows.length];
					}
					if (spatialPropertyMap['latitude'] && tableItem && tableItem[spatialPropertyMap['latitude']]) {
						phi = tableItem[spatialPropertyMap['latitude']] * Math.PI / 180;
					}
					if (spatialPropertyMap['longitude'] && tableItem &&  tableItem[spatialPropertyMap['longitude']]) {
						theta = tableItem[spatialPropertyMap['longitude']] * Math.PI / 180;
					}

					const object = new THREE.Object3D();

					object.position.setFromSphericalCoords( sphereRadius, phi, theta );

					vector.copy( object.position ).multiplyScalar( $SphereScale );

					object.lookAt( vector );
					

					targets.sphere.push( object );										
					const bubbleObject = new THREE.Object3D();
					bubbleObject.position.setFromSphericalCoords( $SphereRadius, phi, theta );
					vector.copy( bubbleObject.position ).multiplyScalar( $SphereScale );
					bubbleObject.rotation.z = Math.PI * 180;
					bubbleObject.lookAt( vector );
					targets.bubble.push(bubbleObject);
				}

				// helix

				for ( let i = 0, l = objects.length; i < l; i ++ ) {

					const theta = i * $HelixPitch + Math.PI;
					const y = - ( i * 16 ) + 450;

					const object = new THREE.Object3D();

					object.position.setFromCylindricalCoords( $HelixRadius, theta, y );

					vector.x = object.position.x * $HelixScaleX;
					vector.y = object.position.y * $HelixScaleY;
					vector.z = object.position.z * $HelixScaleZ;

					object.lookAt( vector );

					targets.helix.push( object );

				}

				// cube

                let cubeRadius = $CubeRadius;				
				let cubeMultiple = $itemMultiple;
				
                const cubeSize = $(if ($cubeSize) { "$cubeSize;" } else { "Math.ceil(Math.cbrt(objects.length));"});
				for ( let i = 0; i < objects.length; i ++ ) {

					const object = new THREE.Object3D();

					object.position.x = ( ( i % cubeSize ) * $cubeRadius ) - $($CubeRadius * 2);
					object.position.y = ( - ( Math.floor( i / cubeSize ) % cubeSize ) * $cubeRadius ) + $($CubeRadius * 2);
					object.position.z = ( Math.floor( i / (cubeSize*cubeSize) ) ) * $cubeRadius  - $($cubeRadius * 2);

					targets.cube.push( object );
				}
				
				// Create the renderer

				renderer = new CSS3DRenderer();
				renderer.setSize( window.innerWidth, window.innerHeight );
				document.getElementById( 'container-3d' ).appendChild( renderer.domElement );				

				// Create the controls

				controls = new OrbitControls( camera, renderer.domElement );
				controls.minDistance = $(if ($OrbitNear) {$OrbitNear} elseif ($Near) {$Near} else {0.1});
				controls.maxDistance = $(if ($orbitFar) {$orbitFar} elseif ($Far) {$Far} else {25kb});
                controls.listenToKeyEvents( window );
                controls.enableDamping = true;
				// We want to be able to control the orbit _and_ click on the objects.
				controls.addEventListener( 'start', function() {
					// Find the current parent
					var currentParent = event.srcElement.parentElement;
					// and walk up the tree until we find the data element.
					var dataElement   = null;
					while (currentParent) {
						// If there element has a dataset index
						if (currentParent.dataset['index'] >= 0) {
							// we've found the data element.
							dataElement = currentParent;
							// and can take a break.
							break;
						}
						// (otherwise, keep walking up the tree)
						currentParent = currentParent.parentElement;
					}


					// If we found the data element
					if (dataElement) {
						// get the index of the data element
						var index = dataElement.dataset['index'];
						// and the table item.
						var tableItem = tableRows[index];
						// if the event was a pointerdown event					
						if (event.type == 'pointerdown') {
							// run any optional selection code.
							$(if ($onSelect) {$onSelect -join [Environment]::NewLine})
							// and propagate the 'click' the element.
							if (spatialPropertyMap['href'] && tableItem[spatialPropertyMap['href']]) {
								if (baseUrl) {
									window.location.href = baseUrl + tableItem[spatialPropertyMap['href']];
								}
								else {
									window.location.href = tableItem[spatialPropertyMap['href']];
								}								
							} else {
								event.preventDefault();
								event.srcElement.dispatchEvent(new MouseEvent('click', { 'view': window, 'bubbles': true, 'cancelable': true }));
							}														
						}
					}
				});

                $(
                    if ($OrbitSpeed -eq 0) {
                        "controls.autoRotate = false;"
                    } else {
                        "controls.autoRotate = true;"
                        "controls.autoRotateSpeed = $OrbitSpeed;"
                    }
                )                                
				controls.addEventListener( 'change', render );

				const buttonTable = document.getElementById( 'table' );
				buttonTable.addEventListener( 'click', function () {
					transform( targets.table, $($TransitionTime.TotalMilliseconds) );
					new TWEEN.Tween( camera.position )
						.to( {
							x: $CameraX, y: $CameraY, z: $([Math]::Sqrt($TableWidth * $TableHeight) * 1.5)
						}, $($TransitionTime.TotalMilliseconds) )
						.onUpdate( render )
						.start();
				} );

				const bubbleSphere = document.getElementById( 'bubble' );
				bubbleSphere.addEventListener( 'click', function () {
					transform( targets.bubble, $($TransitionTime.TotalMilliseconds) );					
					new TWEEN.Tween( camera.position )
						.to( {
							x: $CameraX, y: $CameraY, z: $($SphereRadius / 2)
						}, $($TransitionTime.TotalMilliseconds) )
						.onUpdate( render )
						.start();
					new TWEEN.Tween( camera.rotation )
						.to( {
							x: 180, y: 0, z: 10,
						}, $($TransitionTime.TotalMilliseconds) )
						.onUpdate( render )
						.start();
				} );

				const buttonSphere = document.getElementById( 'sphere' );
				buttonSphere.addEventListener( 'click', function () {
					transform( targets.sphere, $($TransitionTime.TotalMilliseconds) );
					new TWEEN.Tween( camera.position )
					.to( {
						x: $CameraX, y: $CameraY, z: $($SphereRadius * 2)
					}, $($TransitionTime.TotalMilliseconds) )
						.onUpdate( render )
						.start();
				} );

				const buttonHelix = document.getElementById( 'helix' );
				buttonHelix.addEventListener( 'click', function () {
					transform( targets.helix, $($TransitionTime.TotalMilliseconds) );
					new TWEEN.Tween( camera.position )
					.to( {
						x: $CameraX, y: $CameraY, z: $cameraZ
					}, $($TransitionTime.TotalMilliseconds) )
						.onUpdate( render )
						.start();
				} );

				const buttonCube = document.getElementById( 'cube' );
				buttonCube.addEventListener( 'click', function () {

					transform( targets.cube, $($TransitionTime.TotalMilliseconds) );

				} );

				const randomButton = document.getElementById( 'random' );
				randomButton.addEventListener( 'click', function () {
					targets.random = [];
					for ( let i = 0; i < objects.length; i ++ ) {

						const object = new THREE.Object3D();
	
						object.position.x = Math.random() * $($InitialRandomness * 2) - $($InitialRandomness);
						object.position.y = Math.random() * $($InitialRandomness * 2) - $($InitialRandomness);
						object.position.z = Math.random() * $($InitialRandomness * 2) - $($InitialRandomness);						
	
						targets.random.push( object );

					}	
					transform( targets.random, $($TransitionTime.TotalMilliseconds) );
				});

				transform( targets.$($View3D.ToLower()), $($TransitionTime.TotalMilliseconds) );				

				window.addEventListener( 'resize', onWindowResize );
			}

			function transform( targets, duration ) {
				// Cancel any existing tweens.
				TWEEN.removeAll();

				// Create a new tween, using some parallel arrays to store the start and end values.
				for ( let i = 0; i < objects.length; i ++ ) {

					const object = objects[ i ];
					const target = targets[ i ];

					new TWEEN.Tween( object.position )
						.to( { x: target.position.x, y: target.position.y, z: target.position.z }, Math.random() * duration + duration )
						.easing( TWEEN.Easing.Exponential.InOut )
						.start();

					new TWEEN.Tween( object.rotation )
						.to( { x: target.rotation.x, y: target.rotation.y, z: target.rotation.z }, Math.random() * duration + duration )
						.easing( TWEEN.Easing.Exponential.InOut )
						.start();
				}

				new TWEEN.Tween( this )
					.to( {}, duration * 2 )
					.onUpdate( render )
					.start();
			}

			function onWindowResize() {
				camera.aspect = window.innerWidth / window.innerHeight;
				camera.updateProjectionMatrix();
				renderer.setSize( window.innerWidth, window.innerHeight );
				render();
			}

			function onBeat() {
				lastBeatTime = new Date();
				beatCount++;
				$(if ($onBeat) {$onBeat -join [Environment]::NewLine})
			}

			function setBPM(newBpm) {
				bpm = newBpm;
				beatTime = 60000 / newBpm;
				beatCount = 0;
				lastBeatTime = new Date();
			}

			function animate() {
				requestAnimationFrame( animate );
				TWEEN.update();
				controls.update();
				if (bpm > 0) {
					var now = new Date();
					if (now - lastBeatTime > beatTime) {						
						onBeat();
					}
				}
			}

			function render() {
				renderer.render( scene, camera );
			}
"@
                "   </script>"
                            
            }
            "   </body>"
        
    }
}

end {
	$myCmd = $MyInvocation.MyCommand
	
    # Anything piped in is content to show.
    $contentToshow = @($input)
    if (-not $contentToshow) {
        # If no content is piped in, check the parameter.
        $contentToshow = $PSBoundParameters['Content']
    }
    # Return if there is nothing to show.
    if (-not $contentToshow) { return }
	# Ensure the content is an array.
	$contentToshow = @($contentToshow)

	$myParams = [Ordered]@{} + $PSBoundParameters

	if ($PSBoundParameters['View3D']) {
		$in3d = $true
	}

	$prefersSvg = $AcceptType.Length -ge 1 -and $AcceptType[0] -eq 'image/svg+xml'
    
    $mainContent = 
		@(
			if (-not $prefersSvg) {
				. head
			}			
			. body
		)

	if (-not $prefersSvg) {
		if ($response -and $response.ContentType -ne 'text/html') {
			$response.ContentType = 'text/html'
		}
		($mainContent | . html) -join [Environment]::NewLine
	} else {
		$mainContent
	}
}
