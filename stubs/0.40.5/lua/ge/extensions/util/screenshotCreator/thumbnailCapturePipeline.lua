---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/screenshotCreator/thumbnailCapturePipeline.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Vehicle thumbnail capture chain used by the thumbnail composer (thumbnailComposerRun): replaces the vehicle with the desired configuration, places it and lets it settle, freezes the physics, computes the camera with the "legacy" framing ("warehouse" angle, margins reduced to 85%), points the main camera at the shot, sets the lighting, waits 2 s then captures the image with util_screenshotCreator_capture.captureFramedThumbnail. Unlike job.lua, cameras saved per config or model are ignored. processWorkItem must be called from a coroutine, because it yields.
--- Access: extension `util_screenshotCreator_thumbnailCapturePipeline`: `extensions.load("util_screenshotCreator_thumbnailCapturePipeline")`, then the global `util_screenshotCreator_thumbnailCapturePipeline`
---@class util_screenshotCreator_thumbnailCapturePipeline
---@field dependencies string[] Extensions loaded before: core_vehicles, core_camera and util_screenshotCreator_settings, vehicleSetup, capture, lightingSetup, framing_legacy, framingManager, thumbnailPaths.
util_screenshotCreator_thumbnailCapturePipeline = {}

--- Processes a queue item: replaces the vehicle, places it, waits for it to settle, freezes the physics, frames, lights, captures and restores the lighting. Returns a result {status = "saved", current, camera, outputFolder, outputPath} or {status = "failed", error}, or nil if cancellation was requested.
---Source: lua/ge/extensions/util/screenshotCreator/thumbnailCapturePipeline.lua:65
---@param item table Item {modelName, modelKey, configName, isDefaultConfig...}.
---@param index integer Rank of the item (starting at 1).
---@param total integer Total number of items.
---@param settingsSnapshot table Settings snapshot: capture {superSampling, freezePhysics...}, captureTimeout.
---@param runContext table {initialPosition, initialRotation}: the vehicle's starting transform.
---@param options table {sendProgress = function(done, total, current), isCancelled = function, outputResolution, captureMode}.
---@return table|nil  Item result; nil if canceled.
function util_screenshotCreator_thumbnailCapturePipeline.processWorkItem(item, index, total, settingsSnapshot, runContext, options) end

--- Restores the main camera stored by pointMainCameraAt and the lighting (lightingSetup.restore).
---Source: lua/ge/extensions/util/screenshotCreator/thumbnailCapturePipeline.lua:128
function util_screenshotCreator_thumbnailCapturePipeline.resetRenderState() end

--- Computes the "warehouse angle" framing camera: framing context from the settings, "legacy" mode, margins multiplied by 0.85. Logs an error and returns nil if the framing fails.
---Source: lua/ge/extensions/util/screenshotCreator/thumbnailCapturePipeline.lua:45
---@param vehicle table Vehicle object.
---@param modelName string Model name.
---@param configName string Configuration name.
---@param outputResolution integer[]|nil {width, height} of the final image.
---@return table|nil  Camera {pos, rot, fov, name, ...} or nil.
---@return table|nil  Framing context used.
function util_screenshotCreator_thumbnailCapturePipeline.resolveCamera(vehicle, modelName, configName, outputResolution) end

