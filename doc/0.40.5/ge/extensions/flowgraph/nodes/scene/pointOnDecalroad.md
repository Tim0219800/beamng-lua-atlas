# `flowgraph_nodes_scene_pointOnDecalroad`

*File: `lua/ge/extensions/flowgraph/nodes/scene/pointOnDecalroad.lua` · VM: Game Engine (GE) · 68 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/scene/pointOnDecalroad")` (file under extensions/ but not a regular extension)

Flowgraph node "Point on Decalroad" (repeat_instant). Tests whether a point (vec3) is on a DecalRoad (roadId) via roadObj:containsPoint, forcing z to the altitude of the road's first node. Outputs: inside / outside (flow), onRoad (bool), closestIdx (index of the closest control point, -1 if off the road), maxIdx (number of points - 1).

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Resets the road cache and empties the outputs. | 33 |
| `C:init()` | Initializes point to (0,0,0) and pz to 0. | 28 |
| `C:work()` | Reloads the road if roadId changes, then computes closestIdx, onRoad, inside and outside. | 41 |

## Calls into the engine (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/scene/pointOnDecalroad.lua`.*
