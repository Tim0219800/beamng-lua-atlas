# `telemetry_reporters_jsonFileReporter`

*File: `lua/ge/extensions/telemetry/reporters/jsonFileReporter.lua` · VM: Game Engine (GE) · 147 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `telemetry_reporters_jsonFileReporter`: `extensions.load("telemetry_reporters_jsonFileReporter")`, then the global `telemetry_reporters_jsonFileReporter`

Telemetry sender: on load, a jobsystem task waits 5 s then sends to the server (core_online call s11/v2/telemetryReports) the /telemetry/sessions/*.jsonl session files written by telemetry_core, grouped in a single send. The send only happens if the oldest pending session is older than the configured interval (reportIntervalHours, 12 h by default, with random jitter of 1x to 2x). The current session's file is ignored.

## Notes

- On success (response.result == 'ok'), the sent files are deleted. On failure, they stay for the next startup; beyond 20 pending files, the oldest are deleted.
- An unreadable session file or one without a valid event is deleted without being sent.
- The data sent: anonymous userID (telemetry_userIdentity), telemetry version, and the list of sessions (arrays of events).
- The extension declares itself as manual unload (setExtensionUnloadMode manual).
- Warning: trimPendingFiles is called with the list of files that were just sent, not with all the pending files.

**Dependencies (loaded first):** `telemetry_core`, `telemetry_configManager`

## Functions

| Function | Description | Line |
|---|---|---|
| `telemetry_reporters_jsonFileReporter.onExtensionLoaded()` | Hook called on load: sets the extension to manual unload and launches the send task (jobsystem, priority 0.5). *(internal)* *(hook)* | 139 |

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | telemetry_core and telemetry_configManager. |

## Calls into the engine (C++)

- `FS:` `findFiles`, `removeFile`, `stat`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/telemetry/reporters/jsonFileReporter.lua`.*
