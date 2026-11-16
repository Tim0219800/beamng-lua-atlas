# `flowgraph_nodes_mission_preClean`

*File: `lua/ge/extensions/flowgraph/nodes/mission/preClean.lua` · VM: Game Engine (GE) · 26 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/mission/preClean")` (file under extensions/ but not a regular extension)

Flowgraph node 'Mission Cleanup' (once_p_duration category). Cleans up the world state before a mission via the manager's mission module (processVehicles) with the options keepPlayer and keepTraffic (the player vehicle / traffic stay active instead of being stashed). Output: vehId, the id of the original player vehicle.

## Class `C`

Flowgraph node class (created by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:workOnce()` | Calls self.mgr.modules.mission:processVehicles{keepPlayer, keepTraffic} then writes vehId (original id or be:getPlayerVehicleID(0)). | 21 |

## Calls into the engine (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/mission/preClean.lua`.*
