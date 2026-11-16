# `flowgraph_nodes_gameplay_rally_recoverToRouteDeparture`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/rally/recoverToRouteDeparture.lua` · VM: Game Engine (GE) · 143 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/rally/recoverToRouteDeparture")` (file under extensions/ but not a regular extension)

Flowgraph node "Rally Mode Recover To Route Departure" (category repeat_p_duration, tags rally, recover, teleport). Puts the vehicle back at the last tracked off-road recovery point, via gameplay_rally.getRallyManager():recoverVehicleToRouteDeparture(veh, {repairVehicle, backoffDistance}). Inputs: flow, vehId (otherwise player vehicle 0) and backoffDistance (distance upstream of the tracked point, along the static driveline). If repair is active, a fuel snapshot is taken before and reapplied after.

## Notes

- Error logged if the rally manager cannot be found; warning with the reason if recoverVehicleToRouteDeparture fails.
- Unlike recoverInPlace, this node does not itself emit the end-of-recovery hooks.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Calls onNodeReset. | 44 |
| `C:_executionStopped()` | Calls onNodeReset. | 48 |
| `C:init()` | Calls onNodeReset. | 40 |
| `C:onNodeReset()` | Clears the pending recovery and the fuel snapshot. | 52 |
| `C:runRecovery()` | Calls rm:recoverVehicleToRouteDeparture then reapplies the fuel if repaired. | 57 |
| `C:startRecovery()` | Prepares the pending recovery (vehicle, repair, backoffDistance) and launches it, after the fuel snapshot if needed. | 91 |
| `C:work()` | If flow is active, calls startRecovery. | 136 |

## Calls into the engine (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/rally/recoverToRouteDeparture.lua`.*
