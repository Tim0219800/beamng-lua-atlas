# `flowgraph_nodes_util_randomColor`

*File: `lua/ge/extensions/flowgraph/nodes/util/randomColor.lua` · VM: Game Engine (GE) · 32 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/util/randomColor")` (file under extensions/ but not a regular extension)

Node "Random Color" (repeat_instant, casino icon). Provides a random color {r, g, b, a} every frame. Inputs: cuteColor (only highly saturated colors), randomAlpha (random alpha, otherwise 1). Output: color.

## Class `C`

Flowgraph node class; each instance represents a node in a graph.

| Method | Description | Line |
|---|---|---|
| `C:work()` | Generates a color: in cuteColor mode via HSVtoRGB with a random hue and saturation/value between 0.7 and 1; otherwise three random components. | 21 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/util/randomColor.lua`.*
