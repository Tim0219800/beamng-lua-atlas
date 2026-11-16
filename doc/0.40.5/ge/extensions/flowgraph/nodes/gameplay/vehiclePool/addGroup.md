# `flowgraph_nodes_gameplay_vehiclePool_addGroup`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/vehiclePool/addGroup.lua` · VM: Game Engine (GE) · 31 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/vehiclePool/addGroup")` (file under extensions/ but not a regular extension)

Flowgraph node "Add Vehicle Group To Pool" (once_instant). Inserts all ids of the vehGroup table into the pool (pool:insertVeh for each). Requires the core_vehicleActivePooling module; the pool object comes from the Create Vehicle Pool node.

## Notes

- The node's description ("Activates or deactivates a vehicle object in the pool") does not match the code, which adds a group to the pool.

**Dependencies (loaded first):** `core_vehicleActivePooling`

## Class `C`

Flowgraph node class (created via `_flowgraph_createNode(C)`).

| Method | Description | Line |
|---|---|---|
| `C:workOnce()` | Calls insertVeh for each id in the group. | 23 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/vehiclePool/addGroup.lua`.*
