# `flowgraph_nodes_career_tasklistHeader`

*File: `lua/ge/extensions/flowgraph/nodes/career/tasklistHeader.lua` · VM: Game Engine (GE) · 33 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/career/tasklistHeader")` (file under extensions/ but not a regular extension)

Flowgraph node "Tasklist Header" (category once_instant, tags goal/goals, ui color/icon). Sets the header and subtext of the task list (Tasklist app) of the career tutorial, via the SetTasklistHeader guihook. Inputs: label and sub (any, text or translation object). Copies the input flow to the output.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:workOnce()` | Sends guihooks.trigger('SetTasklistHeader', {label, subtext}) then copies flow to the output. | 23 |

**UI events (guihooks.trigger):** `SetTasklistHeader`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/career/tasklistHeader.lua`.*
