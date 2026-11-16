# `flowgraph_nodes_gameplay_traffic_parkingTrackVehicle`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/parkingTrackVehicle.lua` · VM: Game Engine (GE) · 81 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/traffic/parkingTrackVehicle")` (file under extensions/ but not a regular extension)

Flowgraph node "Track Vehicle Parking" (default category). Enables parking tracking for a vehicle (gameplay_parking.enableTracking) and outputs enter/exit (pulses), inside/outside, spotExists and spot (target spot, parkingSpotData). Input reset: disables tracking and resets the state.

## Class `C`

Flowgraph node class (created via `_flowgraph_createNode(C)`).

| Method | Description | Line |
|---|---|---|
| `C:_executionStopped()` | Calls reset(). | 34 |
| `C:init()` | Calls reset(). | 30 |
| `C:reset()` | Disables the vehicle's tracking and sets the inside/outside/spotExists outputs back to false. | 38 |
| `C:work()` | Enables tracking if needed, reads getTrackingData()[vehId] and detects parked / not parked transitions. | 49 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/parkingTrackVehicle.lua`.*
