# `editor_api_object`

*Fichier : `lua/ge/extensions/editor/api/object.lua` · VM : Game Engine (GE) · 1495 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_api_object` : `extensions.load("editor_api_object")`, puis la globale `editor_api_object`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_api_object.initialize(editorInstance)` |  | 1408 |
| `editor_api_object.initializeFocusLock()` | Registered separately from initialize() to keep that function under Lua's 60 upvalue limit. | 1482 |

## Classe `editor`

Objet `editor` construit dans le module (par ex. par `new`), avec ces méthodes :

| Méthode | Description | Ligne |
|---|---|---|
| `editor.alignObjectSelectionByBounds(boundsAxis)` | Align objects by their bounding box, on the specific axis.<br> @param boundsAxis the axis for the bounds, values allowed:<br> *editor.AxisX* - the X axis<br> *editor.AxisY* - the Y axis<br> *editor.AxisZ* - the Z axis | 685 |
| `editor.alignObjectSelectionByCenter(axis)` | Align objects by their common averaged center, on the specific axis.<br> @param axis the center axis, values allowed:<br> *editor.AxisX* - the X axis<br> *editor.AxisY* - the Y axis<br> *editor.AxisZ* - the Z axis | 755 |
| `editor.calculateBoundingBoxCenter(objects)` |  | 1050 |
| `editor.calculateObjectsCenter(objects)` |  | 1005 |
| `editor.canManipulateObject(object)` |  | 45 |
| `editor.clearFocusLock()` |  | 79 |
| `editor.clearObjectSelection()` |  | 475 |
| `editor.computeSelectionBBox(updateGizmo)` |  | 189 |
| `editor.convertSelectedPrefabsToV2()` |  | 1253 |
| `editor.copyFields(objectID)` |  | 354 |
| `editor.createPrefabFromObjectSelection(newPrefabFilename, objName, loadmode, pathNative)` | Create a new prefab from the current selection.<br> @param newPrefabFilename prefab destination filename<br>TODO: add undo | 1095 |
| `editor.deleteSelectedObjects()` |  | 467 |
| `editor.deselectObjectSelection()` |  | 648 |
| `editor.enableEditorOnObjects(enable)` | This function will enable editing mode on all objects. Usually used internally by the toggle editor mode.<br> @param enable if true, it will enable the edit mode on the objects | 267 |
| `editor.explodeSelectedPrefab()` | Explode the current selected object(s) from prefab to objects. | 1211 |
| `editor.findFirstSelectedByType(classname)` |  | 1355 |
| `editor.getDynamicFields(objectId)` |  | 346 |
| `editor.getFieldInfo(objectId, fieldName)` | Returns a table with object field information<br> @param objectId the object's id<br> @param fieldName the field name<br> @returns the field info table | 326 |
| `editor.getFieldValue(objectId, fieldName, arrayIndex)` |  | 238 |
| `editor.getFields(objectId)` |  | 338 |
| `editor.getFocusLockedGroup()` |  | 59 |
| `editor.getHighestObject(objects)` |  | 991 |
| `editor.getObjectSelection()` |  | 1367 |
| `editor.getObjectsByRectangle(rect, forestData, objectFlags)` | Select objects by a rectangle in the current camera viewport, screen space.<br> @param rect the 2D screen viewport rectangle object<br> @param forestData optional forest data source<br> @param objectFlags optional scene object type mask | 574 |
| `editor.getSelectionCentroid()` |  | 173 |
| `editor.hideObjectSelection()` |  | 668 |
| `editor.isFocusLockActive()` |  | 70 |
| `editor.isObjectInFocusLockedGroup(object)` |  | 84 |
| `editor.isObjectSelectable(object)` |  | 102 |
| `editor.isObjectSelected(objectId)` |  | 117 |
| `editor.isObjectSelectionEmpty()` |  | 113 |
| `editor.lockObjectSelection()` | Select all the objects in the level, care must be taken this might slow things down for various operations | 656 |
| `editor.matrixToTable(mtx)` |  | 28 |
| `editor.pasteFields(fields, targetObjectID)` |  | 417 |
| `editor.pasteFieldsToObject(fields, targetObject)` |  | 442 |
| `editor.removeInvalidObjects(objectIds)` |  | 1371 |
| `editor.removeInvalidSelectedObjects()` |  | 1382 |
| `editor.replaceGroupWithPrefabInstance(prefab, parentGroup, instanceName, position)` |  | 1329 |
| `editor.resetObjectSelectionRotation()` | Reset the object selection's rotation to zero. | 799 |
| `editor.resetObjectSelectionScale()` | Reset the object selection's scale to 1,1,1. | 809 |
| `editor.resetObjectSelectionTransform()` | Reset the object selection transform, sets rotation to zero and scale to 1,1,1. | 793 |
| `editor.resolveAddGroup(defaultGroup)` |  | 98 |
| `editor.restoreSimObjectMemento(jsonString)` |  | 1394 |
| `editor.rotateObjectSelection(gizmoTransform, centerPoint, initialTransformations, initialGizmoTransform)` | Rotate the selected objects by the delta quaternion.<br> @param deltaRotation* [QuatF] the delta quaternion object<br> @param centerPoint [vec3] if not nil, will be used to scale around it, relative to it | 842 |
| `editor.saveSimObjectMemento(obj)` |  | 1386 |
| `editor.scaleObjectSelection(deltaScale, centerPoint)` | Scale the selected objects by the delta scale.<br> @param deltaScale [vec3] delta scale value<br> @param centerPoint [vec3] if not nil, will be used to scale around it, relative to it | 885 |
| `editor.selectObjectById(id, selectMode)` | Select object by id, using selectMode.<br> @param id the object id<br> @param selectMode the selection mode, see editor.selectObjects | 642 |
| `editor.selectObjects(idArray, selectMode)` | Select object ids.<br> @param idArray* - the array of object IDs<br> @param selectMode* - the select mode (if nil/not present, the mode is *editor.SelectMode_New*):<br> *editor.SelectMode_New* - the old selection is discarded<br> *editor.SelectMode_Add* - add (uniquely) the object ids to the current selection<br> *editor.SelectMode_Remove* - remove the ids from the current selection (if present)<br> *editor.SelectMode_Toggle* - if the ids are present, remove them, if they're absent, add them | 548 |
| `editor.selectObjectsByNameMask(nameMask, selectMode)` |  | 598 |
| `editor.selectObjectsByRef(objects, selectMode)` |  | 560 |
| `editor.selectObjectsByType(typeName, selectMode)` | Select objects by class name.<br> @param className the class name of the objects to be selected<br> @param selectMode the selection mode, see editor.selectObjects | 619 |
| `editor.setDynamicFieldValue(objectId, fieldName, value, arrayIndex)` | Set an object's dynamic field value.<br> For static fields, use `editor.setFieldValue`<br> @param objectId [number] the object id<br> @param fieldName [string] the field name<br> @param fieldValue [string] the field value as string | 312 |
| `editor.setFieldValue(objectId, fieldName, value, arrayIndex)` | Set an object's field value.<br> For dynamic fields, use `editor.setDynamicFieldValue`<br> @param objectId [number] the object id<br> @param fieldName [string] the field name<br> @param fieldValue [string] the field value as string | 297 |
| `editor.setFocusLockedGroup(id)` |  | 74 |
| `editor.setObjectSelectedBool(objectIds, selected)` |  | 247 |
| `editor.setObjectSelectedBoolSingle(objectId, selected)` |  | 257 |
| `editor.setObjectSelectionTransformFromCamera()` |  | 779 |
| `editor.showObjectSelection()` |  | 674 |
| `editor.tableToMatrix(tbl)` |  | 36 |
| `editor.translateObjectSelection(deltaTranslate)` | Translate the object selection by the delta value.<br> @param deltaTranslate [vec3] delta value to move the selection | 820 |
| `editor.unlockObjectSelection()` |  | 662 |
| `editor.unpackageSelectedPrefabInstance()` |  | 1294 |
| `editor.validateObjectName(name, newName)` |  | 282 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onEditorFocusLockChanged` — écouté par 1 module(s)
- `onEditorObjectSelectionChanged` — écouté par 8 module(s)
- `onEditorPrefabExploded` — écouté par 2 module(s)

## Appels vers le moteur (C++)

- `Engine.` `sceneGetCameraFrustum`, `setNeedCollisionRebuild`
- `FS:` `native2Virtual`
- `Sim.` `deserializeObjectFromText`, `findObjectById`, `getUniqueName`, `upcast`
- `obj:` `getClassName`, `getDynamicFields`, `getField`, `getFieldFlags`, `getFieldType`, `getFieldsForEditor`, `getId`, `getObjBox`, `getTransform`, `getWorldBox`, `isGlobalBounds`, `isSubClassOf`, `onEditorDisable`, `onEditorEnable`, `postApply`, `preApply`, `serialize`, `setCanSave`, `setDynDataFieldbyName`, `setEditorDirty`, `setField`, `setName`, `setSelected`, `setTransform`
- `scenetree.` `findObject`, `findObjectById`, `getAllObjects`
- `worldEditorCppApi.` `rebuildShapeManagerInstanceData`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/api/object.lua`.*
