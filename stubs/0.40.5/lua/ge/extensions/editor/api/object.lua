---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/api/object.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- API de l'éditeur pour manipuler les objets de la scène : sélection (par id, référence, type, masque de nom, rectangle écran), lecture/écriture des champs (statiques et dynamiques, copier/coller), verrouiller/cacher, aligner, translater/tourner/mettre à l'échelle la sélection, centroïde et boîte englobante, Focus-Lock sur un groupe, prefabs (créer, exploser, convertir en v2, dépaqueter) et mementos de SimObject. `initialize` installe tout sur `editor` et définit les constantes `editor.SelectMode_*` ; `initializeFocusLock` ajoute les fonctions de Focus-Lock. La sélection vit dans `editor.selection.object` (liste d'ids). Les fonctions de ce fichier n'enregistrent PAS d'historique d'annulation : voir objectHistoryActions pour les versions `...WithUndo`.
--- Accès : extension `editor_api_object` : `extensions.load("editor_api_object")`, puis la globale `editor_api_object`
---@class editor_api_object
editor_api_object = {}

--- Mémorise l'éditeur, définit editor.SelectMode_* et editor.objectSelectionBBox, et installe les fonctions de sélection, champs, alignement, transformation et prefabs sur `editor`.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/api/object.lua:1408
---@param editorInstance table objet `editor`
function editor_api_object.initialize(editorInstance) end

--- Installe séparément les fonctions de Focus-Lock (getFocusLockedGroup, isFocusLockActive, setFocusLockedGroup, clearFocusLock, isObjectInFocusLockedGroup, resolveAddGroup) pour contourner la limite de 60 upvalues de initialize.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/api/object.lua:1482
function editor_api_object.initializeFocusLock() end

--- Fonctions ajoutées à `editor` par initialize et initializeFocusLock.
---@class editor_api_object_editor
local editor_api_object_editor = {}

--- Aligne les objets sur la boîte englobante extrême selon l'axe. Valeurs de boundsAxis : 0-2 (editor.AxisX/Y/Z) = alignement sur le bord max de cet axe ; 3-5 = bord min de l'axe (valeur - 3). Ne fait rien (renvoie true) s'il y a moins de 2 objets.
---Source : lua/ge/extensions/editor/api/object.lua:685
---@param boundsAxis integer 0-5 (voir description)
---@return boolean  false si boundsAxis hors de 0..5, sinon true
function editor_api_object_editor.alignObjectSelectionByBounds(boundsAxis) end

--- Aligne tous les objets manipulables sur la coordonnée du premier objet sélectionné pour l'axe donné.
---Source : lua/ge/extensions/editor/api/object.lua:755
---@param axis integer editor.AxisX, AxisY ou AxisZ
---@return boolean  false si axe invalide ou premier objet introuvable, sinon true
function editor_api_object_editor.alignObjectSelectionByCenter(axis) end

--- Calcule le centre de la boîte englobante des enfants non-groupe des SimGroup donnés (mêmes limites que calculateObjectsCenter pour les sous-groupes).
---Source : lua/ge/extensions/editor/api/object.lua:1050
---@param objects integer[] ids de groupes
---@return vec3  centre de boîte
function editor_api_object_editor.calculateBoundingBoxCenter(objects) end

--- Calcule le centre (moyenne des positions) des enfants des SimGroup donnés. Les objets non-groupe de la liste sont ignorés ; les sous-groupes ne sont pas parcourus (bug : `childId` est une variable non définie, donc rien n'est empilé). Divise par zéro (NaN) si aucun enfant.
---Source : lua/ge/extensions/editor/api/object.lua:1005
---@param objects integer[] ids de groupes
---@return vec3  centre
function editor_api_object_editor.calculateObjectsCenter(objects) end

--- Vrai si l'objet existe, n'est ni un SimSet ni un SimGroup et n'est pas verrouillé.
---Source : lua/ge/extensions/editor/api/object.lua:45
---@param object userdata|nil objet
---@return boolean  manipulable
function editor_api_object_editor.canManipulateObject(object) end

--- Désactive le Focus-Lock et émet onEditorFocusLockChanged.
---Source : lua/ge/extensions/editor/api/object.lua:79
function editor_api_object_editor.clearFocusLock() end

--- Désélectionne tout (côté C++ aussi), met la sélection à nil, recalcule la bbox et émet onEditorObjectSelectionChanged.
---Source : lua/ge/extensions/editor/api/object.lua:475
function editor_api_object_editor.clearObjectSelection() end

--- Recalcule editor.objectSelectionBBox et editor.objectSelectionRadius à partir des boîtes monde de la sélection (bornes infinies ignorées, repli sur la boîte objet), met à jour le centroïde et, par défaut, le gizmo (editor.updateObjectSelectionAxisGizmo).
---Source : lua/ge/extensions/editor/api/object.lua:189
---@param updateGizmo boolean|nil false pour ne pas mettre à jour le gizmo (défaut true)
function editor_api_object_editor.computeSelectionBBox(updateGizmo) end

--- Convertit les prefabs sélectionnés au format v2 et les remplace par des instances (replaceGroupWithPrefabInstance) au centre de leur boîte.
---Source : lua/ge/extensions/editor/api/object.lua:1253
---@return userdata[]|nil  instances créées
function editor_api_object_editor.convertSelectedPrefabsToV2() end

--- Copie les valeurs de champs d'un objet (hors groupe Transform, name, persistentId, parentGroup), y compris éléments de tableaux et champs dynamiques.
---Source : lua/ge/extensions/editor/api/object.lua:354
---@param objectID integer id de l'objet
---@return table  {fields, dynamicFields, arrayElements}
function editor_api_object_editor.copyFields(objectID) end

--- Crée un Prefab depuis la sélection : regroupe les objets valides dans un SimGroup relatif au centroïde, enregistre le Prefab dans le groupe du plus haut objet, le sauvegarde, supprime les anciens groupes, sélectionne le prefab et marque le niveau modifié. Pas d'annulation (TODO).
---Source : lua/ge/extensions/editor/api/object.lua:1095
---@param newPrefabFilename string fichier .prefab.json de destination
---@param objName string|nil nom de l'objet (défaut : nom du fichier)
---@param loadmode string|nil "auto" ou "manual"
---@param pathNative boolean|nil true si le chemin est natif (converti en virtuel)
---@return userdata|nil  le Prefab, nil si rien de valide
function editor_api_object_editor.createPrefabFromObjectSelection(newPrefabFilename, objName, loadmode, pathNative) end

--- Supprime (editor.deleteObject) tous les objets sélectionnés et vide la sélection. Pas d'historique : pour l'annulation utiliser deleteSelectedObjectsWithUndo.
---Source : lua/ge/extensions/editor/api/object.lua:467
function editor_api_object_editor.deleteSelectedObjects() end

--- Vide la sélection (table vide, côté C++ aussi) et émet onEditorObjectSelectionChanged.
---Source : lua/ge/extensions/editor/api/object.lua:648
function editor_api_object_editor.deselectObjectSelection() end

--- Appelle onEditorEnable ou onEditorDisable sur tous les objets de la scène qui ont ces méthodes. Utilisé en interne au basculement du mode éditeur ; ne fait rien si le niveau n'est pas chargé.
---Source : lua/ge/extensions/editor/api/object.lua:267
---@param enable boolean true = activer le mode édition
function editor_api_object_editor.enableEditorOnObjects(enable) end

--- Explose les prefabs sélectionnés en groupes d'objets (nom <prefab>_unpacked), supprime les prefabs, sélectionne les groupes et émet onEditorPrefabExploded(groups).
---Source : lua/ge/extensions/editor/api/object.lua:1211
---@return userdata[]|nil  groupes créés
function editor_api_object_editor.explodeSelectedPrefab() end

--- Renvoie le premier objet sélectionné dont le nom de classe est classname.
---Source : lua/ge/extensions/editor/api/object.lua:1355
---@param classname string nom de classe
---@return userdata|nil  objet
function editor_api_object_editor.findFirstSelectedByType(classname) end

--- Renvoie la liste des noms de champs dynamiques de l'objet.
---Source : lua/ge/extensions/editor/api/object.lua:346
---@param objectId integer id de l'objet
---@return string[]|nil  noms
function editor_api_object_editor.getDynamicFields(objectId) end

--- Renvoie le type et les flags d'un champ ; table vide si l'objet n'existe pas.
---Source : lua/ge/extensions/editor/api/object.lua:326
---@param objectId integer id de l'objet
---@param fieldName string nom du champ
---@return table  {type, flags}
function editor_api_object_editor.getFieldInfo(objectId, fieldName) end

--- Lit un champ d'objet sous forme de chaîne. Renvoie "" si l'objet n'existe pas.
---Source : lua/ge/extensions/editor/api/object.lua:238
---@param objectId integer id de l'objet
---@param fieldName string nom du champ
---@param arrayIndex integer|nil index dans un champ tableau
---@return string  valeur
function editor_api_object_editor.getFieldValue(objectId, fieldName, arrayIndex) end

--- Renvoie les champs de l'objet destinés à l'éditeur (getFieldsForEditor), indexés par nom (id, groupName, type, elementCount, fields pour les tableaux...).
---Source : lua/ge/extensions/editor/api/object.lua:338
---@param objectId integer id de l'objet
---@return table|nil  champs
function editor_api_object_editor.getFields(objectId) end

--- Renvoie le groupe sur lequel le Focus-Lock est actif (l'arbre de scène ne montre que lui, seuls ses objets sont sélectionnables dans la vue, les nouveaux objets y sont créés). Efface le verrou s'il pointe vers un groupe supprimé.
---Source : lua/ge/extensions/editor/api/object.lua:59
---@return userdata|nil  groupe verrouillé
function editor_api_object_editor.getFocusLockedGroup() end

--- Renvoie, parmi les ids donnés, l'objet le moins profond dans la hiérarchie des groupes.
---Source : lua/ge/extensions/editor/api/object.lua:991
---@param objects integer[] ids
---@return userdata|nil  objet le plus haut
function editor_api_object_editor.getHighestObject(objects) end

--- Renvoie la liste des ids sélectionnés (table vide si aucune).
---Source : lua/ge/extensions/editor/api/object.lua:1367
---@return integer[]  ids
function editor_api_object_editor.getObjectSelection() end

--- Renvoie les objets (ou items de forêt si forestData fourni) dont le volume intersecte un rectangle écran, via un frustum dérivé du frustum caméra.
---Source : lua/ge/extensions/editor/api/object.lua:574
---@param rect table rectangle écran {topLeft, bottomRight}
---@param forestData userdata|nil ForestData optionnel
---@param objectFlags integer|nil masque de types (défaut terrain, eau, static shape, joueur, item, véhicule, lumière)
---@return table  liste d'objets/items
---@return Frustum  frustum du rectangle
function editor_api_object_editor.getObjectsByRectangle(rect, forestData, objectFlags) end

--- Renvoie le centre de la sélection : moyenne des positions, ou centre de la boîte englobante si la préférence gizmos.general.useObjectBoxCenter est vraie (sauf si un objet a des bornes globales). vec3(0,0,0) si vide.
---Source : lua/ge/extensions/editor/api/object.lua:173
---@return vec3  centre
function editor_api_object_editor.getSelectionCentroid() end

--- Cache les objets sélectionnés (hidden = "true").
---Source : lua/ge/extensions/editor/api/object.lua:668
function editor_api_object_editor.hideObjectSelection() end

--- Vrai si un Focus-Lock valide est actif.
---Source : lua/ge/extensions/editor/api/object.lua:70
---@return boolean  actif
function editor_api_object_editor.isFocusLockActive() end

--- Vrai si aucun Focus-Lock n'est actif, ou si l'objet est le groupe verrouillé ou l'un de ses descendants.
---Source : lua/ge/extensions/editor/api/object.lua:84
---@param object userdata|nil objet
---@return boolean  dans le groupe verrouillé
function editor_api_object_editor.isObjectInFocusLockedGroup(object) end

--- Vrai si l'objet est dans le groupe Focus-Lock et, pour un SceneObject, si sa sélection est activée.
---Source : lua/ge/extensions/editor/api/object.lua:102
---@param object userdata objet
---@return boolean  sélectionnable
function editor_api_object_editor.isObjectSelectable(object) end

--- Vrai si l'id fait partie de la sélection d'objets.
---Source : lua/ge/extensions/editor/api/object.lua:117
---@param objectId integer id de l'objet
---@return boolean  sélectionné
function editor_api_object_editor.isObjectSelected(objectId) end

--- Vrai si la sélection d'objets est vide.
---Source : lua/ge/extensions/editor/api/object.lua:113
---@return boolean  vide
function editor_api_object_editor.isObjectSelectionEmpty() end

--- Verrouille les objets sélectionnés (champ locked = "true"). Le commentaire d'origine (« Select all the objects ») est erroné. Pas annulable (voir lockObjectSelectionWithUndo).
---Source : lua/ge/extensions/editor/api/object.lua:656
function editor_api_object_editor.lockObjectSelection() end

--- Convertit une MatrixF en table sérialisable {c0, c1, c2, c3} (colonnes).
---Source : lua/ge/extensions/editor/api/object.lua:28
---@param mtx MatrixF matrice
---@return table  {c0, c1, c2, c3}
function editor_api_object_editor.matrixToTable(mtx) end

--- Applique une copie de copyFields sur un objet par id (via setFieldValue/setDynamicFieldValue), recharge les templates de route si useTemplate == "true" et marque le niveau modifié.
---Source : lua/ge/extensions/editor/api/object.lua:417
---@param fields table résultat de copyFields
---@param targetObjectID integer id cible
function editor_api_object_editor.pasteFields(fields, targetObjectID) end

--- Comme pasteFields mais sur un objet déjà résolu (appelle setField directement, sans preApply/postApply).
---Source : lua/ge/extensions/editor/api/object.lua:442
---@param fields table résultat de copyFields
---@param targetObject userdata objet cible
function editor_api_object_editor.pasteFieldsToObject(fields, targetObject) end

--- Renvoie une copie de la liste sans les ids qui ne correspondent plus à un objet existant.
---Source : lua/ge/extensions/editor/api/object.lua:1371
---@param objectIds integer[] ids
---@return integer[]  ids valides
function editor_api_object_editor.removeInvalidObjects(objectIds) end

--- Retire de la sélection les ids d'objets disparus.
---Source : lua/ge/extensions/editor/api/object.lua:1382
function editor_api_object_editor.removeInvalidSelectedObjects() end

--- Fait apparaître une instance du prefab v2 (spawn, échelle 1, rotation nulle) à la position donnée, l'ajoute au groupe parent et demande la reconstruction des collisions.
---Source : lua/ge/extensions/editor/api/object.lua:1329
---@param prefab userdata|nil prefab v2
---@param parentGroup userdata|nil groupe parent
---@param instanceName string nom de l'instance
---@param position vec3 position
---@return userdata|nil  instance
function editor_api_object_editor.replaceGroupWithPrefabInstance(prefab, parentGroup, instanceName, position) end

--- Remet la rotation à "0 0 0 0" des objets manipulables sélectionnés.
---Source : lua/ge/extensions/editor/api/object.lua:799
function editor_api_object_editor.resetObjectSelectionRotation() end

--- Remet l'échelle à "1 1 1" des objets manipulables sélectionnés.
---Source : lua/ge/extensions/editor/api/object.lua:809
function editor_api_object_editor.resetObjectSelectionScale() end

--- Remet rotation à zéro et échelle à 1,1,1 pour la sélection.
---Source : lua/ge/extensions/editor/api/object.lua:793
function editor_api_object_editor.resetObjectSelectionTransform() end

--- Renvoie le groupe de Focus-Lock s'il existe, sinon defaultGroup (groupe où ajouter les nouveaux objets).
---Source : lua/ge/extensions/editor/api/object.lua:98
---@param defaultGroup userdata|nil groupe par défaut
---@return userdata|nil  groupe cible
function editor_api_object_editor.resolveAddGroup(defaultGroup) end

--- Recrée un objet depuis un memento : retire persistentId, désérialise et donne un nom unique (Sim.getUniqueName) dérivé du nom d'origine.
---Source : lua/ge/extensions/editor/api/object.lua:1394
---@param jsonString string memento de saveSimObjectMemento
---@return userdata|nil  nouvel objet
function editor_api_object_editor.restoreSimObjectMemento(jsonString) end

--- Applique aux objets sélectionnés la rotation du gizmo depuis l'état initial, autour de centerPoint (positions et orientations). Ne fait rien sans initialTransformations.
---Source : lua/ge/extensions/editor/api/object.lua:842
---@param gizmoTransform MatrixF transformation courante du gizmo
---@param centerPoint vec3 centre de rotation
---@param initialTransformations MatrixF[] transformations des objets au début du glissement
---@param initialGizmoTransform MatrixF transformation du gizmo au début du glissement
function editor_api_object_editor.rotateObjectSelection(gizmoTransform, centerPoint, initialTransformations, initialGizmoTransform) end

--- Sérialise un objet en texte JSON (memento), "" si nil.
---Source : lua/ge/extensions/editor/api/object.lua:1386
---@param obj userdata|nil objet
---@return string  JSON
function editor_api_object_editor.saveSimObjectMemento(obj) end

--- Met à l'échelle les objets sélectionnés d'un delta, autour de centerPoint (centre de la bbox par défaut), avec bornes 0.01 à 1000 et exclusion des axes à delta nul ; les positions sont mises à l'échelle dans le repère du gizmo.
---Source : lua/ge/extensions/editor/api/object.lua:885
---@param deltaScale vec3 delta d'échelle (ne fait rien si longueur nulle)
---@param centerPoint vec3|nil centre de l'échelle
function editor_api_object_editor.scaleObjectSelection(deltaScale, centerPoint) end

--- Sélectionne un objet par id selon le mode.
---Source : lua/ge/extensions/editor/api/object.lua:642
---@param id integer id de l'objet
---@param selectMode integer|nil mode : editor.SelectMode_New (1, défaut), _Add (2), _Remove (3), _Toggle (4)
---@return boolean  sélection changée
function editor_api_object_editor.selectObjectById(id, selectMode) end

--- Modifie la sélection d'objets selon le mode, met à jour l'état côté C++, recalcule la bbox et émet onEditorObjectSelectionChanged si elle a changé. Ne passe pas par l'historique.
---Source : lua/ge/extensions/editor/api/object.lua:548
---@param idArray integer[] ids des objets
---@param selectMode integer|nil mode : editor.SelectMode_New (1, défaut), _Add (2), _Remove (3), _Toggle (4)
---@return boolean  true si la sélection a changé
function editor_api_object_editor.selectObjects(idArray, selectMode) end

--- Sélectionne les objets dont le nom contient le motif Lua (string.find).
---Source : lua/ge/extensions/editor/api/object.lua:598
---@param nameMask string motif Lua
---@param selectMode integer|nil mode : editor.SelectMode_New (1, défaut), _Add (2), _Remove (3), _Toggle (4)
---@return boolean  sélection changée
function editor_api_object_editor.selectObjectsByNameMask(nameMask, selectMode) end

--- Comme selectObjects mais avec des objets plutôt que des ids.
---Source : lua/ge/extensions/editor/api/object.lua:560
---@param objects table liste d'objets
---@param selectMode integer|nil mode : editor.SelectMode_New (1, défaut), _Add (2), _Remove (3), _Toggle (4)
---@return boolean  sélection changée
function editor_api_object_editor.selectObjectsByRef(objects, selectMode) end

--- Sélectionne les objets dont `className` vaut typeName.
---Source : lua/ge/extensions/editor/api/object.lua:619
---@param typeName string nom de classe
---@param selectMode integer|nil mode : editor.SelectMode_New (1, défaut), _Add (2), _Remove (3), _Toggle (4)
---@return boolean  sélection changée
function editor_api_object_editor.selectObjectsByType(typeName, selectMode) end

--- Fixe un champ dynamique d'un objet (index 0 par défaut). Pour un champ statique utiliser setFieldValue.
---Source : lua/ge/extensions/editor/api/object.lua:312
---@param objectId integer id de l'objet
---@param fieldName string nom
---@param value string valeur en texte
---@param arrayIndex integer|nil index (0)
function editor_api_object_editor.setDynamicFieldValue(objectId, fieldName, value, arrayIndex) end

--- Fixe un champ statique d'un objet (preApply, setField, marque editor-dirty, postApply). Ne passe pas par l'historique : pour l'annulation utiliser editor.changeObjectFieldWithUndo.
---Source : lua/ge/extensions/editor/api/object.lua:297
---@param objectId integer id de l'objet
---@param fieldName string nom du champ
---@param value string valeur en texte
---@param arrayIndex integer|string|nil index de tableau (passé via tostring ; nil devient la chaîne "nil")
function editor_api_object_editor.setFieldValue(objectId, fieldName, value, arrayIndex) end

--- Active le Focus-Lock sur le groupe d'id donné et émet onEditorFocusLockChanged.
---Source : lua/ge/extensions/editor/api/object.lua:74
---@param id integer id du SimGroup
function editor_api_object_editor.setFocusLockedGroup(id) end

--- Marque/démarque chaque objet comme sélectionné côté C++ (setSelected) puis reconstruit les données d'instances de shapes.
---Source : lua/ge/extensions/editor/api/object.lua:247
---@param objectIds integer[]|nil ids
---@param selected boolean|nil sélectionné (false si nil)
function editor_api_object_editor.setObjectSelectedBool(objectIds, selected) end

--- Idem pour un seul objet.
---Source : lua/ge/extensions/editor/api/object.lua:257
---@param objectId integer|nil id
---@param selected boolean sélectionné
function editor_api_object_editor.setObjectSelectedBoolSingle(objectId, selected) end

--- Place chaque objet manipulable sélectionné à la transformation de la caméra de l'éditeur en conservant son échelle (sans annulation, TODO dans le code).
---Source : lua/ge/extensions/editor/api/object.lua:779
function editor_api_object_editor.setObjectSelectionTransformFromCamera() end

--- Affiche les objets sélectionnés (hidden = "false").
---Source : lua/ge/extensions/editor/api/object.lua:674
function editor_api_object_editor.showObjectSelection() end

--- Reconstruit une MatrixF depuis une table {c0, c1, c2, c3}.
---Source : lua/ge/extensions/editor/api/object.lua:36
---@param tbl table table produite par matrixToTable
---@return MatrixF  matrice
function editor_api_object_editor.tableToMatrix(tbl) end

--- Translate les objets manipulables sélectionnés d'un delta (via setFieldValue "position").
---Source : lua/ge/extensions/editor/api/object.lua:820
---@param deltaTranslate vec3 delta de position (mètres)
function editor_api_object_editor.translateObjectSelection(deltaTranslate) end

--- Déverrouille les objets sélectionnés (locked = "false").
---Source : lua/ge/extensions/editor/api/object.lua:662
function editor_api_object_editor.unlockObjectSelection() end

--- Dépaquette les instances de prefab sélectionnées (unpackage) en groupes et supprime les instances.
---Source : lua/ge/extensions/editor/api/object.lua:1294
---@return userdata[]|nil  groupes créés
function editor_api_object_editor.unpackageSelectedPrefabInstance() end

--- Valide un nom d'objet (isValidObjectName) ; refuse un nom vide quand newName est vrai.
---Source : lua/ge/extensions/editor/api/object.lua:282
---@param name string nom
---@param newName boolean|nil true si c'est un nouveau nom
---@return boolean  valide
function editor_api_object_editor.validateObjectName(name, newName) end

