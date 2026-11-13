# `editor_util_transformUtil`

*Fichier : `lua/ge/extensions/editor/util/transformUtil.lua` · VM : Game Engine (GE) · 761 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/util/transformUtil")` (fichier sous extensions/ mais pas une extension classique)

Classe utilitaire de l'éditeur : un « assistant de transformation » (position vec3, rotation quat, échelle vec3 ou nombre) avec gizmo d'axes, champs imgui, mode d'édition dédié et boutons d'aide (poser sur le terrain, placer devant la caméra, aligner sur la pente, téléporter le véhicule joueur…). Utile à un outil d'éditeur qui doit éditer un transform d'objet. Le module renvoie un constructeur : `local t = require('editor/util/transformUtil')(editName, objectName)`.

## Exemple

```lua
local tu = require('editor/util/transformUtil')('Mon outil', 'Marker')
tu:set(vec3(0,0,0), quat(0,0,0,1), vec3(1,1,1))
-- dans onEditorGui :
local changed = tu:update(mouseInfo)
if changed then print(tu.pos, tu.rot, tu.scl) end
```

## Remarques

- Chaque instance reçoit un id unique et enregistre un edit mode `editor.editModes["<editName> (<id>)"]` ; Échap ou un clic hors gizmo revient au mode objectSelect.
- Maj + clic-glisser = Quick Edit : place la position au point visé et oriente (quatFromDir) dans la direction du glissement ; l'échelle 1D suit la longueur du glissement.
- Si l'échelle est 1D (setOneDimensionalScale(true)), self.scl est un number ; sinon un vec3. set() convertit automatiquement.
- Pendant le glissement du gizmo, des lignes de 2000 m (rouge/vert/bleu) sont tracées le long des axes locaux.
- Incohérence : contextMenu() teste self.hasPos / self.hasRot qui ne sont jamais initialisés dans init() (donc nil sauf affectation externe) : le menu contextuel n'affiche alors que le séparateur.
- getValidButtons() utilise `break` : dès qu'un bouton est incompatible avec allowTranslate/allowRotate, les suivants sont aussi ignorés.
- Les rotations sont des quaternions (x, y, z, w) ; distances en mètres. 'Move before Camera' place le point à 15 m devant la caméra.
- Le module appelle `editor.*` sans vérifier partout son existence ; init() sort tôt si `editor.editModes` est absent.

## Classe `C`

Objet renvoyé par le constructeur du module. Champs publics notables : pos (vec3), rot (quat), scl (vec3|number), allowTranslate/allowRotate/allowScale (booléens), oneDimensionalScale, showWidgets, showGizmo, widgetSettings.width, switchRotationForMouse, isDragging.

Le module renvoie un constructeur : `local obj = require("editor_util_transformUtil")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:beginDrag()` | Début de glissement du gizmo : mémorise pos/rot/scl de départ. | 674 |
| `C:combinedWidget()` | Dessine l'interface combinée (gizmo, boutons d'aide, champs) dans la largeur disponible. | 418 |
| `C:contextMenu()` | Dessine le menu contextuel d'aide (position/rotation vers caméra, caméra vers position, etc.). | 366 |
| `C:correctEditMode()` | Indique si l'edit mode actif de l'éditeur est celui de cet assistant. | 742 |
| `C:dragging()` | Pendant le glissement : met à jour pos, rot ou scl selon le mode du gizmo (translation, rotation, échelle) et trace les axes. | 681 |
| `C:enableEditing(cooldown)` | Active l'edit mode de cet assistant, avec un délai de quelques frames avant de traiter les clics. | 306 |
| `C:endDragging()` | Fin de glissement du gizmo. | 732 |
| `C:getValidButtons()` | Renvoie la liste des boutons d'aide compatibles avec allowTranslate/allowRotate (s'arrête au premier incompatible). | 547 |
| `C:gizmo()` | Dessine le bouton 'Edit <objet>' / 'Exit Editing', le gizmo d'axes en edit mode, et le menu '...'. | 559 |
| `C:helperAlignWithTerrain()` | Aligne l'axe haut sur la normale lissée du terrain en conservant la direction avant projetée (sans effet sans terrain). | 355 |
| `C:helperCameraToPosition()` | Passe en caméra libre et déplace la caméra à la position, en gardant son orientation. | 329 |
| `C:helperCameraToPositionRotation()` | Passe en caméra libre et applique position et rotation à la caméra. | 343 |
| `C:helperCameraToRotation()` | Passe en caméra libre et applique la rotation à la caméra, en gardant sa position. | 336 |
| `C:helperFocus()` | Centre la vue de l'éditeur sur la position (editor.fitViewToSelectionSmooth). | 313 |
| `C:helperMoveToTransform()` | Téléporte le véhicule joueur (spawn.safeTeleport) à la position/rotation. | 349 |
| `C:helperPositionDownToTerrain()` | Pose la position à la hauteur du terrain (sans effet s'il n'y a pas de terrain). | 322 |
| `C:helperPositionInFrontOfToCamera()` | Place la position 15 m devant la caméra. | 319 |
| `C:helperPositionToCamera()` | Place la position sur celle de la caméra. | 316 |
| `C:helperRotateWithCamera()` | Copie la rotation de la caméra (identique à helperRotationToCamera ; l'info-bulle du bouton dit 'face away from the camera'). | 361 |
| `C:helperRotationToCamera()` | Copie la rotation de la caméra. | 326 |
| `C:init(editName, objectName)` | Constructeur : crée l'état (pos 0, rot identité, scl 1), les champs imgui et enregistre l'edit mode de l'éditeur. | 68 |
| `C:onActivate()` | Callback d'edit mode : efface la sélection d'objets et réinitialise via set(). | 747 |
| `C:onDeactivate()` | Callback d'edit mode : efface la sélection d'objets. | 751 |
| `C:resetDragging()` | Efface les valeurs de début de glissement (appel manuel). | 737 |
| `C:set(pos, rot, scl)` | Définit position, rotation et échelle ; les arguments nil sont ignorés. Met à jour le transform du gizmo et les champs de saisie. | 146 |
| `C:setOneDimensionalScale(ods)` | Bascule entre échelle scalaire et échelle vec3 et recrée le champ d'entrée correspondant. | 116 |
| `C:shiftUpdate(mouseInfo)` | Gère le Quick Edit (Maj + souris) : pose la position sur le point visé et oriente l'objet selon le glissement. | 201 |
| `C:start()` | Entre dans l'edit mode de cet assistant s'il n'y est pas déjà. | 131 |
| `C:stop()` | Quitte l'edit mode (editor.selectEditMode(nil)) s'il est actif. | 138 |
| `C:update(mouseInfo)` | À appeler à chaque frame : gère les clics, les messages d'aide et le Quick Edit quand l'edit mode est actif, puis dessine les widgets (combinedWidget). | 254 |
| `C:updateInputFields()` | Recopie pos, rot et scl dans les tableaux imgui (inputPos, inputRot, inputScl). | 182 |
| `C:updateTransform()` | Recalcule la matrice du gizmo à partir de pos/rot (orientation locale ou monde selon l'alignement du gizmo) et l'applique si cet edit mode est actif. | 164 |
| `C:widget()` | Dessine les champs de saisie Position, Rotation (quaternion) et Scale selon les autorisations. | 597 |
| `C:widgetCondensed()` | Version compacte de widget() (libellés Pos, Rot, Scl). | 635 |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawLine`, `drawTextAdvanced`
- `worldEditorCppApi.` `getAxisGizmoScale`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/util/transformUtil.lua`.*
