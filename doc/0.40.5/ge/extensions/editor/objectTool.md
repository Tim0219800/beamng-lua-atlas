# `editor_objectTool`

*Fichier : `lua/ge/extensions/editor/objectTool.lua` · VM : Game Engine (GE) · 1545 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_objectTool` : `extensions.load("editor_objectTool")`, puis la globale `editor_objectTool`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_objectTool.onEditorAxisGizmoAligmentChanged()` | *(hook)* | 1134 |
| `editor_objectTool.onEditorEditModeActivated(editMode)` | *(hook)* | 1503 |
| `editor_objectTool.onEditorEditModeDeactivated(editMode)` | *(hook)* | 1520 |
| `editor_objectTool.onEditorInitialized()` | *(hook)* | 1427 |
| `editor_objectTool.onEditorInspectorFieldChanged(selectedIds, fieldName, fieldValue, arrayIndex)` | *(hook)* | 1489 |
| `editor_objectTool.onEditorPreferenceValueChanged(path, value)` | *(hook)* | 1258 |
| `editor_objectTool.onEditorRegisterPreferences(prefsRegistry)` | *(hook)* | 1326 |

## Classe `editor`

Objet `editor` construit dans le module (par ex. par `new`), avec ces méthodes :

| Méthode | Description | Ligne |
|---|---|---|
| `editor.drawSelectedObjectBBox(obj, color)` |  | 72 |
| `editor.drawSelectionBBox(objMat, color)` | TODO: this could be done in C++ | 47 |
| `editor.duplicateSceneObjects()` |  | 1198 |
| `editor.duplicateSelectionAtCamera()` |  | 238 |
| `editor.moveSelectionAtCamera()` |  | 272 |
| `editor.updateObjectSelectionAxisGizmo()` |  | 108 |

## Appels vers le moteur (C++)

- `Engine.` `castRay`
- `Sim.` `upcast`
- `core_environment.` `getTimeOfDay`, `setTimeOfDay`
- `debugDrawer:` `drawCylinder`, `drawLine`, `drawLineInstance`, `drawSphere`
- `obj:` `delete`, `disableCollision`, `enableCollision`, `getClassName`, `getField`, `getId`, `getName`, `getObjBox`, `getPosition`, `getScale`, `getTransform`, `getWorldBox`, `isLocked`, `isSubClassOf`, `setPosition`, `setTransform`, `updateInstanceRenderData`
- `scenetree.` `findClassObjects`, `findObject`, `findObjectById`
- `worldEditorCppApi.` `getAxisGizmoAlignment`, `getAxisGizmoHideDisabledRotateAxes`, `getAxisGizmoHideDisabledScaleAxes`, `getAxisGizmoHideDisabledTranslateAxes`, `getAxisGizmoMode`, `getAxisGizmoRenderMoveGrid`, `getAxisGizmoRenderPlane`, `getAxisGizmoRenderPlaneHashes`, `getAxisGizmoRotateProfileFlags`, `getAxisGizmoScaleOffset`, `getAxisGizmoScaleProfileFlags`, `getAxisGizmoTranslateProfileFlags`, `getClassIsSelectable`, `getObjectClassNames`, `setAxisGizmoAlignment`, `setAxisGizmoHideDisabledRotateAxes`, `setAxisGizmoHideDisabledScaleAxes`, `setAxisGizmoHideDisabledTranslateAxes`, `setAxisGizmoHighlightSelectedMeshes`, `setAxisGizmoMode`, `setAxisGizmoRenderMoveGrid`, `setAxisGizmoRenderPlane`, `setAxisGizmoRenderPlaneHashes`, `setAxisGizmoRotateProfileFlags`, `setAxisGizmoScaleProfileFlags`, `setAxisGizmoSelectedElement`, `setAxisGizmoTranslateProfileFlags`, `setConstantSizeIconScale`, `setConstantSizeIcons`, `setDrawIconShadow`, `setDrawObjectIcons`, `setDrawObjectsText`, `setFadeIcons`, `setFadeIconsDistance`, `setFineMoveScalar`, `setFineRotationScalar`, `setFineScaleScalar`, `setGizmoLineThicknessScale`, `setGizmoPlaneColor`, `setGizmoPlaneGridLineColor`, `setGizmoPlaneSize`, `setHideIconClass`, `setHoveredObjectId`, `setIconBackgroundColor`, `setIconBackgroundScale`, `setIconBackgroundType`, `setIconShadowColor`, `setIconShadowOffset`, `setIconWorldScale`, `setMonoIconColor`, `setObjectTextBackgroundColor`, `setObjectTextColor`, `setRandomIconColorSeed`, `setSelectedIconBgColor`, `setSelectedIconColor`, `setUseIconColor`, `setUseObjectsBoxCenter`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/objectTool.lua`.*
