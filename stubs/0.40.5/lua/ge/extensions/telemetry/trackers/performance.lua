---@meta
-- tim19Atlas stub generated from lua/ge/extensions/telemetry/trackers/performance.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Performance telemetry tracker: reports players' framerate from what the engine already measures for the overlay cycled by Ctrl+F ($fps::avg, min, p99, cpuTime, gpuTime). One "performance" event per reading, with no averaging or judgment: the server decides which framerate is too low. The interval (sampleIntervalSeconds, 300 s by default, clamped between 5 and 3600) comes from the server config.
--- Access: extension `telemetry_trackers_performance`: `extensions.load("telemetry_trackers_performance")`, then the global `telemetry_trackers_performance`
---@class telemetry_trackers_performance
---@field dependencies string[] telemetry_core.
telemetry_trackers_performance = {}

--- Hook called on load: reads sampleIntervalSeconds from the "performance" module config and switches to manual unload.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/trackers/performance.lua:64
function telemetry_trackers_performance.onExtensionLoaded() end

--- Hook called every frame: a single clock call and one comparison; takes a reading when the interval has elapsed.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/trackers/performance.lua:56
---@param dtReal number Real time delta (s).
---@param dtSim number Simulated delta time (s); <= 0 marks the reading as paused.
---@param dtRaw number Raw time delta (s).
function telemetry_trackers_performance.onUpdate(dtReal, dtSim, dtRaw) end

