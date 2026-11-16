# `flowgraph_nodes_scene_hide`

*File: `lua/ge/extensions/flowgraph/nodes/scene/hide.lua` · VM: Game Engine (GE) · 44 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/scene/hide")` (file under extensions/ but not a regular extension)

Flowgraph node "Show/Hide Object" (repeat_instant). Hides or shows a scene object. Inputs: objID (number), hide (bool, true = hide). Sets obj.hidden then calls updateInstanceRenderData if the object has it.

## Notes

- If the id matches no object, obj is nil and the assignment obj.hidden raises a Lua error (no guard).

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:init()` | Nothing to initialize. | 23 |
| `C:work()` | Finds the object by id and applies hidden; reports the error "objID must be set" if the pin is empty. | 27 |

## Calls into the engine (C++)

- `obj:` `updateInstanceRenderData`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/scene/hide.lua`.*
