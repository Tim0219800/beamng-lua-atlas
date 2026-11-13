# `editor_api_objectHistoryActions`

*Fichier : `lua/ge/extensions/editor/api/objectHistoryActions.lua` · VM : Game Engine (GE) · 412 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/api/objectHistoryActions")` (fichier sous extensions/ mais pas une extension classique)

Actions annulables (undo/redo) de l'éditeur de niveau pour les objets de la scène : création, suppression (objet ou groupe entier, restauré par sérialisation), changement de champ ou de champ dynamique, sélection, transformation, échelle, appel de hook. Chaque action est enregistrée via `editor.history:commitAction`. Le module renvoie une FONCTION : l'appeler installe `editor.lockObjectSelectionWithUndo` & co sur `editor` puis renvoie la table de fonctions (M). Un outil d'éditeur utilise les `...WithUndo` pour que ses modifications soient annulables.

## Exemple

```lua
local actions = require("editor/api/objectHistoryActions")()
actions.changeObjectFieldWithUndo({objId}, "hidden", "true")
```

## Remarques

- Les valeurs de champs sont des chaînes (ex. "true"/"false" pour locked/hidden). arrayIndex numérique >= 0 est converti en chaîne ; nil devient "".
- Un changement de position/rotation/scale recalcule la bbox de sélection (editor.computeSelectionBBox).
- Hooks émis : onEditorObjectAdded(objectId), onEditorInspectorFieldChanged(objectIds, fieldName, valeurs, arrayIndex), onEditorInspectorDynFieldChanged(objectIds, fieldName, valeurs, arrayIndex), onEditorObjectSelectionChanged().
- `changeObjectFieldMultipleValuesUndo/Redo` existent dans le fichier mais ne sont pas exportés ; seule `changeObjectFieldMultipleValuesWithUndo` n'est pas non plus dans M (déduit : absente de la liste d'export).
- Un objet verrouillé (isLocked) n'est pas supprimé par deleteObjectRedo ; l'action est quand même empilée.
- La suppression d'un groupe (SimSet/SimGroup) sérialise toute la hiérarchie (JSON par objet) et la restaure avec les mêmes ids (SimObject.setForcedId) ; l'ordre dans le groupe parent est restauré via nextObjIdInGroup.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_api_objectHistoryActions.callHookWithUndo(hookName, ...)` | Enregistre une action "CallHook" dont undo et redo appellent tous deux extensions.hook(hookName, ...). (assignée dynamiquement) | dyn |
| `editor_api_objectHistoryActions.changeObjectDynFieldRedo(actionData)` | Applique la nouvelle valeur d'un champ dynamique et émet onEditorInspectorDynFieldChanged. (assignée dynamiquement) *(interne)* | dyn |
| `editor_api_objectHistoryActions.changeObjectDynFieldUndo(actionData)` | Restaure les anciennes valeurs d'un champ dynamique et émet onEditorInspectorDynFieldChanged. (assignée dynamiquement) *(interne)* | dyn |
| `editor_api_objectHistoryActions.changeObjectDynFieldWithUndo(objIds, fieldName, newFieldValue, arrayIndex)` | Change un champ dynamique sur plusieurs objets de façon annulable. (assignée dynamiquement) | dyn |
| `editor_api_objectHistoryActions.changeObjectFieldMultipleValuesWithUndo(objIds, fieldName, newFieldValues, arrayIndex)` | Comme changeObjectFieldWithUndo mais avec une valeur différente par objet. (assignée dynamiquement) | dyn |
| `editor_api_objectHistoryActions.changeObjectFieldRedo(actionData)` | Applique la nouvelle valeur du champ sur tous les objets et émet onEditorInspectorFieldChanged. (assignée dynamiquement) *(interne)* | dyn |
| `editor_api_objectHistoryActions.changeObjectFieldUndo(actionData)` | Remet les anciennes valeurs du champ sur tous les objets, met à jour le gizmo/la bbox et émet onEditorInspectorFieldChanged. (assignée dynamiquement) *(interne)* | dyn |
| `editor_api_objectHistoryActions.changeObjectFieldWithOldValues(objIds, fieldName, newFieldValue, oldFieldValues, arrayIndex)` | Comme changeObjectFieldWithUndo mais l'appelant fournit lui-même les anciennes valeurs (utile quand le champ a déjà été modifié pendant une édition interactive). (assignée dynamiquement) | dyn |
| `editor_api_objectHistoryActions.changeObjectFieldWithUndo(objIds, fieldName, newFieldValue, arrayIndex)` | Change un champ sur plusieurs objets en mémorisant les anciennes valeurs (getField). (assignée dynamiquement) | dyn |
| `editor_api_objectHistoryActions.createObjectRedo(actionData)` | Crée un objet de classe actionData.className, l'enregistre sous actionData.name et l'ajoute au groupe actionData.parentId ou à MissionGroup ; mémorise le nouvel id (réutilise l'ancien via setForcedId) et émet onEditorObjectAdded. (assignée dynamiquement) *(interne)* | dyn |
| `editor_api_objectHistoryActions.createObjectUndo(actionData)` | Annule une création : supprime l'objet actionData.objectId et remet objectId à nil. (assignée dynamiquement) *(interne)* | dyn |
| `editor_api_objectHistoryActions.createObjectWithUndo(name, className)` | Crée un objet via une action annulable "CreateObject" et marque l'éditeur comme modifié. (assignée dynamiquement) | dyn |
| `editor_api_objectHistoryActions.deleteObjectRedo(actionData)` | Sérialise l'objet (ou la hiérarchie du groupe) puis le supprime avec editor.deleteObject, sauf s'il est verrouillé. (assignée dynamiquement) *(interne)* | dyn |
| `editor_api_objectHistoryActions.deleteObjectUndo(actionData)` | Restaure l'objet (ou tout le groupe) supprimé depuis serializedData avec son id d'origine, le replace avant nextObjIdInGroup et émet onEditorObjectAdded. (assignée dynamiquement) *(interne)* | dyn |
| `editor_api_objectHistoryActions.deleteObjectWithUndo(objId)` | Supprime un objet via une action annulable "DeleteObject", vide la sélection et marque l'éditeur modifié. (assignée dynamiquement) | dyn |
| `editor_api_objectHistoryActions.deleteSelectedObjectsWithUndo()` | Supprime tous les objets sélectionnés dans une seule transaction "DeleteSelectedObjects". Ne fait rien si la sélection est vide. (assignée dynamiquement) | dyn |
| `editor_api_objectHistoryActions.selectObjectsRedo(actionData)` | Applique la nouvelle sélection (newSelection), recalcule la bbox et émet onEditorObjectSelectionChanged. (assignée dynamiquement) *(interne)* | dyn |
| `editor_api_objectHistoryActions.selectObjectsUndo(actionData)` | Rétablit l'ancienne sélection (oldSelection), recalcule la bbox et émet onEditorObjectSelectionChanged. (assignée dynamiquement) *(interne)* | dyn |
| `editor_api_objectHistoryActions.selectObjectsWithUndo(newSelection, oldSelection)` | Change la sélection d'objets de façon annulable. Ignore l'appel si l'ancienne et la nouvelle sélection sont égales, ou si la dernière action est déjà une SelectObjects avec la même nouvelle sélection. (assignée dynamiquement) | dyn |
| `editor_api_objectHistoryActions.setObjectScaleRedo(actionData)` | Applique newScale à l'objet. (assignée dynamiquement) *(interne)* | dyn |
| `editor_api_objectHistoryActions.setObjectScaleUndo(actionData)` | Remet oldScale sur l'objet. (assignée dynamiquement) *(interne)* | dyn |
| `editor_api_objectHistoryActions.setObjectTransformRedo(actionData)` | Applique newTransform à l'objet. (assignée dynamiquement) *(interne)* | dyn |
| `editor_api_objectHistoryActions.setObjectTransformUndo(actionData)` | Remet l'ancienne transformation (oldTransform, table convertie en matrice) sur l'objet. (assignée dynamiquement) *(interne)* | dyn |

### Détail des paramètres

#### `editor_api_objectHistoryActions.callHookWithUndo(hookName, ...)`

Enregistre une action "CallHook" dont undo et redo appellent tous deux extensions.hook(hookName, ...). (assignée dynamiquement)

- `hookName` (*string*) : nom du hook
- `...` (*any*) : arguments passés au hook

#### `editor_api_objectHistoryActions.changeObjectDynFieldRedo(actionData)`

Applique la nouvelle valeur d'un champ dynamique et émet onEditorInspectorDynFieldChanged. (assignée dynamiquement)

- `actionData` (*table*) : {objectIds, fieldName, newFieldValue, arrayIndex}

#### `editor_api_objectHistoryActions.changeObjectDynFieldUndo(actionData)`

Restaure les anciennes valeurs d'un champ dynamique et émet onEditorInspectorDynFieldChanged. (assignée dynamiquement)

- `actionData` (*table*) : {objectIds, fieldName, oldFieldValues, arrayIndex}

#### `editor_api_objectHistoryActions.changeObjectDynFieldWithUndo(objIds, fieldName, newFieldValue, arrayIndex)`

Change un champ dynamique sur plusieurs objets de façon annulable. (assignée dynamiquement)

- `objIds` (*integer[]*) : ids des objets
- `fieldName` (*string*) : nom du champ dynamique
- `newFieldValue` (*string*) : nouvelle valeur
- `arrayIndex` (*integer|nil*) : index (non converti en chaîne ici)

#### `editor_api_objectHistoryActions.changeObjectFieldMultipleValuesWithUndo(objIds, fieldName, newFieldValues, arrayIndex)`

Comme changeObjectFieldWithUndo mais avec une valeur différente par objet. (assignée dynamiquement)

- `objIds` (*integer[]*) : ids des objets
- `fieldName` (*string*) : nom du champ
- `newFieldValues` (*table*) : valeurs, même ordre que objIds
- `arrayIndex` (*integer|nil*) : index dans un champ tableau

#### `editor_api_objectHistoryActions.changeObjectFieldRedo(actionData)`

Applique la nouvelle valeur du champ sur tous les objets et émet onEditorInspectorFieldChanged. (assignée dynamiquement)

- `actionData` (*table*) : {objectIds, fieldName, newFieldValue, arrayIndex}

#### `editor_api_objectHistoryActions.changeObjectFieldUndo(actionData)`

Remet les anciennes valeurs du champ sur tous les objets, met à jour le gizmo/la bbox et émet onEditorInspectorFieldChanged. (assignée dynamiquement)

- `actionData` (*table*) : {objectIds, fieldName, oldFieldValues, arrayIndex}

#### `editor_api_objectHistoryActions.changeObjectFieldWithOldValues(objIds, fieldName, newFieldValue, oldFieldValues, arrayIndex)`

Comme changeObjectFieldWithUndo mais l'appelant fournit lui-même les anciennes valeurs (utile quand le champ a déjà été modifié pendant une édition interactive). (assignée dynamiquement)

- `objIds` (*integer[]*) : ids des objets
- `fieldName` (*string*) : nom du champ
- `newFieldValue` (*string*) : nouvelle valeur
- `oldFieldValues` (*table*) : anciennes valeurs, même ordre que objIds
- `arrayIndex` (*integer|nil*) : index dans un champ tableau

#### `editor_api_objectHistoryActions.changeObjectFieldWithUndo(objIds, fieldName, newFieldValue, arrayIndex)`

Change un champ sur plusieurs objets en mémorisant les anciennes valeurs (getField). (assignée dynamiquement)

- `objIds` (*integer[]*) : ids des objets
- `fieldName` (*string*) : nom du champ
- `newFieldValue` (*string*) : nouvelle valeur (identique pour tous)
- `arrayIndex` (*integer|nil*) : index dans un champ tableau

#### `editor_api_objectHistoryActions.createObjectRedo(actionData)`

Crée un objet de classe actionData.className, l'enregistre sous actionData.name et l'ajoute au groupe actionData.parentId ou à MissionGroup ; mémorise le nouvel id (réutilise l'ancien via setForcedId) et émet onEditorObjectAdded. (assignée dynamiquement)

- `actionData` (*table*) : {name, className, parentId?, objectId?}
- **renvoie** : integer|nil id de l'objet créé (nil si MissionGroup absent)

#### `editor_api_objectHistoryActions.createObjectUndo(actionData)`

Annule une création : supprime l'objet actionData.objectId et remet objectId à nil. (assignée dynamiquement)

- `actionData` (*table*) : {objectId}

#### `editor_api_objectHistoryActions.createObjectWithUndo(name, className)`

Crée un objet via une action annulable "CreateObject" et marque l'éditeur comme modifié. (assignée dynamiquement)

- `name` (*string*) : nom d'enregistrement
- `className` (*string*) : classe C++ à créer

#### `editor_api_objectHistoryActions.deleteObjectRedo(actionData)`

Sérialise l'objet (ou la hiérarchie du groupe) puis le supprime avec editor.deleteObject, sauf s'il est verrouillé. (assignée dynamiquement)

- `actionData` (*table*) : {objectId}

#### `editor_api_objectHistoryActions.deleteObjectUndo(actionData)`

Restaure l'objet (ou tout le groupe) supprimé depuis serializedData avec son id d'origine, le replace avant nextObjIdInGroup et émet onEditorObjectAdded. (assignée dynamiquement)

- `actionData` (*table*) : {objectId, serializedData, isSimSet?, nextObjIdInGroup?}

#### `editor_api_objectHistoryActions.deleteObjectWithUndo(objId)`

Supprime un objet via une action annulable "DeleteObject", vide la sélection et marque l'éditeur modifié. (assignée dynamiquement)

- `objId` (*integer*) : id de l'objet

#### `editor_api_objectHistoryActions.selectObjectsRedo(actionData)`

Applique la nouvelle sélection (newSelection), recalcule la bbox et émet onEditorObjectSelectionChanged. (assignée dynamiquement)

- `actionData` (*table*) : {newSelection}

#### `editor_api_objectHistoryActions.selectObjectsUndo(actionData)`

Rétablit l'ancienne sélection (oldSelection), recalcule la bbox et émet onEditorObjectSelectionChanged. (assignée dynamiquement)

- `actionData` (*table*) : {oldSelection}

#### `editor_api_objectHistoryActions.selectObjectsWithUndo(newSelection, oldSelection)`

Change la sélection d'objets de façon annulable. Ignore l'appel si l'ancienne et la nouvelle sélection sont égales, ou si la dernière action est déjà une SelectObjects avec la même nouvelle sélection. (assignée dynamiquement)

- `newSelection` (*integer[]*) : nouveaux ids sélectionnés
- `oldSelection` (*integer[]*) : ids précédemment sélectionnés

#### `editor_api_objectHistoryActions.setObjectScaleRedo(actionData)`

Applique newScale à l'objet. (assignée dynamiquement)

- `actionData` (*table*) : {objectId, newScale}

#### `editor_api_objectHistoryActions.setObjectScaleUndo(actionData)`

Remet oldScale sur l'objet. (assignée dynamiquement)

- `actionData` (*table*) : {objectId, oldScale}

#### `editor_api_objectHistoryActions.setObjectTransformRedo(actionData)`

Applique newTransform à l'objet. (assignée dynamiquement)

- `actionData` (*table*) : {objectId, newTransform}

#### `editor_api_objectHistoryActions.setObjectTransformUndo(actionData)`

Remet l'ancienne transformation (oldTransform, table convertie en matrice) sur l'objet. (assignée dynamiquement)

- `actionData` (*table*) : {objectId, oldTransform}

## Classe `editor`

Fonctions ajoutées à `editor` quand on appelle la fonction renvoyée par le module. Elles agissent sur editor.selection.object.

Objet `editor` construit dans le module (par ex. par `new`), avec ces méthodes :

| Méthode | Description | Ligne |
|---|---|---|
| `editor.hideObjectSelectionWithUndo()` | Cache (hidden = "true") les objets sélectionnés, annulable. | 343 |
| `editor.lockObjectSelectionWithUndo()` | Verrouille (locked = "true") les objets sélectionnés, annulable. | 335 |
| `editor.showObjectSelectionWithUndo()` | Affiche (hidden = "false") les objets sélectionnés, annulable. | 347 |
| `editor.unlockObjectSelectionWithUndo()` | Déverrouille (locked = "false") les objets sélectionnés, annulable. | 339 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onEditorInspectorDynFieldChanged` — écouté par 1 module(s)
- `onEditorInspectorFieldChanged` — écouté par 9 module(s)
- `onEditorObjectAdded` — écouté par 3 module(s)
- `onEditorObjectSelectionChanged` — écouté par 8 module(s)

## Appels vers le moteur (C++)

- `Sim.` `deserializeObjectsFromText`, `findObjectById`, `upcast`
- `obj:` `delete`, `getClassName`, `getDynDataFieldbyName`, `getField`, `getGroup`, `getId`, `isLocked`, `isSubClassOf`, `registerObject`, `serialize`, `setScale`, `setTransform`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/api/objectHistoryActions.lua`.*
