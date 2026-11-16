# `flowgraph_nodes_mission_postClean`

*File: `lua/ge/extensions/flowgraph/nodes/mission/postClean.lua` · VM: Game Engine (GE) · 61 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/mission/postClean")` (file under extensions/ but not a regular extension)

Flowgraph node 'Mission Post Clean' (once_p_duration category). Cleans up after a mission: if keepVeh, keeps the vehicle vehId (or the player vehicle), deletes the stashed player vehicle if it is not the original, unfreezes it and can recover it in place (recoverInPlace, with repair except in career mode with an inventory vehicle). resetStartPos asks to put the original vehicle back at its starting point (mission.restoreStartingInfoSetup). If the mission used the previous traffic, keeps the traffic state.

## Notes

- Crashes if keepVeh is true and no vehicle is found (veh nil).

## Class `C`

Flowgraph node class (created by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:workOnce()` | Runs the cleanup only once (see module description). | 22 |

## Calls into the engine (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/mission/postClean.lua`.*
