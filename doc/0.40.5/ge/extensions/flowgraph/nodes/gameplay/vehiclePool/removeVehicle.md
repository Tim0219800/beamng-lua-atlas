# `flowgraph_nodes_gameplay_vehiclePool_removeVehicle`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/vehiclePool/removeVehicle.lua` · VM: Game Engine (GE) · 29 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/vehiclePool/removeVehicle")` (file under extensions/ but not a regular extension)

Flowgraph node "Remove Vehicle (Pool)" (once_instant). Removes a vehicle from the pool (pool:removeVeh(vehId)). Requires the core_vehicleActivePooling module; the pool object comes from the Create Vehicle Pool node.

**Dependencies (loaded first):** `core_vehicleActivePooling`

## Class `C`

Flowgraph node class (created via `_flowgraph_createNode(C)`).

| Method | Description | Line |
|---|---|---|
| `C:workOnce()` | Calls removeVeh(vehId) if pool and vehId are defined. | 23 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/vehiclePool/removeVehicle.lua`.*
