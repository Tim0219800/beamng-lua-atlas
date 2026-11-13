---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/screenshotCreator/thumbnailConfig.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `util_screenshotCreator_thumbnailConfig` : `extensions.load("util_screenshotCreator_thumbnailConfig")`, puis la globale `util_screenshotCreator_thumbnailConfig`
---@class util_screenshotCreator_thumbnailConfig
---@field dependencies table
util_screenshotCreator_thumbnailConfig = {}

---Source : lua/ge/extensions/util/screenshotCreator/thumbnailConfig.lua:54
---@param modelName any
---@param configName any
function util_screenshotCreator_thumbnailConfig.getCameraConfig(modelName, configName) end

---Source : lua/ge/extensions/util/screenshotCreator/thumbnailConfig.lua:116
---@param configName any
---@param vehicle any
function util_screenshotCreator_thumbnailConfig.getCameraOffsets(configName, vehicle) end

--- vehicle box axes levelled to world up (heading kept), so a tilted spawn cannot tilt the camera
---Source : lua/ge/extensions/util/screenshotCreator/thumbnailConfig.lua:95
---@param bb any
function util_screenshotCreator_thumbnailConfig.getLevelAxes(bb) end

---Source : lua/ge/extensions/util/screenshotCreator/thumbnailConfig.lua:83
---@param modelName any
---@param configName any
function util_screenshotCreator_thumbnailConfig.getPauseDelay(modelName, configName) end

---Source : lua/ge/extensions/util/screenshotCreator/thumbnailConfig.lua:104
---@param vehicle any
---@param configName any
---@param boundingBox any
function util_screenshotCreator_thumbnailConfig.getReferenceAxes(vehicle, configName, boundingBox) end

---Source : lua/ge/extensions/util/screenshotCreator/thumbnailConfig.lua:72
---@param modelName any
---@param configName any
function util_screenshotCreator_thumbnailConfig.getRotation(modelName, configName) end

---Source : lua/ge/extensions/util/screenshotCreator/thumbnailConfig.lua:132
---@param posOffset any
---@param rotOffset any
---@param vehicle any
---@param configName any
function util_screenshotCreator_thumbnailConfig.rewindCameraOffsets(posOffset, rotOffset, vehicle, configName) end

---Source : lua/ge/extensions/util/screenshotCreator/thumbnailConfig.lua:41
---@param modelName any
---@param config any
function util_screenshotCreator_thumbnailConfig.saveModelConfig(modelName, config) end

---Source : lua/ge/extensions/util/screenshotCreator/thumbnailConfig.lua:27
---@param modelName any
---@param configName any
---@param config any
function util_screenshotCreator_thumbnailConfig.saveVehicleConfig(modelName, configName, config) end

