---@meta
-- tim19Atlas stub generated from lua/ge/extensions/telemetry/trackers/traffic.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `telemetry_trackers_traffic` : `extensions.load("telemetry_trackers_traffic")`, puis la globale `telemetry_trackers_traffic`
---@class telemetry_trackers_traffic
---@field dependencies table
telemetry_trackers_traffic = {}

--- traffic does not always stop cleanly on a level change, so close the activity here
---Source : lua/ge/extensions/telemetry/trackers/traffic.lua:46
function telemetry_trackers_traffic.onClientEndMission() end

--- traffic does not always stop cleanly on a level change, so close the activity here
---Source : lua/ge/extensions/telemetry/trackers/traffic.lua:46
function telemetry_trackers_traffic.onExit() end

---Source : lua/ge/extensions/telemetry/trackers/traffic.lua:50
function telemetry_trackers_traffic.onExtensionLoaded() end

--- traffic does not always stop cleanly on a level change, so close the activity here
---Source : lua/ge/extensions/telemetry/trackers/traffic.lua:46
function telemetry_trackers_traffic.onExtensionUnloaded() end

--- Fires whenever vehicles are pooled in or out. Only the peak is kept, no event.
---Source : lua/ge/extensions/telemetry/trackers/traffic.lua:39
---@param activeAmount any
function telemetry_trackers_traffic.onTrafficAmountChanged(activeAmount) end

---Source : lua/ge/extensions/telemetry/trackers/traffic.lua:22
function telemetry_trackers_traffic.onTrafficStarted() end

---Source : lua/ge/extensions/telemetry/trackers/traffic.lua:31
function telemetry_trackers_traffic.onTrafficStopped() end

