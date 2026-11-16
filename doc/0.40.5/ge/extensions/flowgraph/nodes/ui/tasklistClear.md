# `flowgraph_nodes_ui_tasklistClear`

*File: `lua/ge/extensions/flowgraph/nodes/ui/tasklistClear.lua` · VM: Game Engine (GE) · 24 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/ui/tasklistClear")` (file under extensions/ but not a regular extension)

Flowgraph node "Clear Goals" (category once_instant, author BeamNG): clears all objectives from the task list ('ClearTasklist' hook). No pins.

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)).

| Method | Description | Line |
|---|---|---|
| `C:workOnce()` | guihooks.trigger('ClearTasklist'). | 19 |

**UI events (guihooks.trigger):** `ClearTasklist`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/ui/tasklistClear.lua`.*
