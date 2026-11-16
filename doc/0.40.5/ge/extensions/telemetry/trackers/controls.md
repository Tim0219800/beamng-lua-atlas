# `telemetry_trackers_controls`

*File: `lua/ge/extensions/telemetry/trackers/controls.lua` · VM: Game Engine (GE) · 67 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `telemetry_trackers_controls`: `extensions.load("telemetry_trackers_controls")`, then the global `telemetry_trackers_controls`

Controls telemetry tracker: reports the steering method used (one-off event "controlsUsed") and, when the game closes, the number of uses of each bound action ("inputActionUse", via ActionMap.getActionUseCounts). Connected devices belong to the hardware survey (hardware tracker), not this one.

## Notes

- controlsUsed is a one-off event, not a duration: the method almost never changes in a session. It is reported per vehicle, so a vehicle change reports it again.
- The extension unloads before telemetry_core flushes its buffer, so the inputActionUse event still reaches the file.
- On a Lua reload (onSerialize with reason == "reload"), the action report is skipped to avoid duplicates; it is only reported once per extension lifetime.

**Dependencies (loaded first):** `telemetry_core`

## Functions

| Function | Description | Line |
|---|---|---|
| `telemetry_trackers_controls.onExtensionLoaded()` | Hook called on load: manual unload. *(internal)* *(hook)* | 45 |
| `telemetry_trackers_controls.onExtensionUnloaded()` | Hook called on unload: sends the count of action uses (except on Lua reload or if already done). *(internal)* *(hook)* | 50 |
| `telemetry_trackers_controls.onSerialize(reason)` | Hook called before unload/reload: remembers whether the reason is a Lua reload. *(internal)* *(hook)* | 56 |
| `telemetry_trackers_controls.onSteeringFilterChanged(method)` | Hook called when the vehicle's steering filter changes: records the controlsUsed event with the method. *(internal)* *(hook)* | 22 |

### Parameter details

#### `telemetry_trackers_controls.onSerialize(reason)`

Hook called before unload/reload: remembers whether the reason is a Lua reload.

- `reason` (*string*) : Reason for the serialization ("reload" on reload).

#### `telemetry_trackers_controls.onSteeringFilterChanged(method)`

Hook called when the vehicle's steering filter changes: records the controlsUsed event with the method.

- `method` (*string*) : Steering method (inferred from code: name of the steering filter/mode).

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | telemetry_core. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/telemetry/trackers/controls.lua`.*
