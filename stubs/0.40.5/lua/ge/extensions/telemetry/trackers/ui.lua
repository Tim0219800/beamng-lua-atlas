---@meta
-- tim19Atlas stub generated from lua/ge/extensions/telemetry/trackers/ui.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- UI telemetry tracker. It tracks the screens (UI routes) the player opens and leaves: each screen is a `uiScreen` activity whose duration is the time spent on it, with the `from` field (origin screen) to reconstruct the path through the menus. Only route names are reported, never screen parameters. Depends on `telemetry_core`.
--- Access: extension `telemetry_trackers_ui`: `extensions.load("telemetry_trackers_ui")`, then the global `telemetry_trackers_ui`
---@class telemetry_trackers_ui
---@field dependencies table<integer, string> Extensions to load before this one: `{'telemetry_core'}`.
telemetry_trackers_ui = {}

--- Hook called by the UI router once a navigation is finished: the displayed screen is then `entry.request.name`. Closes the previous screen's activity then opens `uiScreen` with `screen` and `from` (`entry.origin.route`). Without a screen name, does nothing.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/trackers/ui.lua:56
---@param entry table Router navigation entry; fields read: `request.name` and `origin.route`.
function telemetry_trackers_ui.onAfterRouteChange(entry) end

--- Hook called when the game exits. Closes the open screen, otherwise the last one would have no duration.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/trackers/ui.lua:82
function telemetry_trackers_ui.onExit() end

--- Hook called when the extension loads. Sets the extension to manual unload.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/trackers/ui.lua:77
function telemetry_trackers_ui.onExtensionLoaded() end

--- Hook called when the extension is unloaded (a Lua reload does not go through onExit). Closes the open screen.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/trackers/ui.lua:32
function telemetry_trackers_ui.onExtensionUnloaded() end

--- Hook called by the router after it has validated the route, so just after the activity is opened. Remembers the timings if the route matches the current screen; they are sent on close.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/trackers/ui.lua:72
---@param routeName string Name of the route concerned.
---@param timings table Navigation timings; fields read: total, mountAcked, enter, ready.
function telemetry_trackers_ui.onRouteTiming(routeName, timings) end

