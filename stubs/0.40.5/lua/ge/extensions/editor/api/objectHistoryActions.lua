---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/api/objectHistoryActions.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Undoable (undo/redo) actions of the level editor for scene objects: creation, deletion (object or whole group, restored by serialization), field or dynamic field change, selection, transform, scale, hook call. Each action is recorded via `editor.history:commitAction`. The module returns a FUNCTION: calling it installs `editor.lockObjectSelectionWithUndo` & co on `editor` then returns the function table (M). An editor tool uses the `...WithUndo` functions to make its modifications undoable.
--- Access: `require("extensions/editor/api/objectHistoryActions")` (file under extensions/ but not a regular extension)
---@class editor_api_objectHistoryActions
editor_api_objectHistoryActions = {}

--- Records a "CallHook" action whose undo and redo both call extensions.hook(hookName, ...). (dynamically assigned)
---Source: lua/ge/extensions/editor/api/objectHistoryActions.lua:dyn
---@param hookName string hook name
---@param ... any arguments passed to the hook
function editor_api_objectHistoryActions.callHookWithUndo(hookName, ...) end

--- Applies the new value of a dynamic field and emits onEditorInspectorDynFieldChanged. (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/api/objectHistoryActions.lua:dyn
---@param actionData table {objectIds, fieldName, newFieldValue, arrayIndex}
function editor_api_objectHistoryActions.changeObjectDynFieldRedo(actionData) end

--- Restores the old values of a dynamic field and emits onEditorInspectorDynFieldChanged. (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/api/objectHistoryActions.lua:dyn
---@param actionData table {objectIds, fieldName, oldFieldValues, arrayIndex}
function editor_api_objectHistoryActions.changeObjectDynFieldUndo(actionData) end

--- Changes a dynamic field on several objects in an undoable way. (dynamically assigned)
---Source: lua/ge/extensions/editor/api/objectHistoryActions.lua:dyn
---@param objIds integer[] object ids
---@param fieldName string dynamic field name
---@param newFieldValue string new value
---@param arrayIndex integer|nil index (not converted to a string here)
function editor_api_objectHistoryActions.changeObjectDynFieldWithUndo(objIds, fieldName, newFieldValue, arrayIndex) end

--- Like changeObjectFieldWithUndo but with a different value per object. (dynamically assigned)
---Source: lua/ge/extensions/editor/api/objectHistoryActions.lua:dyn
---@param objIds integer[] object ids
---@param fieldName string field name
---@param newFieldValues table values, same order as objIds
---@param arrayIndex integer|nil index in an array field
function editor_api_objectHistoryActions.changeObjectFieldMultipleValuesWithUndo(objIds, fieldName, newFieldValues, arrayIndex) end

--- Applies the new field value on all objects and emits onEditorInspectorFieldChanged. (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/api/objectHistoryActions.lua:dyn
---@param actionData table {objectIds, fieldName, newFieldValue, arrayIndex}
function editor_api_objectHistoryActions.changeObjectFieldRedo(actionData) end

--- Restores the old field values on all objects, updates the gizmo/bbox and emits onEditorInspectorFieldChanged. (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/api/objectHistoryActions.lua:dyn
---@param actionData table {objectIds, fieldName, oldFieldValues, arrayIndex}
function editor_api_objectHistoryActions.changeObjectFieldUndo(actionData) end

--- Like changeObjectFieldWithUndo but the caller supplies the old values itself (useful when the field was already modified during an interactive edit). (dynamically assigned)
---Source: lua/ge/extensions/editor/api/objectHistoryActions.lua:dyn
---@param objIds integer[] object ids
---@param fieldName string field name
---@param newFieldValue string new value
---@param oldFieldValues table old values, same order as objIds
---@param arrayIndex integer|nil index in an array field
function editor_api_objectHistoryActions.changeObjectFieldWithOldValues(objIds, fieldName, newFieldValue, oldFieldValues, arrayIndex) end

--- Changes a field on several objects while remembering the old values (getField). (dynamically assigned)
---Source: lua/ge/extensions/editor/api/objectHistoryActions.lua:dyn
---@param objIds integer[] object ids
---@param fieldName string field name
---@param newFieldValue string new value (same for all)
---@param arrayIndex integer|nil index in an array field
function editor_api_objectHistoryActions.changeObjectFieldWithUndo(objIds, fieldName, newFieldValue, arrayIndex) end

--- Creates an object of class actionData.className, registers it under actionData.name and adds it to the group actionData.parentId or to MissionGroup; remembers the new id (reuses the old one via setForcedId) and emits onEditorObjectAdded. (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/api/objectHistoryActions.lua:dyn
---@param actionData table {name, className, parentId?, objectId?}
---@return integer|nil  id of the created object (nil if MissionGroup is absent)
function editor_api_objectHistoryActions.createObjectRedo(actionData) end

--- Undoes a creation: deletes the object actionData.objectId and sets objectId to nil. (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/api/objectHistoryActions.lua:dyn
---@param actionData table {objectId}
function editor_api_objectHistoryActions.createObjectUndo(actionData) end

--- Creates an object via an undoable "CreateObject" action and marks the editor as modified. (dynamically assigned)
---Source: lua/ge/extensions/editor/api/objectHistoryActions.lua:dyn
---@param name string registration name
---@param className string C++ class to create
function editor_api_objectHistoryActions.createObjectWithUndo(name, className) end

--- Serializes the object (or the group hierarchy) then deletes it with editor.deleteObject, unless it is locked. (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/api/objectHistoryActions.lua:dyn
---@param actionData table {objectId}
function editor_api_objectHistoryActions.deleteObjectRedo(actionData) end

--- Restores the deleted object (or whole group) from serializedData with its original id, puts it back before nextObjIdInGroup and emits onEditorObjectAdded. (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/api/objectHistoryActions.lua:dyn
---@param actionData table {objectId, serializedData, isSimSet?, nextObjIdInGroup?}
function editor_api_objectHistoryActions.deleteObjectUndo(actionData) end

--- Deletes an object via an undoable "DeleteObject" action, clears the selection and marks the editor as modified. (dynamically assigned)
---Source: lua/ge/extensions/editor/api/objectHistoryActions.lua:dyn
---@param objId integer object id
function editor_api_objectHistoryActions.deleteObjectWithUndo(objId) end

--- Deletes all the selected objects in a single "DeleteSelectedObjects" transaction. Does nothing if the selection is empty. (dynamically assigned)
---Source: lua/ge/extensions/editor/api/objectHistoryActions.lua:dyn
function editor_api_objectHistoryActions.deleteSelectedObjectsWithUndo() end

--- Applies the new selection (newSelection), recomputes the bbox and emits onEditorObjectSelectionChanged. (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/api/objectHistoryActions.lua:dyn
---@param actionData table {newSelection}
function editor_api_objectHistoryActions.selectObjectsRedo(actionData) end

--- Restores the old selection (oldSelection), recomputes the bbox and emits onEditorObjectSelectionChanged. (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/api/objectHistoryActions.lua:dyn
---@param actionData table {oldSelection}
function editor_api_objectHistoryActions.selectObjectsUndo(actionData) end

--- Changes the object selection in an undoable way. Ignores the call if the old and new selections are equal, or if the last action is already a SelectObjects with the same new selection. (dynamically assigned)
---Source: lua/ge/extensions/editor/api/objectHistoryActions.lua:dyn
---@param newSelection integer[] new selected ids
---@param oldSelection integer[] previously selected ids
function editor_api_objectHistoryActions.selectObjectsWithUndo(newSelection, oldSelection) end

--- Applies newScale to the object. (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/api/objectHistoryActions.lua:dyn
---@param actionData table {objectId, newScale}
function editor_api_objectHistoryActions.setObjectScaleRedo(actionData) end

--- Restores oldScale on the object. (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/api/objectHistoryActions.lua:dyn
---@param actionData table {objectId, oldScale}
function editor_api_objectHistoryActions.setObjectScaleUndo(actionData) end

--- Applies newTransform to the object. (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/api/objectHistoryActions.lua:dyn
---@param actionData table {objectId, newTransform}
function editor_api_objectHistoryActions.setObjectTransformRedo(actionData) end

--- Restores the old transform (oldTransform, table converted to a matrix) on the object. (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/api/objectHistoryActions.lua:dyn
---@param actionData table {objectId, oldTransform}
function editor_api_objectHistoryActions.setObjectTransformUndo(actionData) end

--- Functions added to `editor` when the function returned by the module is called. They act on editor.selection.object.
---@class editor_api_objectHistoryActions_editor
local editor_api_objectHistoryActions_editor = {}

--- Hides (hidden = "true") the selected objects, undoable.
---Source: lua/ge/extensions/editor/api/objectHistoryActions.lua:343
function editor_api_objectHistoryActions_editor.hideObjectSelectionWithUndo() end

--- Locks (locked = "true") the selected objects, undoable.
---Source: lua/ge/extensions/editor/api/objectHistoryActions.lua:335
function editor_api_objectHistoryActions_editor.lockObjectSelectionWithUndo() end

--- Shows (hidden = "false") the selected objects, undoable.
---Source: lua/ge/extensions/editor/api/objectHistoryActions.lua:347
function editor_api_objectHistoryActions_editor.showObjectSelectionWithUndo() end

--- Unlocks (locked = "false") the selected objects, undoable.
---Source: lua/ge/extensions/editor/api/objectHistoryActions.lua:339
function editor_api_objectHistoryActions_editor.unlockObjectSelectionWithUndo() end

