# `telemetry_trackers_memory`

*File: `lua/ge/extensions/telemetry/trackers/memory.lua` · VM: Game Engine (GE) · 155 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `telemetry_trackers_memory`: `extensions.load("telemetry_trackers_memory")`, then the global `telemetry_trackers_memory`

Memory telemetry tracker: reports the machine's memory, the memory held by the game, and whether the OS has started paging to disk. It queries Engine.Platform.getMemoryInfo every 5 s. The "memoryPressure" event is only sent once per session, the first time low free memory and sustained paging are seen together. "memorySample" only exists if the server sets sampleIntervalSeconds (one-off survey).

## Notes

- Pressure thresholds: available memory <= min(2 GiB, 10% of total physical memory) AND paging read+write >= 1 MiB/s.
- The paging counters are those of the whole machine and include the file reads of any process: paging alone proves nothing, hence the combination with free memory.
- sampleIntervalSeconds (config of the "memory" module) is clamped between 5 and 3600 s; without it, polling stops as soon as nothing more can be reported (pressure already sent, or paging not supported), the tracker then removes its onUpdate hook (M.onUpdate = nil then extensions.hookUpdate).
- If the system does not provide paging counters, memory pressure cannot be detected (D-level log message).
- The events notably contain physicalTotalBytes, physicalAvailableBytes, gamePhysicalUsedBytes, an estimate of the memory used outside the game, virtual memory, paging rates, the level and the paused flag (simulation paused).

**Dependencies (loaded first):** `telemetry_core`

## Functions

| Function | Description | Line |
|---|---|---|
| `telemetry_trackers_memory.onExtensionLoaded()` | Hook called on load: resets the state, reads sampleIntervalSeconds from the config, registers the onUpdate hook and switches to manual unload. *(internal)* *(hook)* | 129 |
| `telemetry_trackers_memory.onUpdate(dtReal, dtSim)` | Hook called every frame: accumulates real time and triggers a read every 5 s. Dynamically removed when the tracker is done. *(internal)* *(hook)* | 118 |

### Parameter details

#### `telemetry_trackers_memory.onUpdate(dtReal, dtSim)`

Hook called every frame: accumulates real time and triggers a read every 5 s. Dynamically removed when the tracker is done.

- `dtReal` (*number*) : Real time delta (s).
- `dtSim` (*number*) : Simulated time delta (s); <= 0 indicates pause.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | telemetry_core. |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onUpdate` — listened to by 186 module(s)

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/telemetry/trackers/memory.lua`.*
