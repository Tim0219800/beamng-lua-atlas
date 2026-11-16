# `flowgraph_nodes_gameplay_rally_vehicleStoppedNearPlane`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/rally/vehicleStoppedNearPlane.lua` · VM: Game Engine (GE) · 358 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/rally/vehicleStoppedNearPlane")` (file under extensions/ but not a regular extension)

Flowgraph node "Stopped Near Plane?" (category repeat, timer icon, once + duration behavior, tag rally). Checks that a vehicle is stopped within distance meters of a plane (position pos, rotation rot; the plane normal is the local Y axis) for at least duration seconds. The vehicle must be in front of the plane (signed distance >= 0) and within a finite lateral zone of 10 m; it is stopped if its speed is below speedThreshold. Inputs: flow, reset (pulse), vehId, pos (vec3 or table), rot (quat or table), duration (4 s by default), distance (1 m), speedThreshold (0.08 m/s). Outputs: flow (true once the duration is reached), impulse. Every frame broadcasts the proximity state to the UI via onRallyDataUpdated (isNear, display distance, distanceToPlane, isStopped, usingGroundMarkerDistance, timer, duration). Used for rally stop controls (stage finish, etc.).

## Notes

- The measurement starts from the vehicle's front center (RallyUtil.getVehFrontCenter).
- Outside the lateral zone, the displayed distance comes from core_groundMarkers.getPathLength() if a ground marker is active.
- The timer uses dtReal. It restarts from zero if the vehicle is no longer near the plane or moves within the zone; reset also cancels it.
- Option data.drawDebug (false) or 'stopZones' flag of the loop manager: draws the plane, the vehicle-plane line and the vehicle point.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Resets the timer, the cache and the proximity state to zero. | 59 |
| `C:drawDebugVisualization()` | Draws the plane and the debug markers via StagedCountdownUtils. | 262 |
| `C:drawMiddle(builder, style)` | Displays a progress bar of the timer. | 87 |
| `C:getRallyLoopManager()` | Returns the rally loop manager if gameplay_rallyLoop exists. | 250 |
| `C:init(mgr, ...)` | Initializes the timer and the cached proximity state. | 33 |
| `C:isNearPlane()` | Returns the cached proximity state. | 258 |
| `C:shouldDrawDebug()` | True if data.drawDebug or the rally loop's stopZones flag is active. | 245 |
| `C:updateProximityState()` | Computes signed distance to the plane, lateral distance, finite zone, stop, proximity, display distance and "staged" state. | 179 |
| `C:updateTimer()` | Advances the timer; when the duration is reached, stops the timer and emits the pulse. | 78 |
| `C:updateVehicleData()` | Updates the front position and speed of the tracked vehicle from map.objects. | 99 |
| `C:work(args)` | Every frame: reads pos/rot, updates the vehicle and the proximity, handles timer and reset, broadcasts the UI, fills flow and impulse. | 272 |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onRallyDataUpdated` — listened to by 2 module(s)

## Calls into the engine (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/rally/vehicleStoppedNearPlane.lua`.*
