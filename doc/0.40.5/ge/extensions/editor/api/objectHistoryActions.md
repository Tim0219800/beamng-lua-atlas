# `editor_api_objectHistoryActions`

*File: `lua/ge/extensions/editor/api/objectHistoryActions.lua` · VM: Game Engine (GE) · 412 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/editor/api/objectHistoryActions")` (file under extensions/ but not a regular extension)

Undoable (undo/redo) actions of the level editor for scene objects: creation, deletion (object or whole group, restored by serialization), field or dynamic field change, selection, transform, scale, hook call. Each action is recorded via `editor.history:commitAction`. The module returns a FUNCTION: calling it installs `editor.lockObjectSelectionWithUndo` & co on `editor` then returns the function table (M). An editor tool uses the `...WithUndo` functions to make its modifications undoable.

## Example

```lua
local actions = require("editor/api/objectHistoryActions")()
actions.changeObjectFieldWithUndo({objId}, "hidden", "true")
```

## Notes

- Field values are strings (e.g. "true"/"false" for locked/hidden). A numeric arrayIndex >= 0 is converted to a string; nil becomes "".
- A position/rotation/scale change recomputes the selection bbox (editor.computeSelectionBBox).
- Emitted hooks: onEditorObjectAdded(objectId), onEditorInspectorFieldChanged(objectIds, fieldName, values, arrayIndex), onEditorInspectorDynFieldChanged(objectIds, fieldName, values, arrayIndex), onEditorObjectSelectionChanged().
- `changeObjectFieldMultipleValuesUndo/Redo` exist in the file but are not exported; `changeObjectFieldMultipleValuesWithUndo` is not in M either (inferred: absent from the export list).
- A locked object (isLocked) is not deleted by deleteObjectRedo; the action is still pushed onto the stack.
- Deleting a group (SimSet/SimGroup) serializes the whole hierarchy (JSON per object) and restores it with the same ids (SimObject.setForcedId); the order in the parent group is restored via nextObjIdInGroup.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_api_objectHistoryActions.callHookWithUndo(hookName, ...)` | Records a "CallHook" action whose undo and redo both call extensions.hook(hookName, ...). (dynamically assigned) | dyn |
| `editor_api_objectHistoryActions.changeObjectDynFieldRedo(actionData)` | Applies the new value of a dynamic field and emits onEditorInspectorDynFieldChanged. (dynamically assigned) *(internal)* | dyn |
| `editor_api_objectHistoryActions.changeObjectDynFieldUndo(actionData)` | Restores the old values of a dynamic field and emits onEditorInspectorDynFieldChanged. (dynamically assigned) *(internal)* | dyn |
| `editor_api_objectHistoryActions.changeObjectDynFieldWithUndo(objIds, fieldName, newFieldValue, arrayIndex)` | Changes a dynamic field on several objects in an undoable way. (dynamically assigned) | dyn |
| `editor_api_objectHistoryActions.changeObjectFieldMultipleValuesWithUndo(objIds, fieldName, newFieldValues, arrayIndex)` | Like changeObjectFieldWithUndo but with a different value per object. (dynamically assigned) | dyn |
| `editor_api_objectHistoryActions.changeObjectFieldRedo(actionData)` | Applies the new field value on all objects and emits onEditorInspectorFieldChanged. (dynamically assigned) *(internal)* | dyn |
| `editor_api_objectHistoryActions.changeObjectFieldUndo(actionData)` | Restores the old field values on all objects, updates the gizmo/bbox and emits onEditorInspectorFieldChanged. (dynamically assigned) *(internal)* | dyn |
| `editor_api_objectHistoryActions.changeObjectFieldWithOldValues(objIds, fieldName, newFieldValue, oldFieldValues, arrayIndex)` | Like changeObjectFieldWithUndo but the caller supplies the old values itself (useful when the field was already modified during an interactive edit). (dynamically assigned) | dyn |
| `editor_api_objectHistoryActions.changeObjectFieldWithUndo(objIds, fieldName, newFieldValue, arrayIndex)` | Changes a field on several objects while remembering the old values (getField). (dynamically assigned) | dyn |
| `editor_api_objectHistoryActions.createObjectRedo(actionData)` | Creates an object of class actionData.className, registers it under actionData.name and adds it to the group actionData.parentId or to MissionGroup; remembers the new id (reuses the old one via setForcedId) and emits onEditorObjectAdded. (dynamically assigned) *(internal)* | dyn |
| `editor_api_objectHistoryActions.createObjectUndo(actionData)` | Undoes a creation: deletes the object actionData.objectId and sets objectId to nil. (dynamically assigned) *(internal)* | dyn |
| `editor_api_objectHistoryActions.createObjectWithUndo(name, className)` | Creates an object via an undoable "CreateObject" action and marks the editor as modified. (dynamically assigned) | dyn |
| `editor_api_objectHistoryActions.deleteObjectRedo(actionData)` | Serializes the object (or the group hierarchy) then deletes it with editor.deleteObject, unless it is locked. (dynamically assigned) *(internal)* | dyn |
| `editor_api_objectHistoryActions.deleteObjectUndo(actionData)` | Restores the deleted object (or whole group) from serializedData with its original id, puts it back before nextObjIdInGroup and emits onEditorObjectAdded. (dynamically assigned) *(internal)* | dyn |
| `editor_api_objectHistoryActions.deleteObjectWithUndo(objId)` | Deletes an object via an undoable "DeleteObject" action, clears the selection and marks the editor as modified. (dynamically assigned) | dyn |
| `editor_api_objectHistoryActions.deleteSelectedObjectsWithUndo()` | Deletes all the selected objects in a single "DeleteSelectedObjects" transaction. Does nothing if the selection is empty. (dynamically assigned) | dyn |
| `editor_api_objectHistoryActions.selectObjectsRedo(actionData)` | Applies the new selection (newSelection), recomputes the bbox and emits onEditorObjectSelectionChanged. (dynamically assigned) *(internal)* | dyn |
| `editor_api_objectHistoryActions.selectObjectsUndo(actionData)` | Restores the old selection (oldSelection), recomputes the bbox and emits onEditorObjectSelectionChanged. (dynamically assigned) *(internal)* | dyn |
| `editor_api_objectHistoryActions.selectObjectsWithUndo(newSelection, oldSelection)` | Changes the object selection in an undoable way. Ignores the call if the old and new selections are equal, or if the last action is already a SelectObjects with the same new selection. (dynamically assigned) | dyn |
| `editor_api_objectHistoryActions.setObjectScaleRedo(actionData)` | Applies newScale to the object. (dynamically assigned) *(internal)* | dyn |
| `editor_api_objectHistoryActions.setObjectScaleUndo(actionData)` | Restores oldScale on the object. (dynamically assigned) *(internal)* | dyn |
| `editor_api_objectHistoryActions.setObjectTransformRedo(actionData)` | Applies newTransform to the object. (dynamically assigned) *(internal)* | dyn |
| `editor_api_objectHistoryActions.setObjectTransformUndo(actionData)` | Restores the old transform (oldTransform, table converted to a matrix) on the object. (dynamically assigned) *(internal)* | dyn |

### Parameter details

#### `editor_api_objectHistoryActions.callHookWithUndo(hookName, ...)`

Records a "CallHook" action whose undo and redo both call extensions.hook(hookName, ...). (dynamically assigned)

- `hookName` (*string*) : hook name
- `...` (*any*) : arguments passed to the hook

#### `editor_api_objectHistoryActions.changeObjectDynFieldRedo(actionData)`

Applies the new value of a dynamic field and emits onEditorInspectorDynFieldChanged. (dynamically assigned)

- `actionData` (*table*) : {objectIds, fieldName, newFieldValue, arrayIndex}

#### `editor_api_objectHistoryActions.changeObjectDynFieldUndo(actionData)`

Restores the old values of a dynamic field and emits onEditorInspectorDynFieldChanged. (dynamically assigned)

- `actionData` (*table*) : {objectIds, fieldName, oldFieldValues, arrayIndex}

#### `editor_api_objectHistoryActions.changeObjectDynFieldWithUndo(objIds, fieldName, newFieldValue, arrayIndex)`

Changes a dynamic field on several objects in an undoable way. (dynamically assigned)

- `objIds` (*integer[]*) : object ids
- `fieldName` (*string*) : dynamic field name
- `newFieldValue` (*string*) : new value
- `arrayIndex` (*integer|nil*) : index (not converted to a string here)

#### `editor_api_objectHistoryActions.changeObjectFieldMultipleValuesWithUndo(objIds, fieldName, newFieldValues, arrayIndex)`

Like changeObjectFieldWithUndo but with a different value per object. (dynamically assigned)

- `objIds` (*integer[]*) : object ids
- `fieldName` (*string*) : field name
- `newFieldValues` (*table*) : values, same order as objIds
- `arrayIndex` (*integer|nil*) : index in an array field

#### `editor_api_objectHistoryActions.changeObjectFieldRedo(actionData)`

Applies the new field value on all objects and emits onEditorInspectorFieldChanged. (dynamically assigned)

- `actionData` (*table*) : {objectIds, fieldName, newFieldValue, arrayIndex}

#### `editor_api_objectHistoryActions.changeObjectFieldUndo(actionData)`

Restores the old field values on all objects, updates the gizmo/bbox and emits onEditorInspectorFieldChanged. (dynamically assigned)

- `actionData` (*table*) : {objectIds, fieldName, oldFieldValues, arrayIndex}

#### `editor_api_objectHistoryActions.changeObjectFieldWithOldValues(objIds, fieldName, newFieldValue, oldFieldValues, arrayIndex)`

Like changeObjectFieldWithUndo but the caller supplies the old values itself (useful when the field was already modified during an interactive edit). (dynamically assigned)

- `objIds` (*integer[]*) : object ids
- `fieldName` (*string*) : field name
- `newFieldValue` (*string*) : new value
- `oldFieldValues` (*table*) : old values, same order as objIds
- `arrayIndex` (*integer|nil*) : index in an array field

#### `editor_api_objectHistoryActions.changeObjectFieldWithUndo(objIds, fieldName, newFieldValue, arrayIndex)`

Changes a field on several objects while remembering the old values (getField). (dynamically assigned)

- `objIds` (*integer[]*) : object ids
- `fieldName` (*string*) : field name
- `newFieldValue` (*string*) : new value (same for all)
- `arrayIndex` (*integer|nil*) : index in an array field

#### `editor_api_objectHistoryActions.createObjectRedo(actionData)`

Creates an object of class actionData.className, registers it under actionData.name and adds it to the group actionData.parentId or to MissionGroup; remembers the new id (reuses the old one via setForcedId) and emits onEditorObjectAdded. (dynamically assigned)

- `actionData` (*table*) : {name, className, parentId?, objectId?}
- **returns**: integer|nil id of the created object (nil if MissionGroup is absent)

#### `editor_api_objectHistoryActions.createObjectUndo(actionData)`

Undoes a creation: deletes the object actionData.objectId and sets objectId to nil. (dynamically assigned)

- `actionData` (*table*) : {objectId}

#### `editor_api_objectHistoryActions.createObjectWithUndo(name, className)`

Creates an object via an undoable "CreateObject" action and marks the editor as modified. (dynamically assigned)

- `name` (*string*) : registration name
- `className` (*string*) : C++ class to create

#### `editor_api_objectHistoryActions.deleteObjectRedo(actionData)`

Serializes the object (or the group hierarchy) then deletes it with editor.deleteObject, unless it is locked. (dynamically assigned)

- `actionData` (*table*) : {objectId}

#### `editor_api_objectHistoryActions.deleteObjectUndo(actionData)`

Restores the deleted object (or whole group) from serializedData with its original id, puts it back before nextObjIdInGroup and emits onEditorObjectAdded. (dynamically assigned)

- `actionData` (*table*) : {objectId, serializedData, isSimSet?, nextObjIdInGroup?}

#### `editor_api_objectHistoryActions.deleteObjectWithUndo(objId)`

Deletes an object via an undoable "DeleteObject" action, clears the selection and marks the editor as modified. (dynamically assigned)

- `objId` (*integer*) : object id

#### `editor_api_objectHistoryActions.selectObjectsRedo(actionData)`

Applies the new selection (newSelection), recomputes the bbox and emits onEditorObjectSelectionChanged. (dynamically assigned)

- `actionData` (*table*) : {newSelection}

#### `editor_api_objectHistoryActions.selectObjectsUndo(actionData)`

Restores the old selection (oldSelection), recomputes the bbox and emits onEditorObjectSelectionChanged. (dynamically assigned)

- `actionData` (*table*) : {oldSelection}

#### `editor_api_objectHistoryActions.selectObjectsWithUndo(newSelection, oldSelection)`

Changes the object selection in an undoable way. Ignores the call if the old and new selections are equal, or if the last action is already a SelectObjects with the same new selection. (dynamically assigned)

- `newSelection` (*integer[]*) : new selected ids
- `oldSelection` (*integer[]*) : previously selected ids

#### `editor_api_objectHistoryActions.setObjectScaleRedo(actionData)`

Applies newScale to the object. (dynamically assigned)

- `actionData` (*table*) : {objectId, newScale}

#### `editor_api_objectHistoryActions.setObjectScaleUndo(actionData)`

Restores oldScale on the object. (dynamically assigned)

- `actionData` (*table*) : {objectId, oldScale}

#### `editor_api_objectHistoryActions.setObjectTransformRedo(actionData)`

Applies newTransform to the object. (dynamically assigned)

- `actionData` (*table*) : {objectId, newTransform}

#### `editor_api_objectHistoryActions.setObjectTransformUndo(actionData)`

Restores the old transform (oldTransform, table converted to a matrix) on the object. (dynamically assigned)

- `actionData` (*table*) : {objectId, oldTransform}

## Class `editor`

Functions added to `editor` when the function returned by the module is called. They act on editor.selection.object.

Object `editor` built inside the module (e.g. by `new`), with these methods:

| Method | Description | Line |
|---|---|---|
| `editor.hideObjectSelectionWithUndo()` | Hides (hidden = "true") the selected objects, undoable. | 343 |
| `editor.lockObjectSelectionWithUndo()` | Locks (locked = "true") the selected objects, undoable. | 335 |
| `editor.showObjectSelectionWithUndo()` | Shows (hidden = "false") the selected objects, undoable. | 347 |
| `editor.unlockObjectSelectionWithUndo()` | Unlocks (locked = "false") the selected objects, undoable. | 339 |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onEditorInspectorDynFieldChanged` — listened to by 1 module(s)
- `onEditorInspectorFieldChanged` — listened to by 9 module(s)
- `onEditorObjectAdded` — listened to by 3 module(s)
- `onEditorObjectSelectionChanged` — listened to by 8 module(s)

## Calls into the engine (C++)

- `Sim.` `deserializeObjectsFromText`, `findObjectById`, `upcast`
- `obj:` `delete`, `getClassName`, `getDynDataFieldbyName`, `getField`, `getGroup`, `getId`, `isLocked`, `isSubClassOf`, `registerObject`, `serialize`, `setScale`, `setTransform`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/api/objectHistoryActions.lua`.*
