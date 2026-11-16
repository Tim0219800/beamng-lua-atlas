# `flowgraph_nodes_gameplay_rally_rallyDebugNode`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyDebugNode.lua` · VM: Game Engine (GE) · 40 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/rally/rallyDebugNode")` (file under extensions/ but not a regular extension)

Flowgraph node "Rally Debug Draw" (category repeat_instant, tag rally). Draws debug info for a vehicle every frame: its bounding box (RallyUtil.drawVehBB), a 0.1 m magenta sphere at the front-bottom, a yellow one at the vehicle position and a green one at the received position pos. Inputs: vehId, pos (vec3), rot (quat, unused).

## Notes

- The pos pin must be set when vehId is, otherwise vec3(nil) can fail.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:work(args)` | Draws via debugDrawer the markers of the vehicle and of the target position. | 22 |

## Calls into the engine (C++)

- `debugDrawer:` `drawSphere`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyDebugNode.lua`.*
