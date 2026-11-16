# `flowgraph_nodes_gameplay_vehiclePool_activateVehicle`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/vehiclePool/activateVehicle.lua` · VM: Game Engine (GE) · 30 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/vehiclePool/activateVehicle")` (file under extensions/ but not a regular extension)

Flowgraph node "Activate Vehicle" (once_instant). Activates or deactivates a vehicle in the pool (pool:setVeh(vehId, activate), default true). Requires the core_vehicleActivePooling module; the pool object comes from the Create Vehicle Pool node.

**Dependencies (loaded first):** `core_vehicleActivePooling`

## Class `C`

Flowgraph node class (created via `_flowgraph_createNode(C)`).

| Method | Description | Line |
|---|---|---|
| `C:workOnce()` | Calls setVeh(vehId, activate) if pool and vehId are defined. | 24 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/vehiclePool/activateVehicle.lua`.*
