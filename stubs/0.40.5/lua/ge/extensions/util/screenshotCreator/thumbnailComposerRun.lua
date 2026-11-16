---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/screenshotCreator/thumbnailComposerRun.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Execution engine of the "Thumbnail Composer" (v2): orchestrates a series of vehicle thumbnail captures for a calling UI (identified by ownerId) that receives events via a table of handlers. It validates the targets (thumbnailTargets), optionally filters out those that already have a thumbnail (missingOnly), takes control of the physics, applies reference graphics settings for the duration of the job (Ultra quality, SMAA, no motion blur, no occupants…), then processes each item in a coroutine (thumbnailCapturePipeline.processWorkItem). It also handles a camera preview, a depth-of-field background blur tuned to the showroom's back wall, a forced exposure, and the "Showroom Tools" ImGui panel (drawShowroomTools) of the showroom_thumbnails flowgraph.
--- Access: extension `util_screenshotCreator_thumbnailComposerRun`: `extensions.load("util_screenshotCreator_thumbnailComposerRun")`, then the global `util_screenshotCreator_thumbnailComposerRun`
---@class util_screenshotCreator_thumbnailComposerRun
---@field dependencies string[] Extensions loaded before: ui_imgui and util_screenshotCreator_settings, lightingSetup, thumbnailCapturePipeline, thumbnailConfig, thumbnailPaths, thumbnailTargets.
---@field onClientEndMission function Alias of onExtensionUnloaded: cleans up at the end of the level.
---@field onExit function Alias of onExtensionUnloaded: cleans up when the game closes.
util_screenshotCreator_thumbnailComposerRun = {}

--- Cancels the current job (emits Failed with cancelled = true). If ownerId is given, it must match the job's caller.
---Source: lua/ge/extensions/util/screenshotCreator/thumbnailComposerRun.lua:385
---@param ownerId string|nil Caller identifier.
---@return boolean  true if a job was canceled.
function util_screenshotCreator_thumbnailComposerRun.cancel(ownerId) end

--- Draws in the flowgraph's ImGui window the thumbnail tools panel: blur and exposure options, resolution, vehicle selection grid, "Capture current config", "Capture all configs" and "Capture missing thumbnails" buttons, progress bar and Cancel button.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/screenshotCreator/thumbnailComposerRun.lua:542
function util_screenshotCreator_thumbnailComposerRun.drawShowroomTools() end

--- Indicates whether a job is in progress (for this ownerId if specified).
---Source: lua/ge/extensions/util/screenshotCreator/thumbnailComposerRun.lua:392
---@param ownerId string|nil Caller identifier.
---@return boolean  true if active.
function util_screenshotCreator_thumbnailComposerRun.isActive(ownerId) end

--- Unload hook: stops the job, restores the exposure, the blur, the graphics settings, the environment and the physics.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/screenshotCreator/thumbnailComposerRun.lua:415
function util_screenshotCreator_thumbnailComposerRun.onExtensionUnloaded() end

--- Hook called every frame before rendering: advances the work coroutine (an error makes it fail) and updates the DOF blur and the forced exposure during a preview or a job.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/screenshotCreator/thumbnailComposerRun.lua:397
function util_screenshotCreator_thumbnailComposerRun.onPreRender() end

--- Emits the Status event: {active, runId, currentModel, currentConfig, currentFlipped} (currentFlipped = 180° thumbnail rotation).
---Source: lua/ge/extensions/util/screenshotCreator/thumbnailComposerRun.lua:311
---@param ownerId string Caller identifier.
---@param handlers table Handlers with emit.
function util_screenshotCreator_thumbnailComposerRun.sendStatus(ownerId, handlers) end

--- Sets the view options (background blur, blur start distance, forced exposure) from a message.
---Source: lua/ge/extensions/util/screenshotCreator/thumbnailComposerRun.lua:85
---@param message table {backgroundBlur, blurStartDistance, forceExposure, exposureEV}.
function util_screenshotCreator_thumbnailComposerRun.setViewOptions(message) end

--- Starts a capture job for the caller ownerId. Resolves the targets, applies the capture settings and starts the work coroutine. Returns false (and emits "Failed") on refusal.
---Source: lua/ge/extensions/util/screenshotCreator/thumbnailComposerRun.lua:335
---@param ownerId string Caller identifier (converted to a string).
---@param message table Options: targets, captureMode, missingOnly, outputWidth, outputHeight, backgroundBlur, blurStartDistance, forceExposure, exposureEV.
---@param handlers table {emit = function(ownerId, name, data)} that receives the events.
---@return boolean  true if the job started.
function util_screenshotCreator_thumbnailComposerRun.start(ownerId, message, handlers) end

--- Preview: places the player's free camera on the framing computed for the player vehicle (the pipeline's legacy framing) and adjusts the lighting. Does nothing if there is no vehicle or if a job is active.
---Source: lua/ge/extensions/util/screenshotCreator/thumbnailComposerRun.lua:159
---@param message table View options and outputWidth/outputHeight.
function util_screenshotCreator_thumbnailComposerRun.startPreview(message) end

--- Ends the preview: restores the stored camera state and the lighting.
---Source: lua/ge/extensions/util/screenshotCreator/thumbnailComposerRun.lua:152
function util_screenshotCreator_thumbnailComposerRun.stopPreview() end

--- Registers a caller: emits Status then Catalog {models = vehicle catalog, resolutions = resolution presets}.
---Source: lua/ge/extensions/util/screenshotCreator/thumbnailComposerRun.lua:324
---@param ownerId string Caller identifier.
---@param handlers table Handlers with emit.
function util_screenshotCreator_thumbnailComposerRun.subscribe(ownerId, handlers) end

