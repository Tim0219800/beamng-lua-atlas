---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/terrainEditor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_terrainEditor` : `extensions.load("editor_terrainEditor")`, puis la globale `editor_terrainEditor`
---@class editor_terrainEditor
editor_terrainEditor = {}

---Source : lua/ge/extensions/editor/terrainEditor.lua:3376
---@param direction any
function editor_terrainEditor.beginChangeBrushSizeWithKeys(direction) end

---Source : lua/ge/extensions/editor/terrainEditor.lua:2482
---@param value any
---@param step any
function editor_terrainEditor.changeBrushSize(value, step) end

---Source : lua/ge/extensions/editor/terrainEditor.lua:2798
function editor_terrainEditor.checkForTerrainMaterialFileFormat() end

---Source : lua/ge/extensions/editor/terrainEditor.lua:621
---@param mtlProxy any
function editor_terrainEditor.copyMaterialProxyWithInputs(mtlProxy) end

---Source : lua/ge/extensions/editor/terrainEditor.lua:671
---@param index any
---@param pid any
---@param mtlObject any
---@param name any
---@param dirty any
---@param isNew any
function editor_terrainEditor.createMaterialProxy(index, pid, mtlObject, name, dirty, isNew) end

---Source : lua/ge/extensions/editor/terrainEditor.lua:3346
---@param name any
function editor_terrainEditor.deleteMaterialInJson(name) end

--- drag'n'drop
---Source : lua/ge/extensions/editor/terrainEditor.lua:409
---@param mtlProxy any
---@param map any
---@param cbData any
function editor_terrainEditor.dragDropTarget(mtlProxy, map, cbData) end

---Source : lua/ge/extensions/editor/terrainEditor.lua:3377
function editor_terrainEditor.endChangeBrushSizeWithKeys() end

--- Background: in the past the groundmodel name was actually the internalName of the terrain material, but now we have a new groundmodel field in the
---  terrain material where we store the groundmodel name and use the internalName for the actual name of the terrain material
---  to fix this improper usage, we now check if the groundmodel field is empty and we set it from the internalName
---Source : lua/ge/extensions/editor/terrainEditor.lua:649
---@param name any
---@param mtlObject any
---@param isNew any
function editor_terrainEditor.fixGroundmodelName(name, mtlObject, isNew) end

---Source : lua/ge/extensions/editor/terrainEditor.lua:3375
function editor_terrainEditor.fixedFileFormat() end

---Source : lua/ge/extensions/editor/terrainEditor.lua:3373
function editor_terrainEditor.getErrors() end

---Source : lua/ge/extensions/editor/terrainEditor.lua:3374
function editor_terrainEditor.getLevelPath() end

---Source : lua/ge/extensions/editor/terrainEditor.lua:3371
function editor_terrainEditor.getMatFilePath() end

---Source : lua/ge/extensions/editor/terrainEditor.lua:3367
function editor_terrainEditor.getMaterialsInJson() end

---Source : lua/ge/extensions/editor/terrainEditor.lua:223
---@param matName any
function editor_terrainEditor.getMtlIdByName(matName) end

---Source : lua/ge/extensions/editor/terrainEditor.lua:3369
function editor_terrainEditor.getPaintMaterialProxies() end

---Source : lua/ge/extensions/editor/terrainEditor.lua:3368
function editor_terrainEditor.getSelectedPaintMaterialProxy() end

---Source : lua/ge/extensions/editor/terrainEditor.lua:3366
function editor_terrainEditor.getTerrainBlock() end

---Source : lua/ge/extensions/editor/terrainEditor.lua:3355
---@param name any
function editor_terrainEditor.getTerrainBlockMaterialIndex(name) end

---Source : lua/ge/extensions/editor/terrainEditor.lua:3370
function editor_terrainEditor.getTerrainBlockProxies() end

---Source : lua/ge/extensions/editor/terrainEditor.lua:3365
function editor_terrainEditor.getTerrainEditor() end

---Source : lua/ge/extensions/editor/terrainEditor.lua:3372
function editor_terrainEditor.getTerrainFolder() end

---Source : lua/ge/extensions/editor/terrainEditor.lua:721
---@param initialName any
---@param counter any
function editor_terrainEditor.getUniqueMtlName(initialName, counter) end

---Source : lua/ge/extensions/editor/terrainEditor.lua:3364
function editor_terrainEditor.getVars() end

---Source : lua/ge/extensions/editor/terrainEditor.lua:3285
function editor_terrainEditor.onClientEndMission() end

---Source : lua/ge/extensions/editor/terrainEditor.lua:3120
function editor_terrainEditor.onEditorBeforeSaveLevel() end

---Source : lua/ge/extensions/editor/terrainEditor.lua:3282
function editor_terrainEditor.onEditorDeactivated() end

--- Handle terrain deletion - clean up stale state to prevent crashes
---Source : lua/ge/extensions/editor/terrainEditor.lua:3297
function editor_terrainEditor.onEditorDeleteSelection() end

---Source : lua/ge/extensions/editor/terrainEditor.lua:2399
function editor_terrainEditor.onEditorGui() end

--- public interface
---Source : lua/ge/extensions/editor/terrainEditor.lua:3258
function editor_terrainEditor.onEditorInitialized() end

---Source : lua/ge/extensions/editor/terrainEditor.lua:3289
---@param id any
function editor_terrainEditor.onEditorObjectAdded(id) end

---Source : lua/ge/extensions/editor/terrainEditor.lua:3145
---@param path any
---@param value any
function editor_terrainEditor.onEditorPreferenceValueChanged(path, value) end

---Source : lua/ge/extensions/editor/terrainEditor.lua:3215
---@param prefsRegistry any
function editor_terrainEditor.onEditorRegisterPreferences(prefsRegistry) end

---Source : lua/ge/extensions/editor/terrainEditor.lua:1026
---@param mtlProxy any
---@param mapType any
function editor_terrainEditor.removeMap(mtlProxy, mapType) end

---Source : lua/ge/extensions/editor/terrainEditor.lua:1031
function editor_terrainEditor.saveMaterials() end

---Source : lua/ge/extensions/editor/terrainEditor.lua:1036
function editor_terrainEditor.saveTerrainAndMaterials() end

---Source : lua/ge/extensions/editor/terrainEditor.lua:884
---@param matProxy any
function editor_terrainEditor.selectPaintMaterial(matProxy) end

--- the terrain block the tools operate on, until the user picks another one
---Source : lua/ge/extensions/editor/terrainEditor.lua:1059
---@param id any
function editor_terrainEditor.setActiveTerrainBlock(id) end

---Source : lua/ge/extensions/editor/terrainEditor.lua:530
function editor_terrainEditor.setMaterialsDirty() end

---Source : lua/ge/extensions/editor/terrainEditor.lua:525
function editor_terrainEditor.setTerrainDirty() end

---Source : lua/ge/extensions/editor/terrainEditor.lua:2389
function editor_terrainEditor.setupVars() end

---Source : lua/ge/extensions/editor/terrainEditor.lua:1108
---@param preferredId any
function editor_terrainEditor.updateEditorTerrainBlocks(preferredId) end

---Source : lua/ge/extensions/editor/terrainEditor.lua:377
---@param mtlProxy any
---@param map any
---@param path any
function editor_terrainEditor.updateMap(mtlProxy, map, path) end

--- TODO: move this to terrainMaterialsEditor.lua
---Source : lua/ge/extensions/editor/terrainEditor.lua:733
function editor_terrainEditor.updateMaterialLibrary() end

---Source : lua/ge/extensions/editor/terrainEditor.lua:900
function editor_terrainEditor.updatePaintMaterialProxies() end

---Source : lua/ge/extensions/editor/terrainEditor.lua:1046
function editor_terrainEditor.updateTerrainBlockProxies() end

