# `editor_api_object`

*Fichier : `lua/ge/extensions/editor/api/object.lua` · VM : Game Engine (GE) · 1495 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_api_object` : `extensions.load("editor_api_object")`, puis la globale `editor_api_object`

API de l'éditeur pour manipuler les objets de la scène : sélection (par id, référence, type, masque de nom, rectangle écran), lecture/écriture des champs (statiques et dynamiques, copier/coller), verrouiller/cacher, aligner, translater/tourner/mettre à l'échelle la sélection, centroïde et boîte englobante, Focus-Lock sur un groupe, prefabs (créer, exploser, convertir en v2, dépaqueter) et mementos de SimObject. `initialize` installe tout sur `editor` et définit les constantes `editor.SelectMode_*` ; `initializeFocusLock` ajoute les fonctions de Focus-Lock. La sélection vit dans `editor.selection.object` (liste d'ids). Les fonctions de ce fichier n'enregistrent PAS d'historique d'annulation : voir objectHistoryActions pour les versions `...WithUndo`.

## Exemple

```lua
editor.selectObjectById(objId)
local sel = editor.getObjectSelection()
editor.setFieldValue(sel[1], "position", "0 0 10")
```

## Remarques

- Constantes : editor.SelectMode_New = 1, _Add = 2, _Remove = 3, _Toggle = 4.
- Les valeurs de champs sont des chaînes (ex. position "x y z", rotation "0 0 0 0", scale "1 1 1").
- Hooks émis : onEditorObjectSelectionChanged, onEditorFocusLockChanged, onEditorPrefabExploded(groups). L'en-tête du fichier liste d'autres hooks (onEditorObjectCreated, ...Delete, ...SelectionLocked/Unlocked/Shown/Hidden/TransformChanged, onEditorPrefabCreated) qui ne sont pas émis depuis ce fichier.
- `initialize` est volontairement scindé de `initializeFocusLock` pour rester sous la limite de 60 upvalues de Lua.
- Bug : dans calculateObjectsCenter et calculateBoundingBoxCenter, `table.insert(stack, childId)` utilise une variable non définie (le code lit `childObjId`) : les sous-groupes ne sont jamais parcourus.
- Bug probable : alignObjectSelectionByBounds démarre la recherche de l'objet de référence à l'indice 2, le premier objet n'est donc jamais candidat.
- debugObjectSelection est défini mais non exporté.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_api_object.initialize(editorInstance)` | Mémorise l'éditeur, définit editor.SelectMode_* et editor.objectSelectionBBox, et installe les fonctions de sélection, champs, alignement, transformation et prefabs sur `editor`. *(interne)* | 1408 |
| `editor_api_object.initializeFocusLock()` | Installe séparément les fonctions de Focus-Lock (getFocusLockedGroup, isFocusLockActive, setFocusLockedGroup, clearFocusLock, isObjectInFocusLockedGroup, resolveAddGroup) pour contourner la limite de 60 upvalues de initialize. *(interne)* | 1482 |

### Détail des paramètres

#### `editor_api_object.initialize(editorInstance)`

Mémorise l'éditeur, définit editor.SelectMode_* et editor.objectSelectionBBox, et installe les fonctions de sélection, champs, alignement, transformation et prefabs sur `editor`.

- `editorInstance` (*table*) : objet `editor`

## Classe `editor`

Fonctions ajoutées à `editor` par initialize et initializeFocusLock.

Objet `editor` construit dans le module (par ex. par `new`), avec ces méthodes :

| Méthode | Description | Ligne |
|---|---|---|
| `editor.alignObjectSelectionByBounds(boundsAxis)` | Aligne les objets sur la boîte englobante extrême selon l'axe. Valeurs de boundsAxis : 0-2 (editor.AxisX/Y/Z) = alignement sur le bord max de cet axe ; 3-5 = bord min de l'axe (valeur - 3). Ne fait rien (renvoie true) s'il y a moins de 2 objets. | 685 |
| `editor.alignObjectSelectionByCenter(axis)` | Aligne tous les objets manipulables sur la coordonnée du premier objet sélectionné pour l'axe donné. | 755 |
| `editor.calculateBoundingBoxCenter(objects)` | Calcule le centre de la boîte englobante des enfants non-groupe des SimGroup donnés (mêmes limites que calculateObjectsCenter pour les sous-groupes). | 1050 |
| `editor.calculateObjectsCenter(objects)` | Calcule le centre (moyenne des positions) des enfants des SimGroup donnés. Les objets non-groupe de la liste sont ignorés ; les sous-groupes ne sont pas parcourus (bug : `childId` est une variable non définie, donc rien n'est empilé). Divise par zéro (NaN) si aucun enfant. | 1005 |
| `editor.canManipulateObject(object)` | Vrai si l'objet existe, n'est ni un SimSet ni un SimGroup et n'est pas verrouillé. | 45 |
| `editor.clearFocusLock()` | Désactive le Focus-Lock et émet onEditorFocusLockChanged. | 79 |
| `editor.clearObjectSelection()` | Désélectionne tout (côté C++ aussi), met la sélection à nil, recalcule la bbox et émet onEditorObjectSelectionChanged. | 475 |
| `editor.computeSelectionBBox(updateGizmo)` | Recalcule editor.objectSelectionBBox et editor.objectSelectionRadius à partir des boîtes monde de la sélection (bornes infinies ignorées, repli sur la boîte objet), met à jour le centroïde et, par défaut, le gizmo (editor.updateObjectSelectionAxisGizmo). | 189 |
| `editor.convertSelectedPrefabsToV2()` | Convertit les prefabs sélectionnés au format v2 et les remplace par des instances (replaceGroupWithPrefabInstance) au centre de leur boîte. | 1253 |
| `editor.copyFields(objectID)` | Copie les valeurs de champs d'un objet (hors groupe Transform, name, persistentId, parentGroup), y compris éléments de tableaux et champs dynamiques. | 354 |
| `editor.createPrefabFromObjectSelection(newPrefabFilename, objName, loadmode, pathNative)` | Crée un Prefab depuis la sélection : regroupe les objets valides dans un SimGroup relatif au centroïde, enregistre le Prefab dans le groupe du plus haut objet, le sauvegarde, supprime les anciens groupes, sélectionne le prefab et marque le niveau modifié. Pas d'annulation (TODO). | 1095 |
| `editor.deleteSelectedObjects()` | Supprime (editor.deleteObject) tous les objets sélectionnés et vide la sélection. Pas d'historique : pour l'annulation utiliser deleteSelectedObjectsWithUndo. | 467 |
| `editor.deselectObjectSelection()` | Vide la sélection (table vide, côté C++ aussi) et émet onEditorObjectSelectionChanged. | 648 |
| `editor.enableEditorOnObjects(enable)` | Appelle onEditorEnable ou onEditorDisable sur tous les objets de la scène qui ont ces méthodes. Utilisé en interne au basculement du mode éditeur ; ne fait rien si le niveau n'est pas chargé. | 267 |
| `editor.explodeSelectedPrefab()` | Explose les prefabs sélectionnés en groupes d'objets (nom <prefab>_unpacked), supprime les prefabs, sélectionne les groupes et émet onEditorPrefabExploded(groups). | 1211 |
| `editor.findFirstSelectedByType(classname)` | Renvoie le premier objet sélectionné dont le nom de classe est classname. | 1355 |
| `editor.getDynamicFields(objectId)` | Renvoie la liste des noms de champs dynamiques de l'objet. | 346 |
| `editor.getFieldInfo(objectId, fieldName)` | Renvoie le type et les flags d'un champ ; table vide si l'objet n'existe pas. | 326 |
| `editor.getFieldValue(objectId, fieldName, arrayIndex)` | Lit un champ d'objet sous forme de chaîne. Renvoie "" si l'objet n'existe pas. | 238 |
| `editor.getFields(objectId)` | Renvoie les champs de l'objet destinés à l'éditeur (getFieldsForEditor), indexés par nom (id, groupName, type, elementCount, fields pour les tableaux...). | 338 |
| `editor.getFocusLockedGroup()` | Renvoie le groupe sur lequel le Focus-Lock est actif (l'arbre de scène ne montre que lui, seuls ses objets sont sélectionnables dans la vue, les nouveaux objets y sont créés). Efface le verrou s'il pointe vers un groupe supprimé. | 59 |
| `editor.getHighestObject(objects)` | Renvoie, parmi les ids donnés, l'objet le moins profond dans la hiérarchie des groupes. | 991 |
| `editor.getObjectSelection()` | Renvoie la liste des ids sélectionnés (table vide si aucune). | 1367 |
| `editor.getObjectsByRectangle(rect, forestData, objectFlags)` | Renvoie les objets (ou items de forêt si forestData fourni) dont le volume intersecte un rectangle écran, via un frustum dérivé du frustum caméra. | 574 |
| `editor.getSelectionCentroid()` | Renvoie le centre de la sélection : moyenne des positions, ou centre de la boîte englobante si la préférence gizmos.general.useObjectBoxCenter est vraie (sauf si un objet a des bornes globales). vec3(0,0,0) si vide. | 173 |
| `editor.hideObjectSelection()` | Cache les objets sélectionnés (hidden = "true"). | 668 |
| `editor.isFocusLockActive()` | Vrai si un Focus-Lock valide est actif. | 70 |
| `editor.isObjectInFocusLockedGroup(object)` | Vrai si aucun Focus-Lock n'est actif, ou si l'objet est le groupe verrouillé ou l'un de ses descendants. | 84 |
| `editor.isObjectSelectable(object)` | Vrai si l'objet est dans le groupe Focus-Lock et, pour un SceneObject, si sa sélection est activée. | 102 |
| `editor.isObjectSelected(objectId)` | Vrai si l'id fait partie de la sélection d'objets. | 117 |
| `editor.isObjectSelectionEmpty()` | Vrai si la sélection d'objets est vide. | 113 |
| `editor.lockObjectSelection()` | Verrouille les objets sélectionnés (champ locked = "true"). Le commentaire d'origine (« Select all the objects ») est erroné. Pas annulable (voir lockObjectSelectionWithUndo). | 656 |
| `editor.matrixToTable(mtx)` | Convertit une MatrixF en table sérialisable {c0, c1, c2, c3} (colonnes). | 28 |
| `editor.pasteFields(fields, targetObjectID)` | Applique une copie de copyFields sur un objet par id (via setFieldValue/setDynamicFieldValue), recharge les templates de route si useTemplate == "true" et marque le niveau modifié. | 417 |
| `editor.pasteFieldsToObject(fields, targetObject)` | Comme pasteFields mais sur un objet déjà résolu (appelle setField directement, sans preApply/postApply). | 442 |
| `editor.removeInvalidObjects(objectIds)` | Renvoie une copie de la liste sans les ids qui ne correspondent plus à un objet existant. | 1371 |
| `editor.removeInvalidSelectedObjects()` | Retire de la sélection les ids d'objets disparus. | 1382 |
| `editor.replaceGroupWithPrefabInstance(prefab, parentGroup, instanceName, position)` | Fait apparaître une instance du prefab v2 (spawn, échelle 1, rotation nulle) à la position donnée, l'ajoute au groupe parent et demande la reconstruction des collisions. | 1329 |
| `editor.resetObjectSelectionRotation()` | Remet la rotation à "0 0 0 0" des objets manipulables sélectionnés. | 799 |
| `editor.resetObjectSelectionScale()` | Remet l'échelle à "1 1 1" des objets manipulables sélectionnés. | 809 |
| `editor.resetObjectSelectionTransform()` | Remet rotation à zéro et échelle à 1,1,1 pour la sélection. | 793 |
| `editor.resolveAddGroup(defaultGroup)` | Renvoie le groupe de Focus-Lock s'il existe, sinon defaultGroup (groupe où ajouter les nouveaux objets). | 98 |
| `editor.restoreSimObjectMemento(jsonString)` | Recrée un objet depuis un memento : retire persistentId, désérialise et donne un nom unique (Sim.getUniqueName) dérivé du nom d'origine. | 1394 |
| `editor.rotateObjectSelection(gizmoTransform, centerPoint, initialTransformations, initialGizmoTransform)` | Applique aux objets sélectionnés la rotation du gizmo depuis l'état initial, autour de centerPoint (positions et orientations). Ne fait rien sans initialTransformations. | 842 |
| `editor.saveSimObjectMemento(obj)` | Sérialise un objet en texte JSON (memento), "" si nil. | 1386 |
| `editor.scaleObjectSelection(deltaScale, centerPoint)` | Met à l'échelle les objets sélectionnés d'un delta, autour de centerPoint (centre de la bbox par défaut), avec bornes 0.01 à 1000 et exclusion des axes à delta nul ; les positions sont mises à l'échelle dans le repère du gizmo. | 885 |
| `editor.selectObjectById(id, selectMode)` | Sélectionne un objet par id selon le mode. | 642 |
| `editor.selectObjects(idArray, selectMode)` | Modifie la sélection d'objets selon le mode, met à jour l'état côté C++, recalcule la bbox et émet onEditorObjectSelectionChanged si elle a changé. Ne passe pas par l'historique. | 548 |
| `editor.selectObjectsByNameMask(nameMask, selectMode)` | Sélectionne les objets dont le nom contient le motif Lua (string.find). | 598 |
| `editor.selectObjectsByRef(objects, selectMode)` | Comme selectObjects mais avec des objets plutôt que des ids. | 560 |
| `editor.selectObjectsByType(typeName, selectMode)` | Sélectionne les objets dont `className` vaut typeName. | 619 |
| `editor.setDynamicFieldValue(objectId, fieldName, value, arrayIndex)` | Fixe un champ dynamique d'un objet (index 0 par défaut). Pour un champ statique utiliser setFieldValue. | 312 |
| `editor.setFieldValue(objectId, fieldName, value, arrayIndex)` | Fixe un champ statique d'un objet (preApply, setField, marque editor-dirty, postApply). Ne passe pas par l'historique : pour l'annulation utiliser editor.changeObjectFieldWithUndo. | 297 |
| `editor.setFocusLockedGroup(id)` | Active le Focus-Lock sur le groupe d'id donné et émet onEditorFocusLockChanged. | 74 |
| `editor.setObjectSelectedBool(objectIds, selected)` | Marque/démarque chaque objet comme sélectionné côté C++ (setSelected) puis reconstruit les données d'instances de shapes. | 247 |
| `editor.setObjectSelectedBoolSingle(objectId, selected)` | Idem pour un seul objet. | 257 |
| `editor.setObjectSelectionTransformFromCamera()` | Place chaque objet manipulable sélectionné à la transformation de la caméra de l'éditeur en conservant son échelle (sans annulation, TODO dans le code). | 779 |
| `editor.showObjectSelection()` | Affiche les objets sélectionnés (hidden = "false"). | 674 |
| `editor.tableToMatrix(tbl)` | Reconstruit une MatrixF depuis une table {c0, c1, c2, c3}. | 36 |
| `editor.translateObjectSelection(deltaTranslate)` | Translate les objets manipulables sélectionnés d'un delta (via setFieldValue "position"). | 820 |
| `editor.unlockObjectSelection()` | Déverrouille les objets sélectionnés (locked = "false"). | 662 |
| `editor.unpackageSelectedPrefabInstance()` | Dépaquette les instances de prefab sélectionnées (unpackage) en groupes et supprime les instances. | 1294 |
| `editor.validateObjectName(name, newName)` | Valide un nom d'objet (isValidObjectName) ; refuse un nom vide quand newName est vrai. | 282 |

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
