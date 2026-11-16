# `flowgraph_nodes_util_getMapObjectsDynField`

*File: `lua/ge/extensions/flowgraph/nodes/util/getMapObjectsDynField.lua` · VM: Game Engine (GE) · 47 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/util/getMapObjectsDynField")` (file under extensions/ but not a regular extension)

Node "Get Map Objects IDs by DynField" (repeat_instant). Returns the list of ids of the map objects (map.objects, hence the tracked vehicles) that have a given dynamic field. Input: dynamicFieldName. Output: objects (table of ids).

## Notes

- Only the field name is tested, not its value.
- Recomputed every frame: cost proportional to the number of objects.

## Class `C`

Flowgraph node class; each instance represents a node in a graph.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Sets oldPos to nil (field unused afterwards). | 24 |
| `C:findObjectsWithDynField(dynamicFieldName)` | Iterates over map.objects, reads object:getDynamicFields() and returns the ids for which a name matches. | 28 |
| `C:init(mgr)` | Does nothing. | 20 |
| `C:work()` | If the name is provided, recomputes the list every frame and writes it to objects. | 41 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/util/getMapObjectsDynField.lua`.*
