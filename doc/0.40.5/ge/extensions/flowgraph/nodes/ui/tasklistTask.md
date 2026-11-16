# `flowgraph_nodes_ui_tasklistTask`

*File: `lua/ge/extensions/flowgraph/nodes/ui/tasklistTask.lua` · VM: Game Engine (GE) · 49 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/ui/tasklistTask")` (file under extensions/ but not a regular extension)

Flowgraph node "Tasklist Task" (category once_instant, duration): displays a task in the Tasklist app ('SetTasklistTask' hook, type 'goal'). Inputs: "label", "sub", "identifier", "done", "fail", "clear" (true by default), "active", "attention" (blinks). Output: propagated flow.

## Notes

- The app does not accept a label that starts with a digit (todo from the code).
- By default 'clear' is true.

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)).

| Method | Description | Line |
|---|---|---|
| `C:workOnce()` | Sends the task to the UI and propagates the flow. | 30 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/ui/tasklistTask.lua`.*
