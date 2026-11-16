# `telemetry_trackers_performance`

*File: `lua/ge/extensions/telemetry/trackers/performance.lua` · VM: Game Engine (GE) · 76 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `telemetry_trackers_performance`: `extensions.load("telemetry_trackers_performance")`, then the global `telemetry_trackers_performance`

Performance telemetry tracker: reports players' framerate from what the engine already measures for the overlay cycled by Ctrl+F ($fps::avg, min, p99, cpuTime, gpuTime). One "performance" event per reading, with no averaging or judgment: the server decides which framerate is too low. The interval (sampleIntervalSeconds, 300 s by default, clamped between 5 and 3600) comes from the server config.

## Notes

- Readings are taken everywhere, menus included; each one says where it comes from: level is nil in menus and paused is set when the simulation is stopped.
- The reading is ignored if $fps::avg is missing or <= 0.
- The event contains fpsAvg, fpsMin, fpsP99, cpuMs, gpuMs and limitedBy (limiting factor according to performanceMetrics).

**Dependencies (loaded first):** `telemetry_core`

## Functions

| Function | Description | Line |
|---|---|---|
| `telemetry_trackers_performance.onExtensionLoaded()` | Hook called on load: reads sampleIntervalSeconds from the "performance" module config and switches to manual unload. *(internal)* *(hook)* | 64 |
| `telemetry_trackers_performance.onUpdate(dtReal, dtSim, dtRaw)` | Hook called every frame: a single clock call and one comparison; takes a reading when the interval has elapsed. *(internal)* *(hook)* | 56 |

### Parameter details

#### `telemetry_trackers_performance.onUpdate(dtReal, dtSim, dtRaw)`

Hook called every frame: a single clock call and one comparison; takes a reading when the interval has elapsed.

- `dtReal` (*number*) : Real time delta (s).
- `dtSim` (*number*) : Simulated delta time (s); <= 0 marks the reading as paused.
- `dtRaw` (*number*) : Raw time delta (s).

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | telemetry_core. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/telemetry/trackers/performance.lua`.*
