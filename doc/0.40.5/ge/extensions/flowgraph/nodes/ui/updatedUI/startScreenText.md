# `flowgraph_nodes_ui_updatedUI_startScreenText`

*File: `lua/ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenText.lua` · VM: Game Engine (GE) · 61 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/ui/updatedUI/startScreenText")` (file under extensions/ but not a regular extension)

Node "StartScreen Text Panel" (repeat_instant, color ui). Adds a text panel with a header to the start screen. Inputs: flow, header and text (string or table), experimental (hidden, obsolete), flavour (hidden; default, experimental or info). Output: flow (chainFlow).

## Class `C`

Flowgraph node class; each instance represents a node in a graph.

| Method | Description | Line |
|---|---|---|
| `C:postInit()` | Defines the enforced templates of the flavour pin: default, experimental, info. | 25 |
| `C:work()` | Copies flow; if text is non-empty, adds a textPanel. If the header is "missions.missions.general.rules" or "Rules", the panel goes on the rules page instead of main. experimental=true forces the "experimental" flavour. | 32 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenText.lua`.*
