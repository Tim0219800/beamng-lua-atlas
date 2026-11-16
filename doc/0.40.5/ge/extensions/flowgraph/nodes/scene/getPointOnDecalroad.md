# `flowgraph_nodes_scene_getPointOnDecalroad`

*File: `lua/ge/extensions/flowgraph/nodes/scene/getPointOnDecalroad.lua` · VM: Game Engine (GE) · 80 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/scene/getPointOnDecalroad")` (file under extensions/ but not a regular extension)

Flowgraph node "Get Point on Decalroad" (repeat_instant). Gives the position of a control point of a DecalRoad (roadId, idx) and an approximation of its direction (quat). If the road is looped ('looped'), the neighbors of the first/last point wrap around; otherwise they are clamped. The computation is only redone if roadId or idx changes.

## Notes

- idx is 0-based, clamped to [0, getNodeCount()-1]; out of bounds the node does nothing.
- The direction is computed as position(previous) - position(next): check the direction if the rotation seems inverted. The code says it is approximate.

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Resets the cache (oldRoadId, oldIdx, roadObj) and empties the output pins. | 28 |
| `C:init()` | Nothing to initialize. | 24 |
| `C:work()` | Looks up the road, computes pos ({x,y,z} of node idx) and rot (quatFromDir of the next->previous direction, Z up vector). | 37 |

## Calls into the engine (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/scene/getPointOnDecalroad.lua`.*
