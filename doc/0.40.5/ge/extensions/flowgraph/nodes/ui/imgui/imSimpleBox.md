# `flowgraph_nodes_ui_imgui_imSimpleBox`

*File: `lua/ge/extensions/flowgraph/nodes/ui/imgui/imSimpleBox.lua` · VM: Game Engine (GE) · 36 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/ui/imgui/imSimpleBox")` (file under extensions/ but not a regular extension)

Flowgraph node "im Simple Text Box" (category repeat_instant, tag imgui): minimal imgui window with a title and a text. Inputs: "title" (default 'Some Title'), "text" (default 'Some Text').

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)).

| Method | Description | Line |
|---|---|---|
| `C:drawMiddle(builder, style)` | Empty central area. | 23 |
| `C:work()` | Opens an imgui window, displays the text and closes it. | 27 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/ui/imgui/imSimpleBox.lua`.*
