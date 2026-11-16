---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/screenshotCreator/job.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Orchestrator of the vehicle thumbnail creator. It runs, in a coroutine driven by onPreRender, the complete loop: replace/place the vehicle, let it settle, freeze the physics, compute the camera (framing via framingManager or saved camera), adjust the lighting, wait 2 s, capture the image with util_screenshotCreator_capture, check the produced file then restore the environment and the physics. It also handles the camera preview (startPreview) and exposes progress and the report for the UI. A modder uses it to batch-generate the vehicles/<model>/<config>.jpg images.
--- Access: extension `util_screenshotCreator_job`: `extensions.load("util_screenshotCreator_job")`, then the global `util_screenshotCreator_job`
---@class util_screenshotCreator_job
---@field dependencies string[] Extensions loaded before: core_camera, core_vehicles, core_vehicle_manager, ui_vehicleSelector_general and several util_screenshotCreator_* (settings, thumbnailConfig, vehicleSetup, capture, lightingSetup, framing_configured, framingManager, modelSelection, shippedConfigs).
util_screenshotCreator_job = {}

--- Resets the "job done" flag to false without reading it.
---Source: lua/ge/extensions/util/screenshotCreator/job.lua:810
function util_screenshotCreator_job.clearRunDone() end

--- Reads then resets the "job done" flag to false.
---Source: lua/ge/extensions/util/screenshotCreator/job.lua:804
---@return boolean  true only once after a job ends (or a startup failure for lack of a vehicle).
function util_screenshotCreator_job.consumeRunDone() end

--- Returns the job progress.
---Source: lua/ge/extensions/util/screenshotCreator/job.lua:846
---@return table  {completed = integer, total = integer, current = string "model/config"}.
function util_screenshotCreator_job.getProgress() end

--- Returns the report of the last job.
---Source: lua/ge/extensions/util/screenshotCreator/job.lua:847
---@return table|nil  {onlyMissingThumbnails, shippedConfigsOnly, lowBeamsEnabled, selection, framingModeId, cameraOverridePolicy, sampleOutputFolder, configs = [{vehName, camName, status (done/failed/skipped), thumbnailPath}]}; nil before any job.
function util_screenshotCreator_job.getReviewData() end

--- Indicates whether a preview moved the camera (cameraSet).
---Source: lua/ge/extensions/util/screenshotCreator/job.lua:851
---@return boolean  true as long as resetCamera has not been called.
function util_screenshotCreator_job.isCameraSet() end

--- Indicates whether a work coroutine exists.
---Source: lua/ge/extensions/util/screenshotCreator/job.lua:845
---@return boolean  true during a job or a preview.
function util_screenshotCreator_job.isRunning() end

--- Hook called at the end of the mission/level; same function as onExtensionUnloaded.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/screenshotCreator/job.lua:833
function util_screenshotCreator_job.onClientEndMission() end

--- Hook called after reload with the serialized state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/screenshotCreator/job.lua:824
---@param data table State returned by onSerialize.
function util_screenshotCreator_job.onDeserialized(data) end

--- Hook called when the game closes; same function as onExtensionUnloaded.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/screenshotCreator/job.lua:833
function util_screenshotCreator_job.onExit() end

--- Hook called when the extension is unloaded: stops the job, restores the lighting, the settings and the physics state. Also used as onClientEndMission and onExit.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/screenshotCreator/job.lua:833
function util_screenshotCreator_job.onExtensionUnloaded() end

--- Hook called every frame before rendering: advances the work coroutine. On a Lua error, the trace is logged and the job is abandoned; at the end, the lighting and the physics are restored.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/screenshotCreator/job.lua:785
function util_screenshotCreator_job.onPreRender() end

--- Hook called before an extension reload: returns progress, review, runDone, previousFov and cameraSet. The coroutine is not saved.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/screenshotCreator/job.lua:814
---@return table  State to restore.
function util_screenshotCreator_job.onSerialize() end

--- Returns the player's camera to "orbit" mode and restores the FOV saved before the preview (60 by default).
---Source: lua/ge/extensions/util/screenshotCreator/job.lua:117
function util_screenshotCreator_job.resetCamera() end

--- Places the vehicle as for a thumbnail, waits for it to settle then positions the player's free camera on the computed framing, without capturing an image. Returns false if a job is running or if vehicle is nil.
---Source: lua/ge/extensions/util/screenshotCreator/job.lua:765
---@param vehicle table Vehicle object.
---@param configName string Configuration name.
---@param modeOrOptions string|table|nil Framing mode id, or options table {framingModeId, fixedRotation, delayedPreview}.
---@param fixedRotation quat|nil Imposed camera rotation (ignored if modeOrOptions is a table).
---@return boolean  true if the preview started.
function util_screenshotCreator_job.startPreview(vehicle, configName, modeOrOptions, fixedRotation) end

--- Like startPreview, but for vehicles whose thumbnailConfig.getPauseDelay is > 0: the physics runs during this delay before freezing. Returns false if the model is unknown or if the delay is zero.
---Source: lua/ge/extensions/util/screenshotCreator/job.lua:769
---@param vehicle table Vehicle object.
---@param configName string Configuration name.
---@param modeOrOptions string|table|nil Framing mode id or options table.
---@param fixedRotation quat|nil Imposed camera rotation.
---@return boolean  true if the preview started.
function util_screenshotCreator_job.startPreviewWithDelay(vehicle, configName, modeOrOptions, fixedRotation) end

--- Starts thumbnail generation. Normalizes the options, builds the list of items (selected models, explicit targets or the current vehicle), takes control of the physics, enables the environment settings (settings.beginWork) and creates the work coroutine. Returns false if a job is already in progress, if the targets are invalid or if the physics API is missing.
---Source: lua/ge/extensions/util/screenshotCreator/job.lua:654
---@param workOptions table|nil Job options (see notes). If it is not a table: selection = "selectedModels", onlyMissingThumbnails = false.
---@return boolean  true if the job started.
function util_screenshotCreator_job.startWork(workOptions) end

--- Requests the current job to stop (forceQuit); the coroutine stops at its next checkpoint.
---Source: lua/ge/extensions/util/screenshotCreator/job.lua:779
---@return boolean  false if there is no job in progress, otherwise true.
function util_screenshotCreator_job.stop() end

