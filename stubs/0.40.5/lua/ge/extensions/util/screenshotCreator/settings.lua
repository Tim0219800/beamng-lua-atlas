---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/screenshotCreator/settings.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Settings and settings window of the screenshot/thumbnail creator. It keeps all the settings in ImGui pointers (getControls): output destination, resolution (presets thumbnail 800x448, 720p, 1080p, 4k, 8k…), supersampling, FOV, camera height, framing margins, dynamic reflection quality, exposure, low beams, settle delay, physics freeze, lighting rig, SSAO. It builds the contexts (getFramingContext, getCaptureContext, getJobSettings) consumed by job.lua, the framing modes and the capture, applies/restores the showroom environment (local exposure, reflections, plates, seat occupants) and draws the margin overlays in the 3D view.
--- Access: extension `util_screenshotCreator_settings`: `extensions.load("util_screenshotCreator_settings")`, then the global `util_screenshotCreator_settings`
---@class util_screenshotCreator_settings
---@field dependencies string[] Extensions loaded before: ui_imgui and core_camera.
util_screenshotCreator_settings = {}

--- Adds to a margin target the horizontal margin set by the user (left and right) and the vehicle margins (top +4, bottom +2).
---Source: lua/ge/extensions/util/screenshotCreator/settings.lua:205
---@param margin table|nil Margin target.
---@return table|nil  New margin, or nil if margin is nil.
function util_screenshotCreator_settings.addVehicleMargin(margin) end

--- Stores the current environment then applies that of the captures: exposure, reflections, ungenerated plates, seat occupants disabled. Does nothing outside the showroom.
---Source: lua/ge/extensions/util/screenshotCreator/settings.lua:429
---@param options table|nil {applyExposure = false} to leave the exposure untouched.
function util_screenshotCreator_settings.applyEnvironment(options) end

--- Reapplies an environment snapshot while checking each value; logs an error for each setting not restored.
---Source: lua/ge/extensions/util/screenshotCreator/settings.lua:441
---@param snapshot table Snapshot (see getEnvironmentSnapshot).
---@return boolean  true if everything was restored.
function util_screenshotCreator_settings.applyEnvironmentSnapshot(snapshot) end

--- Writes the exposure (auto or manual in EV) to the scene's PostEffectLocalExposureObject.
---Source: lua/ge/extensions/util/screenshotCreator/settings.lua:375
---@return boolean  true if the object exists and took the requested values.
function util_screenshotCreator_settings.applyExposure() end

--- Enables the SkipGenerateLicencePlate setting (showroom only).
---Source: lua/ge/extensions/util/screenshotCreator/settings.lua:388
---@return boolean  false outside the showroom.
function util_screenshotCreator_settings.applyLicensePlates() end

--- Turns on the vehicle's low beams (electrics.setLightsState(1)) if enabled; does nothing otherwise.
---Source: lua/ge/extensions/util/screenshotCreator/settings.lua:949
---@param vehicle table Vehicle object.
---@param enabled boolean|nil Imposed value; by default the UI setting.
function util_screenshotCreator_settings.applyLowBeams(vehicle, enabled) end

--- Applies the chosen dynamic reflection quality via dynCaptureQuality (showroom only).
---Source: lua/ge/extensions/util/screenshotCreator/settings.lua:382
---@return boolean  false outside the showroom.
function util_screenshotCreator_settings.applyReflections() end

--- Start of a capture job: calls applyEnvironment.
---Source: lua/ge/extensions/util/screenshotCreator/settings.lua:612
---@param options table|nil Passed to applyEnvironment.
function util_screenshotCreator_settings.beginWork(options) end

--- Restores the settings from a table (clamped values, old formats accepted), then applies exposure and reflections if in the showroom (alias onDeserialized).
---Source: lua/ge/extensions/util/screenshotCreator/settings.lua:875
---@param data table|nil Serialized state; ignored if it is not a table.
function util_screenshotCreator_settings.deserialize(data) end

--- Draws in the 3D view, in front of the current camera, the frame of the final image (red), the safety margins (green), the vehicle margins (blue) and optionally the composition grid (thirds and center). To be called every frame.
---Source: lua/ge/extensions/util/screenshotCreator/settings.lua:782
---@param fovOverride number|nil FOV in degrees to use instead of the set FOV.
function util_screenshotCreator_settings.drawCameraOverlay(fovOverride) end

--- Draws the lighting ImGui controls: cyclorama color (showroom_v2_lighting_backdrop material), camera-relative rig, shadows and intensity per role, exposure correction, parking markup, SSAO mode.
---Source: lua/ge/extensions/util/screenshotCreator/settings.lua:340
function util_screenshotCreator_settings.drawLightingControls() end

--- Alias of drawOutputControls.
---Source: lua/ge/extensions/util/screenshotCreator/settings.lua:646
---@param options table|nil See drawOutputControls.
function util_screenshotCreator_settings.drawOutput(options) end

--- Draws the output ImGui controls: "Restore thumbnail defaults" button, destination, procedural FOV and camera height, horizontal margin, resolutions, supersampling, reflections, exposure, lights, settle delay, physics freeze, and an image size summary.
---Source: lua/ge/extensions/util/screenshotCreator/settings.lua:646
---@param options table|nil {drawToggleUiApps = function} drawn next to the resolution preview button.
function util_screenshotCreator_settings.drawOutputControls(options) end

--- Draws the overlay ImGui controls: margins, framing box, OOBB, framing inputs, composition, as well as the Sample and Comparison checkboxes.
---Source: lua/ge/extensions/util/screenshotCreator/settings.lua:760
function util_screenshotCreator_settings.drawOverlayControls() end

--- Alias of drawCameraOverlay.
---Source: lua/ge/extensions/util/screenshotCreator/settings.lua:782
---@param fovOverride number|nil See drawCameraOverlay.
function util_screenshotCreator_settings.drawOverlays(fovOverride) end

--- End of a capture job: calls restoreEnvironment.
---Source: lua/ge/extensions/util/screenshotCreator/settings.lua:616
function util_screenshotCreator_settings.finishWork() end

--- Builds the capture context: destination, file extension, resolution, superSampling (and supersampling), internalResolution (resolution × supersampling), reflection quality, lights, delay, physics freeze, exposure, sample/comparison options.
---Source: lua/ge/extensions/util/screenshotCreator/settings.lua:545
---@return table  Capture context.
function util_screenshotCreator_settings.getCaptureContext() end

--- Returns the table of all ImGui pointers of the settings (outputDestination, resolution, imageResolution, superSampling, fieldOfView, cameraHeight, selectedMargin, lightRoleIntensity, etc.). Modifying these pointers directly modifies the settings.
---Source: lua/ge/extensions/util/screenshotCreator/settings.lua:980
---@return table  ctrls (im.BoolPtr, im.FloatPtr, im.IntPtr, im.ArrayInt…).
function util_screenshotCreator_settings.getControls() end

--- Returns the final chosen resolution: that of the selected preset, or the custom resolution if "custom".
---Source: lua/ge/extensions/util/screenshotCreator/settings.lua:239
---@return integer[]  {width, height}.
function util_screenshotCreator_settings.getCurrentResolution() end

--- Returns a copy of the settings' default values.
---Source: lua/ge/extensions/util/screenshotCreator/settings.lua:1005
---@return table  Default values.
function util_screenshotCreator_settings.getDefaults() end

--- Returns the reflection quality levels: Lowest, Low, Normal, High, Ultra.
---Source: lua/ge/extensions/util/screenshotCreator/settings.lua:1012
---@return string[]  Quality levels.
function util_screenshotCreator_settings.getDynamicReflectionQualities() end

--- Returns a copy of the stored environment (skipLicensePlates, dynamicReflectionRuntime, autoExposure, manualExposure, seatOccupants).
---Source: lua/ge/extensions/util/screenshotCreator/settings.lua:486
---@return table|nil  Snapshot, nil if nothing was stored.
function util_screenshotCreator_settings.getEnvironmentSnapshot() end

--- Builds the context passed to the framing modes: fieldOfView/fov, nearPlane, cameraHeight, cameraAxisDownOffset, settleDelay, resolution, aspectRatio, useMargins, margin and debug {drawBounds, drawOobb, drawInputs}. The caller adds vehicle, configName, etc.
---Source: lua/ge/extensions/util/screenshotCreator/settings.lua:524
---@param resolution integer[]|nil {width, height}; default the current resolution.
---@return table  Framing context.
function util_screenshotCreator_settings.getFramingContext(resolution) end

--- Returns a copy of the framing defaults: {cameraAxisDownOffset = 0.10, cameraHeight = 1.1, settleDelay = 1}.
---Source: lua/ge/extensions/util/screenshotCreator/settings.lua:1007
---@return table  Framing defaults.
function util_screenshotCreator_settings.getFramingDefaults() end

--- Computes the final framing margin for a resolution: chosen target + vehicle margins, scaled. Returns a zero margin if "useFramingMargins" is unchecked.
---Source: lua/ge/extensions/util/screenshotCreator/settings.lua:517
---@param resolution integer[] {width, height}.
---@return table  {left, right, top, bottom, extraBottom, ...}.
function util_screenshotCreator_settings.getFramingMargin(resolution) end

--- Merges the framing and capture contexts into a single table of job settings (outputFolder, resolution, fov, margin, captureTimeout min 0.1 s…). Options override some UI settings.
---Source: lua/ge/extensions/util/screenshotCreator/settings.lua:572
---@param options table|nil {resolution, outputFolder, lowBeamsEnabled, shippedConfigsOnly, sample, comparison, captureTimeout}.
---@return table  Job settings.
function util_screenshotCreator_settings.getJobSettings(options) end

--- Returns the lighting rig settings read from the UI: enabled, exposureCorrection, ssaoMode ("on", "reduced" or "off"), parkingMarkup, roles[id] = {intensity, shadows} for key, fill, rim, top, groundFill, horizonFill.
---Source: lua/ge/extensions/util/screenshotCreator/settings.lua:300
---@return table  Rig settings.
function util_screenshotCreator_settings.getLightingRig() end

--- Returns the margin target of the given index (0-based). The "minimal" target is replaced by the maximum of all the others. Falls back to the default target if the index is invalid.
---Source: lua/ge/extensions/util/screenshotCreator/settings.lua:200
---@param index integer|nil Target index, 0-based (default safeMargins.defaultTargetIndex).
---@return table  {name, left, right, top, bottom, extraBottom, color} in 500x281 reference pixels.
function util_screenshotCreator_settings.getMarginTarget(index) end

--- Returns the subset of output pointers: outputDestination, resolution, imageResolution, shippedConfigsOnly, keepAspectRatio, resolutionMultiplier.
---Source: lua/ge/extensions/util/screenshotCreator/settings.lua:981
---@return table  ImGui pointers.
function util_screenshotCreator_settings.getOutputControls() end

--- Returns the names of the output destinations: "Vehicle thumbnails" and "Screenshot/showroom folder".
---Source: lua/ge/extensions/util/screenshotCreator/settings.lua:1008
---@return string[]  Destinations.
function util_screenshotCreator_settings.getOutputDestinations() end

--- Returns the render pointers: superSampling, shippedConfigsOnly, fieldOfView, cameraHeight, dynamicReflectionQuality, lowBeamsEnabled, settleDelay, freezePhysics, autoExposure, manualExposure.
---Source: lua/ge/extensions/util/screenshotCreator/settings.lua:991
---@return table  ImGui pointers.
function util_screenshotCreator_settings.getRenderControls() end

--- Returns the resolution presets {name, width, height}.
---Source: lua/ge/extensions/util/screenshotCreator/settings.lua:1009
---@return table[]  Presets.
function util_screenshotCreator_settings.getResolutions() end

--- Returns the safety margin definition: {width = 500, height = 281, defaultTargetIndex, targets = [{name, left, right, top, bottom, extraBottom, color}]}.
---Source: lua/ge/extensions/util/screenshotCreator/settings.lua:1010
---@return table  Reference margins.
function util_screenshotCreator_settings.getSafeMargins() end

--- Returns a copy of the thumbnail config: {fileEnding = ".jpg", fov = 20, nearPlane = 0.1}.
---Source: lua/ge/extensions/util/screenshotCreator/settings.lua:1006
---@return table  Thumbnail config.
function util_screenshotCreator_settings.getThumbnailConfig() end

--- Returns the correct resolution of a vehicle thumbnail ("thumbnail" preset, 800 x 448).
---Source: lua/ge/extensions/util/screenshotCreator/settings.lua:234
---@return integer[]  {width, height}.
function util_screenshotCreator_settings.getThumbnailResolution() end

--- Returns the extra margin around the vehicle: {top = 4, bottom = 2} (in reference pixels).
---Source: lua/ge/extensions/util/screenshotCreator/settings.lua:1011
---@return table  {top, bottom}.
function util_screenshotCreator_settings.getVehicleSafeMargin() end

--- Indicates whether the main output/render settings are at the thumbnail default values.
---Source: lua/ge/extensions/util/screenshotCreator/settings.lua:499
---@return boolean  true if everything is default.
function util_screenshotCreator_settings.isDefaultConfig() end

--- Checks that, for the "Vehicle thumbnails" destination, the resolution is indeed the thumbnail preset.
---Source: lua/ge/extensions/util/screenshotCreator/settings.lua:512
---@return boolean  false if the size is not suitable for game thumbnails.
function util_screenshotCreator_settings.isThumbnailConfigGood() end

--- End-of-level hook; same function as onExtensionUnloaded.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/screenshotCreator/settings.lua:968
function util_screenshotCreator_settings.onClientEndMission() end

--- Hook called after a level starts: in the showroom, forces reflections to Ultra and applies the environment.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/screenshotCreator/settings.lua:961
function util_screenshotCreator_settings.onClientPostStartMission() end

--- Hook called after reload with the serialized state; identical to deserialize.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/screenshotCreator/settings.lua:875
---@param data table|nil Serialized state.
function util_screenshotCreator_settings.onDeserialized(data) end

--- Game close hook; same function as onExtensionUnloaded.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/screenshotCreator/settings.lua:968
function util_screenshotCreator_settings.onExit() end

--- Hook: resets the settings to default and applies the environment (showroom).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/screenshotCreator/settings.lua:956
function util_screenshotCreator_settings.onExtensionLoaded() end

--- Hook: restores the window resolution if the preview was active, then restores the environment. Also used as onClientEndMission and onExit.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/screenshotCreator/settings.lua:968
function util_screenshotCreator_settings.onExtensionUnloaded() end

--- Serialization hook before extension reload; identical to serialize.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/screenshotCreator/settings.lua:837
---@return table  Settings state.
function util_screenshotCreator_settings.onSerialize() end

--- Resets the output and render settings to their default values (not those of the lighting or the overlays).
---Source: lua/ge/extensions/util/screenshotCreator/settings.lua:262
function util_screenshotCreator_settings.resetToDefaults() end

--- Restores the stored environment then forgets it.
---Source: lua/ge/extensions/util/screenshotCreator/settings.lua:491
---@return boolean  true if everything is restored or if nothing had been stored.
function util_screenshotCreator_settings.restoreEnvironment() end

--- Scales a margin expressed for 500x281 to the given resolution.
---Source: lua/ge/extensions/util/screenshotCreator/settings.lua:219
---@param margin table Reference margin.
---@param resolution integer[] Target {width, height}.
---@return table  Margin in pixels of the target resolution (returned as is if an argument is missing).
function util_screenshotCreator_settings.scaleMargin(margin, resolution) end

--- Returns all the settings as a serializable table (alias onSerialize).
---Source: lua/ge/extensions/util/screenshotCreator/settings.lua:837
---@return table  Settings state.
function util_screenshotCreator_settings.serialize() end

--- Sets the custom resolution (rounded, minimum 1) and selects the matching preset if there is one, otherwise "custom".
---Source: lua/ge/extensions/util/screenshotCreator/settings.lua:247
---@param width number Width in pixels.
---@param height number Height in pixels.
function util_screenshotCreator_settings.setImageResolution(width, height) end

--- Switches the game window to borderless mode at the final chosen resolution (preview), or restores the original video mode.
---Source: lua/ge/extensions/util/screenshotCreator/settings.lua:620
---@param enabled boolean true to enable the preview.
function util_screenshotCreator_settings.setPreviewResolution(enabled) end

