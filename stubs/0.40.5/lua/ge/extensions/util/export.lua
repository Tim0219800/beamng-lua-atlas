---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/export.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `util_export` : `extensions.load("util_export")`, puis la globale `util_export`
---@class util_export
---@field embedBuffers boolean
---@field exportBeams boolean
---@field exportColors boolean
---@field exportNormals boolean
---@field exportTangents boolean
---@field exportTexCoords boolean
---@field gltfBinaryFormat boolean
util_export = {}

---Source : lua/ge/extensions/util/export.lua:1124
---@param handler any
function util_export.export(handler) end

---Source : lua/ge/extensions/util/export.lua:1140
---@param filename any
function util_export.exportFile(filename) end

---Source : lua/ge/extensions/util/export.lua:1284
function util_export.getGeInfo() end

---Source : lua/ge/extensions/util/export.lua:1248
---@param filename any
function util_export.startRecording(filename) end

---Source : lua/ge/extensions/util/export.lua:1253
function util_export.stopRecording() end

--- for the UI
---Source : lua/ge/extensions/util/export.lua:1263
function util_export.suggestFilename() end

---Source : lua/ge/extensions/util/export.lua:1257
---@param dt any
function util_export.updateGFX(dt) end

