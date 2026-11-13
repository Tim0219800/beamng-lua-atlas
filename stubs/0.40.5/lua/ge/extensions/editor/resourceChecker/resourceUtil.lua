---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/resourceChecker/resourceUtil.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_resourceChecker_resourceUtil` : `extensions.load("editor_resourceChecker_resourceUtil")`, puis la globale `editor_resourceChecker_resourceUtil`
---@class editor_resourceChecker_resourceUtil
---@field checkColDataworkJob any
---@field checkUnusedMatsworkJob any
---@field checkUnusedModelsworkJob any
---@field checkUsedMatsworkJob any
---@field duplicateDataworkJob any
---@field matstoRemove table
---@field removeDummyworkJob any
---@field shapestoRemove table
---@field textoRemove table
---@field textureExporterworkJob any
---@field unusedTexturesworkJob any
editor_resourceChecker_resourceUtil = {}

---Source : lua/ge/extensions/editor/resourceChecker/resourceUtil.lua:2778
---@param levelname any
function editor_resourceChecker_resourceUtil.assetStats(levelname) end

---Source : lua/ge/extensions/editor/resourceChecker/resourceUtil.lua:1739
---@param levelname any
---@param removal any
function editor_resourceChecker_resourceUtil.checkColData(levelname, removal) end

---Source : lua/ge/extensions/editor/resourceChecker/resourceUtil.lua:944
function editor_resourceChecker_resourceUtil.checkForest() end

---Source : lua/ge/extensions/editor/resourceChecker/resourceUtil.lua:588
---@param convertdata any
function editor_resourceChecker_resourceUtil.checkMatTex(convertdata) end

---Source : lua/ge/extensions/editor/resourceChecker/resourceUtil.lua:875
function editor_resourceChecker_resourceUtil.checkStatic() end

---Source : lua/ge/extensions/editor/resourceChecker/resourceUtil.lua:993
function editor_resourceChecker_resourceUtil.checkTerrains() end

---Source : lua/ge/extensions/editor/resourceChecker/resourceUtil.lua:715
---@param convertdata any
function editor_resourceChecker_resourceUtil.checkTex(convertdata) end

---Source : lua/ge/extensions/editor/resourceChecker/resourceUtil.lua:1277
---@param levelname any
---@param removal any
function editor_resourceChecker_resourceUtil.checkUnusedMats(levelname, removal) end

---Source : lua/ge/extensions/editor/resourceChecker/resourceUtil.lua:1937
---@param levelname any
---@param removal any
function editor_resourceChecker_resourceUtil.checkUnusedModels(levelname, removal) end

---Source : lua/ge/extensions/editor/resourceChecker/resourceUtil.lua:1593
---@param levelname any
---@param removal any
function editor_resourceChecker_resourceUtil.checkUsedMats(levelname, removal) end

---Source : lua/ge/extensions/editor/resourceChecker/resourceUtil.lua:803
---@param convertdata any
function editor_resourceChecker_resourceUtil.checkmissingMats(convertdata) end

---Source : lua/ge/extensions/editor/resourceChecker/resourceUtil.lua:2378
---@param material any
function editor_resourceChecker_resourceUtil.duplicateData(material) end

--- look for duplicates
---Source : lua/ge/extensions/editor/resourceChecker/resourceUtil.lua:236
---@param duplicatelist any
function editor_resourceChecker_resourceUtil.findDuplicates(duplicatelist) end

---Source : lua/ge/extensions/editor/resourceChecker/resourceUtil.lua:448
---@param convertdata any
---@param skipCommon any
function editor_resourceChecker_resourceUtil.fixPID(convertdata, skipCommon) end

--- get material layers fields
---Source : lua/ge/extensions/editor/resourceChecker/resourceUtil.lua:206
---@param mat any
function editor_resourceChecker_resourceUtil.getMaterialTexFields(mat) end

--- interface
---Source : lua/ge/extensions/editor/resourceChecker/resourceUtil.lua:2783
function editor_resourceChecker_resourceUtil.getProgress() end

--- get scene tree all objects
---Source : lua/ge/extensions/editor/resourceChecker/resourceUtil.lua:145
---@param fileName any
function editor_resourceChecker_resourceUtil.getSimObjects(fileName) end

--- interface
---Source : lua/ge/extensions/editor/resourceChecker/resourceUtil.lua:2897
function editor_resourceChecker_resourceUtil.onExtensionLoaded() end

---Source : lua/ge/extensions/editor/resourceChecker/resourceUtil.lua:140
function editor_resourceChecker_resourceUtil.onExtensionUnloaded() end

---Source : lua/ge/extensions/editor/resourceChecker/resourceUtil.lua:177
---@param x any
function editor_resourceChecker_resourceUtil.powerOfTwo(x) end

---Source : lua/ge/extensions/editor/resourceChecker/resourceUtil.lua:2447
---@param convertdata any
---@param skipCommon any
function editor_resourceChecker_resourceUtil.removeDummy(convertdata, skipCommon) end

---Source : lua/ge/extensions/editor/resourceChecker/resourceUtil.lua:186
---@param shape any
---@param foresData any
function editor_resourceChecker_resourceUtil.removeFromForestJson(shape, foresData) end

---Source : lua/ge/extensions/editor/resourceChecker/resourceUtil.lua:2329
---@param levelname any
---@param item any
---@param selected any
function editor_resourceChecker_resourceUtil.removeUnused(levelname, item, selected) end

---Source : lua/ge/extensions/editor/resourceChecker/resourceUtil.lua:157
---@param file any
function editor_resourceChecker_resourceUtil.resaveMaterial(file) end

---Source : lua/ge/extensions/editor/resourceChecker/resourceUtil.lua:2840
function editor_resourceChecker_resourceUtil.stopProgress() end

---Source : lua/ge/extensions/editor/resourceChecker/resourceUtil.lua:2492
---@param convertdata any
---@param exportpath any
function editor_resourceChecker_resourceUtil.textureExporter(convertdata, exportpath) end

---Source : lua/ge/extensions/editor/resourceChecker/resourceUtil.lua:2176
---@param levelname any
---@param removal any
function editor_resourceChecker_resourceUtil.unusedTextures(levelname, removal) end

---Source : lua/ge/extensions/editor/resourceChecker/resourceUtil.lua:394
---@param convertdata any
---@param skipCommon any
function editor_resourceChecker_resourceUtil.verifyDuplicate(convertdata, skipCommon) end

---Source : lua/ge/extensions/editor/resourceChecker/resourceUtil.lua:326
---@param convertdata any
function editor_resourceChecker_resourceUtil.verifyVersion(convertdata) end

