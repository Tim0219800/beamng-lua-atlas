# `flowgraph_nodes_scene_raycast`

*File: `lua/ge/extensions/flowgraph/nodes/scene/raycast.lua` · VM: Game Engine (GE) · 53 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/scene/raycast")` (file under extensions/ but not a regular extension)

Flowgraph node "Raycast" (repeat_instant, tags util/draw). Casts a ray from pos in direction dir and hits the first static collision object (TSStatic, terrain) via castRayStatic. Inputs: pos, dir (vec3), dist (hidden, 1000 by default; otherwise the length of dir). Outputs: hit/miss (flow), pos (impact point) and dist (distance traveled). data.debug draws spheres, line and text.

## Notes

- If there is no impact, castRayStatic returns a distance >= dist and pos is then the end of the ray.

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:init()` | Disables debug (self.data.debug = false). | 28 |
| `C:work()` | Calls castRayStatic(pos, dir, dist), computes the impact point and writes hit, miss, pos and dist. | 32 |

## Calls into the engine (C++)

- `debugDrawer:` `drawLine`, `drawSphere`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/scene/raycast.lua`.*
