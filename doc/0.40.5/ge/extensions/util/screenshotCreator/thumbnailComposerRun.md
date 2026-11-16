# `util_screenshotCreator_thumbnailComposerRun`

*File: `lua/ge/extensions/util/screenshotCreator/thumbnailComposerRun.lua` · VM: Game Engine (GE) · 569 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `util_screenshotCreator_thumbnailComposerRun`: `extensions.load("util_screenshotCreator_thumbnailComposerRun")`, then the global `util_screenshotCreator_thumbnailComposerRun`

Execution engine of the "Thumbnail Composer" (v2): orchestrates a series of vehicle thumbnail captures for a calling UI (identified by ownerId) that receives events via a table of handlers. It validates the targets (thumbnailTargets), optionally filters out those that already have a thumbnail (missingOnly), takes control of the physics, applies reference graphics settings for the duration of the job (Ultra quality, SMAA, no motion blur, no occupants…), then processes each item in a coroutine (thumbnailCapturePipeline.processWorkItem). It also handles a camera preview, a depth-of-field background blur tuned to the showroom's back wall, a forced exposure, and the "Showroom Tools" ImGui panel (drawShowroomTools) of the showroom_thumbnails flowgraph.

## Notes

- Events emitted to handlers.emit(ownerId, name, data): Status, Catalog, Progress {runId, stage = "capture", completed, total, current}, ItemResult {runId, itemId, index, total, current, status...}, RunComplete {runId}, Failed {runId, error, cancelled}. Handler errors are caught (pcall) and logged.
- Only one job at a time: start returns false and emits Failed if a capture is already in progress, if the targets are invalid, if missingOnly leaves nothing to do or if the physics cannot be taken over.
- Message options for start: targets (list {model, config}; absent = player vehicle's config), captureMode ("defaults" = default.jpg, otherwise one thumbnail per config), missingOnly, outputWidth/outputHeight (16 to 8192, default 500x281), backgroundBlur (0 to 1), blurStartDistance (0.5 to 30 m, default 8), forceExposure, exposureEV (default 8.3).
- The original graphics settings are saved (settings.getValue) and restored at the end, on cancellation or on unload; the showroom environment is restored via util_screenshotCreator_settings.
- The background blur casts a ray (Engine.castRay) from the camera to find the wall and sets DOFPostEffect (focalDist, farSlope…) every frame; the exposure uses PostEffectLocalExposureObject. These two effects are active only during a preview or a job.
- The first failure of an item stops the whole job (failRun); cancellation emits Failed with cancelled = true.

**Dependencies (loaded first):** `ui_imgui`, `util_screenshotCreator_settings`, `util_screenshotCreator_lightingSetup`, `util_screenshotCreator_thumbnailCapturePipeline`, `util_screenshotCreator_thumbnailConfig`, `util_screenshotCreator_thumbnailPaths`, `util_screenshotCreator_thumbnailTargets`

## Functions

| Function | Description | Line |
|---|---|---|
| `util_screenshotCreator_thumbnailComposerRun.cancel(ownerId)` | Cancels the current job (emits Failed with cancelled = true). If ownerId is given, it must match the job's caller. | 385 |
| `util_screenshotCreator_thumbnailComposerRun.drawShowroomTools()` | Draws in the flowgraph's ImGui window the thumbnail tools panel: blur and exposure options, resolution, vehicle selection grid, "Capture current config", "Capture all configs" and "Capture missing thumbnails" buttons, progress bar and Cancel button. *(internal)* | 542 |
| `util_screenshotCreator_thumbnailComposerRun.isActive(ownerId)` | Indicates whether a job is in progress (for this ownerId if specified). | 392 |
| `util_screenshotCreator_thumbnailComposerRun.onExtensionUnloaded()` | Unload hook: stops the job, restores the exposure, the blur, the graphics settings, the environment and the physics. *(internal)* *(hook)* | 415 |
| `util_screenshotCreator_thumbnailComposerRun.onPreRender()` | Hook called every frame before rendering: advances the work coroutine (an error makes it fail) and updates the DOF blur and the forced exposure during a preview or a job. *(internal)* *(hook)* | 397 |
| `util_screenshotCreator_thumbnailComposerRun.sendStatus(ownerId, handlers)` | Emits the Status event: {active, runId, currentModel, currentConfig, currentFlipped} (currentFlipped = 180° thumbnail rotation). | 311 |
| `util_screenshotCreator_thumbnailComposerRun.setViewOptions(message)` | Sets the view options (background blur, blur start distance, forced exposure) from a message. | 85 |
| `util_screenshotCreator_thumbnailComposerRun.start(ownerId, message, handlers)` | Starts a capture job for the caller ownerId. Resolves the targets, applies the capture settings and starts the work coroutine. Returns false (and emits "Failed") on refusal. | 335 |
| `util_screenshotCreator_thumbnailComposerRun.startPreview(message)` | Preview: places the player's free camera on the framing computed for the player vehicle (the pipeline's legacy framing) and adjusts the lighting. Does nothing if there is no vehicle or if a job is active. | 159 |
| `util_screenshotCreator_thumbnailComposerRun.stopPreview()` | Ends the preview: restores the stored camera state and the lighting. | 152 |
| `util_screenshotCreator_thumbnailComposerRun.subscribe(ownerId, handlers)` | Registers a caller: emits Status then Catalog {models = vehicle catalog, resolutions = resolution presets}. | 324 |

### Parameter details

#### `util_screenshotCreator_thumbnailComposerRun.cancel(ownerId)`

Cancels the current job (emits Failed with cancelled = true). If ownerId is given, it must match the job's caller.

- `ownerId` (*string|nil*) : Caller identifier.
- **returns**: boolean true if a job was canceled.

#### `util_screenshotCreator_thumbnailComposerRun.isActive(ownerId)`

Indicates whether a job is in progress (for this ownerId if specified).

- `ownerId` (*string|nil*) : Caller identifier.
- **returns**: boolean true if active.

#### `util_screenshotCreator_thumbnailComposerRun.sendStatus(ownerId, handlers)`

Emits the Status event: {active, runId, currentModel, currentConfig, currentFlipped} (currentFlipped = 180° thumbnail rotation).

- `ownerId` (*string*) : Caller identifier.
- `handlers` (*table*) : Handlers with emit.

#### `util_screenshotCreator_thumbnailComposerRun.setViewOptions(message)`

Sets the view options (background blur, blur start distance, forced exposure) from a message.

- `message` (*table*) : {backgroundBlur, blurStartDistance, forceExposure, exposureEV}.

#### `util_screenshotCreator_thumbnailComposerRun.start(ownerId, message, handlers)`

Starts a capture job for the caller ownerId. Resolves the targets, applies the capture settings and starts the work coroutine. Returns false (and emits "Failed") on refusal.

- `ownerId` (*string*) : Caller identifier (converted to a string).
- `message` (*table*) : Options: targets, captureMode, missingOnly, outputWidth, outputHeight, backgroundBlur, blurStartDistance, forceExposure, exposureEV.
- `handlers` (*table*) : {emit = function(ownerId, name, data)} that receives the events.
- **returns**: boolean true if the job started.

#### `util_screenshotCreator_thumbnailComposerRun.startPreview(message)`

Preview: places the player's free camera on the framing computed for the player vehicle (the pipeline's legacy framing) and adjusts the lighting. Does nothing if there is no vehicle or if a job is active.

- `message` (*table*) : View options and outputWidth/outputHeight.

#### `util_screenshotCreator_thumbnailComposerRun.subscribe(ownerId, handlers)`

Registers a caller: emits Status then Catalog {models = vehicle catalog, resolutions = resolution presets}.

- `ownerId` (*string*) : Caller identifier.
- `handlers` (*table*) : Handlers with emit.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | Extensions loaded before: ui_imgui and util_screenshotCreator_settings, lightingSetup, thumbnailCapturePipeline, thumbnailConfig, thumbnailPaths, thumbnailTargets. |
| `onClientEndMission` | function | Alias of onExtensionUnloaded: cleans up at the end of the level. |
| `onExit` | function | Alias of onExtensionUnloaded: cleans up when the game closes. |

## Calls into the engine (C++)

- `Engine.` `castRay`
- `be:` `getPhysicsRunning`, `getPhysicsSpeedFactor`, `setPhysicsRunning`, `setPhysicsSpeedFactor`
- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/util/screenshotCreator/thumbnailComposerRun.lua`.*
