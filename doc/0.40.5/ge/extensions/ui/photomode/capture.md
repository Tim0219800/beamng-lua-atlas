# `ui_photomode_capture`

*File: `lua/ge/extensions/ui/photomode/capture.lua` · VM: Game Engine (GE) · 1686 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_photomode_capture`: `extensions.load("ui_photomode_capture")`, then the global `ui_photomode_capture`

Photo mode image capture: settings (supersampling, downscale level, HDR, capture with motion blur, extra scene/vehicle passes and normals/depth), window resolution presets, render scale of temporal upscalers, and the capture requests themselves (basic, publish/upload, Steam, motion blur). The module relies on the "screenshot" module (takeScreenShot, takeCustomScreenShot, takeMotionBlurScreenShot, publish, doSteamScreenshot) and on ui_photomode_flash for the flash. It is driven by the photo mode UI and by ui_photomode_shared.

## Example

```lua
local r = ui_photomode_capture.setCaptureState({superSampling = 4, downscaleLevel = 4})
local res = ui_photomode_capture.requestScreenshot({motion = false})
if not res.ok then log('W', 'x', res.reason) end
```

## Notes

- The capture functions return {ok, reason?, mode, captureUiHoldFrames?}. Possible reasons: session_inactive, capture_busy, screenshot_unavailable, screenshot_method_missing, hdr_unavailable, screenshot_request_failed, upload_unavailable, steam_unavailable, motion_blur_disabled, shipping_build_required, resolution_preset_invalid, resolution_apply_failed, capture_state_invalid.
- Limits: supersampling 1 to 8 (capped by getMaxSafeScreenshotSuperSampling depending on VRAM), downscale level 1 to 8, default values 2 and 2. With an active temporal upscaler (DLSS, FSR3, FSR4, XeSS, fsrCustom, PSSR), both are forced to 1.
- rescaleFactor = 1 / sqrt(downscaleLevel); the render resolution is window x sqrt(superSampling) (or x resolutionScale with a temporal upscaler), the output is then multiplied by rescaleFactor.
- Resolution presets (current, 1280x720, 1600x900, 1920x1080, 2560x1440, 3840x2160) are available only outside shipping builds (isResolutionPresetFeatureEnabled = shipping_build ~= true). Inconsistency: in a shipping build, setResolutionPreset returns the reason "shipping_build_required", whereas the opposite is required (a non-shipping build).
- Motion behavior: motionBehavior is static, followVehicle (default) or followVehicleWithRotation; outside static, util/photomodeAttach attaches the camera to the vehicle during the capture. The simulation is temporarily unpaused during a motion blur capture, then paused again. PostFxMotionBlur must be enabled.
- requestBasicScreenshot contains a game TODO: takeScreenShot() does not handle normals capture well; when extra passes are requested with the default values (2, 2), the capture goes through takeCustomScreenShot with 2 and 2.
- The HDR switch waits up to 10 frames to stabilize (timeout with a warning in the logs); the original HDR state is restored by finishPendingBasicCapture.
- The module uses ui_photomode_shared, gameplay_achievement (achievement SCREENSHOT_TAKEN) and core_locales without declaring them all in M.dependencies (only ui_photomode_flash is).
- handlePreRender advances pending captures (HDR, motion blur) and must be called every frame by the main photo mode module; onScreenshotAllDone is the end-of-capture hook emitted by the screenshot module.

**Dependencies (loaded first):** `ui_photomode_flash`

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_photomode_capture.applyCaptureStatePatch(currentCaptureSettings, partialState)` | Applies a partial patch to given settings without touching the module state: superSampling, downscaleLevel, motion {enabled, behavior}, artifacts {splitSceneVehicle, saveNormalDepth}, hdr {enabled}, flash (passed to ui_photomode_flash.applyStatePatch) and resolutionScale (applied immediately to the GraphicUpscalingQuality graphics settings, between 0.33 and 1). | 816 |
| `ui_photomode_capture.applyResolutionPreset(preset)` | Applies a resolution preset in windowed mode via util_resolution.setWindowedResolution (loads the util/resolution extension). The "current" preset does nothing. | 393 |
| `ui_photomode_capture.applySelectedResolutionPresetBeforeCapture(selectedResolutionPresetId)` | Looks up then applies the preset whose identifier is given (applyResolutionPreset(findResolutionPreset(id))). If the identifier is unknown, findResolutionPreset returns nil and applyResolutionPreset returns true without doing anything. | 412 |
| `ui_photomode_capture.buildCaptureRescaleFactor(downscaleLevel)` | Computes the final image reduction factor: 1 / square root of the normalized downscale level. | 524 |
| `ui_photomode_capture.buildCaptureState(captureSettings)` | Builds the full capture display state for the UI: settings, downscale factor, limits, resolution labels (window, render target, output), format, aspect ratio, estimated file size, VRAM / high supersampling warning (threshold 6), motion, artifacts, HDR and flash state. | 716 |
| `ui_photomode_capture.buildDefaultSettings()` | Returns the default capture settings taking the context into account: supersampling and downscale at 1 if a temporal upscaler is active (otherwise 2), HDR enabled by default only if HDR is supported and active. | 254 |
| `ui_photomode_capture.buildMetadataState()` | Subset of the settings to write into a photo's metadata: superSampling, downscaleLevel, rescaleFactor, motion, artifacts, hdr, flash, resolutionScale. | 1043 |
| `ui_photomode_capture.buildNormalizedCaptureSettings(captureSettings)` | Normalizes a set of capture settings: supersampling and downscale bounds (depending on VRAM), booleans, motion mode, HDR disabled if unsupported, supersampling and downscale forced to 1 with a temporal upscaler. Adds safeSuperSamplingMax and temporalUpscalersEnabled. | 529 |
| `ui_photomode_capture.buildResolutionPresetState()` | Builds the resolution presets UI state: visible, enabled, selectedId, labels, applyOnCapture (always false) and the items list {value, label}. | 1039 |
| `ui_photomode_capture.buildState()` | Capture display state with the module's current settings. | 1035 |
| `ui_photomode_capture.findResolutionPreset(presetId)` | Looks up a resolution preset by identifier; an empty identifier means "current". | 278 |
| `ui_photomode_capture.finishPendingMotionCapture(immediateAttachRelease)` | Ends a motion blur capture: restores the photo mode pause request or puts the simulation back in pause, then detaches the camera from the vehicle (immediately or after a few frames). | 959 |
| `ui_photomode_capture.getCaptureState()` | Returns buildState() with ok = photo mode session active, and reason = session_inactive otherwise. | 1065 |
| `ui_photomode_capture.getResolutionPresetState()` | Returns {ok = feature active, state = buildResolutionPresetState()}. | 1074 |
| `ui_photomode_capture.handlePreRender(dtReal, dtSim, dtRaw)` | To be called every frame before rendering: decrements the capture-in-progress counter, advances the pending basic capture (waiting for HDR, sending the capture) and the motion blur capture (warm-up frames, sending, cleanup). *(internal)* | 1596 |
| `ui_photomode_capture.isCaptureInProgress()` | Indicates whether a capture is in progress (basic pending, motion pending, or non-zero capture frame counter), so that the UI stays hidden. | 1029 |
| `ui_photomode_capture.isResolutionPresetFeatureEnabled()` | Indicates whether resolution presets are available: true when the game is not a shipping build. | 266 |
| `ui_photomode_capture.markCaptureInProgress(frames)` | Extends the frame counter during which the capture is considered in progress (takes the maximum of the current value and frames). | 1018 |
| `ui_photomode_capture.normalizeCaptureSuperSampling(value, safeMax)` | Rounds the supersampling value to the nearest integer then clamps it between 1 and safeMax (maximum 8). | 451 |
| `ui_photomode_capture.onScreenshotAllDone()` | Hook called when the screenshot module has finished all captures: ends the pending basic capture and restores HDR. *(internal)* *(hook)* | 1680 |
| `ui_photomode_capture.refreshSessionDefaults()` | Stores the starting resolution scale, resets supersampling, downscale and HDR to their current default values, then reapplies the flash. Called at the start of a photo mode session. *(internal)* | 1007 |
| `ui_photomode_capture.requestScreenshot(options)` | Requests a capture. options.motion = capture with motion blur; options.upload = online publishing; options.steam = Steam capture; they combine (upload + steam). With no option: basic capture (default path if supersampling and downscale are 1 with no extra pass, otherwise custom capture). Handles the flash, the HDR switch (deferred by a few frames) and triggers the SCREENSHOT_TAKEN achievement. | 1532 |
| `ui_photomode_capture.resetSettings()` | Cancels any pending basic capture, resets the capture settings to default and resets the flash. | 995 |
| `ui_photomode_capture.restoreCaptureRuntimeState()` | Ends the pending basic capture (restores HDR), turns off the flash and restores the pre-session resolution scale. *(internal)* | 1001 |
| `ui_photomode_capture.setCaptureState(partialState)` | Applies a partial patch to the module's capture settings (see applyCaptureStatePatch), then reapplies the flash settings. Requires an active session. | 1081 |
| `ui_photomode_capture.setResolutionPreset(presetId)` | Selects and immediately applies a resolution preset, and stores it as the current selection. | 1560 |

### Parameter details

#### `ui_photomode_capture.applyCaptureStatePatch(currentCaptureSettings, partialState)`

Applies a partial patch to given settings without touching the module state: superSampling, downscaleLevel, motion {enabled, behavior}, artifacts {splitSceneVehicle, saveNormalDepth}, hdr {enabled}, flash (passed to ui_photomode_flash.applyStatePatch) and resolutionScale (applied immediately to the GraphicUpscalingQuality graphics settings, between 0.33 and 1).

- `currentCaptureSettings` (*table*) : Starting settings
- `partialState` (*table*) : Partial patch
- **returns**: table|nil New normalized settings, or nil
- **returns**: string|nil capture_state_invalid or capture_resolution_scale_set_failed

#### `ui_photomode_capture.applyResolutionPreset(preset)`

Applies a resolution preset in windowed mode via util_resolution.setWindowedResolution (loads the util/resolution extension). The "current" preset does nothing.

- `preset` (*table*) : Preset returned by findResolutionPreset
- **returns**: boolean success
- **returns**: string|nil resolution_api_unavailable or resolution_apply_failed

#### `ui_photomode_capture.applySelectedResolutionPresetBeforeCapture(selectedResolutionPresetId)`

Looks up then applies the preset whose identifier is given (applyResolutionPreset(findResolutionPreset(id))). If the identifier is unknown, findResolutionPreset returns nil and applyResolutionPreset returns true without doing anything.

- `selectedResolutionPresetId` (*string|nil*) : Identifier of the chosen preset
- **returns**: boolean success
- **returns**: string|nil failure reason

#### `ui_photomode_capture.buildCaptureRescaleFactor(downscaleLevel)`

Computes the final image reduction factor: 1 / square root of the normalized downscale level.

- `downscaleLevel` (*number*) : Downscale level (1 to 8)
- **returns**: number Scale factor between 0.35 and 1

#### `ui_photomode_capture.buildCaptureState(captureSettings)`

Builds the full capture display state for the UI: settings, downscale factor, limits, resolution labels (window, render target, output), format, aspect ratio, estimated file size, VRAM / high supersampling warning (threshold 6), motion, artifacts, HDR and flash state.

- `captureSettings` (*table|nil*) : Settings to describe
- **returns**: table Display state

#### `ui_photomode_capture.buildDefaultSettings()`

Returns the default capture settings taking the context into account: supersampling and downscale at 1 if a temporal upscaler is active (otherwise 2), HDR enabled by default only if HDR is supported and active.

- **returns**: table {superSampling, downscaleLevel, motionEnabled, motionBehavior, splitSceneVehicle, saveNormalDepth, hdrScreenshot}

#### `ui_photomode_capture.buildMetadataState()`

Subset of the settings to write into a photo's metadata: superSampling, downscaleLevel, rescaleFactor, motion, artifacts, hdr, flash, resolutionScale.

- **returns**: table Capture settings

#### `ui_photomode_capture.buildNormalizedCaptureSettings(captureSettings)`

Normalizes a set of capture settings: supersampling and downscale bounds (depending on VRAM), booleans, motion mode, HDR disabled if unsupported, supersampling and downscale forced to 1 with a temporal upscaler. Adds safeSuperSamplingMax and temporalUpscalersEnabled.

- `captureSettings` (*table|nil*) : Raw settings
- **returns**: table Normalized settings

#### `ui_photomode_capture.buildResolutionPresetState()`

Builds the resolution presets UI state: visible, enabled, selectedId, labels, applyOnCapture (always false) and the items list {value, label}.

- **returns**: table Presets state

#### `ui_photomode_capture.buildState()`

Capture display state with the module's current settings.

- **returns**: table See buildCaptureState

#### `ui_photomode_capture.findResolutionPreset(presetId)`

Looks up a resolution preset by identifier; an empty identifier means "current".

- `presetId` (*string|nil*) : Preset identifier
- **returns**: table|nil Preset {id, labelKey, width?, height?} or nil

#### `ui_photomode_capture.finishPendingMotionCapture(immediateAttachRelease)`

Ends a motion blur capture: restores the photo mode pause request or puts the simulation back in pause, then detaches the camera from the vehicle (immediately or after a few frames).

- `immediateAttachRelease` (*boolean|nil*) : true to detach without delay

#### `ui_photomode_capture.getCaptureState()`

Returns buildState() with ok = photo mode session active, and reason = session_inactive otherwise.

- **returns**: table Capture state

#### `ui_photomode_capture.getResolutionPresetState()`

Returns {ok = feature active, state = buildResolutionPresetState()}.

- **returns**: table {ok, state}

#### `ui_photomode_capture.handlePreRender(dtReal, dtSim, dtRaw)`

To be called every frame before rendering: decrements the capture-in-progress counter, advances the pending basic capture (waiting for HDR, sending the capture) and the motion blur capture (warm-up frames, sending, cleanup).

- `dtReal` (*number*) : Frame real time (s)
- `dtSim` (*number*) : Simulation time (s)
- `dtRaw` (*number*) : Raw time (s)

#### `ui_photomode_capture.isCaptureInProgress()`

Indicates whether a capture is in progress (basic pending, motion pending, or non-zero capture frame counter), so that the UI stays hidden.

- **returns**: boolean capture in progress

#### `ui_photomode_capture.isResolutionPresetFeatureEnabled()`

Indicates whether resolution presets are available: true when the game is not a shipping build.

- **returns**: boolean feature active

#### `ui_photomode_capture.markCaptureInProgress(frames)`

Extends the frame counter during which the capture is considered in progress (takes the maximum of the current value and frames).

- `frames` (*integer*) : Number of frames; ignored if <= 0

#### `ui_photomode_capture.normalizeCaptureSuperSampling(value, safeMax)`

Rounds the supersampling value to the nearest integer then clamps it between 1 and safeMax (maximum 8).

- `value` (*number*) : Requested value (default 2 if non-numeric)
- `safeMax` (*number|nil*) : Safe maximum (8 by default)
- **returns**: integer Normalized supersampling

#### `ui_photomode_capture.requestScreenshot(options)`

Requests a capture. options.motion = capture with motion blur; options.upload = online publishing; options.steam = Steam capture; they combine (upload + steam). With no option: basic capture (default path if supersampling and downscale are 1 with no extra pass, otherwise custom capture). Handles the flash, the HDR switch (deferred by a few frames) and triggers the SCREENSHOT_TAKEN achievement.

- `options` (*table|nil*) : {motion?, upload?, steam?}
- **returns**: table {ok, reason?, mode, captureUiHoldFrames?}

#### `ui_photomode_capture.setCaptureState(partialState)`

Applies a partial patch to the module's capture settings (see applyCaptureStatePatch), then reapplies the flash settings. Requires an active session.

- `partialState` (*table*) : Partial patch
- **returns**: table {ok, reason?, state}

#### `ui_photomode_capture.setResolutionPreset(presetId)`

Selects and immediately applies a resolution preset, and stores it as the current selection.

- `presetId` (*string*) : Preset identifier
- **returns**: table {ok, reason?, state}

## Fields

| Field | Type | Description |
|---|---|---|
| `DEFAULTS` | table | Static default values: superSampling = 2, downscaleLevel = 2, motionEnabled = false, motionBehavior = "followVehicle", splitSceneVehicle = false, saveNormalDepth = false, hdrScreenshot = false. For the values actually applied (temporal upscaler, HDR), use buildDefaultSettings(). |
| `dependencies` | string[] | {"ui_photomode_flash"} |

## Calls into the engine (C++)

- `scenetree.` `findObject`

**Loads extensions:** `util/photomodeAttach`, `util/resolution`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/photomode/capture.lua`.*
