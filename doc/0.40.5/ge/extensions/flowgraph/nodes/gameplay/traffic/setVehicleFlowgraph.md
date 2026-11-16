# `flowgraph_nodes_gameplay_traffic_setVehicleFlowgraph`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/setVehicleFlowgraph.lua` · VM: Game Engine (GE) · 73 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/traffic/setVehicleFlowgraph")` (file under extensions/ but not a regular extension)

Flowgraph node "Set Vehicle Flowgraph" (once_instant). Launches a custom flowgraph (fgFile) for a traffic vehicle via veh.role:setupFlowgraph(fgFile, varData). Custom input pins (types string, number, bool, any, table, vec3, quat, color; not flow) are saved and passed as variables to the flowgraph. Ideal for custom AI roles and actions. On reset, the role's flowgraph is removed (role:clearFlowgraph).

## Class `C`

Flowgraph node class (created via `_flowgraph_createNode(C)`).

| Method | Description | Line |
|---|---|---|
| `C:_executionStopped()` | Calls onNodeReset(). | 41 |
| `C:init()` | Initializes the node's internal state at creation (called by the flowgraph engine). | 35 |
| `C:onNodeReset()` | Removes the role flowgraph of the remembered vehicle (clearFlowgraph) and forgets vehId. | 45 |
| `C:workOnce()` | Copies the values of all non-fixed input pins into varData and calls veh.role:setupFlowgraph(fgFile, varData) for vehicle vehId. | 55 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/setVehicleFlowgraph.lua`.*
