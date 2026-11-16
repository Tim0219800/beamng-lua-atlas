# `telemetry_trackers_physics`

*File: `lua/ge/extensions/telemetry/trackers/physics.lua` · VM: Game Engine (GE) · 54 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `telemetry_trackers_physics`: `extensions.load("telemetry_trackers_physics")`, then the global `telemetry_trackers_physics`

Physics telemetry tracker: reports physics instabilities with enough context to reproduce them ("physicsInstability" event: model, config, originating mod, level, simulation speed, vehicle count, position and sum of the vehicle's section damage) then requests the report to be written.

## Notes

- This tracker only observes: it never sets instabilityHandled, so it does not interfere with whatever handles the instability.
- If telemetry_vehicleInfo does not know the vehicle, nothing is sent.

**Dependencies (loaded first):** `telemetry_core`

## Functions

| Function | Description | Line |
|---|---|---|
| `telemetry_trackers_physics.onExtensionLoaded()` | Hook called on load: manual unload. *(internal)* *(hook)* | 46 |
| `telemetry_trackers_physics.onInstabilityDetected(vid, returnData)` | Hook called when a physics instability is detected on a vehicle: builds and sends the event, then calls telemetry_core.triggerReportWrite(). *(internal)* *(hook)* | 18 |

### Parameter details

#### `telemetry_trackers_physics.onInstabilityDetected(vid, returnData)`

Hook called when a physics instability is detected on a vehicle: builds and sends the event, then calls telemetry_core.triggerReportWrite().

- `vid` (*integer*) : Id of the unstable vehicle.
- `returnData` (*table*) : Return table of the instability handlers (not used here).

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | telemetry_core. |

## Calls into the engine (C++)

- `be:` `getSimulationTimeScale`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/telemetry/trackers/physics.lua`.*
