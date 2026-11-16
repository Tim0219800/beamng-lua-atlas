# `flowgraph_nodes_debug_debugLine`

*File: `lua/ge/extensions/flowgraph/nodes/debug/debugLine.lua` · VM: Game Engine (GE) · 39 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/debug/debugLine")` (file under extensions/ but not a regular extension)

Flowgraph node "Debug Line" (category repeat_instant, tags util/draw). Draws a debug line (debugDrawer:drawLine) from posA to posB every frame. Inputs: posA, posB (vec3, required), color (hidden, pink {0.91,0.05,0.48,0.5} by default).

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:init()` | Empty. | 23 |
| `C:work()` | If posA and posB are set, draws the line with the given color. | 26 |

## Calls into the engine (C++)

- `debugDrawer:` `drawLine`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/debug/debugLine.lua`.*
