---@meta
-- tim19Atlas stub generated from lua/ge/extensions/telemetry/trackers/traffic.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Traffic telemetry tracker. It answers the question "how much traffic is actually used": it opens the `trafficActive` activity when traffic starts and closes it when it stops, attaching the peak of active vehicles. Depends on `telemetry_core` and is only used for statistics collection, not for gameplay.
--- Access: extension `telemetry_trackers_traffic`: `extensions.load("telemetry_trackers_traffic")`, then the global `telemetry_trackers_traffic`
---@class telemetry_trackers_traffic
---@field dependencies table<integer, string> Extensions to load before this one: `{'telemetry_core'}`.
telemetry_trackers_traffic = {}

--- Hook called at the end of the mission/level on the client side. Closes the traffic activity if it is open (same code as onTrafficStopped).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/trackers/traffic.lua:46
function telemetry_trackers_traffic.onClientEndMission() end

--- Hook called when the game exits. Alias of onClientEndMission: closes the traffic activity.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/trackers/traffic.lua:46
function telemetry_trackers_traffic.onExit() end

--- Hook called when the extension loads. Sets the extension to manual unload.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/trackers/traffic.lua:50
function telemetry_trackers_traffic.onExtensionLoaded() end

--- Hook called when the extension is unloaded (for example on a Lua reload, which does not go through onExit). Closes the traffic activity.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/trackers/traffic.lua:46
function telemetry_trackers_traffic.onExtensionUnloaded() end

--- Hook called whenever vehicles enter or leave the traffic pool. Keeps only the maximum, without creating an event.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/trackers/traffic.lua:39
---@param activeAmount integer Number of active traffic vehicles.
function telemetry_trackers_traffic.onTrafficAmountChanged(activeAmount) end

--- Hook called when traffic starts. Resets the peak to 0 and opens the `trafficActive` activity with the current level (`getCurrentLevelIdentifier()` or "unknown").
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/trackers/traffic.lua:22
function telemetry_trackers_traffic.onTrafficStarted() end

--- Hook called when traffic stops. Does nothing if traffic was not running; otherwise closes the `trafficActive` activity with `peakAmount`.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/trackers/traffic.lua:31
function telemetry_trackers_traffic.onTrafficStopped() end

