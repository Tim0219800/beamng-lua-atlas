# `flowgraph_nodes_scene_setObjectField`

*File: `lua/ge/extensions/flowgraph/nodes/scene/setObjectField.lua` · VM: Game Engine (GE) · 44 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/scene/setObjectField")` (file under extensions/ but not a regular extension)

Flowgraph node "Set Object Field" (repeat_instant). Modifies a field of a scene object by id. Inputs: objectId, fieldName, fieldArrayNum (hidden, 0), value (any; a table is converted to a space-separated string). Output: objectFound. Uses setField if the field is declared, otherwise setDynDataFieldbyName, then updateInstanceRenderData if available.

## Notes

- Does nothing if value is nil or false (test `not value`): impossible to write false with this node.
- Tables are concatenated by table.concat: only valid for lists of numbers/strings.

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:work()` | Looks up the object, converts the value and writes it to the field (declared or dynamic). | 24 |

## Calls into the engine (C++)

- `obj:` `getFields`, `setDynDataFieldbyName`, `setField`, `updateInstanceRenderData`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/scene/setObjectField.lua`.*
