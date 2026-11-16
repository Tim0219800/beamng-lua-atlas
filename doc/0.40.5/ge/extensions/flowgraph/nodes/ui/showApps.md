# `flowgraph_nodes_ui_showApps`

*File: `lua/ge/extensions/flowgraph/nodes/ui/showApps.lua` · VM: Game Engine (GE) · 40 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/ui/showApps")` (file under extensions/ but not a regular extension)

Flowgraph node "Show Apps" (category once_instant, author BeamNG): shows or hides the UI apps ('ShowApps' hook). Input "value" (bool).

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)).

| Method | Description | Line |
|---|---|---|
| `C:_afterTrigger()` | Sends 'ShowApps' with the stored value. | 31 |
| `C:_executionStarted()` | Clears the pending request. | 23 |
| `C:workOnce()` | Stores the value. | 27 |

**UI events (guihooks.trigger):** `ShowApps`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/ui/showApps.lua`.*
