# `flowgraph_nodes_scene_getObjectField`

*File: `lua/ge/extensions/flowgraph/nodes/scene/getObjectField.lua` · VM: Game Engine (GE) · 37 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/scene/getObjectField")` (file under extensions/ but not a regular extension)

Flowgraph node "Get Object Field" (repeat_instant). Reads a field of a scene object (scenetree.findObjectById). Inputs: objectId, fieldName, fieldArrayNum (optional, 0 by default, hidden). Output: value (any). Uses getField if the field is declared, otherwise getDynDataFieldbyName (dynamic field).

## Notes

- Nothing is written if the object is not found: the output keeps its old value.
- getField generally returns a string.

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:work()` | Finds the object, then writes value with obj:getField(name, index) if the name is in obj:getFields(), otherwise with obj:getDynDataFieldbyName. | 24 |

## Calls into the engine (C++)

- `obj:` `getDynDataFieldbyName`, `getField`, `getFields`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/scene/getObjectField.lua`.*
