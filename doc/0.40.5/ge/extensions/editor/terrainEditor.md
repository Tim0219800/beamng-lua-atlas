# `editor_terrainEditor`

*File: `lua/ge/extensions/editor/terrainEditor.lua` · VM: Game Engine (GE) · 3379 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_terrainEditor`: `extensions.load("editor_terrainEditor")`, then the global `editor_terrainEditor`

World Editor terrain editor ('Terrain Tools' edit mode, terrainToolsEditMode). It handles the sculpting, material painting and terraforming brushes (via extensions/editor/terraformTool), the choice of the active TerrainBlock, the level's terrain material library (art/terrain/main.materials.json) as 'proxies', the terrain import/export window (heightmap, hole map, texture maps, meshes, presets) and saving the terrain and materials before the level is saved. A modder mostly uses it to get the TerrainBlock/TerrainEditor object (getTerrainBlock, getTerrainEditor), mark the terrain as modified (setTerrainDirty) or manipulate painted materials.

## Example

```lua
local te = extensions.editor_terrainEditor
local tb = te.getTerrainBlock()
if tb then
  tb:setHeight(10, 10, 5.0)
  tb:updateGrid(vec3(10,10), vec3(10,10))
  te.setTerrainDirty()
end
```

## Notes

- Material paths are /art/terrain/main.materials.json (or /art/terrains/... for the old format, detected by checkForTerrainMaterialFileFormat); they are read relative to var.levelPath.
- Brush: size 1 to 256 (changeBrushSize), pressure/softness/height as a percentage in the terrainEditor.general.* preferences; terraforming: terrainEditor.terraform.* preferences (DOI, margin, falloff, roughness, scale).
- Paint material indices on the Lua side are 1-based (k) whereas the C++ TerrainBlock/terrainEditor expects k-1.
- Emitted hooks (extensions.hook) around the terrain save: onEditorBeforeSaveTerrain then onEditorAfterSaveTerrain, for tools with a live paint overlay.
- Automatic migration: if a material has no groundmodelName, it is filled from the uppercase internalName (or 'ASPHALT' for a new material), with a warning and a dirty mark.
- getTerrainBlock() returns nil if there is no active TerrainBlock (e.g. smallgrid level).

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_terrainEditor.beginChangeBrushSizeWithKeys(direction)` | Enables auto-repeat of the brush size change with the [ and ] keys. | 3376 |
| `editor_terrainEditor.changeBrushSize(value, step)` | Increases (value == 1) or decreases (value == 0) the brush size by `step`, clamped to 1-256, and applies it to the TerrainEditor. Any other value of value changes nothing. | 2482 |
| `editor_terrainEditor.checkForTerrainMaterialFileFormat()` | Detects the location of the materials file (art/terrain or old art/terrains) and flags the obsolete format (errors.deprecated_material_file). | 2798 |
| `editor_terrainEditor.copyMaterialProxyWithInputs(mtlProxy)` | Deep copy of a material proxy, recreating the imgui input widgets (name, size, strengths...). Fills groundmodelName from the uppercase internalName if it is empty. | 621 |
| `editor_terrainEditor.createMaterialProxy(index, pid, mtlObject, name, dirty, isNew)` | Builds a Lua proxy of a terrain material (diffuse/normal/detail/macro maps, sizes, strengths, distances, side projection, parallaxScale, groundmodelName, uniqueID = name-persistentId). Calls fixGroundmodelName; if dirty is true, also marks the terrain as modified. | 671 |
| `editor_terrainEditor.deleteMaterialInJson(name)` | Removes from the in-memory library the material with the given internalName (does not modify the file). | 3346 |
| `editor_terrainEditor.dragDropTarget(mtlProxy, map, cbData)` | imgui drag-and-drop target for an asset (ASSETDRAGDROP payload of 2048 bytes): calls updateMap with the dropped path. To be called right after an imgui widget. | 409 |
| `editor_terrainEditor.endChangeBrushSizeWithKeys()` | Stops the auto-repeat of the brush size change. | 3377 |
| `editor_terrainEditor.fixGroundmodelName(name, mtlObject, isNew)` | Migration: the groundmodel used to be stored in the internalName; now a dedicated groundmodel field exists. If this field is empty, it is filled from the uppercase internalName (or 'ASPHALT' for a new material), the material is marked dirty and a warning is logged. | 649 |
| `editor_terrainEditor.fixedFileFormat()` | Clears the 'deprecated_material_file' error (to be called once the materials file has been upgraded). | 3375 |
| `editor_terrainEditor.getErrors()` | Table of detected format errors/warnings (key -> true). | 3373 |
| `editor_terrainEditor.getLevelPath()` | Path of the current level (var.levelPath). | 3374 |
| `editor_terrainEditor.getMatFilePath()` | Path (relative to the level) of the terrain materials file, normally '/art/terrain/main.materials.json'. | 3371 |
| `editor_terrainEditor.getMaterialsInJson()` | Level material library read from the JSON. | 3367 |
| `editor_terrainEditor.getMtlIdByName(matName)` | Looks up an import material by name (exact, then case-insensitive). Returns its 0-based index, its name and whether it was found; otherwise 0 and the first material with found=false; (0, 'unknown', false) if there are none. | 223 |
| `editor_terrainEditor.getPaintMaterialProxies()` | List of the paint material proxies of the active TerrainBlock. | 3369 |
| `editor_terrainEditor.getSelectedPaintMaterialProxy()` | Proxy of the selected paint material (or nil). | 3368 |
| `editor_terrainEditor.getTerrainBlock()` | Returns the active TerrainBlock object (looked up by its id) or nil if there is none. | 3366 |
| `editor_terrainEditor.getTerrainBlockMaterialIndex(name)` | Index (1-based) of the paint material with this internalName, or -1 if it is not in the block. | 3355 |
| `editor_terrainEditor.getTerrainBlockProxies()` | Table of TerrainBlock proxies keyed by object name. | 3370 |
| `editor_terrainEditor.getTerrainEditor()` | Returns the TerrainEditor (C++) object used for world/grid conversions, brushes and actions. | 3365 |
| `editor_terrainEditor.getTerrainFolder()` | Folder of the level's terrain materials: '/art/terrain/' or the old '/art/terrains/'. | 3372 |
| `editor_terrainEditor.getUniqueMtlName(initialName, counter)` | Returns a material name absent from the library: initialName, then initialName0, initialName1... | 721 |
| `editor_terrainEditor.getVars()` | Returns the internal var table (UI state, levelPath, current brush...). | 3364 |
| `editor_terrainEditor.onClientEndMission()` | Hook called at the end of the mission: clears the in-memory material library. *(internal)* *(hook)* | 3285 |
| `editor_terrainEditor.onEditorBeforeSaveLevel()` | Hook called before the level is saved: saves the modified terrain materials then the terrain file (emitting onEditorBeforeSaveTerrain / onEditorAfterSaveTerrain) if changes are pending. *(internal)* *(hook)* | 3120 |
| `editor_terrainEditor.onEditorDeactivated()` | Hook called when the editor is deactivated; does nothing in this version. *(internal)* *(hook)* | 3282 |
| `editor_terrainEditor.onEditorDeleteSelection()` | Hook called before the selection is deleted: detaches the selected TerrainBlocks from the TerrainEditor and clears the state if it was the active block, to avoid crashes. *(internal)* *(hook)* | 3297 |
| `editor_terrainEditor.onEditorGui()` | Render hook: draws the import dialog, the export dialog, the paint window, the softness curve and the terrain toolbar. *(internal)* *(hook)* | 2399 |
| `editor_terrainEditor.onEditorInitialized()` | Editor initialization hook: registers the windows (terrainPainter, import, export, softness curve, autoPaint modal) and the 'Terrain Tools' edit mode, then calls initialize(). *(internal)* *(hook)* | 3258 |
| `editor_terrainEditor.onEditorObjectAdded(id)` | Hook called when an object is added in the editor: if it is a TerrainBlock, rescans the blocks (updateEditorTerrainBlocks). *(internal)* *(hook)* | 3289 |
| `editor_terrainEditor.onEditorPreferenceValueChanged(path, value)` | Hook called when a preference changes: applies terrainEditor.general.* (size, pressure, softness, height, slopes, soft selection filter) and terrainEditor.terraform.* (DOI, margin, falloff, roughness, scale) to the brush/terraformer. *(internal)* *(hook)* | 3145 |
| `editor_terrainEditor.onEditorRegisterPreferences(prefsRegistry)` | Preference registration hook: creates the terrainEditor category (general, import, terrainMaterialLibrary, terraform) with their default values and bounds. *(internal)* *(hook)* | 3215 |
| `editor_terrainEditor.removeMap(mtlProxy, mapType)` | Clears a map of a proxy (updateMap with an empty path). A TODO in the code questions the origin of mtlProxy. | 1026 |
| `editor_terrainEditor.saveMaterials()` | Saves the modified terrain materials (terrEd_PersistMan:saveDirty). | 1031 |
| `editor_terrainEditor.saveTerrainAndMaterials()` | Saves the materials then the terrain file (.ter) of the active TerrainBlock, clears the notifications and displays 'Saved TerrainBlock'. | 1036 |
| `editor_terrainEditor.selectPaintMaterial(matProxy)` | Selects a paint material and sets the TerrainEditor paint index (index - 1). | 884 |
| `editor_terrainEditor.setActiveTerrainBlock(id)` | Sets the TerrainBlock the tools work on (until the user chooses another): attaches it to the TerrainEditor, resets the selected paint material and selects the first one. No effect if the id is not found. | 1059 |
| `editor_terrainEditor.setMaterialsDirty()` | Marks the terrain materials as modified (editor.setDirty + notification); they will be saved with the level. | 530 |
| `editor_terrainEditor.setTerrainDirty()` | Marks the terrain as modified (editor.setDirty) and shows the 'unsaved terrain changes' notification. The terrain will be saved when the level is saved. To be called after any direct modification of the heightmap. | 525 |
| `editor_terrainEditor.setupVars()` | See above: recomputes the UI variables. | 2389 |
| `editor_terrainEditor.updateEditorTerrainBlocks(preferredId)` | Rescans the level's TerrainBlocks, detaches the old ones and attaches all the new ones to the TerrainEditor, then reactivates the preferred block (or the active one, or the first); clears the state if there are none left. | 1108 |
| `editor_terrainEditor.updateMap(mtlProxy, map, path)` | Assigns a texture path to a map of a proxy ('diffuse', 'macro', 'detail', 'normal') or to the importer/exporter fields ('heightMap', 'holeMap', 'textureMap', 'mesh', or table {meshIndex=...}). | 377 |
| `editor_terrainEditor.updateMaterialLibrary()` | Rereads the level's JSON materials file and rebuilds the library (materialsInJson). (A TODO in the code says this should migrate to terrainMaterialsEditor.lua.) | 733 |
| `editor_terrainEditor.updatePaintMaterialProxies()` | Rebuilds the paint material proxies of the active TerrainBlock (names, indices, inTerrainBlock), warns if the count does not match and reselects the previous material. | 900 |
| `editor_terrainEditor.updateTerrainBlockProxies()` | Rebuilds the list of the level's TerrainBlocks (proxies {selected, id} by name) and the sorted list of names for the combo. | 1046 |

### Parameter details

#### `editor_terrainEditor.beginChangeBrushSizeWithKeys(direction)`

Enables auto-repeat of the brush size change with the [ and ] keys.

- `direction` (*integer*) : Direction of the change (changeBrushSize convention: 1 enlarge, 0 reduce, inferred from code)

#### `editor_terrainEditor.changeBrushSize(value, step)`

Increases (value == 1) or decreases (value == 0) the brush size by `step`, clamped to 1-256, and applies it to the TerrainEditor. Any other value of value changes nothing.

- `value` (*integer*) : 1 to enlarge, 0 to reduce
- `step` (*number*) : Size increment

#### `editor_terrainEditor.copyMaterialProxyWithInputs(mtlProxy)`

Deep copy of a material proxy, recreating the imgui input widgets (name, size, strengths...). Fills groundmodelName from the uppercase internalName if it is empty.

- `mtlProxy` (*table*) : Source proxy
- **returns**: table Copy with *Input fields.

#### `editor_terrainEditor.createMaterialProxy(index, pid, mtlObject, name, dirty, isNew)`

Builds a Lua proxy of a terrain material (diffuse/normal/detail/macro maps, sizes, strengths, distances, side projection, parallaxScale, groundmodelName, uniqueID = name-persistentId). Calls fixGroundmodelName; if dirty is true, also marks the terrain as modified.

- `index` (*integer*) : Index (1-based)
- `pid` (*string|nil*) : persistentId (created if empty)
- `mtlObject` (*userdata*) : Terrain material object
- `name` (*string*) : internalName
- `dirty` (*boolean|nil*) : true to mark dirty
- `isNew` (*boolean|nil*) : true if the material was newly created
- **returns**: table Material proxy.

#### `editor_terrainEditor.deleteMaterialInJson(name)`

Removes from the in-memory library the material with the given internalName (does not modify the file).

- `name` (*string*) : internalName of the material

#### `editor_terrainEditor.dragDropTarget(mtlProxy, map, cbData)`

imgui drag-and-drop target for an asset (ASSETDRAGDROP payload of 2048 bytes): calls updateMap with the dropped path. To be called right after an imgui widget.

- `mtlProxy` (*table*) : Material proxy
- `map` (*string|table*) : Target map
- `cbData` (*any*) : Unused (inferred from code)

#### `editor_terrainEditor.fixGroundmodelName(name, mtlObject, isNew)`

Migration: the groundmodel used to be stored in the internalName; now a dedicated groundmodel field exists. If this field is empty, it is filled from the uppercase internalName (or 'ASPHALT' for a new material), the material is marked dirty and a warning is logged.

- `name` (*string*) : internalName
- `mtlObject` (*userdata*) : Material
- `isNew` (*boolean|nil*) : true if new

#### `editor_terrainEditor.getErrors()`

Table of detected format errors/warnings (key -> true).

- **returns**: table<string, boolean> 

#### `editor_terrainEditor.getLevelPath()`

Path of the current level (var.levelPath).

- **returns**: string|nil 

#### `editor_terrainEditor.getMatFilePath()`

Path (relative to the level) of the terrain materials file, normally '/art/terrain/main.materials.json'.

- **returns**: string 

#### `editor_terrainEditor.getMaterialsInJson()`

Level material library read from the JSON.

- **returns**: table Materials keyed by id/persistentId, with internalName, etc.

#### `editor_terrainEditor.getMtlIdByName(matName)`

Looks up an import material by name (exact, then case-insensitive). Returns its 0-based index, its name and whether it was found; otherwise 0 and the first material with found=false; (0, 'unknown', false) if there are none.

- `matName` (*string*) : Material name
- **returns**: integer Index (0-based)
- **returns**: string Name retained
- **returns**: boolean true if found

#### `editor_terrainEditor.getPaintMaterialProxies()`

List of the paint material proxies of the active TerrainBlock.

- **returns**: table[] 

#### `editor_terrainEditor.getSelectedPaintMaterialProxy()`

Proxy of the selected paint material (or nil).

- **returns**: table|nil 

#### `editor_terrainEditor.getTerrainBlock()`

Returns the active TerrainBlock object (looked up by its id) or nil if there is none.

- **returns**: userdata|nil TerrainBlock

#### `editor_terrainEditor.getTerrainBlockMaterialIndex(name)`

Index (1-based) of the paint material with this internalName, or -1 if it is not in the block.

- `name` (*string*) : internalName
- **returns**: integer Index or -1

#### `editor_terrainEditor.getTerrainBlockProxies()`

Table of TerrainBlock proxies keyed by object name.

- **returns**: table<string, table> { [name] = { selected = boolean, id = integer } }

#### `editor_terrainEditor.getTerrainEditor()`

Returns the TerrainEditor (C++) object used for world/grid conversions, brushes and actions.

- **returns**: userdata TerrainEditor

#### `editor_terrainEditor.getTerrainFolder()`

Folder of the level's terrain materials: '/art/terrain/' or the old '/art/terrains/'.

- **returns**: string 

#### `editor_terrainEditor.getUniqueMtlName(initialName, counter)`

Returns a material name absent from the library: initialName, then initialName0, initialName1...

- `initialName` (*string|nil*) : Base name ('NewMaterial' by default).
- `counter` (*integer|nil*) : Starting suffix (recursive, internal).
- **returns**: string Unique name.

#### `editor_terrainEditor.getVars()`

Returns the internal var table (UI state, levelPath, current brush...).

- **returns**: table var table

#### `editor_terrainEditor.onEditorObjectAdded(id)`

Hook called when an object is added in the editor: if it is a TerrainBlock, rescans the blocks (updateEditorTerrainBlocks).

- `id` (*integer*) : Id of the added object

#### `editor_terrainEditor.onEditorPreferenceValueChanged(path, value)`

Hook called when a preference changes: applies terrainEditor.general.* (size, pressure, softness, height, slopes, soft selection filter) and terrainEditor.terraform.* (DOI, margin, falloff, roughness, scale) to the brush/terraformer.

- `path` (*string*) : Preference path
- `value` (*any*) : New value

#### `editor_terrainEditor.onEditorRegisterPreferences(prefsRegistry)`

Preference registration hook: creates the terrainEditor category (general, import, terrainMaterialLibrary, terraform) with their default values and bounds.

- `prefsRegistry` (*table*) : Editor preferences registry

#### `editor_terrainEditor.removeMap(mtlProxy, mapType)`

Clears a map of a proxy (updateMap with an empty path). A TODO in the code questions the origin of mtlProxy.

- `mtlProxy` (*table*) : Material proxy
- `mapType` (*string*) : Map type

#### `editor_terrainEditor.selectPaintMaterial(matProxy)`

Selects a paint material and sets the TerrainEditor paint index (index - 1).

- `matProxy` (*table*) : Material proxy (with 1-based .index)

#### `editor_terrainEditor.setActiveTerrainBlock(id)`

Sets the TerrainBlock the tools work on (until the user chooses another): attaches it to the TerrainEditor, resets the selected paint material and selects the first one. No effect if the id is not found.

- `id` (*integer*) : Id of the TerrainBlock object

#### `editor_terrainEditor.updateEditorTerrainBlocks(preferredId)`

Rescans the level's TerrainBlocks, detaches the old ones and attaches all the new ones to the TerrainEditor, then reactivates the preferred block (or the active one, or the first); clears the state if there are none left.

- `preferredId` (*integer|nil*) : Id of the block to activate first.

#### `editor_terrainEditor.updateMap(mtlProxy, map, path)`

Assigns a texture path to a map of a proxy ('diffuse', 'macro', 'detail', 'normal') or to the importer/exporter fields ('heightMap', 'holeMap', 'textureMap', 'mesh', or table {meshIndex=...}).

- `mtlProxy` (*table*) : Material proxy (ignored for import maps)
- `map` (*string|table*) : Map type
- `path` (*string*) : File path

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onEditorAfterSaveTerrain`
- `onEditorBeforeSaveTerrain`

## Calls into the engine (C++)

- `FS:` `directoryCreate`, `directoryExists`, `fileExists`, `findFiles`, `stat`
- `debugDrawer:` `drawSphere`
- `obj:` `getClassName`, `getField`, `registerObject`, `setField`, `setPosition`
- `scenetree.` `findClassObjects`, `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/terrainEditor.lua`.*
