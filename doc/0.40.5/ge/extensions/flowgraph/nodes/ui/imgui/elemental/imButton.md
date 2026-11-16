# `flowgraph_nodes_ui_imgui_elemental_imButton`

*File: `lua/ge/extensions/flowgraph/nodes/ui/imgui/elemental/imButton.lua` · VM: Game Engine (GE) · 54 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/ui/imgui/elemental/imButton")` (file under extensions/ but not a regular extension)

Flowgraph node "im Button" (category repeat_instant, tag imgui): full-width imgui button in the current window. Input "text". Outputs: "down" (pulse on click), "hold" (held, hidden), "up" (released, hidden).

## Notes

- States are detected only while the mouse hovers over the button.

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)).

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Outputs to false. | 24 |
| `C:work()` | Draws the button and updates down/hold/up according to the mouse. | 30 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/ui/imgui/elemental/imButton.lua`.*
