# `screenshot`

*File: `lua/ge/screenshot.lua` · VM: Game Engine (GE) · 1376 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** global `screenshot`

Screenshot capture on the Game Engine side. It prepares the file name (folder screenshots/<month>/screenshot_<date>), the quality options (supersampling, scaling), the metadata (level, vehicles, sharing), and launches the capture via the engine (createScreenshot2). It tracks each capture as a "job" (queued, in progress, saving, done, error) and notifies the UI. It also handles the upload to the BeamNG media server, the list of the latest photo mode photos and the restoring of the graphics settings after a high-quality capture.

## Example

```lua
screenshot.takeScreenShot()            -- normal capture
screenshot.takeBigScreenShot()         -- 2x linear (4x pixels)
screenshot.takeCustomScreenShot(4, 1)  -- supersampling 4, rescale 1
```

## Notes

- The takeXxxScreenShot functions accept flexible positional arguments: (splitSceneVehicle, saveNormalDepth, options...) or, if the first argument is a table, the booleans are read at positions c and d. A table passed in the last or second-to-last position is interpreted as 'options' (callOrigin, upload, jsonMetaData, includeMetadata, persistMetadataSidecar, forceSidecar).
- Supersampling is the TOTAL pixel multiplier (1 = native, 4 = 2x linear, 9 = 3x linear). It is capped by a GPU budget (getMaxSafeScreenshotSuperSampling): Big 4, Huge 9, Custom/MotionBlur up to 24. High values can hang or crash some GPU drivers.
- From a supersampling >= 9 (highest), the module temporarily sets $pref::TS::detailAdjust to 20, $pref::Terrain::lodScale to 0.001 and the grass scale to 8; with supersampling > 1 it also sets the volumetric cloud layer (256 steps). screenshotAllDone restores the original values.
- Only one capture at a time: doScreenshot, takeBig and takeHuge exit if captureInProgress is true (log 'ignoring screenshot capture'). captureInProgress is reset to false by screenshotAllDone. takeScreenShot, takeCustom and takeMotionBlur do not test this lock.
- takeMotionBlurScreenShot calls exactly the same code as takeCustomScreenShot: no motion blur processing is visible in it.
- File formats come from the settings 'screenshotFormat' (png by default, jpg/jpeg possible). doScreenshot can receive a forced path and extension.
- The functions screenshotProgress, screenshotTaken, screenshotSaved, screenshotUploaded and screenshotAllDone are called by the C++ engine; do not call them yourself.
- The phases of a job (phase field): 'queue' -> 'in progress' -> 'saving' -> 'done' or 'error'. result == 0 means success.
- The upload (publish) is refused if the onlineFeatures setting is not 'enable'. doSteamScreenshot also requires onlineFeatures, but takes a photo then calls OnlineServiceProvider.triggerScreenshot().
- The module also writes a sidecar file or metadata embedded in the image (writeScreenshotEmbeddedMetadata) with level, vehicles, share link, used by getPhotomodeRollEntries.
- Dynamically created fields: hqActive, cloudHqActive, sc_detailAdjustSaved, sc_lodScaleSaved, sc_GroundCoverScaleSaved, sc_cloudDownsampleSaved, sc_cloudStepCountSaved, sc_cloudSunShadowStepCountSaved (state saved during a high-quality capture).

## Functions

| Function | Description | Line |
|---|---|---|
| `screenshot.clearScreenshotJobs()` | Forgets all capture jobs (lists, metadata, pending uploads), resets hqActive to false and notifies the UI. | 1131 |
| `screenshot.createScreenshotTracked(p)` | Creates a capture in the engine (createScreenshot2) from a copy of the parameters table and registers the job for tracking (filename, bufferType, type, metadata, upload). Sets captureInProgress. | 114 |
| `screenshot.doScreenshot(batchTag, upload, path, ext, options)` | Takes a simple capture (scale 1, a single tile) with a unique file name 'screenshot_<date>[_n]'. If path and ext are provided, uses this path and ignores upload and batchTag. Attaches the metadata if requested or if upload. | 512 |
| `screenshot.doSteamScreenshot(options)` | Takes a capture then asks the online service provider (Steam) to trigger its capture. Refused if onlineFeatures is not 'enable'. | 585 |
| `screenshot.getPhotomodeRollEntries(limit)` | Lists the latest main photo mode captures (files 'screenshot_YYYYMMDD_HHMMSS', excluding _scene/_vehicle/_normal/_depth), most recent first, with share link and metadata read from the sidecar file or the embedded metadata. | 715 |
| `screenshot.getPhotomodeRollEntriesJson(limit)` | Same result as getPhotomodeRollEntries but encoded as a JSON string, for the UI (tables do not always pass well to Angular/CEF). | 764 |
| `screenshot.getScreenshotCompletion(id)` | Returns the final state of a capture job, only if it is finished ('done') or in error ('error'). | 1068 |
| `screenshot.getScreenshotJobsSnapshotJson()` | Snapshot of the running jobs as JSON: id, runId, percent, message, phase, result, filename, bufferType, type, metadata, openMap. | 768 |
| `screenshot.isDebugTracingEnabled()` | Indicates whether the module's '[Trace]' trace logs are enabled. | 1360 |
| `screenshot.openScreenshotFileInExplorer(filePath)` | Opens the system file explorer on a capture. Does nothing (with a warning) if the file does not exist or if the path is empty. | 605 |
| `screenshot.openScreenshotsFolderInExplorer()` | Creates the screenshots/<month> folder if needed and opens it in the file explorer. | 595 |
| `screenshot.publish(batchTag, options)` | Takes a capture and sends it to the BeamNG media server. Refused with an error toast if onlineFeatures is not 'enable'. | 576 |
| `screenshot.runPhotomodeFlashCapture(kind, ...)` | Single entry point for the old photo mode UI callbacks: loads the util/photomodeFlash extension and calls util_photomodeFlash.runCapture(kind, ...). | 1341 |
| `screenshot.screenshotAllDone()` | Called by the engine when all the jobs of a series are finished: restores the original graphics and cloud settings, releases the reserved file names, resets captureInProgress to false, emits the onScreenshotAllDone hook and the UI event ScreenshotJobsAllDone. *(internal)* | 1161 |
| `screenshot.screenshotProgress(id, percent, message)` | Called by the engine: updates the percentage and message of a job ('in progress' phase) and notifies the UI. *(internal)* | 1142 |
| `screenshot.screenshotSaved(id, res, filename)` | Called by the engine when the image is written to disk. res == 0: success ('done' phase, 100%, writing of the metadata sidecar file if planned); otherwise 'error' phase. *(internal)* | 1016 |
| `screenshot.screenshotTaken(id)` | Called by the engine when the image is captured on the GPU side but not yet written: puts the job in the 'saving' phase. *(internal)* | 1120 |
| `screenshot.screenshotUploaded(id, result, _adminUrl, shareUrl)` | Called by the engine at the end of an upload: writes the share link into the sidecar file, notifies the UI (ScreenshotUploadComplete) and displays a success or failure toast (result == 0 = success). *(internal)* | 1079 |
| `screenshot.setDebugTracingEnabled(value)` | Enables or disables the module's trace logs. | 1359 |
| `screenshot.takeBigScreenShot(a, b, c, d)` | "Big" capture: supersampling 4 (2x linear, 4x pixels). A 1080p screen gives a 4K image. Ignored if a capture is already in progress. | 1270 |
| `screenshot.takeCustomScreenShot(superSampling, rescaleFactor, a, b, c, d)` | Capture with chosen supersampling and scaling (limited to 24 and to the GPU budget). Above 9 the risk of a driver freeze is real. | 1308 |
| `screenshot.takeHugeScreenShot(a, b, c, d)` | "Huge" capture: supersampling 9 (3x linear, 9x pixels), with maximum graphics settings. 1080p gives about 6K, 4K gives about 12K. Ignored if a capture is already in progress. | 1289 |
| `screenshot.takeMotionBlurScreenShot(superSampling, rescaleFactor, a, b, c, d)` | Same behavior as takeCustomScreenShot (same internal call): see the notes on the absence of specific motion blur processing. | 1324 |
| `screenshot.takeScreenShot(a, b, c, d)` | "Normal" capture at native resolution (1080p gives a 1080p image). Can additionally save separate scene/vehicle images and normals/depth. | 1247 |

### Parameter details

#### `screenshot.createScreenshotTracked(p)`

Creates a capture in the engine (createScreenshot2) from a copy of the parameters table and registers the job for tracking (filename, bufferType, type, metadata, upload). Sets captureInProgress.

- `p` (*table*) : Capture parameters: filename, writeJPG, superSampling, tiles, overlap, rescaleFactor, upload, jsonMetaData (JSON string), persistMetadataSidecar, bufferType ('color', 'depth'…), jobType, object masks (objectTypeWhitelistMask…), etc.
- **returns**: integer|nil Job id returned by the engine (nil or 0 if creation fails).

#### `screenshot.doScreenshot(batchTag, upload, path, ext, options)`

Takes a simple capture (scale 1, a single tile) with a unique file name 'screenshot_<date>[_n]'. If path and ext are provided, uses this path and ignores upload and batchTag. Attaches the metadata if requested or if upload.

- `batchTag` (*string|nil*) : Batch tag (ignored if path/ext are provided; not used afterwards in the code read).
- `upload` (*boolean|nil*) : true to send the capture to the media server.
- `path` (*string|nil*) : Output path without extension.
- `ext` (*string|nil*) : Extension/format ('png' or 'jpg'), to be provided with path.
- `options` (*table|nil*) : jsonMetaData, includeMetadata, persistMetadataSidecar, callOrigin…

#### `screenshot.doSteamScreenshot(options)`

Takes a capture then asks the online service provider (Steam) to trigger its capture. Refused if onlineFeatures is not 'enable'.

- `options` (*table|nil*) : Options; options.upload == true also sends the capture.

#### `screenshot.getPhotomodeRollEntries(limit)`

Lists the latest main photo mode captures (files 'screenshot_YYYYMMDD_HHMMSS', excluding _scene/_vehicle/_normal/_depth), most recent first, with share link and metadata read from the sidecar file or the embedded metadata.

- `limit` (*integer|nil*) : Maximum number of entries (10 by default). A value <= 0 searches recursively in all screenshots folders with no limit.
- **returns**: table[] List of {gamePath = string, shareUrl = string|nil, metadata = table|nil, openMap = table|nil}.

#### `screenshot.getPhotomodeRollEntriesJson(limit)`

Same result as getPhotomodeRollEntries but encoded as a JSON string, for the UI (tables do not always pass well to Angular/CEF).

- `limit` (*integer|nil*) : See getPhotomodeRollEntries.
- **returns**: string JSON of the entries array.

#### `screenshot.getScreenshotCompletion(id)`

Returns the final state of a capture job, only if it is finished ('done') or in error ('error').

- `id` (*integer*) : Job id.
- **returns**: table|nil {id, result, filename, phase}, or nil if the job is unknown or not finished.

#### `screenshot.getScreenshotJobsSnapshotJson()`

Snapshot of the running jobs as JSON: id, runId, percent, message, phase, result, filename, bufferType, type, metadata, openMap.

- **returns**: string JSON of the jobs array.

#### `screenshot.isDebugTracingEnabled()`

Indicates whether the module's '[Trace]' trace logs are enabled.

- **returns**: boolean true if enabled.

#### `screenshot.openScreenshotFileInExplorer(filePath)`

Opens the system file explorer on a capture. Does nothing (with a warning) if the file does not exist or if the path is empty.

- `filePath` (*string*) : File path.

#### `screenshot.publish(batchTag, options)`

Takes a capture and sends it to the BeamNG media server. Refused with an error toast if onlineFeatures is not 'enable'.

- `batchTag` (*string|nil*) : Batch tag (passed to doScreenshot).
- `options` (*table|nil*) : Capture options (see doScreenshot).

#### `screenshot.runPhotomodeFlashCapture(kind, ...)`

Single entry point for the old photo mode UI callbacks: loads the util/photomodeFlash extension and calls util_photomodeFlash.runCapture(kind, ...).

- `kind` (*string*) : Capture type requested from the extension (values defined in util/photomodeFlash).
- `...` (*any*) : Arguments passed to runCapture.

#### `screenshot.screenshotProgress(id, percent, message)`

Called by the engine: updates the percentage and message of a job ('in progress' phase) and notifies the UI.

- `id` (*integer*) : Job id.
- `percent` (*number*) : Progress in %.
- `message` (*string*) : Step message.

#### `screenshot.screenshotSaved(id, res, filename)`

Called by the engine when the image is written to disk. res == 0: success ('done' phase, 100%, writing of the metadata sidecar file if planned); otherwise 'error' phase.

- `id` (*integer*) : Job id.
- `res` (*integer*) : Result code, 0 = success.
- `filename` (*string*) : Path of the written file.

#### `screenshot.screenshotTaken(id)`

Called by the engine when the image is captured on the GPU side but not yet written: puts the job in the 'saving' phase.

- `id` (*integer*) : Job id.

#### `screenshot.screenshotUploaded(id, result, _adminUrl, shareUrl)`

Called by the engine at the end of an upload: writes the share link into the sidecar file, notifies the UI (ScreenshotUploadComplete) and displays a success or failure toast (result == 0 = success).

- `id` (*integer|string*) : Job id (converted to a number).
- `result` (*integer|string*) : Result code, 0 = success (1 by default if invalid).
- `_adminUrl` (*string*) : Admin URL (unused).
- `shareUrl` (*string*) : Public share URL.

#### `screenshot.setDebugTracingEnabled(value)`

Enables or disables the module's trace logs.

- `value` (*boolean*) : true to enable (any other value disables).

#### `screenshot.takeBigScreenShot(a, b, c, d)`

"Big" capture: supersampling 4 (2x linear, 4x pixels). A 1080p screen gives a 4K image. Ignored if a capture is already in progress.

- `a` (*boolean|table|nil*) : splitSceneVehicle (also save scene and vehicle separately), or an options table.
- `b` (*boolean|nil*) : saveNormalDepth (also save normals and depth).
- `c` (*boolean|table|nil*) : Options table, or splitSceneVehicle if a is a table.
- `d` (*boolean|table|nil*) : Options table, or saveNormalDepth if a is a table.

#### `screenshot.takeCustomScreenShot(superSampling, rescaleFactor, a, b, c, d)`

Capture with chosen supersampling and scaling (limited to 24 and to the GPU budget). Above 9 the risk of a driver freeze is real.

- `superSampling` (*number*) : Total pixel multiplier (1 native, 4 = 2x linear, 9 = 3x linear).
- `rescaleFactor` (*number|nil*) : Final resize factor (1 if invalid or <= 0).
- `a` (*boolean|table|nil*) : splitSceneVehicle or options table.
- `b` (*boolean|nil*) : saveNormalDepth.
- `c` (*boolean|table|nil*) : Options table, or splitSceneVehicle if a is a table.
- `d` (*boolean|table|nil*) : Options table, or saveNormalDepth if a is a table.

#### `screenshot.takeHugeScreenShot(a, b, c, d)`

"Huge" capture: supersampling 9 (3x linear, 9x pixels), with maximum graphics settings. 1080p gives about 6K, 4K gives about 12K. Ignored if a capture is already in progress.

- `a` (*boolean|table|nil*) : splitSceneVehicle or options table.
- `b` (*boolean|nil*) : saveNormalDepth.
- `c` (*boolean|table|nil*) : Options table, or splitSceneVehicle if a is a table.
- `d` (*boolean|table|nil*) : Options table, or saveNormalDepth if a is a table.

#### `screenshot.takeMotionBlurScreenShot(superSampling, rescaleFactor, a, b, c, d)`

Same behavior as takeCustomScreenShot (same internal call): see the notes on the absence of specific motion blur processing.

- `superSampling` (*number*) : Total pixel multiplier (limited to 24 and to the GPU budget).
- `rescaleFactor` (*number|nil*) : Final resize factor.
- `a` (*boolean|table|nil*) : splitSceneVehicle or options table.
- `b` (*boolean|nil*) : saveNormalDepth.
- `c` (*boolean|table|nil*) : Options table, or splitSceneVehicle.
- `d` (*boolean|table|nil*) : Options table, or saveNormalDepth.

#### `screenshot.takeScreenShot(a, b, c, d)`

"Normal" capture at native resolution (1080p gives a 1080p image). Can additionally save separate scene/vehicle images and normals/depth.

- `a` (*boolean|table|nil*) : splitSceneVehicle (true to save scene and vehicle separately) or options table.
- `b` (*boolean|nil*) : saveNormalDepth (true to save normals and depth).
- `c` (*boolean|table|nil*) : Options table, or splitSceneVehicle if a is a table.
- `d` (*boolean|table|nil*) : Options table, or saveNormalDepth if a is a table.

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onCollectScreenshotMetadata` — listened to by 2 module(s)
- `onScreenshotAllDone` — listened to by 3 module(s)

**UI events (guihooks.trigger):** `ScreenshotJobsAllDone`, `ScreenshotJobsUpdate`, `ScreenshotUploadComplete`, `toastrMsg`

## Calls into the engine (C++)

- `FS:` `directoryCreate`, `directoryExists`, `directoryList`, `expandFilename`, `fileExists`, `findFiles`
- `core_environment.` `getTimeOfDay`

**Loads extensions:** `util/photomodeFlash`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/screenshot.lua`.*
