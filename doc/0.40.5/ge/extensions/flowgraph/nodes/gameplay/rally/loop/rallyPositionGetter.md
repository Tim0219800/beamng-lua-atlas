# `flowgraph_nodes_gameplay_rally_loop_rallyPositionGetter`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/rally/loop/rallyPositionGetter.lua` · VM: Game Engine (GE) · 40 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/rally/loop/rallyPositionGetter")` (file under extensions/ but not a regular extension)

Flowgraph node "Rally Position Getter" (category repeat_instant, tag rally). Looks in a pathData for the start position with the given name (pathData:findStartPositionByName) and returns its position (pos) and rotation (rot). The flow output is true when the position is found.

## Notes

- Despite the description ("from the current rally loop manager"), the node does not use the loop manager: only pathData matters.
- pos and rot are returned as is (vec3 and quat of the path, not tables).

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Sets the flow output to false at start. | 23 |
| `C:work()` | Looks for the named position and fills pos, rot and flow. | 27 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/rally/loop/rallyPositionGetter.lua`.*
