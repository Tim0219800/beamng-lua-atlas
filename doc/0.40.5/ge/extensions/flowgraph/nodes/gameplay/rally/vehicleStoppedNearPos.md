# `flowgraph_nodes_gameplay_rally_vehicleStoppedNearPos`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/rally/vehicleStoppedNearPos.lua` · VM: Game Engine (GE) · 200 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/rally/vehicleStoppedNearPos")` (file under extensions/ but not a regular extension)

Flowgraph node "Stopped Near Position?" (category repeat, timer icon, once + duration behavior, tag rally). Checks that a vehicle is stopped (speed < 0.1 m/s) within radius meters of a position for at least duration seconds. Inputs: flow, reset (pulse), vehId, pos (vec3 or table), duration (0.5 s by default), radius (4 m by default). Outputs: flow (true once the duration is reached), impulse (pulse at that moment). The timer advances with dtReal and restarts from zero if the vehicle moves within the zone. Every frame broadcasts the proximity state to the UI via onRallyDataUpdated (activeState vehicleProximity with isNear, distance, isStopped, timer, duration).

## Notes

- The distance is measured from the vehicle's front center (RallyUtil.getVehFrontCenter).
- Target position and radius are cached on first read.
- With the 'stopZones' debug flag of gameplay_rallyLoop, draws the zone (sphere) and the vehicle's guide point.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Resets timer, state and cache to zero. | 40 |
| `C:drawDebugStopZone()` | Draws the stop zone sphere if the stopZones debug flag is active. | 130 |
| `C:drawDebugVehiclePoint(inside)` | Draws the vehicle's guide point (color depending on inside/outside) if stopZones is active. | 136 |
| `C:drawMiddle(builder, style)` | Displays a progress bar of the timer. | 56 |
| `C:init(mgr, ...)` | Initializes timer, target and hook interval (0.1 s, unused afterwards). | 31 |
| `C:isNearPosition()` | Tests whether the vehicle's front center is within the radius of the target position. | 111 |
| `C:isStopped()` | True if the vehicle speed is below 0.1 m/s. | 103 |
| `C:updateTimer()` | Advances the timer (dtReal); when the duration is reached, stops the timer and emits the pulse. | 47 |
| `C:updateVehicleData2()` | Updates the front position and speed of the tracked vehicle from map.objects. | 84 |
| `C:work(args)` | Handles reset and timer, broadcasts the proximity to the UI and updates flow/impulse. | 144 |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onRallyDataUpdated` — listened to by 2 module(s)

## Calls into the engine (C++)

- `debugDrawer:` `drawSphere`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/rally/vehicleStoppedNearPos.lua`.*
