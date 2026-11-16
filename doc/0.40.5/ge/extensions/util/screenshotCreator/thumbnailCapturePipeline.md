# `util_screenshotCreator_thumbnailCapturePipeline`

*File: `lua/ge/extensions/util/screenshotCreator/thumbnailCapturePipeline.lua` · VM: Game Engine (GE) · 137 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `util_screenshotCreator_thumbnailCapturePipeline`: `extensions.load("util_screenshotCreator_thumbnailCapturePipeline")`, then the global `util_screenshotCreator_thumbnailCapturePipeline`

Vehicle thumbnail capture chain used by the thumbnail composer (thumbnailComposerRun): replaces the vehicle with the desired configuration, places it and lets it settle, freezes the physics, computes the camera with the "legacy" framing ("warehouse" angle, margins reduced to 85%), points the main camera at the shot, sets the lighting, waits 2 s then captures the image with util_screenshotCreator_capture.captureFramedThumbnail. Unlike job.lua, cameras saved per config or model are ignored. processWorkItem must be called from a coroutine, because it yields.

## Notes

- processWorkItem uses coroutine.yield (waits of 0.7 s and 2 s): call it only inside a coroutine.
- The "defaults" capture mode writes default.jpg for the default config; with "all", the default config's thumbnail is also copied to default.jpg (see thumbnailPaths).
- The main camera is switched to free view and its original state is stored (only once); resetRenderState() restores it. It must be called at the end or on cancellation.
- The FOV passed to the capture is framingContext.fieldOfView (user setting) whereas the legacy mode frames with a fixed 20° FOV: the set FOV must stay at 20 for consistent framing.

**Dependencies (loaded first):** `core_vehicles`, `core_camera`, `util_screenshotCreator_settings`, `util_screenshotCreator_vehicleSetup`, `util_screenshotCreator_capture`, `util_screenshotCreator_lightingSetup`, `util_screenshotCreator_framing_legacy`, `util_screenshotCreator_framingManager`, `util_screenshotCreator_thumbnailPaths`

## Functions

| Function | Description | Line |
|---|---|---|
| `util_screenshotCreator_thumbnailCapturePipeline.processWorkItem(item, index, total, settingsSnapshot, runContext, options)` | Processes a queue item: replaces the vehicle, places it, waits for it to settle, freezes the physics, frames, lights, captures and restores the lighting. Returns a result {status = "saved", current, camera, outputFolder, outputPath} or {status = "failed", error}, or nil if cancellation was requested. | 65 |
| `util_screenshotCreator_thumbnailCapturePipeline.resetRenderState()` | Restores the main camera stored by pointMainCameraAt and the lighting (lightingSetup.restore). | 128 |
| `util_screenshotCreator_thumbnailCapturePipeline.resolveCamera(vehicle, modelName, configName, outputResolution)` | Computes the "warehouse angle" framing camera: framing context from the settings, "legacy" mode, margins multiplied by 0.85. Logs an error and returns nil if the framing fails. | 45 |

### Parameter details

#### `util_screenshotCreator_thumbnailCapturePipeline.processWorkItem(item, index, total, settingsSnapshot, runContext, options)`

Processes a queue item: replaces the vehicle, places it, waits for it to settle, freezes the physics, frames, lights, captures and restores the lighting. Returns a result {status = "saved", current, camera, outputFolder, outputPath} or {status = "failed", error}, or nil if cancellation was requested.

- `item` (*table*) : Item {modelName, modelKey, configName, isDefaultConfig...}.
- `index` (*integer*) : Rank of the item (starting at 1).
- `total` (*integer*) : Total number of items.
- `settingsSnapshot` (*table*) : Settings snapshot: capture {superSampling, freezePhysics...}, captureTimeout.
- `runContext` (*table*) : {initialPosition, initialRotation}: the vehicle's starting transform.
- `options` (*table*) : {sendProgress = function(done, total, current), isCancelled = function, outputResolution, captureMode}.
- **returns**: table|nil Item result; nil if canceled.

#### `util_screenshotCreator_thumbnailCapturePipeline.resolveCamera(vehicle, modelName, configName, outputResolution)`

Computes the "warehouse angle" framing camera: framing context from the settings, "legacy" mode, margins multiplied by 0.85. Logs an error and returns nil if the framing fails.

- `vehicle` (*table*) : Vehicle object.
- `modelName` (*string*) : Model name.
- `configName` (*string*) : Configuration name.
- `outputResolution` (*integer[]|nil*) : {width, height} of the final image.
- **returns**: table|nil Camera {pos, rot, fov, name, ...} or nil.
- **returns**: table|nil Framing context used.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | Extensions loaded before: core_vehicles, core_camera and util_screenshotCreator_settings, vehicleSetup, capture, lightingSetup, framing_legacy, framingManager, thumbnailPaths. |

## Calls into the engine (C++)

- `FS:` `copyFile`
- `be:` `getPhysicsRunning`, `setPhysicsRunning`, `setPhysicsSpeedFactor`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/util/screenshotCreator/thumbnailCapturePipeline.lua`.*
