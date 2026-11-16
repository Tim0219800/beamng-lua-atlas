# `flowgraph_nodes_ui_clearMessage`

*File: `lua/ge/extensions/flowgraph/nodes/ui/clearMessage.lua` · VM: Game Engine (GE) · 24 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/ui/clearMessage")` (file under extensions/ but not a regular extension)

Flowgraph node "Clear Messages" (category once_instant, author BeamNG): clears all messages displayed in the UI. No pins. Triggers the UI hook 'ClearAllMessages' (guihooks.trigger).

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)).

| Method | Description | Line |
|---|---|---|
| `C:workOnce()` | Calls guihooks.trigger('ClearAllMessages'). | 19 |

**UI events (guihooks.trigger):** `ClearAllMessages`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/ui/clearMessage.lua`.*
