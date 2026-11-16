# `flowgraph_nodes_ui_imgui_elemental_imSeparator`

*File: `lua/ge/extensions/flowgraph/nodes/ui/imgui/elemental/imSeparator.lua` · VM: Game Engine (GE) · 44 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/ui/imgui/elemental/imSeparator")` (file under extensions/ but not a regular extension)

Flowgraph node "im Separator" (category repeat_instant, tag imgui): horizontal separator in an imgui window, with adjustable space above and below (data.aboveSpacing and data.belowSpacing, 5 px by default). No pins.

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)).

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Effectively empty (no outputs). | 27 |
| `C:init()` | Spacings at 5. | 19 |
| `C:postInit()` | Empty. | 23 |
| `C:work()` | Draws space, separator, space. | 33 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/ui/imgui/elemental/imSeparator.lua`.*
