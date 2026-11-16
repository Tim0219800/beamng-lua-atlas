# `editor_dynamicDecals_gizmo`

*Fichier : `lua/ge/extensions/editor/dynamicDecals/gizmo.lua` · VM : Game Engine (GE) · 160 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_dynamicDecals_gizmo` : `extensions.load("editor_dynamicDecals_gizmo")`, puis la globale `editor_dynamicDecals_gizmo`

Gère le gizmo d'axes (déplacement / rotation / échelle) de l'outil Dynamic Decals. Les autres modules (decal, path, group…) choisissent le mode avec setTransformMode, installent leur callback translateFn / rotateFn / scaleFn, et mettent à jour M.transform. À chaque frame d'édition, editModeUpdate affiche le gizmo, la boîte englobante du decal sélectionné et une sphère de debug.

## Remarques

- Callbacks translateFn / rotateFn / scaleFn : appelés pendant le drag avec la matrice renvoyée par editor.getAxisGizmoTransform() ; s'ils sont nil, un message « not yet implemented » est écrit dans le log.
- Le premier appel de gizmoDragging (dragCount == 1) est ignoré.
- Bug : editModeUpdate teste `data and data.debugObjPos` avec la globale `data` (non définie ici, M.data n'est pas utilisé) ; la sphère de debug ne s'affiche donc jamais, sauf si une globale `data` existe.
- M.data décrit l'objet manipulé : uid, type (« drag », « rotate »…), objectType (« decal », « group », « path », « path_dataPoint »), dataPointIndex optionnel, objectDataCopy (état au début du drag). Il n'est pas rempli par ce module.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_dynamicDecals_gizmo.editModeUpdate(dtReal, dtSim, dtRaw)` | Appelé à chaque frame par le mode d'édition de l'éditeur : met à jour et dessine le gizmo si un mode est actif, dessine la boîte englobante du decal sélectionné, puis la sphère de debug des points de contrôle. *(interne)* | 116 |
| `editor_dynamicDecals_gizmo.editorPreferenceValueChanged(path, value)` | Hook appelé quand une préférence change. Ne fait rien ici. *(interne)* | 112 |
| `editor_dynamicDecals_gizmo.getDragCount()` | Nombre de mises à jour de drag depuis le début du drag courant. | 54 |
| `editor_dynamicDecals_gizmo.getTransformMode()` | Renvoie le mode de transformation actuel. | 40 |
| `editor_dynamicDecals_gizmo.gizmoBeginDrag()` | Callback passé à editor.updateAxisGizmo : appelé quand le drag du gizmo commence. Remet le compteur à 0. *(interne)* | 59 |
| `editor_dynamicDecals_gizmo.gizmoDragging()` | Callback appelé à chaque mise à jour du drag : incrémente le compteur puis, selon le mode, appelle translateFn / rotateFn / scaleFn avec editor.getAxisGizmoTransform(). *(interne)* | 72 |
| `editor_dynamicDecals_gizmo.gizmoEndDrag()` | Callback appelé à la fin du drag. Remet le compteur à 0 (aucune action d'annulation n'est ajoutée ici). *(interne)* | 66 |
| `editor_dynamicDecals_gizmo.registerEditorPreferences(prefsRegistry)` | Enregistre `dynamicDecalsTool.gizmo` : displayBoundingBox (bool, vrai), boundingBoxColor (RGBA {1,0,0,0.75}, avec sélecteur de couleur) et displayDebugObjWhileMovingControlPoints (bool, vrai). *(interne)* | 100 |
| `editor_dynamicDecals_gizmo.resetTransformFn()` | Remet à nil translateFn, rotateFn et scaleFn. | 48 |
| `editor_dynamicDecals_gizmo.setTransformMode(value)` | Définit le mode de transformation ; avec none, le gizmo n'est plus affiché. | 44 |
| `editor_dynamicDecals_gizmo.setup(tool_in)` | Appelé par l'outil : mémorise l'outil et l'API editor_api_dynamicDecals. *(interne)* | 142 |

### Détail des paramètres

#### `editor_dynamicDecals_gizmo.editModeUpdate(dtReal, dtSim, dtRaw)`

Appelé à chaque frame par le mode d'édition de l'éditeur : met à jour et dessine le gizmo si un mode est actif, dessine la boîte englobante du decal sélectionné, puis la sphère de debug des points de contrôle.

- `dtReal` (*number*) : Delta temps réel (s).
- `dtSim` (*number*) : Delta temps simulation (s).
- `dtRaw` (*number*) : Delta temps brut (s).

#### `editor_dynamicDecals_gizmo.editorPreferenceValueChanged(path, value)`

Hook appelé quand une préférence change. Ne fait rien ici.

- `path` (*string*) : Chemin de la préférence.
- `value` (*any*) : Nouvelle valeur.

#### `editor_dynamicDecals_gizmo.getDragCount()`

Nombre de mises à jour de drag depuis le début du drag courant.

- **renvoie** : integer Compteur.

#### `editor_dynamicDecals_gizmo.getTransformMode()`

Renvoie le mode de transformation actuel.

- **renvoie** : integer Valeur de transformModes.

#### `editor_dynamicDecals_gizmo.registerEditorPreferences(prefsRegistry)`

Enregistre `dynamicDecalsTool.gizmo` : displayBoundingBox (bool, vrai), boundingBoxColor (RGBA {1,0,0,0.75}, avec sélecteur de couleur) et displayDebugObjWhileMovingControlPoints (bool, vrai).

- `prefsRegistry` (*table*) : Registre de préférences de l'éditeur.

#### `editor_dynamicDecals_gizmo.setTransformMode(value)`

Définit le mode de transformation ; avec none, le gizmo n'est plus affiché.

- `value` (*integer*) : Une valeur de transformModes.

#### `editor_dynamicDecals_gizmo.setup(tool_in)`

Appelé par l'outil : mémorise l'outil et l'API editor_api_dynamicDecals.

- `tool_in` (*table*) : Référence à l'outil editor_dynamicDecalsTool.

## Champs

| Champ | Type | Description |
|---|---|---|
| `data` | table | Informations sur l'objet en cours de manipulation (uid, type, objectType, dataPointIndex, objectDataCopy), remplies par les modules appelants. |
| `rotateFn` | function|nil | Callback de rotation. |
| `scaleFn` | function|nil | Callback d'échelle. |
| `transform` | MatrixF | Matrice du gizmo (MatrixF(true) au départ). |
| `transformModes` | table<string, integer> | none = 0, translate = 1, rotate = 2, scale = 3. |
| `translateFn` | function|nil | Callback de translation, reçoit la matrice du gizmo. |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawSphere`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/dynamicDecals/gizmo.lua`.*
