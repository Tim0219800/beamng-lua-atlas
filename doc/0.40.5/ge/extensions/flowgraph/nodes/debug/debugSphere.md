# `flowgraph_nodes_debug_debugSphere`

*File: `lua/ge/extensions/flowgraph/nodes/debug/debugSphere.lua` · VM: Game Engine (GE) · 39 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/debug/debugSphere")` (file under extensions/ but not a regular extension)

Flowgraph node "Debug Sphere" (category repeat_instant, tags util/draw). Draws a debug sphere (debugDrawer:drawSphere) every frame. Inputs: pos (vec3, required), radius (hidden, 1 on the pin, 0.25 if nil), color (hidden, pink {0.91,0.05,0.48,0.5} by default).

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:init()` | Empty. | 23 |
| `C:work()` | If pos is set, draws the sphere. | 26 |

## Calls into the engine (C++)

- `debugDrawer:` `drawSphere`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/debug/debugSphere.lua`.*
