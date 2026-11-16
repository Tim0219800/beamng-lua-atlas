# `flowgraph_nodes_gameplay_race_pathEndTransform`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/race/pathEndTransform.lua` · VM: Game Engine (GE) · 66 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/race/pathEndTransform")` (file under extensions/ but not a regular extension)

Flowgraph node "Race End Transform" (category repeat_instant, tag scenario). Gives the transform of the end pathnode of a pathData, useful for custom triggers. The end node is path.endNode; for a closed path without a valid endNode, it is startNode. Outputs: endExists / endDoesNotExist (flow), existing (bool), pos (vec3), dirVec (pathnode normal or {0,0,1}) and radius. Computed only once (as long as self.path is nil).

## Notes

- If endNode is -1, a warning is logged: the end must be explicitly marked in the Race Editor.
- endExists/endDoesNotExist are reset to false every frame; only endExists becomes true, and only during the initial computation: endDoesNotExist never becomes true in this code.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:_executionStopped()` | Forgets the stored path. | 32 |
| `C:init(mgr, ...)` | Initializes self.path and disables clearOutPinsOnStart. | 27 |
| `C:work(args)` | Finds the end pathnode and writes existing, pos, dirVec, radius and the flows endExists/endDoesNotExist. | 36 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/race/pathEndTransform.lua`.*
