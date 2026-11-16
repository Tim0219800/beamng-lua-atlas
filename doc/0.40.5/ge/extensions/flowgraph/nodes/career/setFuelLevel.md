# `flowgraph_nodes_career_setFuelLevel`

*File: `lua/ge/extensions/flowgraph/nodes/career/setFuelLevel.lua` · VM: Game Engine (GE) · 72 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/career/setFuelLevel")` (file under extensions/ but not a regular extension)

Flowgraph node "Set Fuel Level" (category once_f_duration, career color/icon). Sets a vehicle's fuel level to the same percentage in all its tanks. Inputs: vehId (number, otherwise player vehicle 0), mult (number 0-1, fraction of the maximum). First requests the tanks' energy (core_vehicleBridge 'energyStorage'), then runs the setEnergyStorageEnergy action with maxEnergy * mult for each tank; the state becomes finished.

## Notes

- _executionStarted is defined twice (identically).
- The local variable allowedTypes (gasoline, diesel, electricEnergy) and fuelType are unused: all tanks are set.
- The code does not check that mult is non-nil.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Calls onNodeReset when the graph starts. | 27 |
| `C:init()` | Calls onNodeReset. | 24 |
| `C:onNodeReset()` | Resets the received data, the send flag and the duration state ('inactive'). | 36 |
| `C:work()` | Once the data has arrived, sets each tank to maxEnergy*mult and switches to 'finished'. | 55 |
| `C:workOnce()` | Finds the vehicle, requests the energy data and switches to the 'started' state. | 44 |

## Calls into the engine (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/career/setFuelLevel.lua`.*
