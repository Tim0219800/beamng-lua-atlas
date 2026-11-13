---@meta
-- tim19Atlas stub generated from lua/ge/extensions/telemetry/trackers/gameplay/other.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `telemetry_trackers_gameplay_other` : `extensions.load("telemetry_trackers_gameplay_other")`, puis la globale `telemetry_trackers_gameplay_other`
---@class telemetry_trackers_gameplay_other
---@field dependencies table
telemetry_trackers_gameplay_other = {}

---Source : lua/ge/extensions/telemetry/trackers/gameplay/other.lua:59
function telemetry_trackers_gameplay_other.onExit() end

---Source : lua/ge/extensions/telemetry/trackers/gameplay/other.lua:64
function telemetry_trackers_gameplay_other.onExtensionLoaded() end

--- a lua reload tears the trackers down without an onExit, so close the activities here too
---Source : lua/ge/extensions/telemetry/trackers/gameplay/other.lua:59
function telemetry_trackers_gameplay_other.onExtensionUnloaded() end

--- result: dispatched, noTaxiAvailable or tooFarFromRoad
---Source : lua/ge/extensions/telemetry/trackers/gameplay/other.lua:34
---@param result any
function telemetry_trackers_gameplay_other.onTaxiCalled(result) end

--- reason is exited or trafficStopped. phase is where the ride was when it ended, arriving
---  means the taxi had stopped for the player. Distances are in meters.
---Source : lua/ge/extensions/telemetry/trackers/gameplay/other.lua:53
---@param data any
function telemetry_trackers_gameplay_other.onTaxiRideEnded(data) end

--- called is false for a taxi hailed at the roadside
---Source : lua/ge/extensions/telemetry/trackers/gameplay/other.lua:42
---@param called any
function telemetry_trackers_gameplay_other.onTaxiRideStarted(called) end

--- The window funnels every open and close through one call, which also repeats the
---  current state, so the activity is paired off our own state instead.
---Source : lua/ge/extensions/telemetry/trackers/gameplay/other.lua:20
---@param open any
function telemetry_trackers_gameplay_other.onTrackBuilderWindowToggled(open) end

