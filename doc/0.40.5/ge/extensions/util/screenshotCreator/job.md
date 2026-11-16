# `util_screenshotCreator_job`

*File: `lua/ge/extensions/util/screenshotCreator/job.lua` · VM: Game Engine (GE) · 860 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `util_screenshotCreator_job`: `extensions.load("util_screenshotCreator_job")`, then the global `util_screenshotCreator_job`

Orchestrator of the vehicle thumbnail creator. It runs, in a coroutine driven by onPreRender, the complete loop: replace/place the vehicle, let it settle, freeze the physics, compute the camera (framing via framingManager or saved camera), adjust the lighting, wait 2 s, capture the image with util_screenshotCreator_capture, check the produced file then restore the environment and the physics. It also handles the camera preview (startPreview) and exposes progress and the report for the UI. A modder uses it to batch-generate the vehicles/<model>/<config>.jpg images.

## Example

```lua
util_screenshotCreator_job.startWork({selection = 'selectedModels', onlyMissingThumbnails = true})
-- then, every UI frame:
local p = util_screenshotCreator_job.getProgress() -- {completed, total, current}
if util_screenshotCreator_job.consumeRunDone() then dump(util_screenshotCreator_job.getReviewData()) end
```

## Notes

- The work advances by one coroutine step per onPreRender call; only one job at a time (startWork and startPreview return false if a coroutine already exists).
- startWork options: selection ("selectedModels" by default, "selectedModelDefaults", or a config name for the current vehicle), targets (list {model, config}, max 2000), onlyMissingThumbnails, shippedConfigsOnly (true by default unless shippedOnly == false), lowBeamsEnabled, sample (writes to screenshots/thumbnailSamples/<date>/), comparison (copies the existing thumbnail to *_existing), cameraOverridePolicy ("useSaved" or "ignore"), framingModeId, vehicleId, configName, outputPath, onDoneHook (guihooks event name triggered at the end).
- Output folder: vehicles/ by default (vehicles/<model>/<config><ext>), screenshots/showroom/ if the destination setting is 1; for the current vehicle, in its vehicleDirectory. If the config is the default one (outside sample mode), the thumbnail is also copied to vehicles/<model>/default<ext>.
- Physics is frozen during framing and capture; its state (running, speedFactor) is saved then restored at the end or when the extension is unloaded.
- A failed capture sets forceQuit: the batch stops (abortRun) unless it was the last item. Capture wait timeout: 5 s, then 2 s waiting for the file.
- On the command line, if the arguments contain -onLevelLoad_ext / 'util/createThumbnails' twice, the game is closed (shutdown(0)) at the end of the job.
- Vehicles are replaced by core_vehicles.replaceVehicle (plate "BeamNG"), parking brake engaged and engine off.

**Dependencies (loaded first):** `core_camera`, `core_vehicles`, `core_vehicle_manager`, `ui_vehicleSelector_general`, `util_screenshotCreator_settings`, `util_screenshotCreator_thumbnailConfig`, `util_screenshotCreator_vehicleSetup`, `util_screenshotCreator_capture`, `util_screenshotCreator_lightingSetup`, `util_screenshotCreator_framing_configured`, `util_screenshotCreator_framingManager`, `util_screenshotCreator_modelSelection`, `util_screenshotCreator_shippedConfigs`

## Functions

| Function | Description | Line |
|---|---|---|
| `util_screenshotCreator_job.clearRunDone()` | Resets the "job done" flag to false without reading it. | 810 |
| `util_screenshotCreator_job.consumeRunDone()` | Reads then resets the "job done" flag to false. | 804 |
| `util_screenshotCreator_job.getProgress()` | Returns the job progress. | 846 |
| `util_screenshotCreator_job.getReviewData()` | Returns the report of the last job. | 847 |
| `util_screenshotCreator_job.isCameraSet()` | Indicates whether a preview moved the camera (cameraSet). | 851 |
| `util_screenshotCreator_job.isRunning()` | Indicates whether a work coroutine exists. | 845 |
| `util_screenshotCreator_job.onClientEndMission()` | Hook called at the end of the mission/level; same function as onExtensionUnloaded. *(internal)* *(hook)* | 833 |
| `util_screenshotCreator_job.onDeserialized(data)` | Hook called after reload with the serialized state. *(internal)* *(hook)* | 824 |
| `util_screenshotCreator_job.onExit()` | Hook called when the game closes; same function as onExtensionUnloaded. *(internal)* *(hook)* | 833 |
| `util_screenshotCreator_job.onExtensionUnloaded()` | Hook called when the extension is unloaded: stops the job, restores the lighting, the settings and the physics state. Also used as onClientEndMission and onExit. *(internal)* *(hook)* | 833 |
| `util_screenshotCreator_job.onPreRender()` | Hook called every frame before rendering: advances the work coroutine. On a Lua error, the trace is logged and the job is abandoned; at the end, the lighting and the physics are restored. *(internal)* *(hook)* | 785 |
| `util_screenshotCreator_job.onSerialize()` | Hook called before an extension reload: returns progress, review, runDone, previousFov and cameraSet. The coroutine is not saved. *(internal)* *(hook)* | 814 |
| `util_screenshotCreator_job.resetCamera()` | Returns the player's camera to "orbit" mode and restores the FOV saved before the preview (60 by default). | 117 |
| `util_screenshotCreator_job.startPreview(vehicle, configName, modeOrOptions, fixedRotation)` | Places the vehicle as for a thumbnail, waits for it to settle then positions the player's free camera on the computed framing, without capturing an image. Returns false if a job is running or if vehicle is nil. | 765 |
| `util_screenshotCreator_job.startPreviewWithDelay(vehicle, configName, modeOrOptions, fixedRotation)` | Like startPreview, but for vehicles whose thumbnailConfig.getPauseDelay is > 0: the physics runs during this delay before freezing. Returns false if the model is unknown or if the delay is zero. | 769 |
| `util_screenshotCreator_job.startWork(workOptions)` | Starts thumbnail generation. Normalizes the options, builds the list of items (selected models, explicit targets or the current vehicle), takes control of the physics, enables the environment settings (settings.beginWork) and creates the work coroutine. Returns false if a job is already in progress, if the targets are invalid or if the physics API is missing. | 654 |
| `util_screenshotCreator_job.stop()` | Requests the current job to stop (forceQuit); the coroutine stops at its next checkpoint. | 779 |

### Parameter details

#### `util_screenshotCreator_job.consumeRunDone()`

Reads then resets the "job done" flag to false.

- **returns**: boolean true only once after a job ends (or a startup failure for lack of a vehicle).

#### `util_screenshotCreator_job.getProgress()`

Returns the job progress.

- **returns**: table {completed = integer, total = integer, current = string "model/config"}.

#### `util_screenshotCreator_job.getReviewData()`

Returns the report of the last job.

- **returns**: table|nil {onlyMissingThumbnails, shippedConfigsOnly, lowBeamsEnabled, selection, framingModeId, cameraOverridePolicy, sampleOutputFolder, configs = [{vehName, camName, status (done/failed/skipped), thumbnailPath}]}; nil before any job.

#### `util_screenshotCreator_job.isCameraSet()`

Indicates whether a preview moved the camera (cameraSet).

- **returns**: boolean true as long as resetCamera has not been called.

#### `util_screenshotCreator_job.isRunning()`

Indicates whether a work coroutine exists.

- **returns**: boolean true during a job or a preview.

#### `util_screenshotCreator_job.onDeserialized(data)`

Hook called after reload with the serialized state.

- `data` (*table*) : State returned by onSerialize.

#### `util_screenshotCreator_job.onSerialize()`

Hook called before an extension reload: returns progress, review, runDone, previousFov and cameraSet. The coroutine is not saved.

- **returns**: table State to restore.

#### `util_screenshotCreator_job.startPreview(vehicle, configName, modeOrOptions, fixedRotation)`

Places the vehicle as for a thumbnail, waits for it to settle then positions the player's free camera on the computed framing, without capturing an image. Returns false if a job is running or if vehicle is nil.

- `vehicle` (*table*) : Vehicle object.
- `configName` (*string*) : Configuration name.
- `modeOrOptions` (*string|table|nil*) : Framing mode id, or options table {framingModeId, fixedRotation, delayedPreview}.
- `fixedRotation` (*quat|nil*) : Imposed camera rotation (ignored if modeOrOptions is a table).
- **returns**: boolean true if the preview started.

#### `util_screenshotCreator_job.startPreviewWithDelay(vehicle, configName, modeOrOptions, fixedRotation)`

Like startPreview, but for vehicles whose thumbnailConfig.getPauseDelay is > 0: the physics runs during this delay before freezing. Returns false if the model is unknown or if the delay is zero.

- `vehicle` (*table*) : Vehicle object.
- `configName` (*string*) : Configuration name.
- `modeOrOptions` (*string|table|nil*) : Framing mode id or options table.
- `fixedRotation` (*quat|nil*) : Imposed camera rotation.
- **returns**: boolean true if the preview started.

#### `util_screenshotCreator_job.startWork(workOptions)`

Starts thumbnail generation. Normalizes the options, builds the list of items (selected models, explicit targets or the current vehicle), takes control of the physics, enables the environment settings (settings.beginWork) and creates the work coroutine. Returns false if a job is already in progress, if the targets are invalid or if the physics API is missing.

- `workOptions` (*table|nil*) : Job options (see notes). If it is not a table: selection = "selectedModels", onlyMissingThumbnails = false.
- **returns**: boolean true if the job started.

#### `util_screenshotCreator_job.stop()`

Requests the current job to stop (forceQuit); the coroutine stops at its next checkpoint.

- **returns**: boolean false if there is no job in progress, otherwise true.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | Extensions loaded before: core_camera, core_vehicles, core_vehicle_manager, ui_vehicleSelector_general and several util_screenshotCreator_* (settings, thumbnailConfig, vehicleSetup, capture, lightingSetup, framing_configured, framingManager, modelSelection, shippedConfigs). |

## Calls into the engine (C++)

- `Engine.` `getStartingArgs`
- `FS:` `copyFile`, `directoryCreate`, `fileExists`, `fileSize`, `removeFile`
- `be:` `getPhysicsRunning`, `getPhysicsSpeedFactor`, `setPhysicsRunning`, `setPhysicsSpeedFactor`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/util/screenshotCreator/job.lua`.*
