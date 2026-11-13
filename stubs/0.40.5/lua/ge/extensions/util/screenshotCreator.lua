---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/screenshotCreator.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `util_screenshotCreator` : `extensions.load("util_screenshotCreator")`, puis la globale `util_screenshotCreator`
---@class util_screenshotCreator
---@field dependencies table
---@field state table
util_screenshotCreator = {}

---Source : lua/ge/extensions/util/screenshotCreator.lua:43
---@param vehicle any
---@param fov any
---@param nearPlane any
---@param aspectRatio any
---@param resolution any
---@param configName any
function util_screenshotCreator.frameVehicle(vehicle, fov, nearPlane, aspectRatio, resolution, configName) end

---Source : lua/ge/extensions/util/screenshotCreator.lua:101
function util_screenshotCreator.getFramingMode() end

---Source : lua/ge/extensions/util/screenshotCreator.lua:98
function util_screenshotCreator.listFramingModes() end

---Source : lua/ge/extensions/util/screenshotCreator.lua:76
---@param data any
function util_screenshotCreator.onDeserialized(data) end

---Source : lua/ge/extensions/util/screenshotCreator.lua:87
function util_screenshotCreator.onExtensionUnloaded() end

---Source : lua/ge/extensions/util/screenshotCreator.lua:35
function util_screenshotCreator.openWindow() end

---Source : lua/ge/extensions/util/screenshotCreator.lua:104
---@param modeId any
function util_screenshotCreator.setFramingMode(modeId) end

---Source : lua/ge/extensions/util/screenshotCreator.lua:39
---@param workOptions any
function util_screenshotCreator.startWork(workOptions) end

---Source : lua/ge/extensions/util/screenshotCreator.lua:60
---@param filepath any
---@param camera any
---@param callback any
---@param uniqueId any
function util_screenshotCreator.takeThumbnailScreenshot(filepath, camera, callback, uniqueId) end

