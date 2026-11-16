---@meta
-- tim19Atlas stub generated from lua/ge/extensions/telemetry/trackers/gameplay/other.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Telemetry tracker for small gameplay features that do not have their own tracker: the track builder (activity "trackBuilder") and the taxi (event "taxiCalled" and activity "taxiRide"). The duration of a session or a ride is carried by the activity.
--- Access: extension `telemetry_trackers_gameplay_other`: `extensions.load("telemetry_trackers_gameplay_other")`, then the global `telemetry_trackers_gameplay_other`
---@class telemetry_trackers_gameplay_other
---@field dependencies string[] telemetry_core.
telemetry_trackers_gameplay_other = {}

--- Hook called when the game closes: closes the open activities.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/trackers/gameplay/other.lua:59
function telemetry_trackers_gameplay_other.onExit() end

--- Hook called on load: manual unload.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/trackers/gameplay/other.lua:64
function telemetry_trackers_gameplay_other.onExtensionLoaded() end

--- Hook called on unload: a Lua reload destroys the trackers without onExit, so the activities are also closed here.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/trackers/gameplay/other.lua:59
function telemetry_trackers_gameplay_other.onExtensionUnloaded() end

--- Hook called when the player calls a taxi: emits taxiCalled with the result.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/trackers/gameplay/other.lua:34
---@param result string dispatched, noTaxiAvailable or tooFarFromRoad.
function telemetry_trackers_gameplay_other.onTaxiCalled(result) end

--- Hook called at the end of a ride: ends the taxiRide activity with the received data.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/trackers/gameplay/other.lua:53
---@param data table {reason, phase, distances...}
function telemetry_trackers_gameplay_other.onTaxiRideEnded(data) end

--- Hook called at the start of a ride: starts the taxiRide activity (called or not, career mode or not, level).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/trackers/gameplay/other.lua:42
---@param called boolean false for a taxi hailed at the roadside.
function telemetry_trackers_gameplay_other.onTaxiRideStarted(called) end

--- Hook called when the track builder window opens/closes: starts or ends the trackBuilder activity (with the current level).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/trackers/gameplay/other.lua:20
---@param open boolean true if the window is open.
function telemetry_trackers_gameplay_other.onTrackBuilderWindowToggled(open) end

