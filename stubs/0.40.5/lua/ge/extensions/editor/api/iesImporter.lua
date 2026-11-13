---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/api/iesImporter.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_api_iesImporter` : `extensions.load("editor_api_iesImporter")`, puis la globale `editor_api_iesImporter`
---@class editor_api_iesImporter
editor_api_iesImporter = {}

---Source : lua/ge/extensions/editor/api/iesImporter.lua:1107
---@param ies any
---@param outPath any
---@param opts any
---@param saveInfo any
function editor_api_iesImporter.buildCookieMetadata(ies, outPath, opts, saveInfo) end

---Source : lua/ge/extensions/editor/api/iesImporter.lua:663
---@param ies any
---@param opts any
function editor_api_iesImporter.generateCookie(ies, opts) end

--- High-level generation
---Source : lua/ge/extensions/editor/api/iesImporter.lua:1241
---@param iesPath any
---@param outPath any
---@param opts any
function editor_api_iesImporter.generateToFile(iesPath, outPath, opts) end

--- Sidecar metadata
---Source : lua/ge/extensions/editor/api/iesImporter.lua:983
---@param outPath any
function editor_api_iesImporter.getCookieMetadataPath(outPath) end

---Source : lua/ge/extensions/editor/api/iesImporter.lua:269
---@param meta any
---@param keys any
---@param fallback any
function editor_api_iesImporter.getHeaderValue(meta, keys, fallback) end

---Source : lua/ge/extensions/editor/api/iesImporter.lua:458
---@param ies any
function editor_api_iesImporter.getPeakDirection(ies) end

---Source : lua/ge/extensions/editor/api/iesImporter.lua:1308
---@param iesPath any
function editor_api_iesImporter.inferCookiePathFromIES(iesPath) end

---Source : lua/ge/extensions/editor/api/iesImporter.lua:209
---@param path any
function editor_api_iesImporter.parseHeaderMetadata(path) end

---Source : lua/ge/extensions/editor/api/iesImporter.lua:332
---@param path any
function editor_api_iesImporter.parseIES(path) end

--- Sampling
---Source : lua/ge/extensions/editor/api/iesImporter.lua:501
---@param horizontalAngles any
---@param candela any
function editor_api_iesImporter.prepareHorizontalData(horizontalAngles, candela) end

---Source : lua/ge/extensions/editor/api/iesImporter.lua:484
---@param ies any
function editor_api_iesImporter.printIESInfo(ies) end

---Source : lua/ge/extensions/editor/api/iesImporter.lua:563
---@param theta any
---@param phi any
---@param ies any
---@param prepared any
function editor_api_iesImporter.sampleIES(theta, phi, ies, prepared) end

---Source : lua/ge/extensions/editor/api/iesImporter.lua:869
---@param img any
---@param outPath any
---@param opts any
function editor_api_iesImporter.saveImage(img, outPath, opts) end

---Source : lua/ge/extensions/editor/api/iesImporter.lua:1230
---@param ies any
---@param outPath any
---@param opts any
---@param saveInfo any
function editor_api_iesImporter.writeCookieMetadata(ies, outPath, opts, saveInfo) end

