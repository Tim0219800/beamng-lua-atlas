# `flowgraph_nodes_gameplay_traffic_removeVehicle`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/removeVehicle.lua` · VM: Game Engine (GE) · 27 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/traffic/removeVehicle")` (file under extensions/ but not a regular extension)

Flowgraph node "Remove Vehicle (Traffic)" (once_instant). Removes the vehicle vehId from the traffic table via self.mgr.modules.traffic:removeTraffic.

## Class `C`

Flowgraph node class (created via `_flowgraph_createNode(C)`).

| Method | Description | Line |
|---|---|---|
| `C:workOnce()` | Calls removeTraffic(vehId) if vehId is defined. | 21 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/removeVehicle.lua`.*
