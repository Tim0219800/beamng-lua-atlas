# `editor_api_gizmo`

*Fichier : `lua/ge/extensions/editor/api/gizmo.lua` · VM : Game Engine (GE) · 586 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_api_gizmo` : `extensions.load("editor_api_gizmo")`, puis la globale `editor_api_gizmo`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_api_gizmo.initialize(editorInstance)` |  | 533 |

## Classe `editor`

Objet `editor` construit dans le module (par ex. par `new`), avec ces méthodes :

| Méthode | Description | Ligne |
|---|---|---|
| `editor.beginGizmoTranslate(objectTransforms, objectBBs, objectHeights, objects)` | Call this once when starting to drag the gizmo | 96 |
| `editor.cancelAxisGizmoInteraction()` |  | 349 |
| `editor.drawAxisGizmo()` | Draw the axis gizmo with its current transform and mode. | 364 |
| `editor.drawObjectIcons()` |  | 14 |
| `editor.getAxisGizmoAlignment()` | Return the axis gizmo alignment.<br> @see setAxisGizmoAlignment | 423 |
| `editor.getAxisGizmoMode()` | Return the axis gizmo mode.<br> @see setAxisGizmoMode | 417 |
| `editor.getAxisGizmoScale()` | Return the axis gizmo current scale as a Point3F object. | 54 |
| `editor.getAxisGizmoSelectedElement()` | Return the axis gizmo selected element (axis or plane). | 433 |
| `editor.getAxisGizmoTransform()` | Return the axis gizmo current matrix transform as a MatrixF object. | 49 |
| `editor.getTransformsGizmoTranslate(objects, objectHeights)` | Returns the new transforms every frame when dragging the gizmo after "beginGizmoTranslate" was called once<br> TODO Why do we not have that function for rotation as well? | 170 |
| `editor.isAxisGizmoHovered()` | Return true if the axis gizmo has any hovered elements (axes). | 428 |
| `editor.modifyFadeIconsDistance(deltaValue)` | Modify the distance of the object icons fading by a delta value | 499 |
| `editor.setAxisGizmoAlignment(alignment)` | Set the current axis gizmo alignment. Usually called when the edit mode is activated.<br> @param alignment the alignment of the axis gizmo to be set:<br>  *editor.AxisGizmoAlignment_World* the gizmo is aligned with the world axes<br>  *editor.AxisGizmoAlignment_Local* the gizmo is aligned with the local axes of the gizmo transform | 385 |
| `editor.setAxisGizmoMode(mode)` | Set the current axis gizmo mode. Usually called when the edit mode is activated.<br> @param mode the mode of the axis gizmo to be set:<br>  *editor.AxisGizmoMode_Translate*<br>  *editor.AxisGizmoMode_Rotate*<br>  *editor.AxisGizmoMode_Scale* | 376 |
| `editor.setAxisGizmoRotateLock(x, y, z)` | Set the lock on rotation on certain axes<br> @param x true to allow rotation on X axis<br> @param y true to allow rotation on Y axis<br> @param z true to allow rotation on Z axis | 403 |
| `editor.setAxisGizmoRotateSnap(enabled, rotationSnap)` | Set the axis gizmo rotation snapping parameters.<br> @param enabled true to enable snapping<br> @param gridSize a float specifying the angle step for snapping | 447 |
| `editor.setAxisGizmoScaleLock(x, y, z)` | Set the lock on scaling on certain axes<br> @param x true to allow scaling on X axis<br> @param y true to allow scaling on Y axis<br> @param z true to allow scaling on Z axis | 411 |
| `editor.setAxisGizmoScaleSnap(enabled, scaleSnap)` | Set the axis gizmo scale snapping parameters.<br> @param enabled true to enable snapping<br> @param gridSize a float specifying the scale step for snapping | 454 |
| `editor.setAxisGizmoTransform(matrix, scale)` | Set the axis gizmo's transform, used for custom editing of object parts or other visual handles.<br> @param matrix (MatrixF) the world transform matrix of the gizmo<br> @param scale (Point3F) of the gizmo, so to avoid non uniform scale decomposition problems | 44 |
| `editor.setAxisGizmoTranslateLock(x, y, z)` | Set the lock on translation on certain axes<br> @param x true to allow translation on X axis<br> @param y true to allow translation on Y axis<br> @param z true to allow translation on Z axis | 395 |
| `editor.setAxisGizmoTranslateSnap(enabled, gridSize)` | Set the axis gizmo translation snapping parameters.<br> @param enabled true to enable snapping<br> @param gridSize a float specifying the grid cell size for snapping | 440 |
| `editor.toggleAxisGizmoAlignment()` | Switches between local and world gizmo axes alignment | 459 |
| `editor.toggleDrawGizmoPlane()` | Toggle draw gizmo plane | 468 |
| `editor.toggleDrawObjectIcons()` | Toggle draw object icons in the world scene view | 482 |
| `editor.toggleDrawObjectText()` | Toggle draw object name text in the world scene view | 488 |
| `editor.toggleSelectionHighlight()` | Toggle selection highlight on the selected meshes | 494 |
| `editor.toggleSnapping(value)` | Toggle enable snapping for rotate and translate | 513 |
| `editor.updateAxisGizmo(onStartGizmoDragFunc, onEndGizmoDragFunc, onGizmoDraggingFunc)` | Updates the axis gizmo internals, checking mouse manipulation events and so on.<br> Only call this together with "editor.drawAxisGizmo"<br> @param onStartGizmoDragFunc this function is called when the gizmo axes/handles are starting to being dragged (no args)<br> @param onEndGizmoDragFunc this function is called when the gizmo axes/handles ended being dragged (no args)<br> @param onGizmoDraggingFunc this function is called when the gizmo axes/handles are currently being dragged (no args) | 289 |
| `editor.updateObjectIcons()` |  | 24 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onEditorAxisGizmoAligmentChanged` — écouté par 4 module(s)
- `onEditorAxisGizmoModeChanged` — écouté par 2 module(s)

## Appels vers le moteur (C++)

- `Engine.` `castRay`
- `debugDrawer:` `drawAxisGizmo`
- `worldEditorCppApi.` `checkObjectIconHit`, `drawClosestObjectIcons`, `getAxisGizmoAlignment`, `getAxisGizmoMode`, `getAxisGizmoScale`, `getAxisGizmoSelectedElement`, `getAxisGizmoTotalRotateOffset`, `getAxisGizmoTransform`, `getAxisGizmoTranslateOffset`, `onAxisGizmoMouseDown`, `onAxisGizmoMouseDragged`, `onAxisGizmoMouseMove`, `onAxisGizmoMouseUp`, `setAxisGizmoAlignment`, `setAxisGizmoMode`, `setAxisGizmoRenderMoveGrid`, `setAxisGizmoRenderPlane`, `setAxisGizmoRenderPlaneHashes`, `setAxisGizmoRotateLock`, `setAxisGizmoScaleLock`, `setAxisGizmoSelectedElement`, `setAxisGizmoTransform`, `setAxisGizmoTranslateLock`, `setDrawObjectIcons`, `setDrawObjectsText`, `setEventControlModifiers`, `setGridSnap`, `setRotateSnap`, `setScaleSnap`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/api/gizmo.lua`.*
