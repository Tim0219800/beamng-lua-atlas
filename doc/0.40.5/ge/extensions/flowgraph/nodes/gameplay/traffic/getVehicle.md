# `flowgraph_nodes_gameplay_traffic_getVehicle`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/getVehicle.lua` · VM: Game Engine (GE) · 34 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/traffic/getVehicle")` (file under extensions/ but not a regular extension)

Flowgraph node "Get Vehicle Id From Table" (repeat_instant). Reads the element at index `index` of a vehicle id array (vehicleIds) and outputs it on vehId if it is a number, otherwise nil.

## Class `C`

Flowgraph node class (created via `_flowgraph_createNode(C)`).

| Method | Description | Line |
|---|---|---|
| `C:work()` | Writes vehicleIds[index] to vehId if it is a number; otherwise nil. | 23 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/getVehicle.lua`.*
