---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/screenshotCreator/thumbnailCapturePipeline.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `util_screenshotCreator_thumbnailCapturePipeline` : `extensions.load("util_screenshotCreator_thumbnailCapturePipeline")`, puis la globale `util_screenshotCreator_thumbnailCapturePipeline`
---@class util_screenshotCreator_thumbnailCapturePipeline
---@field dependencies table
util_screenshotCreator_thumbnailCapturePipeline = {}

---Source : lua/ge/extensions/util/screenshotCreator/thumbnailCapturePipeline.lua:65
---@param item any
---@param index any
---@param total any
---@param settingsSnapshot any
---@param runContext any
---@param options any
function util_screenshotCreator_thumbnailCapturePipeline.processWorkItem(item, index, total, settingsSnapshot, runContext, options) end

---Source : lua/ge/extensions/util/screenshotCreator/thumbnailCapturePipeline.lua:128
function util_screenshotCreator_thumbnailCapturePipeline.resetRenderState() end

--- "Warehouse angle" framing with slightly tighter margins, saved config/model cameras are ignored
---Source : lua/ge/extensions/util/screenshotCreator/thumbnailCapturePipeline.lua:45
---@param vehicle any
---@param modelName any
---@param configName any
---@param outputResolution any
function util_screenshotCreator_thumbnailCapturePipeline.resolveCamera(vehicle, modelName, configName, outputResolution) end

