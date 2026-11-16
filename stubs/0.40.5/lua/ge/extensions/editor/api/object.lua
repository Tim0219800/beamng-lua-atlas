---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/api/object.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Editor API for manipulating scene objects: selection (by id, reference, type, name mask, screen rectangle), reading/writing fields (static and dynamic, copy/paste), lock/hide, align, translate/rotate/scale the selection, centroid and bounding box, Focus-Lock on a group, prefabs (create, explode, convert to v2, unpack) and SimObject mementos. `initialize` installs everything on `editor` and defines the `editor.SelectMode_*` constants; `initializeFocusLock` adds the Focus-Lock functions. The selection lives in `editor.selection.object` (list of ids). The functions in this file do NOT record undo history: see objectHistoryActions for the `...WithUndo` versions.
--- Access: extension `editor_api_object`: `extensions.load("editor_api_object")`, then the global `editor_api_object`
---@class editor_api_object
editor_api_object = {}

--- Remembers the editor, defines editor.SelectMode_* and editor.objectSelectionBBox, and installs the selection, fields, alignment, transform and prefab functions on `editor`.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/api/object.lua:1408
---@param editorInstance table `editor` object
function editor_api_object.initialize(editorInstance) end

--- Separately installs the Focus-Lock functions (getFocusLockedGroup, isFocusLockActive, setFocusLockedGroup, clearFocusLock, isObjectInFocusLockedGroup, resolveAddGroup) to work around initialize's 60-upvalue limit.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/api/object.lua:1482
function editor_api_object.initializeFocusLock() end

--- Functions added to `editor` by initialize and initializeFocusLock.
---@class editor_api_object_editor
local editor_api_object_editor = {}

--- Aligns the objects to the extreme bounding box along the axis. boundsAxis values: 0-2 (editor.AxisX/Y/Z) = alignment on the max edge of that axis; 3-5 = min edge of the axis (value - 3). Does nothing (returns true) if there are fewer than 2 objects.
---Source: lua/ge/extensions/editor/api/object.lua:685
---@param boundsAxis integer 0-5 (see description)
---@return boolean  false if boundsAxis is outside 0..5, otherwise true
function editor_api_object_editor.alignObjectSelectionByBounds(boundsAxis) end

--- Aligns all manipulable objects to the coordinate of the first selected object for the given axis.
---Source: lua/ge/extensions/editor/api/object.lua:755
---@param axis integer editor.AxisX, AxisY or AxisZ
---@return boolean  false if the axis is invalid or the first object is not found, otherwise true
function editor_api_object_editor.alignObjectSelectionByCenter(axis) end

--- Computes the center of the bounding box of the non-group children of the given SimGroups (same limits as calculateObjectsCenter for subgroups).
---Source: lua/ge/extensions/editor/api/object.lua:1050
---@param objects integer[] group ids
---@return vec3  box center
function editor_api_object_editor.calculateBoundingBoxCenter(objects) end

--- Computes the center (average of positions) of the children of the given SimGroups. Non-group objects in the list are ignored; subgroups are not traversed (bug: `childId` is an undefined variable, so nothing is pushed). Divides by zero (NaN) if there are no children.
---Source: lua/ge/extensions/editor/api/object.lua:1005
---@param objects integer[] group ids
---@return vec3  center
function editor_api_object_editor.calculateObjectsCenter(objects) end

--- True if the object exists, is neither a SimSet nor a SimGroup, and is not locked.
---Source: lua/ge/extensions/editor/api/object.lua:45
---@param object userdata|nil object
---@return boolean  manipulable
function editor_api_object_editor.canManipulateObject(object) end

--- Disables Focus-Lock and emits onEditorFocusLockChanged.
---Source: lua/ge/extensions/editor/api/object.lua:79
function editor_api_object_editor.clearFocusLock() end

--- Deselects everything (on the C++ side too), sets the selection to nil, recomputes the bbox and emits onEditorObjectSelectionChanged.
---Source: lua/ge/extensions/editor/api/object.lua:475
function editor_api_object_editor.clearObjectSelection() end

--- Recomputes editor.objectSelectionBBox and editor.objectSelectionRadius from the selection's world boxes (infinite bounds ignored, falls back to the object box), updates the centroid and, by default, the gizmo (editor.updateObjectSelectionAxisGizmo).
---Source: lua/ge/extensions/editor/api/object.lua:189
---@param updateGizmo boolean|nil false to not update the gizmo (default true)
function editor_api_object_editor.computeSelectionBBox(updateGizmo) end

--- Converts the selected prefabs to v2 format and replaces them with instances (replaceGroupWithPrefabInstance) at the center of their box.
---Source: lua/ge/extensions/editor/api/object.lua:1253
---@return userdata[]|nil  instances created
function editor_api_object_editor.convertSelectedPrefabsToV2() end

--- Copies an object's field values (excluding the Transform group, name, persistentId, parentGroup), including array elements and dynamic fields.
---Source: lua/ge/extensions/editor/api/object.lua:354
---@param objectID integer object id
---@return table  {fields, dynamicFields, arrayElements}
function editor_api_object_editor.copyFields(objectID) end

--- Creates a Prefab from the selection: groups the valid objects into a SimGroup relative to the centroid, registers the Prefab in the group of the topmost object, saves it, deletes the old groups, selects the prefab and marks the level as modified. No undo (TODO).
---Source: lua/ge/extensions/editor/api/object.lua:1095
---@param newPrefabFilename string destination .prefab.json file
---@param objName string|nil object name (default: file name)
---@param loadmode string|nil "auto" or "manual"
---@param pathNative boolean|nil true if the path is native (converted to virtual)
---@return userdata|nil  the Prefab, nil if nothing valid
function editor_api_object_editor.createPrefabFromObjectSelection(newPrefabFilename, objName, loadmode, pathNative) end

--- Deletes (editor.deleteObject) all the selected objects and clears the selection. No history: for undo use deleteSelectedObjectsWithUndo.
---Source: lua/ge/extensions/editor/api/object.lua:467
function editor_api_object_editor.deleteSelectedObjects() end

--- Clears the selection (empty table, on the C++ side too) and emits onEditorObjectSelectionChanged.
---Source: lua/ge/extensions/editor/api/object.lua:648
function editor_api_object_editor.deselectObjectSelection() end

--- Calls onEditorEnable or onEditorDisable on all scene objects that have these methods. Used internally when toggling editor mode; does nothing if the level is not loaded.
---Source: lua/ge/extensions/editor/api/object.lua:267
---@param enable boolean true = enable edit mode
function editor_api_object_editor.enableEditorOnObjects(enable) end

--- Explodes the selected prefabs into object groups (name <prefab>_unpacked), deletes the prefabs, selects the groups and emits onEditorPrefabExploded(groups).
---Source: lua/ge/extensions/editor/api/object.lua:1211
---@return userdata[]|nil  groups created
function editor_api_object_editor.explodeSelectedPrefab() end

--- Returns the first selected object whose class name is classname.
---Source: lua/ge/extensions/editor/api/object.lua:1355
---@param classname string class name
---@return userdata|nil  object
function editor_api_object_editor.findFirstSelectedByType(classname) end

--- Returns the list of the object's dynamic field names.
---Source: lua/ge/extensions/editor/api/object.lua:346
---@param objectId integer object id
---@return string[]|nil  names
function editor_api_object_editor.getDynamicFields(objectId) end

--- Returns the type and flags of a field; empty table if the object does not exist.
---Source: lua/ge/extensions/editor/api/object.lua:326
---@param objectId integer object id
---@param fieldName string field name
---@return table  {type, flags}
function editor_api_object_editor.getFieldInfo(objectId, fieldName) end

--- Reads an object field as a string. Returns "" if the object does not exist.
---Source: lua/ge/extensions/editor/api/object.lua:238
---@param objectId integer object id
---@param fieldName string field name
---@param arrayIndex integer|nil index in an array field
---@return string  value
function editor_api_object_editor.getFieldValue(objectId, fieldName, arrayIndex) end

--- Returns the object's fields intended for the editor (getFieldsForEditor), keyed by name (id, groupName, type, elementCount, fields for arrays...).
---Source: lua/ge/extensions/editor/api/object.lua:338
---@param objectId integer object id
---@return table|nil  fields
function editor_api_object_editor.getFields(objectId) end

--- Returns the group on which Focus-Lock is active (the scene tree shows only it, only its objects are selectable in the view, new objects are created in it). Clears the lock if it points to a deleted group.
---Source: lua/ge/extensions/editor/api/object.lua:59
---@return userdata|nil  locked group
function editor_api_object_editor.getFocusLockedGroup() end

--- Returns, among the given ids, the object that is shallowest in the group hierarchy.
---Source: lua/ge/extensions/editor/api/object.lua:991
---@param objects integer[] ids
---@return userdata|nil  topmost object
function editor_api_object_editor.getHighestObject(objects) end

--- Returns the list of selected ids (empty table if none).
---Source: lua/ge/extensions/editor/api/object.lua:1367
---@return integer[]  ids
function editor_api_object_editor.getObjectSelection() end

--- Returns the objects (or forest items if forestData is provided) whose volume intersects a screen rectangle, via a frustum derived from the camera frustum.
---Source: lua/ge/extensions/editor/api/object.lua:574
---@param rect table screen rectangle {topLeft, bottomRight}
---@param forestData userdata|nil optional ForestData
---@param objectFlags integer|nil type mask (default terrain, water, static shape, player, item, vehicle, light)
---@return table  list of objects/items
---@return Frustum  frustum of the rectangle
function editor_api_object_editor.getObjectsByRectangle(rect, forestData, objectFlags) end

--- Returns the selection center: average of the positions, or the center of the bounding box if the gizmos.general.useObjectBoxCenter preference is true (unless an object has global bounds). vec3(0,0,0) if empty.
---Source: lua/ge/extensions/editor/api/object.lua:173
---@return vec3  center
function editor_api_object_editor.getSelectionCentroid() end

--- Hides the selected objects (hidden = "true").
---Source: lua/ge/extensions/editor/api/object.lua:668
function editor_api_object_editor.hideObjectSelection() end

--- True if a valid Focus-Lock is active.
---Source: lua/ge/extensions/editor/api/object.lua:70
---@return boolean  active
function editor_api_object_editor.isFocusLockActive() end

--- True if no Focus-Lock is active, or if the object is the locked group or one of its descendants.
---Source: lua/ge/extensions/editor/api/object.lua:84
---@param object userdata|nil object
---@return boolean  in the locked group
function editor_api_object_editor.isObjectInFocusLockedGroup(object) end

--- True if the object is in the Focus-Lock group and, for a SceneObject, if its selection is enabled.
---Source: lua/ge/extensions/editor/api/object.lua:102
---@param object userdata object
---@return boolean  selectable
function editor_api_object_editor.isObjectSelectable(object) end

--- True if the id is part of the object selection.
---Source: lua/ge/extensions/editor/api/object.lua:117
---@param objectId integer object id
---@return boolean  selected
function editor_api_object_editor.isObjectSelected(objectId) end

--- True if the object selection is empty.
---Source: lua/ge/extensions/editor/api/object.lua:113
---@return boolean  empty
function editor_api_object_editor.isObjectSelectionEmpty() end

--- Locks the selected objects (locked = "true" field). The original comment ("Select all the objects") is wrong. Not undoable (see lockObjectSelectionWithUndo).
---Source: lua/ge/extensions/editor/api/object.lua:656
function editor_api_object_editor.lockObjectSelection() end

--- Converts a MatrixF into a serializable table {c0, c1, c2, c3} (columns).
---Source: lua/ge/extensions/editor/api/object.lua:28
---@param mtx MatrixF matrix
---@return table  {c0, c1, c2, c3}
function editor_api_object_editor.matrixToTable(mtx) end

--- Applies a copy of copyFields onto an object by id (via setFieldValue/setDynamicFieldValue), reloads the road templates if useTemplate == "true" and marks the level as modified.
---Source: lua/ge/extensions/editor/api/object.lua:417
---@param fields table result of copyFields
---@param targetObjectID integer target id
function editor_api_object_editor.pasteFields(fields, targetObjectID) end

--- Like pasteFields but on an already resolved object (calls setField directly, without preApply/postApply).
---Source: lua/ge/extensions/editor/api/object.lua:442
---@param fields table result of copyFields
---@param targetObject userdata target object
function editor_api_object_editor.pasteFieldsToObject(fields, targetObject) end

--- Returns a copy of the list without the ids that no longer match an existing object.
---Source: lua/ge/extensions/editor/api/object.lua:1371
---@param objectIds integer[] ids
---@return integer[]  valid ids
function editor_api_object_editor.removeInvalidObjects(objectIds) end

--- Removes from the selection the ids of objects that no longer exist.
---Source: lua/ge/extensions/editor/api/object.lua:1382
function editor_api_object_editor.removeInvalidSelectedObjects() end

--- Spawns an instance of the v2 prefab (spawn, scale 1, zero rotation) at the given position, adds it to the parent group and requests a collision rebuild.
---Source: lua/ge/extensions/editor/api/object.lua:1329
---@param prefab userdata|nil v2 prefab
---@param parentGroup userdata|nil parent group
---@param instanceName string instance name
---@param position vec3 position
---@return userdata|nil  instance
function editor_api_object_editor.replaceGroupWithPrefabInstance(prefab, parentGroup, instanceName, position) end

--- Resets the rotation to "0 0 0 0" of the selected manipulable objects.
---Source: lua/ge/extensions/editor/api/object.lua:799
function editor_api_object_editor.resetObjectSelectionRotation() end

--- Resets the scale to "1 1 1" of the selected manipulable objects.
---Source: lua/ge/extensions/editor/api/object.lua:809
function editor_api_object_editor.resetObjectSelectionScale() end

--- Resets rotation to zero and scale to 1,1,1 for the selection.
---Source: lua/ge/extensions/editor/api/object.lua:793
function editor_api_object_editor.resetObjectSelectionTransform() end

--- Returns the Focus-Lock group if it exists, otherwise defaultGroup (group where new objects are added).
---Source: lua/ge/extensions/editor/api/object.lua:98
---@param defaultGroup userdata|nil default group
---@return userdata|nil  target group
function editor_api_object_editor.resolveAddGroup(defaultGroup) end

--- Recreates an object from a memento: removes persistentId, deserializes and gives a unique name (Sim.getUniqueName) derived from the original name.
---Source: lua/ge/extensions/editor/api/object.lua:1394
---@param jsonString string memento from saveSimObjectMemento
---@return userdata|nil  new object
function editor_api_object_editor.restoreSimObjectMemento(jsonString) end

--- Applies the gizmo rotation to the selected objects from the initial state, around centerPoint (positions and orientations). Does nothing without initialTransformations.
---Source: lua/ge/extensions/editor/api/object.lua:842
---@param gizmoTransform MatrixF current gizmo transform
---@param centerPoint vec3 rotation center
---@param initialTransformations MatrixF[] object transforms at the start of the drag
---@param initialGizmoTransform MatrixF gizmo transform at the start of the drag
function editor_api_object_editor.rotateObjectSelection(gizmoTransform, centerPoint, initialTransformations, initialGizmoTransform) end

--- Serializes an object to JSON text (memento), "" if nil.
---Source: lua/ge/extensions/editor/api/object.lua:1386
---@param obj userdata|nil object
---@return string  JSON
function editor_api_object_editor.saveSimObjectMemento(obj) end

--- Scales the selected objects by a delta, around centerPoint (bbox center by default), with bounds 0.01 to 1000 and excluding axes with a zero delta; positions are scaled in the gizmo's frame.
---Source: lua/ge/extensions/editor/api/object.lua:885
---@param deltaScale vec3 scale delta (does nothing if zero length)
---@param centerPoint vec3|nil scale center
function editor_api_object_editor.scaleObjectSelection(deltaScale, centerPoint) end

--- Selects an object by id according to the mode.
---Source: lua/ge/extensions/editor/api/object.lua:642
---@param id integer object id
---@param selectMode integer|nil mode: editor.SelectMode_New (1, default), _Add (2), _Remove (3), _Toggle (4)
---@return boolean  selection changed
function editor_api_object_editor.selectObjectById(id, selectMode) end

--- Modifies the object selection according to the mode, updates the C++ side state, recomputes the bbox and emits onEditorObjectSelectionChanged if it changed. Does not go through the history.
---Source: lua/ge/extensions/editor/api/object.lua:548
---@param idArray integer[] object ids
---@param selectMode integer|nil mode: editor.SelectMode_New (1, default), _Add (2), _Remove (3), _Toggle (4)
---@return boolean  true if the selection changed
function editor_api_object_editor.selectObjects(idArray, selectMode) end

--- Selects the objects whose name contains the Lua pattern (string.find).
---Source: lua/ge/extensions/editor/api/object.lua:598
---@param nameMask string Lua pattern
---@param selectMode integer|nil mode: editor.SelectMode_New (1, default), _Add (2), _Remove (3), _Toggle (4)
---@return boolean  selection changed
function editor_api_object_editor.selectObjectsByNameMask(nameMask, selectMode) end

--- Like selectObjects but with objects rather than ids.
---Source: lua/ge/extensions/editor/api/object.lua:560
---@param objects table list of objects
---@param selectMode integer|nil mode: editor.SelectMode_New (1, default), _Add (2), _Remove (3), _Toggle (4)
---@return boolean  selection changed
function editor_api_object_editor.selectObjectsByRef(objects, selectMode) end

--- Selects the objects whose `className` equals typeName.
---Source: lua/ge/extensions/editor/api/object.lua:619
---@param typeName string class name
---@param selectMode integer|nil mode: editor.SelectMode_New (1, default), _Add (2), _Remove (3), _Toggle (4)
---@return boolean  selection changed
function editor_api_object_editor.selectObjectsByType(typeName, selectMode) end

--- Sets a dynamic field of an object (index 0 by default). For a static field use setFieldValue.
---Source: lua/ge/extensions/editor/api/object.lua:312
---@param objectId integer object id
---@param fieldName string name
---@param value string value as text
---@param arrayIndex integer|nil index (0)
function editor_api_object_editor.setDynamicFieldValue(objectId, fieldName, value, arrayIndex) end

--- Sets a static field of an object (preApply, setField, marks editor-dirty, postApply). Does not go through the history: for undo use editor.changeObjectFieldWithUndo.
---Source: lua/ge/extensions/editor/api/object.lua:297
---@param objectId integer object id
---@param fieldName string field name
---@param value string value as text
---@param arrayIndex integer|string|nil array index (passed through tostring; nil becomes the string "nil")
function editor_api_object_editor.setFieldValue(objectId, fieldName, value, arrayIndex) end

--- Enables Focus-Lock on the group with the given id and emits onEditorFocusLockChanged.
---Source: lua/ge/extensions/editor/api/object.lua:74
---@param id integer id of the SimGroup
function editor_api_object_editor.setFocusLockedGroup(id) end

--- Marks/unmarks each object as selected on the C++ side (setSelected) then rebuilds the shape instance data.
---Source: lua/ge/extensions/editor/api/object.lua:247
---@param objectIds integer[]|nil ids
---@param selected boolean|nil selected (false if nil)
function editor_api_object_editor.setObjectSelectedBool(objectIds, selected) end

--- Same for a single object.
---Source: lua/ge/extensions/editor/api/object.lua:257
---@param objectId integer|nil id
---@param selected boolean selected
function editor_api_object_editor.setObjectSelectedBoolSingle(objectId, selected) end

--- Places each selected manipulable object at the editor camera's transform while keeping its scale (no undo, TODO in the code).
---Source: lua/ge/extensions/editor/api/object.lua:779
function editor_api_object_editor.setObjectSelectionTransformFromCamera() end

--- Shows the selected objects (hidden = "false").
---Source: lua/ge/extensions/editor/api/object.lua:674
function editor_api_object_editor.showObjectSelection() end

--- Rebuilds a MatrixF from a table {c0, c1, c2, c3}.
---Source: lua/ge/extensions/editor/api/object.lua:36
---@param tbl table table produced by matrixToTable
---@return MatrixF  matrix
function editor_api_object_editor.tableToMatrix(tbl) end

--- Translates the selected manipulable objects by a delta (via setFieldValue "position").
---Source: lua/ge/extensions/editor/api/object.lua:820
---@param deltaTranslate vec3 position delta (meters)
function editor_api_object_editor.translateObjectSelection(deltaTranslate) end

--- Unlocks the selected objects (locked = "false").
---Source: lua/ge/extensions/editor/api/object.lua:662
function editor_api_object_editor.unlockObjectSelection() end

--- Unpackages the selected prefab instances (unpackage) into groups and deletes the instances.
---Source: lua/ge/extensions/editor/api/object.lua:1294
---@return userdata[]|nil  groups created
function editor_api_object_editor.unpackageSelectedPrefabInstance() end

--- Validates an object name (isValidObjectName); rejects an empty name when newName is true.
---Source: lua/ge/extensions/editor/api/object.lua:282
---@param name string name
---@param newName boolean|nil true if it is a new name
---@return boolean  valid
function editor_api_object_editor.validateObjectName(name, newName) end

