# `telemetry_trackers_gameplay_other`

*File: `lua/ge/extensions/telemetry/trackers/gameplay/other.lua` · VM: Game Engine (GE) · 79 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `telemetry_trackers_gameplay_other`: `extensions.load("telemetry_trackers_gameplay_other")`, then the global `telemetry_trackers_gameplay_other`

Telemetry tracker for small gameplay features that do not have their own tracker: the track builder (activity "trackBuilder") and the taxi (event "taxiCalled" and activity "taxiRide"). The duration of a session or a ride is carried by the activity.

## Notes

- The track builder window sends all openings/closings through a single call, which also repeats the current state: the activity is therefore matched on the tracker's internal state, not on each call.
- onExit and onExtensionUnloaded (same function) close both activities; an interrupted taxi ride is ended with reason = "gameExit".
- Taxi ride outcomes (onTaxiRideEnded): reason is exited or trafficStopped; phase indicates where the ride was (arriving = the taxi had stopped for the player); distances are in meters.

**Dependencies (loaded first):** `telemetry_core`

## Functions

| Function | Description | Line |
|---|---|---|
| `telemetry_trackers_gameplay_other.onExit()` | Hook called when the game closes: closes the open activities. *(internal)* *(hook)* | 59 |
| `telemetry_trackers_gameplay_other.onExtensionLoaded()` | Hook called on load: manual unload. *(internal)* *(hook)* | 64 |
| `telemetry_trackers_gameplay_other.onExtensionUnloaded()` | Hook called on unload: a Lua reload destroys the trackers without onExit, so the activities are also closed here. *(internal)* *(hook)* | 59 |
| `telemetry_trackers_gameplay_other.onTaxiCalled(result)` | Hook called when the player calls a taxi: emits taxiCalled with the result. *(internal)* *(hook)* | 34 |
| `telemetry_trackers_gameplay_other.onTaxiRideEnded(data)` | Hook called at the end of a ride: ends the taxiRide activity with the received data. *(internal)* *(hook)* | 53 |
| `telemetry_trackers_gameplay_other.onTaxiRideStarted(called)` | Hook called at the start of a ride: starts the taxiRide activity (called or not, career mode or not, level). *(internal)* *(hook)* | 42 |
| `telemetry_trackers_gameplay_other.onTrackBuilderWindowToggled(open)` | Hook called when the track builder window opens/closes: starts or ends the trackBuilder activity (with the current level). *(internal)* *(hook)* | 20 |

### Parameter details

#### `telemetry_trackers_gameplay_other.onTaxiCalled(result)`

Hook called when the player calls a taxi: emits taxiCalled with the result.

- `result` (*string*) : dispatched, noTaxiAvailable or tooFarFromRoad.

#### `telemetry_trackers_gameplay_other.onTaxiRideEnded(data)`

Hook called at the end of a ride: ends the taxiRide activity with the received data.

- `data` (*table*) : {reason, phase, distances...}

#### `telemetry_trackers_gameplay_other.onTaxiRideStarted(called)`

Hook called at the start of a ride: starts the taxiRide activity (called or not, career mode or not, level).

- `called` (*boolean*) : false for a taxi hailed at the roadside.

#### `telemetry_trackers_gameplay_other.onTrackBuilderWindowToggled(open)`

Hook called when the track builder window opens/closes: starts or ends the trackBuilder activity (with the current level).

- `open` (*boolean*) : true if the window is open.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | telemetry_core. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/telemetry/trackers/gameplay/other.lua`.*
