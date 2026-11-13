---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/api/object.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_api_object` : `extensions.load("editor_api_object")`, puis la globale `editor_api_object`
---@class editor_api_object
editor_api_object = {}

---Source : lua/ge/extensions/editor/api/object.lua:1408
---@param editorInstance any
function editor_api_object.initialize(editorInstance) end

--- Registered separately from initialize() to keep that function under Lua's 60 upvalue limit.
---Source : lua/ge/extensions/editor/api/object.lua:1482
function editor_api_object.initializeFocusLock() end

--- Classe locale `editor` de lua/ge/extensions/editor/api/object.lua
---@class editor_api_object_editor
local editor_api_object_editor = {}

--- Align objects by their bounding box, on the specific axis.
---  @param boundsAxis the axis for the bounds, values allowed:
---  *editor.AxisX* - the X axis
---  *editor.AxisY* - the Y axis
---  *editor.AxisZ* - the Z axis
---Source : lua/ge/extensions/editor/api/object.lua:685
---@param boundsAxis any
function editor_api_object_editor.alignObjectSelectionByBounds(boundsAxis) end

--- Align objects by their common averaged center, on the specific axis.
---  @param axis the center axis, values allowed:
---  *editor.AxisX* - the X axis
---  *editor.AxisY* - the Y axis
---  *editor.AxisZ* - the Z axis
---Source : lua/ge/extensions/editor/api/object.lua:755
---@param axis any
function editor_api_object_editor.alignObjectSelectionByCenter(axis) end

---Source : lua/ge/extensions/editor/api/object.lua:1050
---@param objects any
function editor_api_object_editor.calculateBoundingBoxCenter(objects) end

---Source : lua/ge/extensions/editor/api/object.lua:1005
---@param objects any
function editor_api_object_editor.calculateObjectsCenter(objects) end

---Source : lua/ge/extensions/editor/api/object.lua:45
---@param object any
function editor_api_object_editor.canManipulateObject(object) end

---Source : lua/ge/extensions/editor/api/object.lua:79
function editor_api_object_editor.clearFocusLock() end

---Source : lua/ge/extensions/editor/api/object.lua:475
function editor_api_object_editor.clearObjectSelection() end

---Source : lua/ge/extensions/editor/api/object.lua:189
---@param updateGizmo any
function editor_api_object_editor.computeSelectionBBox(updateGizmo) end

---Source : lua/ge/extensions/editor/api/object.lua:1253
function editor_api_object_editor.convertSelectedPrefabsToV2() end

---Source : lua/ge/extensions/editor/api/object.lua:354
---@param objectID any
function editor_api_object_editor.copyFields(objectID) end

--- Create a new prefab from the current selection.
---  @param newPrefabFilename prefab destination filename
--- TODO: add undo
---Source : lua/ge/extensions/editor/api/object.lua:1095
---@param newPrefabFilename any
---@param objName any
---@param loadmode any
---@param pathNative any
function editor_api_object_editor.createPrefabFromObjectSelection(newPrefabFilename, objName, loadmode, pathNative) end

---Source : lua/ge/extensions/editor/api/object.lua:467
function editor_api_object_editor.deleteSelectedObjects() end

---Source : lua/ge/extensions/editor/api/object.lua:648
function editor_api_object_editor.deselectObjectSelection() end

--- This function will enable editing mode on all objects. Usually used internally by the toggle editor mode.
---  @param enable if true, it will enable the edit mode on the objects
---Source : lua/ge/extensions/editor/api/object.lua:267
---@param enable any
function editor_api_object_editor.enableEditorOnObjects(enable) end

--- Explode the current selected object(s) from prefab to objects.
---Source : lua/ge/extensions/editor/api/object.lua:1211
function editor_api_object_editor.explodeSelectedPrefab() end

---Source : lua/ge/extensions/editor/api/object.lua:1355
---@param classname any
function editor_api_object_editor.findFirstSelectedByType(classname) end

---Source : lua/ge/extensions/editor/api/object.lua:346
---@param objectId any
function editor_api_object_editor.getDynamicFields(objectId) end

--- Returns a table with object field information
---  @param objectId the object's id
---  @param fieldName the field name
---  @returns the field info table
---Source : lua/ge/extensions/editor/api/object.lua:326
---@param objectId any
---@param fieldName any
function editor_api_object_editor.getFieldInfo(objectId, fieldName) end

---Source : lua/ge/extensions/editor/api/object.lua:238
---@param objectId any
---@param fieldName any
---@param arrayIndex any
function editor_api_object_editor.getFieldValue(objectId, fieldName, arrayIndex) end

---Source : lua/ge/extensions/editor/api/object.lua:338
---@param objectId any
function editor_api_object_editor.getFields(objectId) end

---Source : lua/ge/extensions/editor/api/object.lua:59
function editor_api_object_editor.getFocusLockedGroup() end

---Source : lua/ge/extensions/editor/api/object.lua:991
---@param objects any
function editor_api_object_editor.getHighestObject(objects) end

---Source : lua/ge/extensions/editor/api/object.lua:1367
function editor_api_object_editor.getObjectSelection() end

--- Select objects by a rectangle in the current camera viewport, screen space.
---  @param rect the 2D screen viewport rectangle object
---  @param forestData optional forest data source
---  @param objectFlags optional scene object type mask
---Source : lua/ge/extensions/editor/api/object.lua:574
---@param rect any
---@param forestData any
---@param objectFlags any
function editor_api_object_editor.getObjectsByRectangle(rect, forestData, objectFlags) end

---Source : lua/ge/extensions/editor/api/object.lua:173
function editor_api_object_editor.getSelectionCentroid() end

---Source : lua/ge/extensions/editor/api/object.lua:668
function editor_api_object_editor.hideObjectSelection() end

---Source : lua/ge/extensions/editor/api/object.lua:70
function editor_api_object_editor.isFocusLockActive() end

---Source : lua/ge/extensions/editor/api/object.lua:84
---@param object any
function editor_api_object_editor.isObjectInFocusLockedGroup(object) end

---Source : lua/ge/extensions/editor/api/object.lua:102
---@param object any
function editor_api_object_editor.isObjectSelectable(object) end

---Source : lua/ge/extensions/editor/api/object.lua:117
---@param objectId any
function editor_api_object_editor.isObjectSelected(objectId) end

---Source : lua/ge/extensions/editor/api/object.lua:113
function editor_api_object_editor.isObjectSelectionEmpty() end

--- Select all the objects in the level, care must be taken this might slow things down for various operations
---Source : lua/ge/extensions/editor/api/object.lua:656
function editor_api_object_editor.lockObjectSelection() end

---Source : lua/ge/extensions/editor/api/object.lua:28
---@param mtx any
function editor_api_object_editor.matrixToTable(mtx) end

---Source : lua/ge/extensions/editor/api/object.lua:417
---@param fields any
---@param targetObjectID any
function editor_api_object_editor.pasteFields(fields, targetObjectID) end

---Source : lua/ge/extensions/editor/api/object.lua:442
---@param fields any
---@param targetObject any
function editor_api_object_editor.pasteFieldsToObject(fields, targetObject) end

---Source : lua/ge/extensions/editor/api/object.lua:1371
---@param objectIds any
function editor_api_object_editor.removeInvalidObjects(objectIds) end

---Source : lua/ge/extensions/editor/api/object.lua:1382
function editor_api_object_editor.removeInvalidSelectedObjects() end

---Source : lua/ge/extensions/editor/api/object.lua:1329
---@param prefab any
---@param parentGroup any
---@param instanceName any
---@param position any
function editor_api_object_editor.replaceGroupWithPrefabInstance(prefab, parentGroup, instanceName, position) end

--- Reset the object selection's rotation to zero.
---Source : lua/ge/extensions/editor/api/object.lua:799
function editor_api_object_editor.resetObjectSelectionRotation() end

--- Reset the object selection's scale to 1,1,1.
---Source : lua/ge/extensions/editor/api/object.lua:809
function editor_api_object_editor.resetObjectSelectionScale() end

--- Reset the object selection transform, sets rotation to zero and scale to 1,1,1.
---Source : lua/ge/extensions/editor/api/object.lua:793
function editor_api_object_editor.resetObjectSelectionTransform() end

---Source : lua/ge/extensions/editor/api/object.lua:98
---@param defaultGroup any
function editor_api_object_editor.resolveAddGroup(defaultGroup) end

---Source : lua/ge/extensions/editor/api/object.lua:1394
---@param jsonString any
function editor_api_object_editor.restoreSimObjectMemento(jsonString) end

--- Rotate the selected objects by the delta quaternion.
---  @param deltaRotation* [QuatF] the delta quaternion object
---  @param centerPoint [vec3] if not nil, will be used to scale around it, relative to it
---Source : lua/ge/extensions/editor/api/object.lua:842
---@param gizmoTransform any
---@param centerPoint any
---@param initialTransformations any
---@param initialGizmoTransform any
function editor_api_object_editor.rotateObjectSelection(gizmoTransform, centerPoint, initialTransformations, initialGizmoTransform) end

---Source : lua/ge/extensions/editor/api/object.lua:1386
---@param obj any
function editor_api_object_editor.saveSimObjectMemento(obj) end

--- Scale the selected objects by the delta scale.
---  @param deltaScale [vec3] delta scale value
---  @param centerPoint [vec3] if not nil, will be used to scale around it, relative to it
---Source : lua/ge/extensions/editor/api/object.lua:885
---@param deltaScale any
---@param centerPoint any
function editor_api_object_editor.scaleObjectSelection(deltaScale, centerPoint) end

--- Select object by id, using selectMode.
---  @param id the object id
---  @param selectMode the selection mode, see editor.selectObjects
---Source : lua/ge/extensions/editor/api/object.lua:642
---@param id any
---@param selectMode any
function editor_api_object_editor.selectObjectById(id, selectMode) end

--- Select object ids.
---  @param idArray* - the array of object IDs
---  @param selectMode* - the select mode (if nil/not present, the mode is *editor.SelectMode_New*):
---  *editor.SelectMode_New* - the old selection is discarded
---  *editor.SelectMode_Add* - add (uniquely) the object ids to the current selection
---  *editor.SelectMode_Remove* - remove the ids from the current selection (if present)
---  *editor.SelectMode_Toggle* - if the ids are present, remove them, if they're absent, add them
---Source : lua/ge/extensions/editor/api/object.lua:548
---@param idArray any
---@param selectMode any
function editor_api_object_editor.selectObjects(idArray, selectMode) end

---Source : lua/ge/extensions/editor/api/object.lua:598
---@param nameMask any
---@param selectMode any
function editor_api_object_editor.selectObjectsByNameMask(nameMask, selectMode) end

---Source : lua/ge/extensions/editor/api/object.lua:560
---@param objects any
---@param selectMode any
function editor_api_object_editor.selectObjectsByRef(objects, selectMode) end

--- Select objects by class name.
---  @param className the class name of the objects to be selected
---  @param selectMode the selection mode, see editor.selectObjects
---Source : lua/ge/extensions/editor/api/object.lua:619
---@param typeName any
---@param selectMode any
function editor_api_object_editor.selectObjectsByType(typeName, selectMode) end

--- Set an object's dynamic field value.
---  For static fields, use `editor.setFieldValue`
---  @param objectId [number] the object id
---  @param fieldName [string] the field name
---  @param fieldValue [string] the field value as string
---Source : lua/ge/extensions/editor/api/object.lua:312
---@param objectId any
---@param fieldName any
---@param value any
---@param arrayIndex any
function editor_api_object_editor.setDynamicFieldValue(objectId, fieldName, value, arrayIndex) end

--- Set an object's field value.
---  For dynamic fields, use `editor.setDynamicFieldValue`
---  @param objectId [number] the object id
---  @param fieldName [string] the field name
---  @param fieldValue [string] the field value as string
---Source : lua/ge/extensions/editor/api/object.lua:297
---@param objectId any
---@param fieldName any
---@param value any
---@param arrayIndex any
function editor_api_object_editor.setFieldValue(objectId, fieldName, value, arrayIndex) end

---Source : lua/ge/extensions/editor/api/object.lua:74
---@param id any
function editor_api_object_editor.setFocusLockedGroup(id) end

---Source : lua/ge/extensions/editor/api/object.lua:247
---@param objectIds any
---@param selected any
function editor_api_object_editor.setObjectSelectedBool(objectIds, selected) end

---Source : lua/ge/extensions/editor/api/object.lua:257
---@param objectId any
---@param selected any
function editor_api_object_editor.setObjectSelectedBoolSingle(objectId, selected) end

---Source : lua/ge/extensions/editor/api/object.lua:779
function editor_api_object_editor.setObjectSelectionTransformFromCamera() end

---Source : lua/ge/extensions/editor/api/object.lua:674
function editor_api_object_editor.showObjectSelection() end

---Source : lua/ge/extensions/editor/api/object.lua:36
---@param tbl any
function editor_api_object_editor.tableToMatrix(tbl) end

--- Translate the object selection by the delta value.
---  @param deltaTranslate [vec3] delta value to move the selection
---Source : lua/ge/extensions/editor/api/object.lua:820
---@param deltaTranslate any
function editor_api_object_editor.translateObjectSelection(deltaTranslate) end

---Source : lua/ge/extensions/editor/api/object.lua:662
function editor_api_object_editor.unlockObjectSelection() end

---Source : lua/ge/extensions/editor/api/object.lua:1294
function editor_api_object_editor.unpackageSelectedPrefabInstance() end

---Source : lua/ge/extensions/editor/api/object.lua:282
---@param name any
---@param newName any
function editor_api_object_editor.validateObjectName(name, newName) end

