# `editor_api_object`

*File: `lua/ge/extensions/editor/api/object.lua` · VM: Game Engine (GE) · 1495 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_api_object`: `extensions.load("editor_api_object")`, then the global `editor_api_object`

Editor API for manipulating scene objects: selection (by id, reference, type, name mask, screen rectangle), reading/writing fields (static and dynamic, copy/paste), lock/hide, align, translate/rotate/scale the selection, centroid and bounding box, Focus-Lock on a group, prefabs (create, explode, convert to v2, unpack) and SimObject mementos. `initialize` installs everything on `editor` and defines the `editor.SelectMode_*` constants; `initializeFocusLock` adds the Focus-Lock functions. The selection lives in `editor.selection.object` (list of ids). The functions in this file do NOT record undo history: see objectHistoryActions for the `...WithUndo` versions.

## Example

```lua
editor.selectObjectById(objId)
local sel = editor.getObjectSelection()
editor.setFieldValue(sel[1], "position", "0 0 10")
```

## Notes

- Constants: editor.SelectMode_New = 1, _Add = 2, _Remove = 3, _Toggle = 4.
- Field values are strings (e.g. position "x y z", rotation "0 0 0 0", scale "1 1 1").
- Emitted hooks: onEditorObjectSelectionChanged, onEditorFocusLockChanged, onEditorPrefabExploded(groups). The file header lists other hooks (onEditorObjectCreated, ...Delete, ...SelectionLocked/Unlocked/Shown/Hidden/TransformChanged, onEditorPrefabCreated) that are not emitted from this file.
- `initialize` is deliberately split from `initializeFocusLock` to stay under Lua's 60-upvalue limit.
- Bug: in calculateObjectsCenter and calculateBoundingBoxCenter, `table.insert(stack, childId)` uses an undefined variable (the code reads `childObjId`): subgroups are never traversed.
- Probable bug: alignObjectSelectionByBounds starts looking for the reference object at index 2, so the first object is never a candidate.
- debugObjectSelection is defined but not exported.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_api_object.initialize(editorInstance)` | Remembers the editor, defines editor.SelectMode_* and editor.objectSelectionBBox, and installs the selection, fields, alignment, transform and prefab functions on `editor`. *(internal)* | 1408 |
| `editor_api_object.initializeFocusLock()` | Separately installs the Focus-Lock functions (getFocusLockedGroup, isFocusLockActive, setFocusLockedGroup, clearFocusLock, isObjectInFocusLockedGroup, resolveAddGroup) to work around initialize's 60-upvalue limit. *(internal)* | 1482 |

### Parameter details

#### `editor_api_object.initialize(editorInstance)`

Remembers the editor, defines editor.SelectMode_* and editor.objectSelectionBBox, and installs the selection, fields, alignment, transform and prefab functions on `editor`.

- `editorInstance` (*table*) : `editor` object

## Class `editor`

Functions added to `editor` by initialize and initializeFocusLock.

Object `editor` built inside the module (e.g. by `new`), with these methods:

| Method | Description | Line |
|---|---|---|
| `editor.alignObjectSelectionByBounds(boundsAxis)` | Aligns the objects to the extreme bounding box along the axis. boundsAxis values: 0-2 (editor.AxisX/Y/Z) = alignment on the max edge of that axis; 3-5 = min edge of the axis (value - 3). Does nothing (returns true) if there are fewer than 2 objects. | 685 |
| `editor.alignObjectSelectionByCenter(axis)` | Aligns all manipulable objects to the coordinate of the first selected object for the given axis. | 755 |
| `editor.calculateBoundingBoxCenter(objects)` | Computes the center of the bounding box of the non-group children of the given SimGroups (same limits as calculateObjectsCenter for subgroups). | 1050 |
| `editor.calculateObjectsCenter(objects)` | Computes the center (average of positions) of the children of the given SimGroups. Non-group objects in the list are ignored; subgroups are not traversed (bug: `childId` is an undefined variable, so nothing is pushed). Divides by zero (NaN) if there are no children. | 1005 |
| `editor.canManipulateObject(object)` | True if the object exists, is neither a SimSet nor a SimGroup, and is not locked. | 45 |
| `editor.clearFocusLock()` | Disables Focus-Lock and emits onEditorFocusLockChanged. | 79 |
| `editor.clearObjectSelection()` | Deselects everything (on the C++ side too), sets the selection to nil, recomputes the bbox and emits onEditorObjectSelectionChanged. | 475 |
| `editor.computeSelectionBBox(updateGizmo)` | Recomputes editor.objectSelectionBBox and editor.objectSelectionRadius from the selection's world boxes (infinite bounds ignored, falls back to the object box), updates the centroid and, by default, the gizmo (editor.updateObjectSelectionAxisGizmo). | 189 |
| `editor.convertSelectedPrefabsToV2()` | Converts the selected prefabs to v2 format and replaces them with instances (replaceGroupWithPrefabInstance) at the center of their box. | 1253 |
| `editor.copyFields(objectID)` | Copies an object's field values (excluding the Transform group, name, persistentId, parentGroup), including array elements and dynamic fields. | 354 |
| `editor.createPrefabFromObjectSelection(newPrefabFilename, objName, loadmode, pathNative)` | Creates a Prefab from the selection: groups the valid objects into a SimGroup relative to the centroid, registers the Prefab in the group of the topmost object, saves it, deletes the old groups, selects the prefab and marks the level as modified. No undo (TODO). | 1095 |
| `editor.deleteSelectedObjects()` | Deletes (editor.deleteObject) all the selected objects and clears the selection. No history: for undo use deleteSelectedObjectsWithUndo. | 467 |
| `editor.deselectObjectSelection()` | Clears the selection (empty table, on the C++ side too) and emits onEditorObjectSelectionChanged. | 648 |
| `editor.enableEditorOnObjects(enable)` | Calls onEditorEnable or onEditorDisable on all scene objects that have these methods. Used internally when toggling editor mode; does nothing if the level is not loaded. | 267 |
| `editor.explodeSelectedPrefab()` | Explodes the selected prefabs into object groups (name <prefab>_unpacked), deletes the prefabs, selects the groups and emits onEditorPrefabExploded(groups). | 1211 |
| `editor.findFirstSelectedByType(classname)` | Returns the first selected object whose class name is classname. | 1355 |
| `editor.getDynamicFields(objectId)` | Returns the list of the object's dynamic field names. | 346 |
| `editor.getFieldInfo(objectId, fieldName)` | Returns the type and flags of a field; empty table if the object does not exist. | 326 |
| `editor.getFieldValue(objectId, fieldName, arrayIndex)` | Reads an object field as a string. Returns "" if the object does not exist. | 238 |
| `editor.getFields(objectId)` | Returns the object's fields intended for the editor (getFieldsForEditor), keyed by name (id, groupName, type, elementCount, fields for arrays...). | 338 |
| `editor.getFocusLockedGroup()` | Returns the group on which Focus-Lock is active (the scene tree shows only it, only its objects are selectable in the view, new objects are created in it). Clears the lock if it points to a deleted group. | 59 |
| `editor.getHighestObject(objects)` | Returns, among the given ids, the object that is shallowest in the group hierarchy. | 991 |
| `editor.getObjectSelection()` | Returns the list of selected ids (empty table if none). | 1367 |
| `editor.getObjectsByRectangle(rect, forestData, objectFlags)` | Returns the objects (or forest items if forestData is provided) whose volume intersects a screen rectangle, via a frustum derived from the camera frustum. | 574 |
| `editor.getSelectionCentroid()` | Returns the selection center: average of the positions, or the center of the bounding box if the gizmos.general.useObjectBoxCenter preference is true (unless an object has global bounds). vec3(0,0,0) if empty. | 173 |
| `editor.hideObjectSelection()` | Hides the selected objects (hidden = "true"). | 668 |
| `editor.isFocusLockActive()` | True if a valid Focus-Lock is active. | 70 |
| `editor.isObjectInFocusLockedGroup(object)` | True if no Focus-Lock is active, or if the object is the locked group or one of its descendants. | 84 |
| `editor.isObjectSelectable(object)` | True if the object is in the Focus-Lock group and, for a SceneObject, if its selection is enabled. | 102 |
| `editor.isObjectSelected(objectId)` | True if the id is part of the object selection. | 117 |
| `editor.isObjectSelectionEmpty()` | True if the object selection is empty. | 113 |
| `editor.lockObjectSelection()` | Locks the selected objects (locked = "true" field). The original comment ("Select all the objects") is wrong. Not undoable (see lockObjectSelectionWithUndo). | 656 |
| `editor.matrixToTable(mtx)` | Converts a MatrixF into a serializable table {c0, c1, c2, c3} (columns). | 28 |
| `editor.pasteFields(fields, targetObjectID)` | Applies a copy of copyFields onto an object by id (via setFieldValue/setDynamicFieldValue), reloads the road templates if useTemplate == "true" and marks the level as modified. | 417 |
| `editor.pasteFieldsToObject(fields, targetObject)` | Like pasteFields but on an already resolved object (calls setField directly, without preApply/postApply). | 442 |
| `editor.removeInvalidObjects(objectIds)` | Returns a copy of the list without the ids that no longer match an existing object. | 1371 |
| `editor.removeInvalidSelectedObjects()` | Removes from the selection the ids of objects that no longer exist. | 1382 |
| `editor.replaceGroupWithPrefabInstance(prefab, parentGroup, instanceName, position)` | Spawns an instance of the v2 prefab (spawn, scale 1, zero rotation) at the given position, adds it to the parent group and requests a collision rebuild. | 1329 |
| `editor.resetObjectSelectionRotation()` | Resets the rotation to "0 0 0 0" of the selected manipulable objects. | 799 |
| `editor.resetObjectSelectionScale()` | Resets the scale to "1 1 1" of the selected manipulable objects. | 809 |
| `editor.resetObjectSelectionTransform()` | Resets rotation to zero and scale to 1,1,1 for the selection. | 793 |
| `editor.resolveAddGroup(defaultGroup)` | Returns the Focus-Lock group if it exists, otherwise defaultGroup (group where new objects are added). | 98 |
| `editor.restoreSimObjectMemento(jsonString)` | Recreates an object from a memento: removes persistentId, deserializes and gives a unique name (Sim.getUniqueName) derived from the original name. | 1394 |
| `editor.rotateObjectSelection(gizmoTransform, centerPoint, initialTransformations, initialGizmoTransform)` | Applies the gizmo rotation to the selected objects from the initial state, around centerPoint (positions and orientations). Does nothing without initialTransformations. | 842 |
| `editor.saveSimObjectMemento(obj)` | Serializes an object to JSON text (memento), "" if nil. | 1386 |
| `editor.scaleObjectSelection(deltaScale, centerPoint)` | Scales the selected objects by a delta, around centerPoint (bbox center by default), with bounds 0.01 to 1000 and excluding axes with a zero delta; positions are scaled in the gizmo's frame. | 885 |
| `editor.selectObjectById(id, selectMode)` | Selects an object by id according to the mode. | 642 |
| `editor.selectObjects(idArray, selectMode)` | Modifies the object selection according to the mode, updates the C++ side state, recomputes the bbox and emits onEditorObjectSelectionChanged if it changed. Does not go through the history. | 548 |
| `editor.selectObjectsByNameMask(nameMask, selectMode)` | Selects the objects whose name contains the Lua pattern (string.find). | 598 |
| `editor.selectObjectsByRef(objects, selectMode)` | Like selectObjects but with objects rather than ids. | 560 |
| `editor.selectObjectsByType(typeName, selectMode)` | Selects the objects whose `className` equals typeName. | 619 |
| `editor.setDynamicFieldValue(objectId, fieldName, value, arrayIndex)` | Sets a dynamic field of an object (index 0 by default). For a static field use setFieldValue. | 312 |
| `editor.setFieldValue(objectId, fieldName, value, arrayIndex)` | Sets a static field of an object (preApply, setField, marks editor-dirty, postApply). Does not go through the history: for undo use editor.changeObjectFieldWithUndo. | 297 |
| `editor.setFocusLockedGroup(id)` | Enables Focus-Lock on the group with the given id and emits onEditorFocusLockChanged. | 74 |
| `editor.setObjectSelectedBool(objectIds, selected)` | Marks/unmarks each object as selected on the C++ side (setSelected) then rebuilds the shape instance data. | 247 |
| `editor.setObjectSelectedBoolSingle(objectId, selected)` | Same for a single object. | 257 |
| `editor.setObjectSelectionTransformFromCamera()` | Places each selected manipulable object at the editor camera's transform while keeping its scale (no undo, TODO in the code). | 779 |
| `editor.showObjectSelection()` | Shows the selected objects (hidden = "false"). | 674 |
| `editor.tableToMatrix(tbl)` | Rebuilds a MatrixF from a table {c0, c1, c2, c3}. | 36 |
| `editor.translateObjectSelection(deltaTranslate)` | Translates the selected manipulable objects by a delta (via setFieldValue "position"). | 820 |
| `editor.unlockObjectSelection()` | Unlocks the selected objects (locked = "false"). | 662 |
| `editor.unpackageSelectedPrefabInstance()` | Unpackages the selected prefab instances (unpackage) into groups and deletes the instances. | 1294 |
| `editor.validateObjectName(name, newName)` | Validates an object name (isValidObjectName); rejects an empty name when newName is true. | 282 |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onEditorFocusLockChanged` — listened to by 1 module(s)
- `onEditorObjectSelectionChanged` — listened to by 8 module(s)
- `onEditorPrefabExploded` — listened to by 2 module(s)

## Calls into the engine (C++)

- `Engine.` `sceneGetCameraFrustum`, `setNeedCollisionRebuild`
- `FS:` `native2Virtual`
- `Sim.` `deserializeObjectFromText`, `findObjectById`, `getUniqueName`, `upcast`
- `obj:` `getClassName`, `getDynamicFields`, `getField`, `getFieldFlags`, `getFieldType`, `getFieldsForEditor`, `getId`, `getObjBox`, `getTransform`, `getWorldBox`, `isGlobalBounds`, `isSubClassOf`, `onEditorDisable`, `onEditorEnable`, `postApply`, `preApply`, `serialize`, `setCanSave`, `setDynDataFieldbyName`, `setEditorDirty`, `setField`, `setName`, `setSelected`, `setTransform`
- `scenetree.` `findObject`, `findObjectById`, `getAllObjects`
- `worldEditorCppApi.` `rebuildShapeManagerInstanceData`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/api/object.lua`.*
