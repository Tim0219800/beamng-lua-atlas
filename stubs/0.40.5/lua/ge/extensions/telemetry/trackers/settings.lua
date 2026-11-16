---@meta
-- tim19Atlas stub generated from lua/ge/extensions/telemetry/trackers/settings.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Settings telemetry tracker: records the game's declared settings (settings.impl.defaults) with their current value and default value, to read framerate and crashes alongside what the player asked for. Local addresses, paths and user-created lists/presets are excluded. A change is reported at the next startup; an unchanged set is resent every surveyIntervalHours (7 days by default).
--- Access: extension `telemetry_trackers_settings`: `extensions.load("telemetry_trackers_settings")`, then the global `telemetry_trackers_settings`
---@class telemetry_trackers_settings
---@field dependencies string[] telemetry_core.
telemetry_trackers_settings = {}

--- Hook called on load: switches to manual unload, collects the settings and sends the survey if it is due or if the settings have changed.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/trackers/settings.lua:94
function telemetry_trackers_settings.onExtensionLoaded() end

