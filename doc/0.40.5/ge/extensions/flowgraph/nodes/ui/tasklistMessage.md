# `flowgraph_nodes_ui_tasklistMessage`

*File: `lua/ge/extensions/flowgraph/nodes/ui/tasklistMessage.lua` · VM: Game Engine (GE) · 45 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/ui/tasklistMessage")` (file under extensions/ but not a regular extension)

Flowgraph node "Tasklist Message" (category once_instant, duration): displays a message-type objective in the Goal List app ('SetTasklistTask' hook, type 'message'). Inputs: "label", "sub" (subtext, hidden), "identifier" (flowgraph), "clear" (hidden, true by default), "active" (hidden, true). Output: propagated flow.

## Notes

- The app does not accept a label that starts with a digit (todo from the code).
- By default 'clear' is true: the objective is cleared unless the pin is set to false.

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)).

| Method | Description | Line |
|---|---|---|
| `C:workOnce()` | Sends the objective to the UI and propagates the flow. | 27 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/ui/tasklistMessage.lua`.*
