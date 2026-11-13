---@meta
-- tim19Atlas stub generated from lua/ge/extensions/telemetry/trackers/ui.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `telemetry_trackers_ui` : `extensions.load("telemetry_trackers_ui")`, puis la globale `telemetry_trackers_ui`
---@class telemetry_trackers_ui
---@field dependencies table
telemetry_trackers_ui = {}

--- The router fires this once a navigation completed, so this is the screen on display.
---  Using the modern hook here, not the legacy onUiChangedState compatibility hook.
---Source : lua/ge/extensions/telemetry/trackers/ui.lua:56
---@param entry any
function telemetry_trackers_ui.onAfterRouteChange(entry) end

--- close the open screen, otherwise the last one has no duration
---Source : lua/ge/extensions/telemetry/trackers/ui.lua:82
function telemetry_trackers_ui.onExit() end

---Source : lua/ge/extensions/telemetry/trackers/ui.lua:77
function telemetry_trackers_ui.onExtensionLoaded() end

--- a lua reload tears the trackers down without an onExit, so close the screen here too
---Source : lua/ge/extensions/telemetry/trackers/ui.lua:32
function telemetry_trackers_ui.onExtensionUnloaded() end

--- The router finishes a navigation after it committed the route, so this arrives just after
---  the activity above opened. A navigation that was cancelled or timed out never gets here,
---  and that screen is reported without a time.
---Source : lua/ge/extensions/telemetry/trackers/ui.lua:72
---@param routeName any
---@param timings any
function telemetry_trackers_ui.onRouteTiming(routeName, timings) end

