# `flowgraph_nodes_gameplay_vehiclePool_activateAll`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/vehiclePool/activateAll.lua` · VM: Game Engine (GE) · 29 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/vehiclePool/activateAll")` (file under extensions/ but not a regular extension)

Flowgraph node "Activate All Vehicles" (once_instant). Activates or deactivates all vehicles in the pool (pool:setAllVehs(activate), default true). Requires the core_vehicleActivePooling module; the pool object comes from the Create Vehicle Pool node.

**Dependencies (loaded first):** `core_vehicleActivePooling`

## Class `C`

Flowgraph node class (created via `_flowgraph_createNode(C)`).

| Method | Description | Line |
|---|---|---|
| `C:workOnce()` | Calls setAllVehs(activate) on the pool. | 23 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/vehiclePool/activateAll.lua`.*
