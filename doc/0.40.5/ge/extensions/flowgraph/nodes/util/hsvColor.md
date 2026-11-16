# `flowgraph_nodes_util_hsvColor`

*File: `lua/ge/extensions/flowgraph/nodes/util/hsvColor.lua` · VM: Game Engine (GE) · 38 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/util/hsvColor")` (file under extensions/ but not a regular extension)

Node "Color HSV" (simple category). Creates a color from hue, saturation, value (0 to 1) and alpha. Output: color = table {r, g, b, a}. Default values if the input is empty: h=0, s=1, v=1, a=1.

## Class `C`

Flowgraph node class; each instance represents a node in a graph.

| Method | Description | Line |
|---|---|---|
| `C:HSVtoRGB(h, s, v)` | Converts HSV to a {r, g, b} table via the global function HSVtoRGB; the hue is brought into [0,1[ and s, v are clamped to [0,1]. | 27 |
| `C:init()` | Does nothing. | 23 |
| `C:work()` | Computes the color and writes {r, g, b, alpha} to color. | 32 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/util/hsvColor.lua`.*
