---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/terrainEditor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- World Editor terrain editor ('Terrain Tools' edit mode, terrainToolsEditMode). It handles the sculpting, material painting and terraforming brushes (via extensions/editor/terraformTool), the choice of the active TerrainBlock, the level's terrain material library (art/terrain/main.materials.json) as 'proxies', the terrain import/export window (heightmap, hole map, texture maps, meshes, presets) and saving the terrain and materials before the level is saved. A modder mostly uses it to get the TerrainBlock/TerrainEditor object (getTerrainBlock, getTerrainEditor), mark the terrain as modified (setTerrainDirty) or manipulate painted materials.
--- Access: extension `editor_terrainEditor`: `extensions.load("editor_terrainEditor")`, then the global `editor_terrainEditor`
---@class editor_terrainEditor
editor_terrainEditor = {}

--- Enables auto-repeat of the brush size change with the [ and ] keys.
---Source: lua/ge/extensions/editor/terrainEditor.lua:3376
---@param direction integer Direction of the change (changeBrushSize convention: 1 enlarge, 0 reduce, inferred from code)
function editor_terrainEditor.beginChangeBrushSizeWithKeys(direction) end

--- Increases (value == 1) or decreases (value == 0) the brush size by `step`, clamped to 1-256, and applies it to the TerrainEditor. Any other value of value changes nothing.
---Source: lua/ge/extensions/editor/terrainEditor.lua:2482
---@param value integer 1 to enlarge, 0 to reduce
---@param step number Size increment
function editor_terrainEditor.changeBrushSize(value, step) end

--- Detects the location of the materials file (art/terrain or old art/terrains) and flags the obsolete format (errors.deprecated_material_file).
---Source: lua/ge/extensions/editor/terrainEditor.lua:2798
function editor_terrainEditor.checkForTerrainMaterialFileFormat() end

--- Deep copy of a material proxy, recreating the imgui input widgets (name, size, strengths...). Fills groundmodelName from the uppercase internalName if it is empty.
---Source: lua/ge/extensions/editor/terrainEditor.lua:621
---@param mtlProxy table Source proxy
---@return table  Copy with *Input fields.
function editor_terrainEditor.copyMaterialProxyWithInputs(mtlProxy) end

--- Builds a Lua proxy of a terrain material (diffuse/normal/detail/macro maps, sizes, strengths, distances, side projection, parallaxScale, groundmodelName, uniqueID = name-persistentId). Calls fixGroundmodelName; if dirty is true, also marks the terrain as modified.
---Source: lua/ge/extensions/editor/terrainEditor.lua:671
---@param index integer Index (1-based)
---@param pid string|nil persistentId (created if empty)
---@param mtlObject userdata Terrain material object
---@param name string internalName
---@param dirty boolean|nil true to mark dirty
---@param isNew boolean|nil true if the material was newly created
---@return table  Material proxy.
function editor_terrainEditor.createMaterialProxy(index, pid, mtlObject, name, dirty, isNew) end

--- Removes from the in-memory library the material with the given internalName (does not modify the file).
---Source: lua/ge/extensions/editor/terrainEditor.lua:3346
---@param name string internalName of the material
function editor_terrainEditor.deleteMaterialInJson(name) end

--- imgui drag-and-drop target for an asset (ASSETDRAGDROP payload of 2048 bytes): calls updateMap with the dropped path. To be called right after an imgui widget.
---Source: lua/ge/extensions/editor/terrainEditor.lua:409
---@param mtlProxy table Material proxy
---@param map string|table Target map
---@param cbData any Unused (inferred from code)
function editor_terrainEditor.dragDropTarget(mtlProxy, map, cbData) end

--- Stops the auto-repeat of the brush size change.
---Source: lua/ge/extensions/editor/terrainEditor.lua:3377
function editor_terrainEditor.endChangeBrushSizeWithKeys() end

--- Migration: the groundmodel used to be stored in the internalName; now a dedicated groundmodel field exists. If this field is empty, it is filled from the uppercase internalName (or 'ASPHALT' for a new material), the material is marked dirty and a warning is logged.
---Source: lua/ge/extensions/editor/terrainEditor.lua:649
---@param name string internalName
---@param mtlObject userdata Material
---@param isNew boolean|nil true if new
function editor_terrainEditor.fixGroundmodelName(name, mtlObject, isNew) end

--- Clears the 'deprecated_material_file' error (to be called once the materials file has been upgraded).
---Source: lua/ge/extensions/editor/terrainEditor.lua:3375
function editor_terrainEditor.fixedFileFormat() end

--- Table of detected format errors/warnings (key -> true).
---Source: lua/ge/extensions/editor/terrainEditor.lua:3373
---@return table<string, boolean>
function editor_terrainEditor.getErrors() end

--- Path of the current level (var.levelPath).
---Source: lua/ge/extensions/editor/terrainEditor.lua:3374
---@return string|nil
function editor_terrainEditor.getLevelPath() end

--- Path (relative to the level) of the terrain materials file, normally '/art/terrain/main.materials.json'.
---Source: lua/ge/extensions/editor/terrainEditor.lua:3371
---@return string
function editor_terrainEditor.getMatFilePath() end

--- Level material library read from the JSON.
---Source: lua/ge/extensions/editor/terrainEditor.lua:3367
---@return table  Materials keyed by id/persistentId, with internalName, etc.
function editor_terrainEditor.getMaterialsInJson() end

--- Looks up an import material by name (exact, then case-insensitive). Returns its 0-based index, its name and whether it was found; otherwise 0 and the first material with found=false; (0, 'unknown', false) if there are none.
---Source: lua/ge/extensions/editor/terrainEditor.lua:223
---@param matName string Material name
---@return integer  Index (0-based)
---@return string  Name retained
---@return boolean  true if found
function editor_terrainEditor.getMtlIdByName(matName) end

--- List of the paint material proxies of the active TerrainBlock.
---Source: lua/ge/extensions/editor/terrainEditor.lua:3369
---@return table[]
function editor_terrainEditor.getPaintMaterialProxies() end

--- Proxy of the selected paint material (or nil).
---Source: lua/ge/extensions/editor/terrainEditor.lua:3368
---@return table|nil
function editor_terrainEditor.getSelectedPaintMaterialProxy() end

--- Returns the active TerrainBlock object (looked up by its id) or nil if there is none.
---Source: lua/ge/extensions/editor/terrainEditor.lua:3366
---@return userdata|nil  TerrainBlock
function editor_terrainEditor.getTerrainBlock() end

--- Index (1-based) of the paint material with this internalName, or -1 if it is not in the block.
---Source: lua/ge/extensions/editor/terrainEditor.lua:3355
---@param name string internalName
---@return integer  Index or -1
function editor_terrainEditor.getTerrainBlockMaterialIndex(name) end

--- Table of TerrainBlock proxies keyed by object name.
---Source: lua/ge/extensions/editor/terrainEditor.lua:3370
---@return table<string, table>  { [name] = { selected = boolean, id = integer } }
function editor_terrainEditor.getTerrainBlockProxies() end

--- Returns the TerrainEditor (C++) object used for world/grid conversions, brushes and actions.
---Source: lua/ge/extensions/editor/terrainEditor.lua:3365
---@return userdata  TerrainEditor
function editor_terrainEditor.getTerrainEditor() end

--- Folder of the level's terrain materials: '/art/terrain/' or the old '/art/terrains/'.
---Source: lua/ge/extensions/editor/terrainEditor.lua:3372
---@return string
function editor_terrainEditor.getTerrainFolder() end

--- Returns a material name absent from the library: initialName, then initialName0, initialName1...
---Source: lua/ge/extensions/editor/terrainEditor.lua:721
---@param initialName string|nil Base name ('NewMaterial' by default).
---@param counter integer|nil Starting suffix (recursive, internal).
---@return string  Unique name.
function editor_terrainEditor.getUniqueMtlName(initialName, counter) end

--- Returns the internal var table (UI state, levelPath, current brush...).
---Source: lua/ge/extensions/editor/terrainEditor.lua:3364
---@return table  var table
function editor_terrainEditor.getVars() end

--- Hook called at the end of the mission: clears the in-memory material library.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/terrainEditor.lua:3285
function editor_terrainEditor.onClientEndMission() end

--- Hook called before the level is saved: saves the modified terrain materials then the terrain file (emitting onEditorBeforeSaveTerrain / onEditorAfterSaveTerrain) if changes are pending.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/terrainEditor.lua:3120
function editor_terrainEditor.onEditorBeforeSaveLevel() end

--- Hook called when the editor is deactivated; does nothing in this version.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/terrainEditor.lua:3282
function editor_terrainEditor.onEditorDeactivated() end

--- Hook called before the selection is deleted: detaches the selected TerrainBlocks from the TerrainEditor and clears the state if it was the active block, to avoid crashes.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/terrainEditor.lua:3297
function editor_terrainEditor.onEditorDeleteSelection() end

--- Render hook: draws the import dialog, the export dialog, the paint window, the softness curve and the terrain toolbar.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/terrainEditor.lua:2399
function editor_terrainEditor.onEditorGui() end

--- Editor initialization hook: registers the windows (terrainPainter, import, export, softness curve, autoPaint modal) and the 'Terrain Tools' edit mode, then calls initialize().
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/terrainEditor.lua:3258
function editor_terrainEditor.onEditorInitialized() end

--- Hook called when an object is added in the editor: if it is a TerrainBlock, rescans the blocks (updateEditorTerrainBlocks).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/terrainEditor.lua:3289
---@param id integer Id of the added object
function editor_terrainEditor.onEditorObjectAdded(id) end

--- Hook called when a preference changes: applies terrainEditor.general.* (size, pressure, softness, height, slopes, soft selection filter) and terrainEditor.terraform.* (DOI, margin, falloff, roughness, scale) to the brush/terraformer.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/terrainEditor.lua:3145
---@param path string Preference path
---@param value any New value
function editor_terrainEditor.onEditorPreferenceValueChanged(path, value) end

--- Preference registration hook: creates the terrainEditor category (general, import, terrainMaterialLibrary, terraform) with their default values and bounds.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/terrainEditor.lua:3215
---@param prefsRegistry table Editor preferences registry
function editor_terrainEditor.onEditorRegisterPreferences(prefsRegistry) end

--- Clears a map of a proxy (updateMap with an empty path). A TODO in the code questions the origin of mtlProxy.
---Source: lua/ge/extensions/editor/terrainEditor.lua:1026
---@param mtlProxy table Material proxy
---@param mapType string Map type
function editor_terrainEditor.removeMap(mtlProxy, mapType) end

--- Saves the modified terrain materials (terrEd_PersistMan:saveDirty).
---Source: lua/ge/extensions/editor/terrainEditor.lua:1031
function editor_terrainEditor.saveMaterials() end

--- Saves the materials then the terrain file (.ter) of the active TerrainBlock, clears the notifications and displays 'Saved TerrainBlock'.
---Source: lua/ge/extensions/editor/terrainEditor.lua:1036
function editor_terrainEditor.saveTerrainAndMaterials() end

--- Selects a paint material and sets the TerrainEditor paint index (index - 1).
---Source: lua/ge/extensions/editor/terrainEditor.lua:884
---@param matProxy table Material proxy (with 1-based .index)
function editor_terrainEditor.selectPaintMaterial(matProxy) end

--- Sets the TerrainBlock the tools work on (until the user chooses another): attaches it to the TerrainEditor, resets the selected paint material and selects the first one. No effect if the id is not found.
---Source: lua/ge/extensions/editor/terrainEditor.lua:1059
---@param id integer Id of the TerrainBlock object
function editor_terrainEditor.setActiveTerrainBlock(id) end

--- Marks the terrain materials as modified (editor.setDirty + notification); they will be saved with the level.
---Source: lua/ge/extensions/editor/terrainEditor.lua:530
function editor_terrainEditor.setMaterialsDirty() end

--- Marks the terrain as modified (editor.setDirty) and shows the 'unsaved terrain changes' notification. The terrain will be saved when the level is saved. To be called after any direct modification of the heightmap.
---Source: lua/ge/extensions/editor/terrainEditor.lua:525
function editor_terrainEditor.setTerrainDirty() end

--- See above: recomputes the UI variables.
---Source: lua/ge/extensions/editor/terrainEditor.lua:2389
function editor_terrainEditor.setupVars() end

--- Rescans the level's TerrainBlocks, detaches the old ones and attaches all the new ones to the TerrainEditor, then reactivates the preferred block (or the active one, or the first); clears the state if there are none left.
---Source: lua/ge/extensions/editor/terrainEditor.lua:1108
---@param preferredId integer|nil Id of the block to activate first.
function editor_terrainEditor.updateEditorTerrainBlocks(preferredId) end

--- Assigns a texture path to a map of a proxy ('diffuse', 'macro', 'detail', 'normal') or to the importer/exporter fields ('heightMap', 'holeMap', 'textureMap', 'mesh', or table {meshIndex=...}).
---Source: lua/ge/extensions/editor/terrainEditor.lua:377
---@param mtlProxy table Material proxy (ignored for import maps)
---@param map string|table Map type
---@param path string File path
function editor_terrainEditor.updateMap(mtlProxy, map, path) end

--- Rereads the level's JSON materials file and rebuilds the library (materialsInJson). (A TODO in the code says this should migrate to terrainMaterialsEditor.lua.)
---Source: lua/ge/extensions/editor/terrainEditor.lua:733
function editor_terrainEditor.updateMaterialLibrary() end

--- Rebuilds the paint material proxies of the active TerrainBlock (names, indices, inTerrainBlock), warns if the count does not match and reselects the previous material.
---Source: lua/ge/extensions/editor/terrainEditor.lua:900
function editor_terrainEditor.updatePaintMaterialProxies() end

--- Rebuilds the list of the level's TerrainBlocks (proxies {selected, id} by name) and the sorted list of names for the combo.
---Source: lua/ge/extensions/editor/terrainEditor.lua:1046
function editor_terrainEditor.updateTerrainBlockProxies() end

