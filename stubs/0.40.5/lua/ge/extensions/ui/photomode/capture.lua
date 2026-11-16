---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/photomode/capture.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Photo mode image capture: settings (supersampling, downscale level, HDR, capture with motion blur, extra scene/vehicle passes and normals/depth), window resolution presets, render scale of temporal upscalers, and the capture requests themselves (basic, publish/upload, Steam, motion blur). The module relies on the "screenshot" module (takeScreenShot, takeCustomScreenShot, takeMotionBlurScreenShot, publish, doSteamScreenshot) and on ui_photomode_flash for the flash. It is driven by the photo mode UI and by ui_photomode_shared.
--- Access: extension `ui_photomode_capture`: `extensions.load("ui_photomode_capture")`, then the global `ui_photomode_capture`
---@class ui_photomode_capture
---@field DEFAULTS table Static default values: superSampling = 2, downscaleLevel = 2, motionEnabled = false, motionBehavior = "followVehicle", splitSceneVehicle = false, saveNormalDepth = false, hdrScreenshot = false. For the values actually applied (temporal upscaler, HDR), use buildDefaultSettings().
---@field dependencies string[] {"ui_photomode_flash"}
ui_photomode_capture = {}

--- Applies a partial patch to given settings without touching the module state: superSampling, downscaleLevel, motion {enabled, behavior}, artifacts {splitSceneVehicle, saveNormalDepth}, hdr {enabled}, flash (passed to ui_photomode_flash.applyStatePatch) and resolutionScale (applied immediately to the GraphicUpscalingQuality graphics settings, between 0.33 and 1).
---Source: lua/ge/extensions/ui/photomode/capture.lua:816
---@param currentCaptureSettings table Starting settings
---@param partialState table Partial patch
---@return table|nil  New normalized settings, or nil
---@return string|nil  capture_state_invalid or capture_resolution_scale_set_failed
function ui_photomode_capture.applyCaptureStatePatch(currentCaptureSettings, partialState) end

--- Applies a resolution preset in windowed mode via util_resolution.setWindowedResolution (loads the util/resolution extension). The "current" preset does nothing.
---Source: lua/ge/extensions/ui/photomode/capture.lua:393
---@param preset table Preset returned by findResolutionPreset
---@return boolean  success
---@return string|nil  resolution_api_unavailable or resolution_apply_failed
function ui_photomode_capture.applyResolutionPreset(preset) end

--- Looks up then applies the preset whose identifier is given (applyResolutionPreset(findResolutionPreset(id))). If the identifier is unknown, findResolutionPreset returns nil and applyResolutionPreset returns true without doing anything.
---Source: lua/ge/extensions/ui/photomode/capture.lua:412
---@param selectedResolutionPresetId string|nil Identifier of the chosen preset
---@return boolean  success
---@return string|nil  failure reason
function ui_photomode_capture.applySelectedResolutionPresetBeforeCapture(selectedResolutionPresetId) end

--- Computes the final image reduction factor: 1 / square root of the normalized downscale level.
---Source: lua/ge/extensions/ui/photomode/capture.lua:524
---@param downscaleLevel number Downscale level (1 to 8)
---@return number  Scale factor between 0.35 and 1
function ui_photomode_capture.buildCaptureRescaleFactor(downscaleLevel) end

--- Builds the full capture display state for the UI: settings, downscale factor, limits, resolution labels (window, render target, output), format, aspect ratio, estimated file size, VRAM / high supersampling warning (threshold 6), motion, artifacts, HDR and flash state.
---Source: lua/ge/extensions/ui/photomode/capture.lua:716
---@param captureSettings table|nil Settings to describe
---@return table  Display state
function ui_photomode_capture.buildCaptureState(captureSettings) end

--- Returns the default capture settings taking the context into account: supersampling and downscale at 1 if a temporal upscaler is active (otherwise 2), HDR enabled by default only if HDR is supported and active.
---Source: lua/ge/extensions/ui/photomode/capture.lua:254
---@return table  {superSampling, downscaleLevel, motionEnabled, motionBehavior, splitSceneVehicle, saveNormalDepth, hdrScreenshot}
function ui_photomode_capture.buildDefaultSettings() end

--- Subset of the settings to write into a photo's metadata: superSampling, downscaleLevel, rescaleFactor, motion, artifacts, hdr, flash, resolutionScale.
---Source: lua/ge/extensions/ui/photomode/capture.lua:1043
---@return table  Capture settings
function ui_photomode_capture.buildMetadataState() end

--- Normalizes a set of capture settings: supersampling and downscale bounds (depending on VRAM), booleans, motion mode, HDR disabled if unsupported, supersampling and downscale forced to 1 with a temporal upscaler. Adds safeSuperSamplingMax and temporalUpscalersEnabled.
---Source: lua/ge/extensions/ui/photomode/capture.lua:529
---@param captureSettings table|nil Raw settings
---@return table  Normalized settings
function ui_photomode_capture.buildNormalizedCaptureSettings(captureSettings) end

--- Builds the resolution presets UI state: visible, enabled, selectedId, labels, applyOnCapture (always false) and the items list {value, label}.
---Source: lua/ge/extensions/ui/photomode/capture.lua:1039
---@return table  Presets state
function ui_photomode_capture.buildResolutionPresetState() end

--- Capture display state with the module's current settings.
---Source: lua/ge/extensions/ui/photomode/capture.lua:1035
---@return table  See buildCaptureState
function ui_photomode_capture.buildState() end

--- Looks up a resolution preset by identifier; an empty identifier means "current".
---Source: lua/ge/extensions/ui/photomode/capture.lua:278
---@param presetId string|nil Preset identifier
---@return table|nil  Preset {id, labelKey, width?, height?} or nil
function ui_photomode_capture.findResolutionPreset(presetId) end

--- Ends a motion blur capture: restores the photo mode pause request or puts the simulation back in pause, then detaches the camera from the vehicle (immediately or after a few frames).
---Source: lua/ge/extensions/ui/photomode/capture.lua:959
---@param immediateAttachRelease boolean|nil true to detach without delay
function ui_photomode_capture.finishPendingMotionCapture(immediateAttachRelease) end

--- Returns buildState() with ok = photo mode session active, and reason = session_inactive otherwise.
---Source: lua/ge/extensions/ui/photomode/capture.lua:1065
---@return table  Capture state
function ui_photomode_capture.getCaptureState() end

--- Returns {ok = feature active, state = buildResolutionPresetState()}.
---Source: lua/ge/extensions/ui/photomode/capture.lua:1074
---@return table  {ok, state}
function ui_photomode_capture.getResolutionPresetState() end

--- To be called every frame before rendering: decrements the capture-in-progress counter, advances the pending basic capture (waiting for HDR, sending the capture) and the motion blur capture (warm-up frames, sending, cleanup).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/photomode/capture.lua:1596
---@param dtReal number Frame real time (s)
---@param dtSim number Simulation time (s)
---@param dtRaw number Raw time (s)
function ui_photomode_capture.handlePreRender(dtReal, dtSim, dtRaw) end

--- Indicates whether a capture is in progress (basic pending, motion pending, or non-zero capture frame counter), so that the UI stays hidden.
---Source: lua/ge/extensions/ui/photomode/capture.lua:1029
---@return boolean  capture in progress
function ui_photomode_capture.isCaptureInProgress() end

--- Indicates whether resolution presets are available: true when the game is not a shipping build.
---Source: lua/ge/extensions/ui/photomode/capture.lua:266
---@return boolean  feature active
function ui_photomode_capture.isResolutionPresetFeatureEnabled() end

--- Extends the frame counter during which the capture is considered in progress (takes the maximum of the current value and frames).
---Source: lua/ge/extensions/ui/photomode/capture.lua:1018
---@param frames integer Number of frames; ignored if <= 0
function ui_photomode_capture.markCaptureInProgress(frames) end

--- Rounds the supersampling value to the nearest integer then clamps it between 1 and safeMax (maximum 8).
---Source: lua/ge/extensions/ui/photomode/capture.lua:451
---@param value number Requested value (default 2 if non-numeric)
---@param safeMax number|nil Safe maximum (8 by default)
---@return integer  Normalized supersampling
function ui_photomode_capture.normalizeCaptureSuperSampling(value, safeMax) end

--- Hook called when the screenshot module has finished all captures: ends the pending basic capture and restores HDR.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/photomode/capture.lua:1680
function ui_photomode_capture.onScreenshotAllDone() end

--- Stores the starting resolution scale, resets supersampling, downscale and HDR to their current default values, then reapplies the flash. Called at the start of a photo mode session.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/photomode/capture.lua:1007
function ui_photomode_capture.refreshSessionDefaults() end

--- Requests a capture. options.motion = capture with motion blur; options.upload = online publishing; options.steam = Steam capture; they combine (upload + steam). With no option: basic capture (default path if supersampling and downscale are 1 with no extra pass, otherwise custom capture). Handles the flash, the HDR switch (deferred by a few frames) and triggers the SCREENSHOT_TAKEN achievement.
---Source: lua/ge/extensions/ui/photomode/capture.lua:1532
---@param options table|nil {motion?, upload?, steam?}
---@return table  {ok, reason?, mode, captureUiHoldFrames?}
function ui_photomode_capture.requestScreenshot(options) end

--- Cancels any pending basic capture, resets the capture settings to default and resets the flash.
---Source: lua/ge/extensions/ui/photomode/capture.lua:995
function ui_photomode_capture.resetSettings() end

--- Ends the pending basic capture (restores HDR), turns off the flash and restores the pre-session resolution scale.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/photomode/capture.lua:1001
function ui_photomode_capture.restoreCaptureRuntimeState() end

--- Applies a partial patch to the module's capture settings (see applyCaptureStatePatch), then reapplies the flash settings. Requires an active session.
---Source: lua/ge/extensions/ui/photomode/capture.lua:1081
---@param partialState table Partial patch
---@return table  {ok, reason?, state}
function ui_photomode_capture.setCaptureState(partialState) end

--- Selects and immediately applies a resolution preset, and stores it as the current selection.
---Source: lua/ge/extensions/ui/photomode/capture.lua:1560
---@param presetId string Preset identifier
---@return table  {ok, reason?, state}
function ui_photomode_capture.setResolutionPreset(presetId) end

