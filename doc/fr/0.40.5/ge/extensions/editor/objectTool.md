# `editor_objectTool`

*Fichier : `lua/ge/extensions/editor/objectTool.lua` · VM : Game Engine (GE) · 1545 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_objectTool` : `extensions.load("editor_objectTool")`, puis la globale `editor_objectTool`

Mode d'édition principal du World Editor, « Manipulate Object(s) » (editor.editModes.objectSelect, icône crayon). Il gère la sélection d'objets (clic, rectangle, survol), le gizmo d'axes (déplacement, rotation, échelle, alignement local/monde, snapping, glisser-dupliquer avec Shift, alignement sur surface avec Ctrl+Alt), les boîtes englobantes dessinées (orange, rouge si verrouillé ; pour un véhicule, la sphère et les axes du nœud de référence), copier/coller/dupliquer/supprimer avec annulation (editor.history), ainsi que l'enregistrement des préférences « gizmos » (général, pinceau, icônes d'objets) et « snapping » (général, terrain, grille). Il ajoute aussi au menu de l'arbre de scène « Move Selection At Camera » et « Align Objects Individually To The Grid ». À l'initialisation il enregistre des fonctions sur la table globale editor (voir classe « editor »).

## Exemple

```lua
-- fonctions ajoutées à `editor` par ce module
editor.selectObjectById(id)
editor.duplicateSelectionAtCamera() -- copie la sélection à 10 m devant la caméra
editor.moveSelectionAtCamera()      -- déplace la sélection à 10 m devant la caméra
```

## Remarques

- onCut est un stub : il vérifie la sélection puis ne fait rien (TODO dans le code) ; couper n'est donc pas implémenté.
- Le presse-papiers interne (copyObjectsArray) est propre au module et non le presse-papiers système (TODO dans le code).
- Les raccourcis copier/coller/dupliquer/supprimer ne fonctionnent que si la vue 3D a le focus (editor.isViewportFocused()). Les objets verrouillés ne sont pas supprimés (notification « Some locked objects were not deleted! »).
- Les fonctions drawSelectionBBox, drawSelectedObjectBBox, updateObjectSelectionAxisGizmo, duplicateSelectionAtCamera, duplicateSceneObjects et moveSelectionAtCamera sont exposées via la table editor (registerApi), pas via le module M.
- onEditorInspectorFieldChanged : quand le champ startTime d'un objet TimeOfDay change, l'heure courante (core_environment) est réglée sur startTime.
- Chaque mode d'édition mémorise l'état du gizmo (plan, grille, profils de flags, alignement, mode) à sa désactivation et le restaure à son activation.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_objectTool.onEditorAxisGizmoAligmentChanged()` | Hook appelé quand l'alignement du gizmo change (nom avec faute dans le jeu : « Aligment »). Si le mode d'édition courant est « Manipulate Object(s) », replace le gizmo sur la sélection. *(interne)* *(hook)* | 1134 |
| `editor_objectTool.onEditorEditModeActivated(editMode)` | Hook appelé quand un mode d'édition est activé : restaure l'état de gizmo (editMode.axisGizmoRestoreState) mémorisé à sa dernière désactivation. *(interne)* *(hook)* | 1503 |
| `editor_objectTool.onEditorEditModeDeactivated(editMode)` | Hook appelé quand un mode d'édition est désactivé : mémorise l'état du gizmo dans editMode.axisGizmoRestoreState. *(interne)* *(hook)* | 1520 |
| `editor_objectTool.onEditorInitialized()` | Hook appelé à l'initialisation de l'éditeur : crée editor.editModes.objectSelect (action map ObjectTool, raccourcis de copie, collage, duplication, suppression), enregistre l'API sur editor, applique l'alignement local par défaut si la préférence est active et ajoute deux entrées au menu contextuel de l'arbre de scène. *(interne)* *(hook)* | 1427 |
| `editor_objectTool.onEditorInspectorFieldChanged(selectedIds, fieldName, fieldValue, arrayIndex)` | Hook appelé quand un champ de l'inspecteur est modifié. Ne traite que le champ startTime d'un TimeOfDay. *(interne)* *(hook)* | 1489 |
| `editor_objectTool.onEditorPreferenceValueChanged(path, value)` | Hook appelé quand une préférence change : répercute les réglages gizmos.* (icônes d'objets, couleurs, échelles, snapping fin, etc.) vers worldEditorCppApi. *(interne)* *(hook)* | 1258 |
| `editor_objectTool.onEditorRegisterPreferences(prefsRegistry)` | Hook d'enregistrement des préférences : crée les catégories gizmos et snapping et leurs préférences (surbrillance de la sélection, icônes d'objets, couleurs, tailles de gizmo, grille, etc.). *(interne)* *(hook)* | 1326 |

### Détail des paramètres

#### `editor_objectTool.onEditorEditModeActivated(editMode)`

Hook appelé quand un mode d'édition est activé : restaure l'état de gizmo (editMode.axisGizmoRestoreState) mémorisé à sa dernière désactivation.

- `editMode` (*table*) : Mode d'édition activé.

#### `editor_objectTool.onEditorEditModeDeactivated(editMode)`

Hook appelé quand un mode d'édition est désactivé : mémorise l'état du gizmo dans editMode.axisGizmoRestoreState.

- `editMode` (*table*) : Mode d'édition désactivé.

#### `editor_objectTool.onEditorInspectorFieldChanged(selectedIds, fieldName, fieldValue, arrayIndex)`

Hook appelé quand un champ de l'inspecteur est modifié. Ne traite que le champ startTime d'un TimeOfDay.

- `selectedIds` (*integer[]*) : Identifiants des objets sélectionnés ; seul le premier est examiné.
- `fieldName` (*string*) : Nom du champ modifié.
- `fieldValue` (*any*) : Nouvelle valeur (non utilisée).
- `arrayIndex` (*integer|nil*) : Indice dans un champ tableau (non utilisé).

#### `editor_objectTool.onEditorPreferenceValueChanged(path, value)`

Hook appelé quand une préférence change : répercute les réglages gizmos.* (icônes d'objets, couleurs, échelles, snapping fin, etc.) vers worldEditorCppApi.

- `path` (*string*) : Chemin de la préférence, par ex. « gizmos.general.drawObjectIcons ».
- `value` (*any*) : Nouvelle valeur.

#### `editor_objectTool.onEditorRegisterPreferences(prefsRegistry)`

Hook d'enregistrement des préférences : crée les catégories gizmos et snapping et leurs préférences (surbrillance de la sélection, icônes d'objets, couleurs, tailles de gizmo, grille, etc.).

- `prefsRegistry` (*table*) : Registre de préférences de l'éditeur.

## Classe `editor`

Pas une classe : fonctions que ce module ajoute à la table globale editor lors de onEditorInitialized (registerApi).

Objet `editor` construit dans le module (par ex. par `new`), avec ces méthodes :

| Méthode | Description | Ligne |
|---|---|---|
| `editor.drawSelectedObjectBBox(obj, color)` | Dessine la boîte englobante d'un objet de scène (ignore les objets sans getTransform). Pour un BeamNGVehicle, dessine à la place une sphère magenta et trois cylindres (axes rouge, bleu, vert) au nœud de référence, dont la taille suit la distance caméra sauf si gizmos.general.fixedRefnodeVisualization est actif. | 72 |
| `editor.drawSelectionBBox(objMat, color)` | Dessine avec debugDrawer:drawLineInstance les 12 arêtes d'une boîte unité transformée par la matrice donnée. | 47 |
| `editor.duplicateSceneObjects()` | Duplique la sélection : si le bouton gauche de la souris est enfoncé, colle immédiatement une copie des objets manipulables et passe en glisser-dupliquer ; sinon enregistre une action annulable « DuplicateObjects ». | 1198 |
| `editor.duplicateSelectionAtCamera()` | Crée, avec annulation possible (action « DuplicateObjectsAtCamera »), une copie de la sélection déplacée pour que le gizmo se retrouve à 10 m devant la caméra. | 238 |
| `editor.moveSelectionAtCamera()` | Déplace la sélection (hors SimGroup) à 10 m devant la caméra, avec annulation possible (action « MoveSelectionAtCamera »). | 272 |
| `editor.updateObjectSelectionAxisGizmo()` | Place le gizmo d'axes sur la sélection d'objets : orientation du dernier objet en mode local, position du dernier objet, du centre de la boîte de sélection ou du centroïde selon les préférences (snapping et gizmos.general.useObjectBoxCenter). | 108 |

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
