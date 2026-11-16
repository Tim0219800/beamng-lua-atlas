# `telemetry_trackers_performanceWarnings`

*File: `lua/ge/extensions/telemetry/trackers/performanceWarnings.lua` · VM: Game Engine (GE) · 35 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `telemetry_trackers_performanceWarnings`: `extensions.load("telemetry_trackers_performanceWarnings")`, then the global `telemetry_trackers_performanceWarnings`

Telemetry tracker for the hardware performance warnings shown to the player: each warning (category + message) is reported only once per session ("performanceHardwareWarning" event with category, message, severity, context and acknowledgment).

**Dependencies (loaded first):** `telemetry_core`

## Functions

| Function | Description | Line |
|---|---|---|
| `telemetry_trackers_performanceWarnings.onExtensionLoaded()` | Hook called on load: manual unload. *(internal)* *(hook)* | 27 |
| `telemetry_trackers_performanceWarnings.onPerformanceHardwareWarning(category, warning)` | Hook called when the game emits a hardware performance warning; deduplicates by category and message. *(internal)* *(hook)* | 12 |

### Parameter details

#### `telemetry_trackers_performanceWarnings.onPerformanceHardwareWarning(category, warning)`

Hook called when the game emits a hardware performance warning; deduplicates by category and message.

- `category` (*string*) : Warning category.
- `warning` (*table*) : {msg, type (severity), context, ack}

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | telemetry_core. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/telemetry/trackers/performanceWarnings.lua`.*
