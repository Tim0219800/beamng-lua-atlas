# `flowgraph_nodes_gameplay_rally_recoverInPlace`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/rally/recoverInPlace.lua` · VM: Game Engine (GE) · 132 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/rally/recoverInPlace")` (file under extensions/ but not a regular extension)

Flowgraph node "Rally Mode Recover In Place" (category repeat_p_duration, tags rally, recover, teleport). Recovers the vehicle in place, without pacenotes, route history or driveline: stores the current position and orientation, teleports with spawn.safeTeleport (with repair/reset if the recovery setting says so), restores the fuel via a snapshot (fuelUtils), then fires the hooks onVehicleTeleportedToLastRoad(vehId) and onRallyRouteRecoveryComplete({vehId, repairVehicle, inPlace = true}). Input: vehId (otherwise player vehicle 0), flow.

## Notes

- The repair comes from gameplay_rallyLoop manager:getRecoveryRepairVehicle(), otherwise gameplay_rally.getRecoveryRepairVehicle(), otherwise the rallyRepairVehicleOnRecovery setting, otherwise true.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Calls onNodeReset. | 43 |
| `C:_executionStopped()` | Calls onNodeReset. | 47 |
| `C:init()` | Calls onNodeReset. | 39 |
| `C:onNodeReset()` | Clears the pending recovery and the fuel snapshot. | 51 |
| `C:runRecovery()` | Executes the pending recovery: teleports the vehicle, reapplies the fuel, emits the hooks. | 56 |
| `C:startRecovery()` | Prepares the recovery (current position/rotation, repair choice); first requests the fuel snapshot if repairing, then launches runRecovery. | 85 |
| `C:work()` | If flow is active, calls startRecovery. | 125 |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onRallyRouteRecoveryComplete` — listened to by 1 module(s)
- `onVehicleTeleportedToLastRoad`

## Calls into the engine (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/rally/recoverInPlace.lua`.*
