# `telemetry_trackers_settings`

*File: `lua/ge/extensions/telemetry/trackers/settings.lua` · VM: Game Engine (GE) · 129 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `telemetry_trackers_settings`: `extensions.load("telemetry_trackers_settings")`, then the global `telemetry_trackers_settings`

Settings telemetry tracker: records the game's declared settings (settings.impl.defaults) with their current value and default value, to read framerate and crashes alongside what the player asked for. Local addresses, paths and user-created lists/presets are excluded. A change is reported at the next startup; an unchanged set is resent every surveyIntervalHours (7 days by default).

## Notes

- Settings never reported: IngameConsoleLogBlacklist/Whitelist, WinConsoleLogBlacklist/Whitelist, mpCustomServiceURL, protocols_motionSim_address, protocols_outgauge_address, rallyCodriverVoicepackMRU, shaderGenCachePath, userColorPresets, userPaintPresets.
- Change detection uses a SHA-256 of a canonical serialization (sorted keys) of the settings and defaults; the fingerprint is stored with the last survey in surveys/settingsSurvey.json (its modification date is the send date).
- The event is called "settings" (surveyVersion 2) and contains settings and defaults.

**Dependencies (loaded first):** `telemetry_core`

## Functions

| Function | Description | Line |
|---|---|---|
| `telemetry_trackers_settings.onExtensionLoaded()` | Hook called on load: switches to manual unload, collects the settings and sends the survey if it is due or if the settings have changed. *(internal)* *(hook)* | 94 |

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | telemetry_core. |

## Calls into the engine (C++)

- `FS:` `stat`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/telemetry/trackers/settings.lua`.*
