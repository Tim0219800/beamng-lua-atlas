# `telemetry_trackers_traffic`

*File: `lua/ge/extensions/telemetry/trackers/traffic.lua` · VM: Game Engine (GE) · 65 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `telemetry_trackers_traffic`: `extensions.load("telemetry_trackers_traffic")`, then the global `telemetry_trackers_traffic`

Traffic telemetry tracker. It answers the question "how much traffic is actually used": it opens the `trafficActive` activity when traffic starts and closes it when it stops, attaching the peak of active vehicles. Depends on `telemetry_core` and is only used for statistics collection, not for gameplay.

## Notes

- The vehicle count is deliberately not read when traffic starts or stops: those hooks arrive one frame after the first or last vehicle, when the count is not yet stable. Only the peak (`peakAmount`) is kept via onTrafficAmountChanged.
- The activity is also closed on onClientEndMission, onExit and onExtensionUnloaded, because traffic does not always stop cleanly on a level change and a Lua reload does not trigger onExit.
- The extension sets itself to manual unload (`setExtensionUnloadMode(M, "manual")`) on load.

**Dependencies (loaded first):** `telemetry_core`

## Functions

| Function | Description | Line |
|---|---|---|
| `telemetry_trackers_traffic.onClientEndMission()` | Hook called at the end of the mission/level on the client side. Closes the traffic activity if it is open (same code as onTrafficStopped). *(internal)* *(hook)* | 46 |
| `telemetry_trackers_traffic.onExit()` | Hook called when the game exits. Alias of onClientEndMission: closes the traffic activity. *(internal)* *(hook)* | 46 |
| `telemetry_trackers_traffic.onExtensionLoaded()` | Hook called when the extension loads. Sets the extension to manual unload. *(internal)* *(hook)* | 50 |
| `telemetry_trackers_traffic.onExtensionUnloaded()` | Hook called when the extension is unloaded (for example on a Lua reload, which does not go through onExit). Closes the traffic activity. *(internal)* *(hook)* | 46 |
| `telemetry_trackers_traffic.onTrafficAmountChanged(activeAmount)` | Hook called whenever vehicles enter or leave the traffic pool. Keeps only the maximum, without creating an event. *(internal)* *(hook)* | 39 |
| `telemetry_trackers_traffic.onTrafficStarted()` | Hook called when traffic starts. Resets the peak to 0 and opens the `trafficActive` activity with the current level (`getCurrentLevelIdentifier()` or "unknown"). *(internal)* *(hook)* | 22 |
| `telemetry_trackers_traffic.onTrafficStopped()` | Hook called when traffic stops. Does nothing if traffic was not running; otherwise closes the `trafficActive` activity with `peakAmount`. *(internal)* *(hook)* | 31 |

### Parameter details

#### `telemetry_trackers_traffic.onTrafficAmountChanged(activeAmount)`

Hook called whenever vehicles enter or leave the traffic pool. Keeps only the maximum, without creating an event.

- `activeAmount` (*integer*) : Number of active traffic vehicles.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Extensions to load before this one: `{'telemetry_core'}`. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/telemetry/trackers/traffic.lua`.*
