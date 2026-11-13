# `editor_util_transformUtil`

*Fichier : `lua/ge/extensions/editor/util/transformUtil.lua` · VM : Game Engine (GE) · 761 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/util/transformUtil")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

Le module renvoie un constructeur : `local obj = require("editor_util_transformUtil")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:beginDrag()` | dragging functions | 674 |
| `C:combinedWidget()` |  | 418 |
| `C:contextMenu()` | draws helper functionality | 366 |
| `C:correctEditMode()` | helper function for getting if the correct edit mode is active | 742 |
| `C:dragging()` |  | 681 |
| `C:enableEditing(cooldown)` |  | 306 |
| `C:endDragging()` |  | 732 |
| `C:getValidButtons()` |  | 547 |
| `C:gizmo()` | draws a button to enter the editmode and handles the gizmo if in the edit mode | 559 |
| `C:helperAlignWithTerrain()` |  | 355 |
| `C:helperCameraToPosition()` |  | 329 |
| `C:helperCameraToPositionRotation()` |  | 343 |
| `C:helperCameraToRotation()` |  | 336 |
| `C:helperFocus()` |  | 313 |
| `C:helperMoveToTransform()` |  | 349 |
| `C:helperPositionDownToTerrain()` |  | 322 |
| `C:helperPositionInFrontOfToCamera()` |  | 319 |
| `C:helperPositionToCamera()` |  | 316 |
| `C:helperRotateWithCamera()` |  | 361 |
| `C:helperRotationToCamera()` |  | 326 |
| `C:init(editName, objectName)` | initializes stuff for the helper. | 68 |
| `C:onActivate()` | helper callbacks for the edit mode | 747 |
| `C:onDeactivate()` |  | 751 |
| `C:resetDragging()` |  | 737 |
| `C:set(pos, rot, scl)` | sets the position, rotation and scale of the helper. nil parameters are ignored,<br> so you can only set the rotation with :set(nil, quat(...), nil) for example | 146 |
| `C:setOneDimensionalScale(ods)` | toggles between single value and vec3 value for scale. | 116 |
| `C:shiftUpdate(mouseInfo)` |  | 201 |
| `C:start()` | starts the edit mode if not already in it | 131 |
| `C:stop()` | stops the edit mode if currently in it | 138 |
| `C:update(mouseInfo)` |  | 254 |
| `C:updateInputFields()` | updates the input fields | 182 |
| `C:updateTransform()` | updates the transform associated with the object | 164 |
| `C:widget()` | draws all widgets that are enabled. | 597 |
| `C:widgetCondensed()` | draws all widgets that are enabled. | 635 |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawLine`, `drawTextAdvanced`
- `worldEditorCppApi.` `getAxisGizmoScale`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/util/transformUtil.lua`.*
