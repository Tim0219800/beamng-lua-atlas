---@meta
-- tim19Atlas stub generated from lua/ge/extensions/telemetry/reporters/jsonFileReporter.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Telemetry sender: on load, a jobsystem task waits 5 s then sends to the server (core_online call s11/v2/telemetryReports) the /telemetry/sessions/*.jsonl session files written by telemetry_core, grouped in a single send. The send only happens if the oldest pending session is older than the configured interval (reportIntervalHours, 12 h by default, with random jitter of 1x to 2x). The current session's file is ignored.
--- Access: extension `telemetry_reporters_jsonFileReporter`: `extensions.load("telemetry_reporters_jsonFileReporter")`, then the global `telemetry_reporters_jsonFileReporter`
---@class telemetry_reporters_jsonFileReporter
---@field dependencies string[] telemetry_core and telemetry_configManager.
telemetry_reporters_jsonFileReporter = {}

--- Hook called on load: sets the extension to manual unload and launches the send task (jobsystem, priority 0.5).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/reporters/jsonFileReporter.lua:139
function telemetry_reporters_jsonFileReporter.onExtensionLoaded() end

