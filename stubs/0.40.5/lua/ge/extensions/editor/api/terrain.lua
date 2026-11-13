---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/api/terrain.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_api_terrain` : `extensions.load("editor_api_terrain")`, puis la globale `editor_api_terrain`
---@class editor_api_terrain
editor_api_terrain = {}

---Source : lua/ge/extensions/editor/api/terrain.lua:205
---@param editorInstance any
function editor_api_terrain.initialize(editorInstance) end

--- Classe locale `editor` de lua/ge/extensions/editor/api/terrain.lua
---@class editor_api_terrain_editor
local editor_api_terrain_editor = {}

---Source : lua/ge/extensions/editor/api/terrain.lua:157
---@param groupName any
---@param foliageBrush any
function editor_api_terrain_editor.addFoliageBrushToGroup(groupName, foliageBrush) end

---Source : lua/ge/extensions/editor/api/terrain.lua:97
---@param x any
---@param y any
---@param topOrBottom any
---@param amount any
function editor_api_terrain_editor.alignTerrainWithMesh(x, y, topOrBottom, amount) end

---Source : lua/ge/extensions/editor/api/terrain.lua:41
---@param name any
function editor_api_terrain_editor.applyTerrainHeightBrushPreset(name) end

---Source : lua/ge/extensions/editor/api/terrain.lua:73
---@param x any
---@param y any
---@param amount any
function editor_api_terrain_editor.averageSmoothTerrain(x, y, amount) end

---Source : lua/ge/extensions/editor/api/terrain.lua:89
---@param x any
---@param y any
function editor_api_terrain_editor.clearTerrain(x, y) end

---Source : lua/ge/extensions/editor/api/terrain.lua:137
---@param name any
function editor_api_terrain_editor.createFoliageGroup(name) end

---Source : lua/ge/extensions/editor/api/terrain.lua:145
---@param foliageMesh any
function editor_api_terrain_editor.createFoliageMesh(foliageMesh) end

---Source : lua/ge/extensions/editor/api/terrain.lua:17
---@param terrainInfo any
function editor_api_terrain_editor.createTerrain(terrainInfo) end

---Source : lua/ge/extensions/editor/api/terrain.lua:109
---@param mtl any
function editor_api_terrain_editor.createTerrainPaintMaterial(mtl) end

---Source : lua/ge/extensions/editor/api/terrain.lua:161
---@param name any
function editor_api_terrain_editor.deleteFoliageBrush(name) end

---Source : lua/ge/extensions/editor/api/terrain.lua:141
---@param name any
function editor_api_terrain_editor.deleteFoliageGroup(name) end

---Source : lua/ge/extensions/editor/api/terrain.lua:149
---@param foliageMeshName any
function editor_api_terrain_editor.deleteFoliageMesh(foliageMeshName) end

---Source : lua/ge/extensions/editor/api/terrain.lua:21
---@param terrainObjectId any
function editor_api_terrain_editor.deleteTerrain(terrainObjectId) end

---Source : lua/ge/extensions/editor/api/terrain.lua:45
---@param name any
function editor_api_terrain_editor.deleteTerrainHeightBrushPreset(name) end

---Source : lua/ge/extensions/editor/api/terrain.lua:129
---@param name any
function editor_api_terrain_editor.deleteTerrainPaintBrushPreset(name) end

---Source : lua/ge/extensions/editor/api/terrain.lua:181
---@param x any
---@param y any
function editor_api_terrain_editor.eraseFoliage(x, y) end

---Source : lua/ge/extensions/editor/api/terrain.lua:185
---@param x any
---@param y any
function editor_api_terrain_editor.eraseSetFoliageBrushOrGroup(x, y) end

---Source : lua/ge/extensions/editor/api/terrain.lua:29
---@param terrainObjectId any
---@param filename any
function editor_api_terrain_editor.exportTerrainHeightmap(terrainObjectId, filename) end

---Source : lua/ge/extensions/editor/api/terrain.lua:81
---@param x any
---@param y any
---@param amount any
function editor_api_terrain_editor.flattenTerrain(x, y, amount) end

---Source : lua/ge/extensions/editor/api/terrain.lua:153
function editor_api_terrain_editor.getFoliageMeshes() end

---Source : lua/ge/extensions/editor/api/terrain.lua:49
function editor_api_terrain_editor.getTerrainHeightBrushPresets() end

---Source : lua/ge/extensions/editor/api/terrain.lua:133
function editor_api_terrain_editor.getTerrainPaintBrushPresets() end

---Source : lua/ge/extensions/editor/api/terrain.lua:53
---@param x any
---@param y any
---@param amount any
function editor_api_terrain_editor.grabTerrain(x, y, amount) end

---Source : lua/ge/extensions/editor/api/terrain.lua:25
---@param importInfo any
function editor_api_terrain_editor.importTerrainHeightmap(importInfo) end

---Source : lua/ge/extensions/editor/api/terrain.lua:125
---@param name any
function editor_api_terrain_editor.loadTerrainPaintBrushPreset(name) end

---Source : lua/ge/extensions/editor/api/terrain.lua:61
---@param x any
---@param y any
---@param amount any
function editor_api_terrain_editor.lowerTerrain(x, y, amount) end

---Source : lua/ge/extensions/editor/api/terrain.lua:77
---@param x any
---@param y any
---@param amount any
function editor_api_terrain_editor.noiseTerrain(x, y, amount) end

---Source : lua/ge/extensions/editor/api/terrain.lua:177
---@param x any
---@param y any
function editor_api_terrain_editor.paintFoliage(x, y) end

---Source : lua/ge/extensions/editor/api/terrain.lua:113
---@param x any
---@param y any
function editor_api_terrain_editor.paintTerrain(x, y) end

---Source : lua/ge/extensions/editor/api/terrain.lua:57
---@param x any
---@param y any
---@param amount any
function editor_api_terrain_editor.raiseTerrain(x, y, amount) end

---Source : lua/ge/extensions/editor/api/terrain.lua:93
---@param x any
---@param y any
function editor_api_terrain_editor.restoreTerrain(x, y) end

---Source : lua/ge/extensions/editor/api/terrain.lua:193
---@param delta any
function editor_api_terrain_editor.rotateFoliageSelection(delta) end

---Source : lua/ge/extensions/editor/api/terrain.lua:37
---@param name any
function editor_api_terrain_editor.saveTerrainHeightBrushPreset(name) end

---Source : lua/ge/extensions/editor/api/terrain.lua:121
---@param name any
function editor_api_terrain_editor.saveTerrainPaintBrushPreset(name) end

---Source : lua/ge/extensions/editor/api/terrain.lua:197
---@param delta any
function editor_api_terrain_editor.scaleFoliageSelection(delta) end

---Source : lua/ge/extensions/editor/api/terrain.lua:201
---@param x any
---@param y any
function editor_api_terrain_editor.selectFoliage(x, y) end

---Source : lua/ge/extensions/editor/api/terrain.lua:105
---@param mtl any
function editor_api_terrain_editor.selectTerrainPaintMaterial(mtl) end

---Source : lua/ge/extensions/editor/api/terrain.lua:169
---@param brushName any
function editor_api_terrain_editor.setFoliageBrush(brushName) end

---Source : lua/ge/extensions/editor/api/terrain.lua:165
---@param name any
function editor_api_terrain_editor.setFoliageBrushGroup(name) end

---Source : lua/ge/extensions/editor/api/terrain.lua:173
---@param brush any
function editor_api_terrain_editor.setFoliagePaintBrushSettings(brush) end

---Source : lua/ge/extensions/editor/api/terrain.lua:85
---@param x any
---@param y any
---@param amount any
function editor_api_terrain_editor.setTerrainHeight(x, y, amount) end

---Source : lua/ge/extensions/editor/api/terrain.lua:33
---@param brush any
function editor_api_terrain_editor.setTerrainHeightBrush(brush) end

---Source : lua/ge/extensions/editor/api/terrain.lua:117
---@param brush any
function editor_api_terrain_editor.setTerrainPaintBrush(brush) end

---Source : lua/ge/extensions/editor/api/terrain.lua:69
---@param x any
---@param y any
---@param amount any
function editor_api_terrain_editor.smoothSlopeTerrain(x, y, amount) end

---Source : lua/ge/extensions/editor/api/terrain.lua:65
---@param x any
---@param y any
---@param amount any
function editor_api_terrain_editor.smoothTerrain(x, y, amount) end

---Source : lua/ge/extensions/editor/api/terrain.lua:101
---@param x any
---@param y any
function editor_api_terrain_editor.subtractMeshFromTerrain(x, y) end

---Source : lua/ge/extensions/editor/api/terrain.lua:189
---@param delta any
function editor_api_terrain_editor.translateFoliageSelection(delta) end

