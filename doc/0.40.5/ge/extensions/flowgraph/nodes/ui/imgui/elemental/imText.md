# `flowgraph_nodes_ui_imgui_elemental_imText`

*File: `lua/ge/extensions/flowgraph/nodes/ui/imgui/elemental/imText.lua` · VM: Game Engine (GE) · 35 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/ui/imgui/elemental/imText")` (file under extensions/ but not a regular extension)

Flowgraph node "im Text" (category repeat_instant, tag imgui): displays text with automatic word wrap in the current imgui window. Input "text" (any, converted with tostring).

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)).

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Effectively empty (no outputs). | 21 |
| `C:work()` | Displays the text (TextWrapped). | 27 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/ui/imgui/elemental/imText.lua`.*
