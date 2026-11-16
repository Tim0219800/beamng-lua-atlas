---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/screenshotCreator/currentConfigThumbnail.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Submodule of screenshotCreator that generates the thumbnail of a vehicle's current configuration. start() prepares an asynchronous capture: every frame (onPreRender), a coroutine resolves the framing according to the selected mode (framingManager), captures the thumbnail off-screen (5 s maximum delay) then calls the callback with the result. Only one capture can be active at a time.
--- Access: extension `util_screenshotCreator_currentConfigThumbnail`: `extensions.load("util_screenshotCreator_currentConfigThumbnail")`, then the global `util_screenshotCreator_currentConfigThumbnail`
---@class util_screenshotCreator_currentConfigThumbnail
---@field dependencies table
util_screenshotCreator_currentConfigThumbnail = {}

--- Hook called on unload: abandons the capture in progress without calling its callback.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/screenshotCreator/currentConfigThumbnail.lua:70
function util_screenshotCreator_currentConfigThumbnail.onExtensionUnloaded() end

--- Hook called every frame before rendering: advances the capture coroutine. On a Lua error, logs the error, releases the capture and calls the callback with success = false.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/screenshotCreator/currentConfigThumbnail.lua:57
function util_screenshotCreator_currentConfigThumbnail.onPreRender() end

--- Starts the thumbnail capture of a vehicle. Refuses (false, "busy") if a capture is already in progress.
---Source: lua/ge/extensions/util/screenshotCreator/currentConfigThumbnail.lua:43
---@param vehicle userdata Vehicle to photograph
---@param configName string Configuration name
---@param outputPath string Path of the image file to produce
---@param callback function callback(success, outputPath, token, errorMessage?) called at the end
---@param token any Value returned as is to the callback
---@return boolean  true if the capture is started, false if busy
---@return string|nil  "busy" on refusal
function util_screenshotCreator_currentConfigThumbnail.start(vehicle, configName, outputPath, callback, token) end

