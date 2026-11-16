# `flowgraph_nodes_ui_getGamestate`

*File: `lua/ge/extensions/flowgraph/nodes/ui/getGamestate.lua` · VM: Game Engine (GE) · 29 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/ui/getGamestate")` (file under extensions/ but not a regular extension)

Flowgraph node "Get Gamestate" (category repeat_instant): reads the current UI state (core_gamestate.state.state). Output "state" (string).

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)).

| Method | Description | Line |
|---|---|---|
| `C:init()` | Empty. | 21 |
| `C:work()` | Writes core_gamestate.state.state to "state". | 24 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/ui/getGamestate.lua`.*
