# `flowgraph_nodes_ui_hideGameUI`

*File: `lua/ge/extensions/flowgraph/nodes/ui/hideGameUI.lua` · VM: Game Engine (GE) · 29 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/ui/hideGameUI")` (file under extensions/ but not a regular extension)

Flowgraph node "Hide Game UI" (category repeat_instant, author BeamNG): shows or hides the normal game UI (apps, etc.) with extensions.ui_visibility.setCef(not value). Input "value" (true = hide).

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)).

| Method | Description | Line |
|---|---|---|
| `C:work()` | Calls ui_visibility.setCef(not value) every frame. | 23 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/ui/hideGameUI.lua`.*
