# `flowgraph_nodes_ui_hideEditor`

*File: `lua/ge/extensions/flowgraph/nodes/ui/hideEditor.lua` · VM: Game Engine (GE) · 38 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/ui/hideEditor")` (file under extensions/ but not a regular extension)

Flowgraph node "Show Editor" (category once_instant, author BeamNG): shows or hides the World Editor. Input "value" (bool, true = visible). The action is applied after the trigger (_afterTrigger) via editor.setEditorActive if the state changes.

## Notes

- The file name (hideEditor) differs from the node name (Show Editor).

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)).

| Method | Description | Line |
|---|---|---|
| `C:_afterTrigger()` | Applies editor.setEditorActive if different from editor.active. | 27 |
| `C:workOnce()` | Stores the requested value. | 23 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/ui/hideEditor.lua`.*
