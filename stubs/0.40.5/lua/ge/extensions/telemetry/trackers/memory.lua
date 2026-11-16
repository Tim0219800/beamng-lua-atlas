---@meta
-- tim19Atlas stub generated from lua/ge/extensions/telemetry/trackers/memory.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Memory telemetry tracker: reports the machine's memory, the memory held by the game, and whether the OS has started paging to disk. It queries Engine.Platform.getMemoryInfo every 5 s. The "memoryPressure" event is only sent once per session, the first time low free memory and sustained paging are seen together. "memorySample" only exists if the server sets sampleIntervalSeconds (one-off survey).
--- Access: extension `telemetry_trackers_memory`: `extensions.load("telemetry_trackers_memory")`, then the global `telemetry_trackers_memory`
---@class telemetry_trackers_memory
---@field dependencies string[] telemetry_core.
telemetry_trackers_memory = {}

--- Hook called on load: resets the state, reads sampleIntervalSeconds from the config, registers the onUpdate hook and switches to manual unload.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/trackers/memory.lua:129
function telemetry_trackers_memory.onExtensionLoaded() end

--- Hook called every frame: accumulates real time and triggers a read every 5 s. Dynamically removed when the tracker is done.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/trackers/memory.lua:118
---@param dtReal number Real time delta (s).
---@param dtSim number Simulated time delta (s); <= 0 indicates pause.
function telemetry_trackers_memory.onUpdate(dtReal, dtSim) end

