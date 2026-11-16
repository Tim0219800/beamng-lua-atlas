---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/api/terrain.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Skeleton of the editor API for terrain (sculpting, material painting, foliage). initialize(editor) adds 46 functions to the editor object, but all have an empty body (TODO comment): they do nothing and return nil. The planned hooks are mentioned in a comment: onEditorTerrainCreated, onEditorTerrainDelete, onEditorTerrainHeightBrushChanged, onEditorTerrainHeightChanged, onEditorTerrainCleared, onEditorTerrainRestored.
--- Access: extension `editor_api_terrain`: `extensions.load("editor_api_terrain")`, then the global `editor_api_terrain`
---@class editor_api_terrain
editor_api_terrain = {}

--- Adds to the editor object all the terrain/foliage functions listed in the editor class. Called by the editor API loader.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/api/terrain.lua:205
---@param editorInstance table Global editor object.
function editor_api_terrain.initialize(editorInstance) end

--- Functions added to editor. All are empty stubs (TODO).
---@class editor_api_terrain_editor
local editor_api_terrain_editor = {}

--- Planned: add a foliage brush to a group. Empty stub.
---Source: lua/ge/extensions/editor/api/terrain.lua:157
---@param groupName string Group name.
---@param foliageBrush any Brush (inferred from the name).
function editor_api_terrain_editor.addFoliageBrushToGroup(groupName, foliageBrush) end

--- Planned: align the terrain to a mesh (top or bottom). Empty stub.
---Source: lua/ge/extensions/editor/api/terrain.lua:97
---@param x number X coordinate.
---@param y number Y coordinate.
---@param topOrBottom any Top/bottom choice (inferred from the name).
---@param amount number Intensity.
function editor_api_terrain_editor.alignTerrainWithMesh(x, y, topOrBottom, amount) end

--- Planned: apply a height brush preset. Empty stub.
---Source: lua/ge/extensions/editor/api/terrain.lua:41
---@param name string Preset name.
function editor_api_terrain_editor.applyTerrainHeightBrushPreset(name) end

--- Planned: smoothing by averaging. Empty stub.
---Source: lua/ge/extensions/editor/api/terrain.lua:73
---@param x number X coordinate.
---@param y number Y coordinate.
---@param amount number Intensity.
function editor_api_terrain_editor.averageSmoothTerrain(x, y, amount) end

--- Planned: clear the terrain at (x, y) (onEditorTerrainCleared hook). Empty stub.
---Source: lua/ge/extensions/editor/api/terrain.lua:89
---@param x number X coordinate.
---@param y number Y coordinate.
function editor_api_terrain_editor.clearTerrain(x, y) end

--- Planned: create a foliage group. Empty stub.
---Source: lua/ge/extensions/editor/api/terrain.lua:137
---@param name string Group name.
function editor_api_terrain_editor.createFoliageGroup(name) end

--- Planned: create a foliage mesh. Empty stub.
---Source: lua/ge/extensions/editor/api/terrain.lua:145
---@param foliageMesh any Mesh definition (inferred from the name).
function editor_api_terrain_editor.createFoliageMesh(foliageMesh) end

--- Planned: create a terrain. Empty stub.
---Source: lua/ge/extensions/editor/api/terrain.lua:17
---@param terrainInfo table Creation info (inferred from the name).
function editor_api_terrain_editor.createTerrain(terrainInfo) end

--- Planned: create a paint material. Empty stub.
---Source: lua/ge/extensions/editor/api/terrain.lua:109
---@param mtl any Material (inferred from the name).
function editor_api_terrain_editor.createTerrainPaintMaterial(mtl) end

--- Planned: delete a foliage brush. Empty stub.
---Source: lua/ge/extensions/editor/api/terrain.lua:161
---@param name string Brush name.
function editor_api_terrain_editor.deleteFoliageBrush(name) end

--- Planned: delete a foliage group. Empty stub.
---Source: lua/ge/extensions/editor/api/terrain.lua:141
---@param name string Group name.
function editor_api_terrain_editor.deleteFoliageGroup(name) end

--- Planned: delete a foliage mesh. Empty stub.
---Source: lua/ge/extensions/editor/api/terrain.lua:149
---@param foliageMeshName string Mesh name.
function editor_api_terrain_editor.deleteFoliageMesh(foliageMeshName) end

--- Planned: delete a terrain. Empty stub.
---Source: lua/ge/extensions/editor/api/terrain.lua:21
---@param terrainObjectId integer Terrain id (inferred from the name).
function editor_api_terrain_editor.deleteTerrain(terrainObjectId) end

--- Planned: delete a height brush preset. Empty stub.
---Source: lua/ge/extensions/editor/api/terrain.lua:45
---@param name string Preset name.
function editor_api_terrain_editor.deleteTerrainHeightBrushPreset(name) end

--- Planned: delete a paint brush preset. Empty stub.
---Source: lua/ge/extensions/editor/api/terrain.lua:129
---@param name string Preset name.
function editor_api_terrain_editor.deleteTerrainPaintBrushPreset(name) end

--- Planned: erase foliage at (x, y). Empty stub.
---Source: lua/ge/extensions/editor/api/terrain.lua:181
---@param x number X coordinate.
---@param y number Y coordinate.
function editor_api_terrain_editor.eraseFoliage(x, y) end

--- Planned: erase the elements of the active brush/group at (x, y). Empty stub.
---Source: lua/ge/extensions/editor/api/terrain.lua:185
---@param x number X coordinate.
---@param y number Y coordinate.
function editor_api_terrain_editor.eraseSetFoliageBrushOrGroup(x, y) end

--- Planned: export a terrain's heightmap. Empty stub.
---Source: lua/ge/extensions/editor/api/terrain.lua:29
---@param terrainObjectId integer Terrain id.
---@param filename string Output file.
function editor_api_terrain_editor.exportTerrainHeightmap(terrainObjectId, filename) end

--- Planned: flatten the terrain. Empty stub.
---Source: lua/ge/extensions/editor/api/terrain.lua:81
---@param x number X coordinate.
---@param y number Y coordinate.
---@param amount number Intensity.
function editor_api_terrain_editor.flattenTerrain(x, y, amount) end

--- Planned: list the foliage meshes. Empty stub.
---Source: lua/ge/extensions/editor/api/terrain.lua:153
function editor_api_terrain_editor.getFoliageMeshes() end

--- Planned: list the height brush presets. Empty stub.
---Source: lua/ge/extensions/editor/api/terrain.lua:49
function editor_api_terrain_editor.getTerrainHeightBrushPresets() end

--- Planned: list the paint brush presets. Empty stub.
---Source: lua/ge/extensions/editor/api/terrain.lua:133
function editor_api_terrain_editor.getTerrainPaintBrushPresets() end

--- Planned: "grab" terrain tool at (x, y). Empty stub.
---Source: lua/ge/extensions/editor/api/terrain.lua:53
---@param x number X coordinate.
---@param y number Y coordinate.
---@param amount number Intensity.
function editor_api_terrain_editor.grabTerrain(x, y, amount) end

--- Planned: import a heightmap. Empty stub.
---Source: lua/ge/extensions/editor/api/terrain.lua:25
---@param importInfo table Import info (inferred from the name).
function editor_api_terrain_editor.importTerrainHeightmap(importInfo) end

--- Planned: load a paint brush preset. Empty stub.
---Source: lua/ge/extensions/editor/api/terrain.lua:125
---@param name string Preset name.
function editor_api_terrain_editor.loadTerrainPaintBrushPreset(name) end

--- Planned: lower the terrain at (x, y). Empty stub.
---Source: lua/ge/extensions/editor/api/terrain.lua:61
---@param x number X coordinate.
---@param y number Y coordinate.
---@param amount number Intensity.
function editor_api_terrain_editor.lowerTerrain(x, y, amount) end

--- Planned: add noise to the terrain. Empty stub.
---Source: lua/ge/extensions/editor/api/terrain.lua:77
---@param x number X coordinate.
---@param y number Y coordinate.
---@param amount number Intensity.
function editor_api_terrain_editor.noiseTerrain(x, y, amount) end

--- Planned: paint foliage at (x, y). Empty stub.
---Source: lua/ge/extensions/editor/api/terrain.lua:177
---@param x number X coordinate.
---@param y number Y coordinate.
function editor_api_terrain_editor.paintFoliage(x, y) end

--- Planned: paint the terrain at (x, y). Empty stub.
---Source: lua/ge/extensions/editor/api/terrain.lua:113
---@param x number X coordinate.
---@param y number Y coordinate.
function editor_api_terrain_editor.paintTerrain(x, y) end

--- Planned: raise the terrain at (x, y). Empty stub.
---Source: lua/ge/extensions/editor/api/terrain.lua:57
---@param x number X coordinate.
---@param y number Y coordinate.
---@param amount number Intensity.
function editor_api_terrain_editor.raiseTerrain(x, y, amount) end

--- Planned: restore the terrain at (x, y) (onEditorTerrainRestored hook). Empty stub.
---Source: lua/ge/extensions/editor/api/terrain.lua:93
---@param x number X coordinate.
---@param y number Y coordinate.
function editor_api_terrain_editor.restoreTerrain(x, y) end

--- Planned: rotate the foliage selection. Empty stub.
---Source: lua/ge/extensions/editor/api/terrain.lua:193
---@param delta any Rotation (inferred from the name).
function editor_api_terrain_editor.rotateFoliageSelection(delta) end

--- Planned: save a height brush preset. Empty stub.
---Source: lua/ge/extensions/editor/api/terrain.lua:37
---@param name string Preset name.
function editor_api_terrain_editor.saveTerrainHeightBrushPreset(name) end

--- Planned: save a paint brush preset. Empty stub.
---Source: lua/ge/extensions/editor/api/terrain.lua:121
---@param name string Preset name.
function editor_api_terrain_editor.saveTerrainPaintBrushPreset(name) end

--- Planned: scale the foliage selection. Empty stub.
---Source: lua/ge/extensions/editor/api/terrain.lua:197
---@param delta any Factor (inferred from the name).
function editor_api_terrain_editor.scaleFoliageSelection(delta) end

--- Planned: select foliage at (x, y). Empty stub.
---Source: lua/ge/extensions/editor/api/terrain.lua:201
---@param x number X coordinate.
---@param y number Y coordinate.
function editor_api_terrain_editor.selectFoliage(x, y) end

--- Planned: choose the paint material. Empty stub.
---Source: lua/ge/extensions/editor/api/terrain.lua:105
---@param mtl any Material (inferred from the name).
function editor_api_terrain_editor.selectTerrainPaintMaterial(mtl) end

--- Planned: choose the active foliage brush. Empty stub.
---Source: lua/ge/extensions/editor/api/terrain.lua:169
---@param brushName string Brush name.
function editor_api_terrain_editor.setFoliageBrush(brushName) end

--- Planned: choose the active brush group. Empty stub.
---Source: lua/ge/extensions/editor/api/terrain.lua:165
---@param name string Group name.
function editor_api_terrain_editor.setFoliageBrushGroup(name) end

--- Planned: set the foliage paint brush. Empty stub.
---Source: lua/ge/extensions/editor/api/terrain.lua:173
---@param brush table Settings (inferred from the name).
function editor_api_terrain_editor.setFoliagePaintBrushSettings(brush) end

--- Planned: set the terrain height. Empty stub.
---Source: lua/ge/extensions/editor/api/terrain.lua:85
---@param x number X coordinate.
---@param y number Y coordinate.
---@param amount number Height (inferred from the name).
function editor_api_terrain_editor.setTerrainHeight(x, y, amount) end

--- Planned: set the height brush. Empty stub.
---Source: lua/ge/extensions/editor/api/terrain.lua:33
---@param brush table Brush (inferred from the name).
function editor_api_terrain_editor.setTerrainHeightBrush(brush) end

--- Planned: set the paint brush. Empty stub.
---Source: lua/ge/extensions/editor/api/terrain.lua:117
---@param brush table Brush (inferred from the name).
function editor_api_terrain_editor.setTerrainPaintBrush(brush) end

--- Planned: smooth the slope. Empty stub.
---Source: lua/ge/extensions/editor/api/terrain.lua:69
---@param x number X coordinate.
---@param y number Y coordinate.
---@param amount number Intensity.
function editor_api_terrain_editor.smoothSlopeTerrain(x, y, amount) end

--- Planned: smooth the terrain. Empty stub.
---Source: lua/ge/extensions/editor/api/terrain.lua:65
---@param x number X coordinate.
---@param y number Y coordinate.
---@param amount number Intensity.
function editor_api_terrain_editor.smoothTerrain(x, y, amount) end

--- Planned: subtract a mesh from the terrain. Empty stub.
---Source: lua/ge/extensions/editor/api/terrain.lua:101
---@param x number X coordinate.
---@param y number Y coordinate.
function editor_api_terrain_editor.subtractMeshFromTerrain(x, y) end

--- Planned: translate the foliage selection. Empty stub.
---Source: lua/ge/extensions/editor/api/terrain.lua:189
---@param delta any Offset (inferred from the name).
function editor_api_terrain_editor.translateFoliageSelection(delta) end

