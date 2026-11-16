# `flowgraph_nodes_mission_prepareVehicle`

*File: `lua/ge/extensions/flowgraph/nodes/mission/prepareVehicle.lua` · VM: Game Engine (GE) · 28 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/mission/prepareVehicle")` (file under extensions/ but not a regular extension)

Flowgraph node 'Prepare Vehicle' (once_instant category). Prepares one or more vehicles for gameplay (electric and values) via self.mgr.modules.mission:prepareVehicle. Optional pins: vehId (default player vehicle) and vehicleIds (table of additional ids).

## Class `C`

Flowgraph node class (created by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:workOnce()` | Prepares vehId (or the player vehicle) with the second argument false, then each id of vehicleIds with the second argument true unless it is the main vehicle or the player. | 19 |

## Calls into the engine (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/mission/prepareVehicle.lua`.*
