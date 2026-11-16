# `flowgraph_nodes_debug_debugPrism`

*File: `lua/ge/extensions/flowgraph/nodes/debug/debugPrism.lua` · VM: Game Engine (GE) · 49 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/debug/debugPrism")` (file under extensions/ but not a regular extension)

Flowgraph node "Debug Prism" (category repeat_instant, tags util/draw). Draws a square/rectangular-base prism (debugDrawer:drawSquarePrism) between posA and posB every frame, with a width and a height at each end. Inputs: posA, posB (vec3 required), widthA, heightA, widthB, heightB (number, 1 by default), color (hidden, pink by default).

## Notes

- The code builds Point2F(height, width): the order passed to the engine is (height, width).

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:init()` | Empty. | 27 |
| `C:work()` | If posA and posB are set, draws the prism. | 30 |

## Calls into the engine (C++)

- `debugDrawer:` `drawSquarePrism`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/debug/debugPrism.lua`.*
