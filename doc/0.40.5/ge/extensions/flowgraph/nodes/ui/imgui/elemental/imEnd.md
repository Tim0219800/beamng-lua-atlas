# `flowgraph_nodes_ui_imgui_elemental_imEnd`

*File: `lua/ge/extensions/flowgraph/nodes/ui/imgui/elemental/imEnd.lua` · VM: Game Engine (GE) · 24 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/ui/imgui/elemental/imEnd")` (file under extensions/ but not a regular extension)

Flowgraph node "im End" (category repeat_instant, tag imgui): ends the imgui window opened by "im Begin" (im.End). No pins.

## Notes

- An im End without a matching im Begin causes an imgui error.

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)).

| Method | Description | Line |
|---|---|---|
| `C:work()` | Calls im.End(). | 19 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/ui/imgui/elemental/imEnd.lua`.*
