# `util_screenshotCreator_settings`

*File: `lua/ge/extensions/util/screenshotCreator/settings.lua` · VM: Game Engine (GE) · 1055 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `util_screenshotCreator_settings`: `extensions.load("util_screenshotCreator_settings")`, then the global `util_screenshotCreator_settings`

Settings and settings window of the screenshot/thumbnail creator. It keeps all the settings in ImGui pointers (getControls): output destination, resolution (presets thumbnail 800x448, 720p, 1080p, 4k, 8k…), supersampling, FOV, camera height, framing margins, dynamic reflection quality, exposure, low beams, settle delay, physics freeze, lighting rig, SSAO. It builds the contexts (getFramingContext, getCaptureContext, getJobSettings) consumed by job.lua, the framing modes and the capture, applies/restores the showroom environment (local exposure, reflections, plates, seat occupants) and draws the margin overlays in the 3D view.

## Notes

- Default values: destination "Vehicle thumbnails" (vehicles/), resolution 800x448, supersampling 3, FOV 20, camera height 1.1 m, horizontal margin 32 px, manual exposure 8.3 EV, Ultra reflections, settle delay 2 s, physics frozen, shipped configs only.
- ctrls.resolution is a preset index with 0 = "custom"; UI indices go from 1 to 9 (getResolutions is 1-based). outputDestination and selectedMargin are 0-based.
- Safety margins are defined for the 500x281 reference resolution (targets tiny, small, medium, large, huge, list, minimal) then scaled (scaleMargin). The "minimal" target is the maximum of all the others. The default index safeMargins.defaultTargetIndex is 6, which designates the 7th target ("minimal") since getMarginTarget adds 1.
- applyEnvironment, applyReflections and applyLicensePlates act only in the showroom_v2_lighting and showroom_v2_lighting_simple levels; elsewhere they do nothing (applyReflections/applyLicensePlates return false). Fixed exposure is applied only in the showroom.
- The original environment (plates, VariableRegistry dynamic reflections, PostEffectLocalExposureObject exposure, seat occupants) is stored at the first applyEnvironment and restored by restoreEnvironment/finishWork; if restoration fails, the stored state is kept.
- applyLowBeams turns on the lights only if enabled is true; it never turns them off.
- Minor inconsistency: the "Procedural camera height" slider is described as "height above the lowest enabled node", whereas framing/procedural places the rail at groundHeight + cameraHeight.
- deserialize accepts old states (resolutionPtr, selectedCameraOverlayMargin, cameraCompositionOverlayEnabled, dynamicReflectionsEnabled) and migrates the old reflection quality numbering (serialization version 2).

**Dependencies (loaded first):** `ui_imgui`, `core_camera`

## Functions

| Function | Description | Line |
|---|---|---|
| `util_screenshotCreator_settings.addVehicleMargin(margin)` | Adds to a margin target the horizontal margin set by the user (left and right) and the vehicle margins (top +4, bottom +2). | 205 |
| `util_screenshotCreator_settings.applyEnvironment(options)` | Stores the current environment then applies that of the captures: exposure, reflections, ungenerated plates, seat occupants disabled. Does nothing outside the showroom. | 429 |
| `util_screenshotCreator_settings.applyEnvironmentSnapshot(snapshot)` | Reapplies an environment snapshot while checking each value; logs an error for each setting not restored. | 441 |
| `util_screenshotCreator_settings.applyExposure()` | Writes the exposure (auto or manual in EV) to the scene's PostEffectLocalExposureObject. | 375 |
| `util_screenshotCreator_settings.applyLicensePlates()` | Enables the SkipGenerateLicencePlate setting (showroom only). | 388 |
| `util_screenshotCreator_settings.applyLowBeams(vehicle, enabled)` | Turns on the vehicle's low beams (electrics.setLightsState(1)) if enabled; does nothing otherwise. | 949 |
| `util_screenshotCreator_settings.applyReflections()` | Applies the chosen dynamic reflection quality via dynCaptureQuality (showroom only). | 382 |
| `util_screenshotCreator_settings.beginWork(options)` | Start of a capture job: calls applyEnvironment. | 612 |
| `util_screenshotCreator_settings.deserialize(data)` | Restores the settings from a table (clamped values, old formats accepted), then applies exposure and reflections if in the showroom (alias onDeserialized). | 875 |
| `util_screenshotCreator_settings.drawCameraOverlay(fovOverride)` | Draws in the 3D view, in front of the current camera, the frame of the final image (red), the safety margins (green), the vehicle margins (blue) and optionally the composition grid (thirds and center). To be called every frame. | 782 |
| `util_screenshotCreator_settings.drawLightingControls()` | Draws the lighting ImGui controls: cyclorama color (showroom_v2_lighting_backdrop material), camera-relative rig, shadows and intensity per role, exposure correction, parking markup, SSAO mode. | 340 |
| `util_screenshotCreator_settings.drawOutput(options)` | Alias of drawOutputControls. | 646 |
| `util_screenshotCreator_settings.drawOutputControls(options)` | Draws the output ImGui controls: "Restore thumbnail defaults" button, destination, procedural FOV and camera height, horizontal margin, resolutions, supersampling, reflections, exposure, lights, settle delay, physics freeze, and an image size summary. | 646 |
| `util_screenshotCreator_settings.drawOverlayControls()` | Draws the overlay ImGui controls: margins, framing box, OOBB, framing inputs, composition, as well as the Sample and Comparison checkboxes. | 760 |
| `util_screenshotCreator_settings.drawOverlays(fovOverride)` | Alias of drawCameraOverlay. | 782 |
| `util_screenshotCreator_settings.finishWork()` | End of a capture job: calls restoreEnvironment. | 616 |
| `util_screenshotCreator_settings.getCaptureContext()` | Builds the capture context: destination, file extension, resolution, superSampling (and supersampling), internalResolution (resolution × supersampling), reflection quality, lights, delay, physics freeze, exposure, sample/comparison options. | 545 |
| `util_screenshotCreator_settings.getControls()` | Returns the table of all ImGui pointers of the settings (outputDestination, resolution, imageResolution, superSampling, fieldOfView, cameraHeight, selectedMargin, lightRoleIntensity, etc.). Modifying these pointers directly modifies the settings. | 980 |
| `util_screenshotCreator_settings.getCurrentResolution()` | Returns the final chosen resolution: that of the selected preset, or the custom resolution if "custom". | 239 |
| `util_screenshotCreator_settings.getDefaults()` | Returns a copy of the settings' default values. | 1005 |
| `util_screenshotCreator_settings.getDynamicReflectionQualities()` | Returns the reflection quality levels: Lowest, Low, Normal, High, Ultra. | 1012 |
| `util_screenshotCreator_settings.getEnvironmentSnapshot()` | Returns a copy of the stored environment (skipLicensePlates, dynamicReflectionRuntime, autoExposure, manualExposure, seatOccupants). | 486 |
| `util_screenshotCreator_settings.getFramingContext(resolution)` | Builds the context passed to the framing modes: fieldOfView/fov, nearPlane, cameraHeight, cameraAxisDownOffset, settleDelay, resolution, aspectRatio, useMargins, margin and debug {drawBounds, drawOobb, drawInputs}. The caller adds vehicle, configName, etc. | 524 |
| `util_screenshotCreator_settings.getFramingDefaults()` | Returns a copy of the framing defaults: {cameraAxisDownOffset = 0.10, cameraHeight = 1.1, settleDelay = 1}. | 1007 |
| `util_screenshotCreator_settings.getFramingMargin(resolution)` | Computes the final framing margin for a resolution: chosen target + vehicle margins, scaled. Returns a zero margin if "useFramingMargins" is unchecked. | 517 |
| `util_screenshotCreator_settings.getJobSettings(options)` | Merges the framing and capture contexts into a single table of job settings (outputFolder, resolution, fov, margin, captureTimeout min 0.1 s…). Options override some UI settings. | 572 |
| `util_screenshotCreator_settings.getLightingRig()` | Returns the lighting rig settings read from the UI: enabled, exposureCorrection, ssaoMode ("on", "reduced" or "off"), parkingMarkup, roles[id] = {intensity, shadows} for key, fill, rim, top, groundFill, horizonFill. | 300 |
| `util_screenshotCreator_settings.getMarginTarget(index)` | Returns the margin target of the given index (0-based). The "minimal" target is replaced by the maximum of all the others. Falls back to the default target if the index is invalid. | 200 |
| `util_screenshotCreator_settings.getOutputControls()` | Returns the subset of output pointers: outputDestination, resolution, imageResolution, shippedConfigsOnly, keepAspectRatio, resolutionMultiplier. | 981 |
| `util_screenshotCreator_settings.getOutputDestinations()` | Returns the names of the output destinations: "Vehicle thumbnails" and "Screenshot/showroom folder". | 1008 |
| `util_screenshotCreator_settings.getRenderControls()` | Returns the render pointers: superSampling, shippedConfigsOnly, fieldOfView, cameraHeight, dynamicReflectionQuality, lowBeamsEnabled, settleDelay, freezePhysics, autoExposure, manualExposure. | 991 |
| `util_screenshotCreator_settings.getResolutions()` | Returns the resolution presets {name, width, height}. | 1009 |
| `util_screenshotCreator_settings.getSafeMargins()` | Returns the safety margin definition: {width = 500, height = 281, defaultTargetIndex, targets = [{name, left, right, top, bottom, extraBottom, color}]}. | 1010 |
| `util_screenshotCreator_settings.getThumbnailConfig()` | Returns a copy of the thumbnail config: {fileEnding = ".jpg", fov = 20, nearPlane = 0.1}. | 1006 |
| `util_screenshotCreator_settings.getThumbnailResolution()` | Returns the correct resolution of a vehicle thumbnail ("thumbnail" preset, 800 x 448). | 234 |
| `util_screenshotCreator_settings.getVehicleSafeMargin()` | Returns the extra margin around the vehicle: {top = 4, bottom = 2} (in reference pixels). | 1011 |
| `util_screenshotCreator_settings.isDefaultConfig()` | Indicates whether the main output/render settings are at the thumbnail default values. | 499 |
| `util_screenshotCreator_settings.isThumbnailConfigGood()` | Checks that, for the "Vehicle thumbnails" destination, the resolution is indeed the thumbnail preset. | 512 |
| `util_screenshotCreator_settings.onClientEndMission()` | End-of-level hook; same function as onExtensionUnloaded. *(internal)* *(hook)* | 968 |
| `util_screenshotCreator_settings.onClientPostStartMission()` | Hook called after a level starts: in the showroom, forces reflections to Ultra and applies the environment. *(internal)* *(hook)* | 961 |
| `util_screenshotCreator_settings.onDeserialized(data)` | Hook called after reload with the serialized state; identical to deserialize. *(internal)* *(hook)* | 875 |
| `util_screenshotCreator_settings.onExit()` | Game close hook; same function as onExtensionUnloaded. *(internal)* *(hook)* | 968 |
| `util_screenshotCreator_settings.onExtensionLoaded()` | Hook: resets the settings to default and applies the environment (showroom). *(internal)* *(hook)* | 956 |
| `util_screenshotCreator_settings.onExtensionUnloaded()` | Hook: restores the window resolution if the preview was active, then restores the environment. Also used as onClientEndMission and onExit. *(internal)* *(hook)* | 968 |
| `util_screenshotCreator_settings.onSerialize()` | Serialization hook before extension reload; identical to serialize. *(internal)* *(hook)* | 837 |
| `util_screenshotCreator_settings.resetToDefaults()` | Resets the output and render settings to their default values (not those of the lighting or the overlays). | 262 |
| `util_screenshotCreator_settings.restoreEnvironment()` | Restores the stored environment then forgets it. | 491 |
| `util_screenshotCreator_settings.scaleMargin(margin, resolution)` | Scales a margin expressed for 500x281 to the given resolution. | 219 |
| `util_screenshotCreator_settings.serialize()` | Returns all the settings as a serializable table (alias onSerialize). | 837 |
| `util_screenshotCreator_settings.setImageResolution(width, height)` | Sets the custom resolution (rounded, minimum 1) and selects the matching preset if there is one, otherwise "custom". | 247 |
| `util_screenshotCreator_settings.setPreviewResolution(enabled)` | Switches the game window to borderless mode at the final chosen resolution (preview), or restores the original video mode. | 620 |

### Parameter details

#### `util_screenshotCreator_settings.addVehicleMargin(margin)`

Adds to a margin target the horizontal margin set by the user (left and right) and the vehicle margins (top +4, bottom +2).

- `margin` (*table|nil*) : Margin target.
- **returns**: table|nil New margin, or nil if margin is nil.

#### `util_screenshotCreator_settings.applyEnvironment(options)`

Stores the current environment then applies that of the captures: exposure, reflections, ungenerated plates, seat occupants disabled. Does nothing outside the showroom.

- `options` (*table|nil*) : {applyExposure = false} to leave the exposure untouched.

#### `util_screenshotCreator_settings.applyEnvironmentSnapshot(snapshot)`

Reapplies an environment snapshot while checking each value; logs an error for each setting not restored.

- `snapshot` (*table*) : Snapshot (see getEnvironmentSnapshot).
- **returns**: boolean true if everything was restored.

#### `util_screenshotCreator_settings.applyExposure()`

Writes the exposure (auto or manual in EV) to the scene's PostEffectLocalExposureObject.

- **returns**: boolean true if the object exists and took the requested values.

#### `util_screenshotCreator_settings.applyLicensePlates()`

Enables the SkipGenerateLicencePlate setting (showroom only).

- **returns**: boolean false outside the showroom.

#### `util_screenshotCreator_settings.applyLowBeams(vehicle, enabled)`

Turns on the vehicle's low beams (electrics.setLightsState(1)) if enabled; does nothing otherwise.

- `vehicle` (*table*) : Vehicle object.
- `enabled` (*boolean|nil*) : Imposed value; by default the UI setting.

#### `util_screenshotCreator_settings.applyReflections()`

Applies the chosen dynamic reflection quality via dynCaptureQuality (showroom only).

- **returns**: boolean false outside the showroom.

#### `util_screenshotCreator_settings.beginWork(options)`

Start of a capture job: calls applyEnvironment.

- `options` (*table|nil*) : Passed to applyEnvironment.

#### `util_screenshotCreator_settings.deserialize(data)`

Restores the settings from a table (clamped values, old formats accepted), then applies exposure and reflections if in the showroom (alias onDeserialized).

- `data` (*table|nil*) : Serialized state; ignored if it is not a table.

#### `util_screenshotCreator_settings.drawCameraOverlay(fovOverride)`

Draws in the 3D view, in front of the current camera, the frame of the final image (red), the safety margins (green), the vehicle margins (blue) and optionally the composition grid (thirds and center). To be called every frame.

- `fovOverride` (*number|nil*) : FOV in degrees to use instead of the set FOV.

#### `util_screenshotCreator_settings.drawOutput(options)`

Alias of drawOutputControls.

- `options` (*table|nil*) : See drawOutputControls.

#### `util_screenshotCreator_settings.drawOutputControls(options)`

Draws the output ImGui controls: "Restore thumbnail defaults" button, destination, procedural FOV and camera height, horizontal margin, resolutions, supersampling, reflections, exposure, lights, settle delay, physics freeze, and an image size summary.

- `options` (*table|nil*) : {drawToggleUiApps = function} drawn next to the resolution preview button.

#### `util_screenshotCreator_settings.drawOverlays(fovOverride)`

Alias of drawCameraOverlay.

- `fovOverride` (*number|nil*) : See drawCameraOverlay.

#### `util_screenshotCreator_settings.getCaptureContext()`

Builds the capture context: destination, file extension, resolution, superSampling (and supersampling), internalResolution (resolution × supersampling), reflection quality, lights, delay, physics freeze, exposure, sample/comparison options.

- **returns**: table Capture context.

#### `util_screenshotCreator_settings.getControls()`

Returns the table of all ImGui pointers of the settings (outputDestination, resolution, imageResolution, superSampling, fieldOfView, cameraHeight, selectedMargin, lightRoleIntensity, etc.). Modifying these pointers directly modifies the settings.

- **returns**: table ctrls (im.BoolPtr, im.FloatPtr, im.IntPtr, im.ArrayInt…).

#### `util_screenshotCreator_settings.getCurrentResolution()`

Returns the final chosen resolution: that of the selected preset, or the custom resolution if "custom".

- **returns**: integer[] {width, height}.

#### `util_screenshotCreator_settings.getDefaults()`

Returns a copy of the settings' default values.

- **returns**: table Default values.

#### `util_screenshotCreator_settings.getDynamicReflectionQualities()`

Returns the reflection quality levels: Lowest, Low, Normal, High, Ultra.

- **returns**: string[] Quality levels.

#### `util_screenshotCreator_settings.getEnvironmentSnapshot()`

Returns a copy of the stored environment (skipLicensePlates, dynamicReflectionRuntime, autoExposure, manualExposure, seatOccupants).

- **returns**: table|nil Snapshot, nil if nothing was stored.

#### `util_screenshotCreator_settings.getFramingContext(resolution)`

Builds the context passed to the framing modes: fieldOfView/fov, nearPlane, cameraHeight, cameraAxisDownOffset, settleDelay, resolution, aspectRatio, useMargins, margin and debug {drawBounds, drawOobb, drawInputs}. The caller adds vehicle, configName, etc.

- `resolution` (*integer[]|nil*) : {width, height}; default the current resolution.
- **returns**: table Framing context.

#### `util_screenshotCreator_settings.getFramingDefaults()`

Returns a copy of the framing defaults: {cameraAxisDownOffset = 0.10, cameraHeight = 1.1, settleDelay = 1}.

- **returns**: table Framing defaults.

#### `util_screenshotCreator_settings.getFramingMargin(resolution)`

Computes the final framing margin for a resolution: chosen target + vehicle margins, scaled. Returns a zero margin if "useFramingMargins" is unchecked.

- `resolution` (*integer[]*) : {width, height}.
- **returns**: table {left, right, top, bottom, extraBottom, ...}.

#### `util_screenshotCreator_settings.getJobSettings(options)`

Merges the framing and capture contexts into a single table of job settings (outputFolder, resolution, fov, margin, captureTimeout min 0.1 s…). Options override some UI settings.

- `options` (*table|nil*) : {resolution, outputFolder, lowBeamsEnabled, shippedConfigsOnly, sample, comparison, captureTimeout}.
- **returns**: table Job settings.

#### `util_screenshotCreator_settings.getLightingRig()`

Returns the lighting rig settings read from the UI: enabled, exposureCorrection, ssaoMode ("on", "reduced" or "off"), parkingMarkup, roles[id] = {intensity, shadows} for key, fill, rim, top, groundFill, horizonFill.

- **returns**: table Rig settings.

#### `util_screenshotCreator_settings.getMarginTarget(index)`

Returns the margin target of the given index (0-based). The "minimal" target is replaced by the maximum of all the others. Falls back to the default target if the index is invalid.

- `index` (*integer|nil*) : Target index, 0-based (default safeMargins.defaultTargetIndex).
- **returns**: table {name, left, right, top, bottom, extraBottom, color} in 500x281 reference pixels.

#### `util_screenshotCreator_settings.getOutputControls()`

Returns the subset of output pointers: outputDestination, resolution, imageResolution, shippedConfigsOnly, keepAspectRatio, resolutionMultiplier.

- **returns**: table ImGui pointers.

#### `util_screenshotCreator_settings.getOutputDestinations()`

Returns the names of the output destinations: "Vehicle thumbnails" and "Screenshot/showroom folder".

- **returns**: string[] Destinations.

#### `util_screenshotCreator_settings.getRenderControls()`

Returns the render pointers: superSampling, shippedConfigsOnly, fieldOfView, cameraHeight, dynamicReflectionQuality, lowBeamsEnabled, settleDelay, freezePhysics, autoExposure, manualExposure.

- **returns**: table ImGui pointers.

#### `util_screenshotCreator_settings.getResolutions()`

Returns the resolution presets {name, width, height}.

- **returns**: table[] Presets.

#### `util_screenshotCreator_settings.getSafeMargins()`

Returns the safety margin definition: {width = 500, height = 281, defaultTargetIndex, targets = [{name, left, right, top, bottom, extraBottom, color}]}.

- **returns**: table Reference margins.

#### `util_screenshotCreator_settings.getThumbnailConfig()`

Returns a copy of the thumbnail config: {fileEnding = ".jpg", fov = 20, nearPlane = 0.1}.

- **returns**: table Thumbnail config.

#### `util_screenshotCreator_settings.getThumbnailResolution()`

Returns the correct resolution of a vehicle thumbnail ("thumbnail" preset, 800 x 448).

- **returns**: integer[] {width, height}.

#### `util_screenshotCreator_settings.getVehicleSafeMargin()`

Returns the extra margin around the vehicle: {top = 4, bottom = 2} (in reference pixels).

- **returns**: table {top, bottom}.

#### `util_screenshotCreator_settings.isDefaultConfig()`

Indicates whether the main output/render settings are at the thumbnail default values.

- **returns**: boolean true if everything is default.

#### `util_screenshotCreator_settings.isThumbnailConfigGood()`

Checks that, for the "Vehicle thumbnails" destination, the resolution is indeed the thumbnail preset.

- **returns**: boolean false if the size is not suitable for game thumbnails.

#### `util_screenshotCreator_settings.onDeserialized(data)`

Hook called after reload with the serialized state; identical to deserialize.

- `data` (*table|nil*) : Serialized state.

#### `util_screenshotCreator_settings.onSerialize()`

Serialization hook before extension reload; identical to serialize.

- **returns**: table Settings state.

#### `util_screenshotCreator_settings.restoreEnvironment()`

Restores the stored environment then forgets it.

- **returns**: boolean true if everything is restored or if nothing had been stored.

#### `util_screenshotCreator_settings.scaleMargin(margin, resolution)`

Scales a margin expressed for 500x281 to the given resolution.

- `margin` (*table*) : Reference margin.
- `resolution` (*integer[]*) : Target {width, height}.
- **returns**: table Margin in pixels of the target resolution (returned as is if an argument is missing).

#### `util_screenshotCreator_settings.serialize()`

Returns all the settings as a serializable table (alias onSerialize).

- **returns**: table Settings state.

#### `util_screenshotCreator_settings.setImageResolution(width, height)`

Sets the custom resolution (rounded, minimum 1) and selects the matching preset if there is one, otherwise "custom".

- `width` (*number*) : Width in pixels.
- `height` (*number*) : Height in pixels.

#### `util_screenshotCreator_settings.setPreviewResolution(enabled)`

Switches the game window to borderless mode at the final chosen resolution (preview), or restores the original video mode.

- `enabled` (*boolean*) : true to enable the preview.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | Extensions loaded before: ui_imgui and core_camera. |

## Calls into the engine (C++)

- `debugDrawer:` `drawLineInstance`
- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/util/screenshotCreator/settings.lua`.*
