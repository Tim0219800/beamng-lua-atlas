# `flowgraph_nodes_ui_imgui_elemental_imColor`

*File: `lua/ge/extensions/flowgraph/nodes/ui/imgui/elemental/imColor.lua` · VM: Game Engine (GE) · 37 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/ui/imgui/elemental/imColor")` (file under extensions/ but not a regular extension)

Flowgraph node "im Color" (category repeat_instant, tag imgui): imgui color picker (ColorEdit4 without numeric inputs, with alpha bar). Inputs: "text", "colorIn" (initial color, hidden; white by default). Output "colorOut" ({r,g,b,a}).

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)).

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Initializes the color from colorIn. | 23 |
| `C:work()` | Draws the picker and writes colorOut. | 31 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/ui/imgui/elemental/imColor.lua`.*
