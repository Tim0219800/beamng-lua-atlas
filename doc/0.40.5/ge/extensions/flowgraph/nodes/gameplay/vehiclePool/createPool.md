# `flowgraph_nodes_gameplay_vehiclePool_createPool`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/vehiclePool/createPool.lua` · VM: Game Engine (GE) · 52 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/vehiclePool/createPool")` (file under extensions/ but not a regular extension)

Flowgraph node "Create Vehicle Pool" (once_instant). Creates a vehicle pool (core_vehicleActivePooling.createPool({name})) to manage the activation/deactivation of vehicle objects; output vehPool. Option data.keepVehicles ("Keep Inactive Vehicles"): when the pool is deleted, keeps the inactive vehicles (deletePool(keepVehicles)).

**Dependencies (loaded first):** `core_vehicleActivePooling`

## Class `C`

Flowgraph node class (created via `_flowgraph_createNode(C)`).

| Method | Description | Line |
|---|---|---|
| `C:_executionStopped()` | Calls onNodeReset(). | 27 |
| `C:drawCustomProperties()` | Displays the "Keep Inactive Vehicles" checkbox (data.keepVehicles). | 38 |
| `C:init()` | Calls onNodeReset(). | 23 |
| `C:onNodeReset()` | Deletes the created pool (deletePool) and forgets it. | 31 |
| `C:workOnce()` | Creates the pool if it does not exist and publishes it on vehPool. | 45 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/vehiclePool/createPool.lua`.*
