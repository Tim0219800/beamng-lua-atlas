---@meta
-- tim19Atlas stub generated from lua/ge/screenshot.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Screenshot capture on the Game Engine side. It prepares the file name (folder screenshots/<month>/screenshot_<date>), the quality options (supersampling, scaling), the metadata (level, vehicles, sharing), and launches the capture via the engine (createScreenshot2). It tracks each capture as a "job" (queued, in progress, saving, done, error) and notifies the UI. It also handles the upload to the BeamNG media server, the list of the latest photo mode photos and the restoring of the graphics settings after a high-quality capture.
--- Access: global `screenshot`
---@class screenshot
screenshot = {}

--- Forgets all capture jobs (lists, metadata, pending uploads), resets hqActive to false and notifies the UI.
---Source: lua/ge/screenshot.lua:1131
function screenshot.clearScreenshotJobs() end

--- Creates a capture in the engine (createScreenshot2) from a copy of the parameters table and registers the job for tracking (filename, bufferType, type, metadata, upload). Sets captureInProgress.
---Source: lua/ge/screenshot.lua:114
---@param p table Capture parameters: filename, writeJPG, superSampling, tiles, overlap, rescaleFactor, upload, jsonMetaData (JSON string), persistMetadataSidecar, bufferType ('color', 'depth'…), jobType, object masks (objectTypeWhitelistMask…), etc.
---@return integer|nil  Job id returned by the engine (nil or 0 if creation fails).
function screenshot.createScreenshotTracked(p) end

--- Takes a simple capture (scale 1, a single tile) with a unique file name 'screenshot_<date>[_n]'. If path and ext are provided, uses this path and ignores upload and batchTag. Attaches the metadata if requested or if upload.
---Source: lua/ge/screenshot.lua:512
---@param batchTag string|nil Batch tag (ignored if path/ext are provided; not used afterwards in the code read).
---@param upload boolean|nil true to send the capture to the media server.
---@param path string|nil Output path without extension.
---@param ext string|nil Extension/format ('png' or 'jpg'), to be provided with path.
---@param options table|nil jsonMetaData, includeMetadata, persistMetadataSidecar, callOrigin…
function screenshot.doScreenshot(batchTag, upload, path, ext, options) end

--- Takes a capture then asks the online service provider (Steam) to trigger its capture. Refused if onlineFeatures is not 'enable'.
---Source: lua/ge/screenshot.lua:585
---@param options table|nil Options; options.upload == true also sends the capture.
function screenshot.doSteamScreenshot(options) end

--- Lists the latest main photo mode captures (files 'screenshot_YYYYMMDD_HHMMSS', excluding _scene/_vehicle/_normal/_depth), most recent first, with share link and metadata read from the sidecar file or the embedded metadata.
---Source: lua/ge/screenshot.lua:715
---@param limit integer|nil Maximum number of entries (10 by default). A value <= 0 searches recursively in all screenshots folders with no limit.
---@return table[]  List of {gamePath = string, shareUrl = string|nil, metadata = table|nil, openMap = table|nil}.
function screenshot.getPhotomodeRollEntries(limit) end

--- Same result as getPhotomodeRollEntries but encoded as a JSON string, for the UI (tables do not always pass well to Angular/CEF).
---Source: lua/ge/screenshot.lua:764
---@param limit integer|nil See getPhotomodeRollEntries.
---@return string  JSON of the entries array.
function screenshot.getPhotomodeRollEntriesJson(limit) end

--- Returns the final state of a capture job, only if it is finished ('done') or in error ('error').
---Source: lua/ge/screenshot.lua:1068
---@param id integer Job id.
---@return table|nil  {id, result, filename, phase}, or nil if the job is unknown or not finished.
function screenshot.getScreenshotCompletion(id) end

--- Snapshot of the running jobs as JSON: id, runId, percent, message, phase, result, filename, bufferType, type, metadata, openMap.
---Source: lua/ge/screenshot.lua:768
---@return string  JSON of the jobs array.
function screenshot.getScreenshotJobsSnapshotJson() end

--- Indicates whether the module's '[Trace]' trace logs are enabled.
---Source: lua/ge/screenshot.lua:1360
---@return boolean  true if enabled.
function screenshot.isDebugTracingEnabled() end

--- Opens the system file explorer on a capture. Does nothing (with a warning) if the file does not exist or if the path is empty.
---Source: lua/ge/screenshot.lua:605
---@param filePath string File path.
function screenshot.openScreenshotFileInExplorer(filePath) end

--- Creates the screenshots/<month> folder if needed and opens it in the file explorer.
---Source: lua/ge/screenshot.lua:595
function screenshot.openScreenshotsFolderInExplorer() end

--- Takes a capture and sends it to the BeamNG media server. Refused with an error toast if onlineFeatures is not 'enable'.
---Source: lua/ge/screenshot.lua:576
---@param batchTag string|nil Batch tag (passed to doScreenshot).
---@param options table|nil Capture options (see doScreenshot).
function screenshot.publish(batchTag, options) end

--- Single entry point for the old photo mode UI callbacks: loads the util/photomodeFlash extension and calls util_photomodeFlash.runCapture(kind, ...).
---Source: lua/ge/screenshot.lua:1341
---@param kind string Capture type requested from the extension (values defined in util/photomodeFlash).
---@param ... any Arguments passed to runCapture.
function screenshot.runPhotomodeFlashCapture(kind, ...) end

--- Called by the engine when all the jobs of a series are finished: restores the original graphics and cloud settings, releases the reserved file names, resets captureInProgress to false, emits the onScreenshotAllDone hook and the UI event ScreenshotJobsAllDone.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/screenshot.lua:1161
function screenshot.screenshotAllDone() end

--- Called by the engine: updates the percentage and message of a job ('in progress' phase) and notifies the UI.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/screenshot.lua:1142
---@param id integer Job id.
---@param percent number Progress in %.
---@param message string Step message.
function screenshot.screenshotProgress(id, percent, message) end

--- Called by the engine when the image is written to disk. res == 0: success ('done' phase, 100%, writing of the metadata sidecar file if planned); otherwise 'error' phase.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/screenshot.lua:1016
---@param id integer Job id.
---@param res integer Result code, 0 = success.
---@param filename string Path of the written file.
function screenshot.screenshotSaved(id, res, filename) end

--- Called by the engine when the image is captured on the GPU side but not yet written: puts the job in the 'saving' phase.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/screenshot.lua:1120
---@param id integer Job id.
function screenshot.screenshotTaken(id) end

--- Called by the engine at the end of an upload: writes the share link into the sidecar file, notifies the UI (ScreenshotUploadComplete) and displays a success or failure toast (result == 0 = success).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/screenshot.lua:1079
---@param id integer|string Job id (converted to a number).
---@param result integer|string Result code, 0 = success (1 by default if invalid).
---@param _adminUrl string Admin URL (unused).
---@param shareUrl string Public share URL.
function screenshot.screenshotUploaded(id, result, _adminUrl, shareUrl) end

--- Enables or disables the module's trace logs.
---Source: lua/ge/screenshot.lua:1359
---@param value boolean true to enable (any other value disables).
function screenshot.setDebugTracingEnabled(value) end

--- "Big" capture: supersampling 4 (2x linear, 4x pixels). A 1080p screen gives a 4K image. Ignored if a capture is already in progress.
---Source: lua/ge/screenshot.lua:1270
---@param a boolean|table|nil splitSceneVehicle (also save scene and vehicle separately), or an options table.
---@param b boolean|nil saveNormalDepth (also save normals and depth).
---@param c boolean|table|nil Options table, or splitSceneVehicle if a is a table.
---@param d boolean|table|nil Options table, or saveNormalDepth if a is a table.
function screenshot.takeBigScreenShot(a, b, c, d) end

--- Capture with chosen supersampling and scaling (limited to 24 and to the GPU budget). Above 9 the risk of a driver freeze is real.
---Source: lua/ge/screenshot.lua:1308
---@param superSampling number Total pixel multiplier (1 native, 4 = 2x linear, 9 = 3x linear).
---@param rescaleFactor number|nil Final resize factor (1 if invalid or <= 0).
---@param a boolean|table|nil splitSceneVehicle or options table.
---@param b boolean|nil saveNormalDepth.
---@param c boolean|table|nil Options table, or splitSceneVehicle if a is a table.
---@param d boolean|table|nil Options table, or saveNormalDepth if a is a table.
function screenshot.takeCustomScreenShot(superSampling, rescaleFactor, a, b, c, d) end

--- "Huge" capture: supersampling 9 (3x linear, 9x pixels), with maximum graphics settings. 1080p gives about 6K, 4K gives about 12K. Ignored if a capture is already in progress.
---Source: lua/ge/screenshot.lua:1289
---@param a boolean|table|nil splitSceneVehicle or options table.
---@param b boolean|nil saveNormalDepth.
---@param c boolean|table|nil Options table, or splitSceneVehicle if a is a table.
---@param d boolean|table|nil Options table, or saveNormalDepth if a is a table.
function screenshot.takeHugeScreenShot(a, b, c, d) end

--- Same behavior as takeCustomScreenShot (same internal call): see the notes on the absence of specific motion blur processing.
---Source: lua/ge/screenshot.lua:1324
---@param superSampling number Total pixel multiplier (limited to 24 and to the GPU budget).
---@param rescaleFactor number|nil Final resize factor.
---@param a boolean|table|nil splitSceneVehicle or options table.
---@param b boolean|nil saveNormalDepth.
---@param c boolean|table|nil Options table, or splitSceneVehicle.
---@param d boolean|table|nil Options table, or saveNormalDepth.
function screenshot.takeMotionBlurScreenShot(superSampling, rescaleFactor, a, b, c, d) end

--- "Normal" capture at native resolution (1080p gives a 1080p image). Can additionally save separate scene/vehicle images and normals/depth.
---Source: lua/ge/screenshot.lua:1247
---@param a boolean|table|nil splitSceneVehicle (true to save scene and vehicle separately) or options table.
---@param b boolean|nil saveNormalDepth (true to save normals and depth).
---@param c boolean|table|nil Options table, or splitSceneVehicle if a is a table.
---@param d boolean|table|nil Options table, or saveNormalDepth if a is a table.
function screenshot.takeScreenShot(a, b, c, d) end

