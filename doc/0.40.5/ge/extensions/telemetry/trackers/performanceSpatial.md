# `telemetry_trackers_performanceSpatial`

*File: `lua/ge/extensions/telemetry/trackers/performanceSpatial.lua` · VM: Game Engine (GE) · 329 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `telemetry_trackers_performanceSpatial`: `extensions.load("telemetry_trackers_performanceSpatial")`, then the global `telemetry_trackers_performanceSpatial`

"Spatial" performance telemetry tracker: links framerate to where the player is. It polls the instantaneous FPS every 0.13 s (in a tracked level, world ready, window in the foreground, simulation not paused) and emits, according to the server config (performanceSpatial module): "performanceDip" (FPS drop detected by performanceSpatialDetector, with the snapshot of the worst moment), "performanceSpatial" (periodic position/performance samples and final exposure), "shaderGeneration" (newly generated shaders), "vehicleRecovery" (vehicle recoveries) and "gameplayActivityExit" (activity exit, via performanceSpatialGameplayExit). Each feature can be enabled separately.

## Notes

- If no feature is enabled, onExtensionLoaded returns false (the tracker does not stay loaded). If only recovery or activity-exit tracking are active, the onUpdate hook is removed.
- When the window loses focus, the simulation is paused, the world is not ready (worldReadyState ~= 2) or the level is not tracked, the context is closed (the last dip is emitted, along with a final exposure) and reset.
- Activity exit deduplication: the same type:id key is not re-emitted within 5 s; for worldExit/gameExit, a mission already finished (aggregated attempt) is not reported as abandoned.
- The exit hooks (onAnyMissionChanged, onMissionAttemptAggregated, onRecoveryPromptButtonPressed, onGameplayActivityAborted, onClientPreEndMission, onPreExit) are added or removed dynamically according to the gameplayExitTrackingEnabled option; their entries in the extension's function table therefore do not always exist.
- On a Lua reload, onSerialize saves completedMissionId and the detector state (eventCount, cooldownUntilMs) to restore them via onExtensionLoaded(data).
- trackVehReset is not an engine hook: it is called by other modules (for example on a vehicle reset); it does nothing if recovery tracking is disabled or if the level is not tracked.

**Dependencies (loaded first):** `telemetry_core`, `core_camera`

## Functions

| Function | Description | Line |
|---|---|---|
| `telemetry_trackers_performanceSpatial.onClientEndMission()` | Hook called at the end of the level: closes the current context (last dip and final exposure). *(internal)* *(hook)* | 316 |
| `telemetry_trackers_performanceSpatial.onExit()` | Hook called when the game exits: closes the current context. *(internal)* *(hook)* | 316 |
| `telemetry_trackers_performanceSpatial.onExtensionLoaded(data)` | Hook called on load: reads the performanceSpatial module config, enables the requested features, prepares the detector and the active GPU, restores the state from a Lua reload. *(internal)* *(hook)* | 246 |
| `telemetry_trackers_performanceSpatial.onExtensionUnloaded()` | Hook called on unload: closes the current context. *(internal)* *(hook)* | 316 |
| `telemetry_trackers_performanceSpatial.onSerialize(reason)` | Hook called before unload: for a Lua reload, closes the context and returns the state to restore. *(internal)* *(hook)* | 305 |
| `telemetry_trackers_performanceSpatial.onUpdate(dtReal, dtSim)` | Hook called every frame: at each 0.13 s interval, reads the instantaneous FPS, detects drops, counts generated shaders and emits spatial samples. *(internal)* *(hook)* | 178 |
| `telemetry_trackers_performanceSpatial.trackVehReset()` | Records a "vehicleRecovery" event (level and position of player 0's vehicle) if recovery tracking is enabled and the level is tracked. | 101 |

### Parameter details

#### `telemetry_trackers_performanceSpatial.onExtensionLoaded(data)`

Hook called on load: reads the performanceSpatial module config, enables the requested features, prepares the detector and the active GPU, restores the state from a Lua reload.

- `data` (*table|nil*) : onSerialize data from a previous reload (completedMissionId, eventCount, cooldownUntilMs).
- **returns**: boolean|nil false if no feature is enabled (the extension unloads itself).

#### `telemetry_trackers_performanceSpatial.onSerialize(reason)`

Hook called before unload: for a Lua reload, closes the context and returns the state to restore.

- `reason` (*string*) : Reason; only "reload" is handled.
- **returns**: table|nil {completedMissionId, eventCount, cooldownUntilMs}

#### `telemetry_trackers_performanceSpatial.onUpdate(dtReal, dtSim)`

Hook called every frame: at each 0.13 s interval, reads the instantaneous FPS, detects drops, counts generated shaders and emits spatial samples.

- `dtReal` (*number*) : Real time delta (s).
- `dtSim` (*number*) : Simulated delta time (s); <= 0 closes the context.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | telemetry_core and core_camera. |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onAnyMissionChanged` — listened to by 19 module(s)
- `onClientPreEndMission`
- `onGameplayActivityAborted`
- `onMissionAttemptAggregated` — listened to by 2 module(s)
- `onPreExit` — listened to by 1 module(s)
- `onRecoveryPromptButtonPressed` — listened to by 2 module(s)
- `onUpdate` — listened to by 186 module(s)

## Calls into the engine (C++)

- `be:` `getPlayerVehicle`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/telemetry/trackers/performanceSpatial.lua`.*
