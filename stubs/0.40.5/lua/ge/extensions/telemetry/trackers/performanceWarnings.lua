---@meta
-- tim19Atlas stub generated from lua/ge/extensions/telemetry/trackers/performanceWarnings.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Telemetry tracker for the hardware performance warnings shown to the player: each warning (category + message) is reported only once per session ("performanceHardwareWarning" event with category, message, severity, context and acknowledgment).
--- Access: extension `telemetry_trackers_performanceWarnings`: `extensions.load("telemetry_trackers_performanceWarnings")`, then the global `telemetry_trackers_performanceWarnings`
---@class telemetry_trackers_performanceWarnings
---@field dependencies string[] telemetry_core.
telemetry_trackers_performanceWarnings = {}

--- Hook called on load: manual unload.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/trackers/performanceWarnings.lua:27
function telemetry_trackers_performanceWarnings.onExtensionLoaded() end

--- Hook called when the game emits a hardware performance warning; deduplicates by category and message.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/trackers/performanceWarnings.lua:12
---@param category string Warning category.
---@param warning table {msg, type (severity), context, ack}
function telemetry_trackers_performanceWarnings.onPerformanceHardwareWarning(category, warning) end

