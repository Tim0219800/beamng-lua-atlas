# `flowgraph_nodes_input_getActionControl`

*File: `lua/ge/extensions/flowgraph/nodes/input/getActionControl.lua` · VM: Game Engine (GE) · 26 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/input/getActionControl")` (file under extensions/ but not a regular extension)

Flowgraph node "Get Action Control" (repeat_instant). Gives the control (key/button) bound to an input action via core_input_bindings.getControlForAction(actionName). Output: controlName.

## Class `C`

Flowgraph node class (created via `_flowgraph_createNode(C)`).

| Method | Description | Line |
|---|---|---|
| `C:work(args)` | Writes the control bound to actionName to controlName. | 21 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/input/getActionControl.lua`.*
