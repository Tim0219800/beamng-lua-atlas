# `flowgraph_nodes_debug_debugCylinder`

*File: `lua/ge/extensions/flowgraph/nodes/debug/debugCylinder.lua` · VM: Game Engine (GE) · 51 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/debug/debugCylinder")` (file under extensions/ but not a regular extension)

Flowgraph node "Debug Cylinder" (category repeat_instant, tags util/draw). Draws a debug cylinder (debugDrawer:drawCylinder) between posA and posB every frame. Inputs: radius (number, 1 by default), posA and posB (vec3, required), color (hidden, {r,g,b,a} 0-1, pink {0.91,0.05,0.48,0.5} by default).

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:init()` | Empty. | 24 |
| `C:work()` | If posA and posB are set, converts the color (alpha 0.5 if absent) and draws the cylinder. | 31 |

## Calls into the engine (C++)

- `debugDrawer:` `drawCylinder`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/debug/debugCylinder.lua`.*
