# `flowgraph_nodes_gameplay_vehiclePool_managePool`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/vehiclePool/managePool.lua` · VM: Game Engine (GE) · 50 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/vehiclePool/managePool")` (file under extensions/ but not a regular extension)

Flowgraph node "Manage Vehicle Pool" (once_instant). Sets and reads a vehicle pool: maxActive (max number of active vehicles; -1 or nil = unlimited), globalPoolingMode (useSceneVehiclesCap: limits the active vehicles of the whole scene). Outputs: vehicleIds, activeVehIds, inactiveVehIds, activeAmount, inactiveAmount. Requires the core_vehicleActivePooling module; the pool object comes from the Create Vehicle Pool node.

**Dependencies (loaded first):** `core_vehicleActivePooling`

## Class `C`

Flowgraph node class (created via `_flowgraph_createNode(C)`).

| Method | Description | Line |
|---|---|---|
| `C:workOnce()` | Applies the settings to the pool then publishes its vehicle lists and their counts. | 30 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/vehiclePool/managePool.lua`.*
