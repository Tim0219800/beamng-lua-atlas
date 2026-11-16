---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/screenshotCreator.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Entry point of the internal vehicle thumbnail generation tool. This file is a facade: it declares all the util_screenshotCreator_* submodules (ImGui interface, settings, framing, capture, batch processing job, etc.) as dependencies and delegates to them. It is used to open the tool window, start batch generation, frame a vehicle, take an off-screen capture and choose the framing mode.
--- Access: extension `util_screenshotCreator`: `extensions.load("util_screenshotCreator")`, then the global `util_screenshotCreator`
---@class util_screenshotCreator
---@field dependencies string[] List of util_screenshotCreator_* extensions loaded with this one
---@field state table Module state, initially {show = false}
util_screenshotCreator = {}

--- Computes the camera position and orientation that frame a vehicle with the procedural framing, based on the framing context from the settings.
---Source: lua/ge/extensions/util/screenshotCreator.lua:43
---@param vehicle userdata Vehicle object to frame
---@param fov number|nil Field of view in degrees (default: settings value)
---@param nearPlane number|nil Camera near plane (default: settings)
---@param aspectRatio number|nil Aspect ratio (default: settings)
---@param resolution table|nil Resolution {width, height} used for the framing context
---@param configName string|nil Vehicle configuration name
---@return vec3|nil  Camera position
---@return quat|nil  Camera rotation
---@return table|nil  Framing data (framingData)
function util_screenshotCreator.frameVehicle(vehicle, fov, nearPlane, aspectRatio, resolution, configName) end

--- Returns the identifier of the selected framing mode.
---Source: lua/ge/extensions/util/screenshotCreator.lua:101
---@return string  Mode identifier
function util_screenshotCreator.getFramingMode() end

--- Lists the available framing modes (delegates to util_screenshotCreator_framingManager.listModes).
---Source: lua/ge/extensions/util/screenshotCreator.lua:98
---@return table  Registered framing modes
function util_screenshotCreator.listFramingModes() end

--- Hook called after an extension reload: if the data contains a UI state (windowOpen, resolutionPtr, reviewData or skipCustomCameras), passes it to util_screenshotCreator_ui.onDeserialized.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/screenshotCreator.lua:76
---@param data table|nil Data saved by serialization
function util_screenshotCreator.onDeserialized(data) end

--- Hook called on unload: restores the environment modified by the settings (restoreEnvironment) and logs the unload.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/screenshotCreator.lua:87
function util_screenshotCreator.onExtensionUnloaded() end

--- Opens the tool's ImGui window (delegates to util_screenshotCreator_ui.openWindow).
---Source: lua/ge/extensions/util/screenshotCreator.lua:35
---@return any  Value returned by util_screenshotCreator_ui.openWindow
function util_screenshotCreator.openWindow() end

--- Selects the framing mode.
---Source: lua/ge/extensions/util/screenshotCreator.lua:104
---@param modeId string Mode identifier (for example "fixedIsometric" or "configured")
---@return any  Value returned by framingManager.setSelectedModeId
function util_screenshotCreator.setFramingMode(modeId) end

--- Starts batch thumbnail generation (delegates to util_screenshotCreator_job.startWork).
---Source: lua/ge/extensions/util/screenshotCreator.lua:39
---@param workOptions table Processing options (inferred from code: passed as is to the job module)
---@return any  Value returned by util_screenshotCreator_job.startWork
function util_screenshotCreator.startWork(workOptions) end

--- Takes an off-screen capture from the given camera and saves it to filepath (delegates to util_screenshotCreator_capture), with the capture parameters from the settings.
---Source: lua/ge/extensions/util/screenshotCreator.lua:60
---@param filepath string Path of the image file to write
---@param camera table Camera {pos, rot, fov?, nearPlane?, screenshotDelay?}
---@param callback function|nil Called at the end of the capture
---@param uniqueId any Identifier passed to the capture module
function util_screenshotCreator.takeThumbnailScreenshot(filepath, camera, callback, uniqueId) end

