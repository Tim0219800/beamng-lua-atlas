# `telemetry_trackers_mods`

*File: `lua/ge/extensions/telemetry/trackers/mods.lua` · VM: Game Engine (GE) · 92 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `telemetry_trackers_mods`: `extensions.load("telemetry_trackers_mods")`, then the global `telemetry_trackers_mods`

Mods telemetry tracker: reports which mods are installed and active, to distinguish crashes and performance between modded and clean installations. Only the name, type, repository identifier (modID), active state and whether the mod is unpacked are sent, never file paths (event "modSurvey" with the mod manager's counts).

## Notes

- The list is only resent every surveyIntervalHours (7 days by default) if unchanged; a changed list is reported at the next startup. The comparison uses a SHA-256 of the (name, active) pairs.
- The mods database is only filled once the mod manager is ready, well after telemetry starts: the survey is therefore done in onModManagerReady and not in onExtensionLoaded.
- The last survey sent is kept in surveys/modSurvey.json; its modification date is the send date.
- modID is absent when the mod does not come from the official repository.

**Dependencies (loaded first):** `telemetry_core`

## Functions

| Function | Description | Line |
|---|---|---|
| `telemetry_trackers_mods.onExtensionLoaded()` | Hook called on load: manual unload. *(internal)* *(hook)* | 84 |
| `telemetry_trackers_mods.onModManagerReady()` | Hook called when the mod manager is ready: collects the sorted list of mods and sends the survey if needed (once per session). *(internal)* *(hook)* | 57 |

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | telemetry_core. |

## Calls into the engine (C++)

- `FS:` `stat`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/telemetry/trackers/mods.lua`.*
