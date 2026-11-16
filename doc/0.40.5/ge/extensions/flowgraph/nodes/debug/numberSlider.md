# `flowgraph_nodes_debug_numberSlider`

*File: `lua/ge/extensions/flowgraph/nodes/debug/numberSlider.lua` · VM: Game Engine (GE) · 108 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/debug/numberSlider")` (file under extensions/ but not a regular extension)

Flowgraph node "Number Slider" (category provider, tag util). Provides up to five numbers adjustable with the mouse, with different ranges: a [-1, 1], b [0, 1], c [0, 10], d [0, 100], e [0, 1000] (modifiable via data.aMin/aMax, bMin/bMax...). Only output a is visible by default; b to e are hidden. The sliders are in the node (for visible pins) and in the properties panel. Values are saved with the graph.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:_onDeserialized(data)` | Restores the values a to e (0 by default). | 98 |
| `C:_onSerialize(res)` | Saves the values a to e. | 88 |
| `C:drawCustomProperties()` | Draws the five sliders in the properties panel. | 48 |
| `C:drawMiddle(builder, style)` | Editor: draws the sliders of the non-hidden pins. | 58 |
| `C:init()` | Sets the default ranges and the initial values to 0. | 25 |
| `C:work()` | Copies the slider values to pins a to e. | 80 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/debug/numberSlider.lua`.*
