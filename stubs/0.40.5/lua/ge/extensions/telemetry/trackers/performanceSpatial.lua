---@meta
-- tim19Atlas stub generated from lua/ge/extensions/telemetry/trackers/performanceSpatial.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "Spatial" performance telemetry tracker: links framerate to where the player is. It polls the instantaneous FPS every 0.13 s (in a tracked level, world ready, window in the foreground, simulation not paused) and emits, according to the server config (performanceSpatial module): "performanceDip" (FPS drop detected by performanceSpatialDetector, with the snapshot of the worst moment), "performanceSpatial" (periodic position/performance samples and final exposure), "shaderGeneration" (newly generated shaders), "vehicleRecovery" (vehicle recoveries) and "gameplayActivityExit" (activity exit, via performanceSpatialGameplayExit). Each feature can be enabled separately.
--- Access: extension `telemetry_trackers_performanceSpatial`: `extensions.load("telemetry_trackers_performanceSpatial")`, then the global `telemetry_trackers_performanceSpatial`
---@class telemetry_trackers_performanceSpatial
---@field dependencies string[] telemetry_core and core_camera.
telemetry_trackers_performanceSpatial = {}

--- Hook called at the end of the level: closes the current context (last dip and final exposure).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/trackers/performanceSpatial.lua:316
function telemetry_trackers_performanceSpatial.onClientEndMission() end

--- Hook called when the game exits: closes the current context.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/trackers/performanceSpatial.lua:316
function telemetry_trackers_performanceSpatial.onExit() end

--- Hook called on load: reads the performanceSpatial module config, enables the requested features, prepares the detector and the active GPU, restores the state from a Lua reload.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/trackers/performanceSpatial.lua:246
---@param data table|nil onSerialize data from a previous reload (completedMissionId, eventCount, cooldownUntilMs).
---@return boolean|nil  false if no feature is enabled (the extension unloads itself).
function telemetry_trackers_performanceSpatial.onExtensionLoaded(data) end

--- Hook called on unload: closes the current context.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/trackers/performanceSpatial.lua:316
function telemetry_trackers_performanceSpatial.onExtensionUnloaded() end

--- Hook called before unload: for a Lua reload, closes the context and returns the state to restore.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/trackers/performanceSpatial.lua:305
---@param reason string Reason; only "reload" is handled.
---@return table|nil  {completedMissionId, eventCount, cooldownUntilMs}
function telemetry_trackers_performanceSpatial.onSerialize(reason) end

--- Hook called every frame: at each 0.13 s interval, reads the instantaneous FPS, detects drops, counts generated shaders and emits spatial samples.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/trackers/performanceSpatial.lua:178
---@param dtReal number Real time delta (s).
---@param dtSim number Simulated delta time (s); <= 0 closes the context.
function telemetry_trackers_performanceSpatial.onUpdate(dtReal, dtSim) end

--- Records a "vehicleRecovery" event (level and position of player 0's vehicle) if recovery tracking is enabled and the level is tracked.
---Source: lua/ge/extensions/telemetry/trackers/performanceSpatial.lua:101
function telemetry_trackers_performanceSpatial.trackVehReset() end

