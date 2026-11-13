---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/api/objectHistoryActions.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Actions annulables (undo/redo) de l'éditeur de niveau pour les objets de la scène : création, suppression (objet ou groupe entier, restauré par sérialisation), changement de champ ou de champ dynamique, sélection, transformation, échelle, appel de hook. Chaque action est enregistrée via `editor.history:commitAction`. Le module renvoie une FONCTION : l'appeler installe `editor.lockObjectSelectionWithUndo` & co sur `editor` puis renvoie la table de fonctions (M). Un outil d'éditeur utilise les `...WithUndo` pour que ses modifications soient annulables.
--- Accès : `require("extensions/editor/api/objectHistoryActions")` (fichier sous extensions/ mais pas une extension classique)
---@class editor_api_objectHistoryActions
editor_api_objectHistoryActions = {}

--- Enregistre une action "CallHook" dont undo et redo appellent tous deux extensions.hook(hookName, ...). (assignée dynamiquement)
---Source : lua/ge/extensions/editor/api/objectHistoryActions.lua:dyn
---@param hookName string nom du hook
---@param ... any arguments passés au hook
function editor_api_objectHistoryActions.callHookWithUndo(hookName, ...) end

--- Applique la nouvelle valeur d'un champ dynamique et émet onEditorInspectorDynFieldChanged. (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/api/objectHistoryActions.lua:dyn
---@param actionData table {objectIds, fieldName, newFieldValue, arrayIndex}
function editor_api_objectHistoryActions.changeObjectDynFieldRedo(actionData) end

--- Restaure les anciennes valeurs d'un champ dynamique et émet onEditorInspectorDynFieldChanged. (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/api/objectHistoryActions.lua:dyn
---@param actionData table {objectIds, fieldName, oldFieldValues, arrayIndex}
function editor_api_objectHistoryActions.changeObjectDynFieldUndo(actionData) end

--- Change un champ dynamique sur plusieurs objets de façon annulable. (assignée dynamiquement)
---Source : lua/ge/extensions/editor/api/objectHistoryActions.lua:dyn
---@param objIds integer[] ids des objets
---@param fieldName string nom du champ dynamique
---@param newFieldValue string nouvelle valeur
---@param arrayIndex integer|nil index (non converti en chaîne ici)
function editor_api_objectHistoryActions.changeObjectDynFieldWithUndo(objIds, fieldName, newFieldValue, arrayIndex) end

--- Comme changeObjectFieldWithUndo mais avec une valeur différente par objet. (assignée dynamiquement)
---Source : lua/ge/extensions/editor/api/objectHistoryActions.lua:dyn
---@param objIds integer[] ids des objets
---@param fieldName string nom du champ
---@param newFieldValues table valeurs, même ordre que objIds
---@param arrayIndex integer|nil index dans un champ tableau
function editor_api_objectHistoryActions.changeObjectFieldMultipleValuesWithUndo(objIds, fieldName, newFieldValues, arrayIndex) end

--- Applique la nouvelle valeur du champ sur tous les objets et émet onEditorInspectorFieldChanged. (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/api/objectHistoryActions.lua:dyn
---@param actionData table {objectIds, fieldName, newFieldValue, arrayIndex}
function editor_api_objectHistoryActions.changeObjectFieldRedo(actionData) end

--- Remet les anciennes valeurs du champ sur tous les objets, met à jour le gizmo/la bbox et émet onEditorInspectorFieldChanged. (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/api/objectHistoryActions.lua:dyn
---@param actionData table {objectIds, fieldName, oldFieldValues, arrayIndex}
function editor_api_objectHistoryActions.changeObjectFieldUndo(actionData) end

--- Comme changeObjectFieldWithUndo mais l'appelant fournit lui-même les anciennes valeurs (utile quand le champ a déjà été modifié pendant une édition interactive). (assignée dynamiquement)
---Source : lua/ge/extensions/editor/api/objectHistoryActions.lua:dyn
---@param objIds integer[] ids des objets
---@param fieldName string nom du champ
---@param newFieldValue string nouvelle valeur
---@param oldFieldValues table anciennes valeurs, même ordre que objIds
---@param arrayIndex integer|nil index dans un champ tableau
function editor_api_objectHistoryActions.changeObjectFieldWithOldValues(objIds, fieldName, newFieldValue, oldFieldValues, arrayIndex) end

--- Change un champ sur plusieurs objets en mémorisant les anciennes valeurs (getField). (assignée dynamiquement)
---Source : lua/ge/extensions/editor/api/objectHistoryActions.lua:dyn
---@param objIds integer[] ids des objets
---@param fieldName string nom du champ
---@param newFieldValue string nouvelle valeur (identique pour tous)
---@param arrayIndex integer|nil index dans un champ tableau
function editor_api_objectHistoryActions.changeObjectFieldWithUndo(objIds, fieldName, newFieldValue, arrayIndex) end

--- Crée un objet de classe actionData.className, l'enregistre sous actionData.name et l'ajoute au groupe actionData.parentId ou à MissionGroup ; mémorise le nouvel id (réutilise l'ancien via setForcedId) et émet onEditorObjectAdded. (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/api/objectHistoryActions.lua:dyn
---@param actionData table {name, className, parentId?, objectId?}
---@return integer|nil  id de l'objet créé (nil si MissionGroup absent)
function editor_api_objectHistoryActions.createObjectRedo(actionData) end

--- Annule une création : supprime l'objet actionData.objectId et remet objectId à nil. (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/api/objectHistoryActions.lua:dyn
---@param actionData table {objectId}
function editor_api_objectHistoryActions.createObjectUndo(actionData) end

--- Crée un objet via une action annulable "CreateObject" et marque l'éditeur comme modifié. (assignée dynamiquement)
---Source : lua/ge/extensions/editor/api/objectHistoryActions.lua:dyn
---@param name string nom d'enregistrement
---@param className string classe C++ à créer
function editor_api_objectHistoryActions.createObjectWithUndo(name, className) end

--- Sérialise l'objet (ou la hiérarchie du groupe) puis le supprime avec editor.deleteObject, sauf s'il est verrouillé. (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/api/objectHistoryActions.lua:dyn
---@param actionData table {objectId}
function editor_api_objectHistoryActions.deleteObjectRedo(actionData) end

--- Restaure l'objet (ou tout le groupe) supprimé depuis serializedData avec son id d'origine, le replace avant nextObjIdInGroup et émet onEditorObjectAdded. (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/api/objectHistoryActions.lua:dyn
---@param actionData table {objectId, serializedData, isSimSet?, nextObjIdInGroup?}
function editor_api_objectHistoryActions.deleteObjectUndo(actionData) end

--- Supprime un objet via une action annulable "DeleteObject", vide la sélection et marque l'éditeur modifié. (assignée dynamiquement)
---Source : lua/ge/extensions/editor/api/objectHistoryActions.lua:dyn
---@param objId integer id de l'objet
function editor_api_objectHistoryActions.deleteObjectWithUndo(objId) end

--- Supprime tous les objets sélectionnés dans une seule transaction "DeleteSelectedObjects". Ne fait rien si la sélection est vide. (assignée dynamiquement)
---Source : lua/ge/extensions/editor/api/objectHistoryActions.lua:dyn
function editor_api_objectHistoryActions.deleteSelectedObjectsWithUndo() end

--- Applique la nouvelle sélection (newSelection), recalcule la bbox et émet onEditorObjectSelectionChanged. (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/api/objectHistoryActions.lua:dyn
---@param actionData table {newSelection}
function editor_api_objectHistoryActions.selectObjectsRedo(actionData) end

--- Rétablit l'ancienne sélection (oldSelection), recalcule la bbox et émet onEditorObjectSelectionChanged. (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/api/objectHistoryActions.lua:dyn
---@param actionData table {oldSelection}
function editor_api_objectHistoryActions.selectObjectsUndo(actionData) end

--- Change la sélection d'objets de façon annulable. Ignore l'appel si l'ancienne et la nouvelle sélection sont égales, ou si la dernière action est déjà une SelectObjects avec la même nouvelle sélection. (assignée dynamiquement)
---Source : lua/ge/extensions/editor/api/objectHistoryActions.lua:dyn
---@param newSelection integer[] nouveaux ids sélectionnés
---@param oldSelection integer[] ids précédemment sélectionnés
function editor_api_objectHistoryActions.selectObjectsWithUndo(newSelection, oldSelection) end

--- Applique newScale à l'objet. (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/api/objectHistoryActions.lua:dyn
---@param actionData table {objectId, newScale}
function editor_api_objectHistoryActions.setObjectScaleRedo(actionData) end

--- Remet oldScale sur l'objet. (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/api/objectHistoryActions.lua:dyn
---@param actionData table {objectId, oldScale}
function editor_api_objectHistoryActions.setObjectScaleUndo(actionData) end

--- Applique newTransform à l'objet. (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/api/objectHistoryActions.lua:dyn
---@param actionData table {objectId, newTransform}
function editor_api_objectHistoryActions.setObjectTransformRedo(actionData) end

--- Remet l'ancienne transformation (oldTransform, table convertie en matrice) sur l'objet. (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/api/objectHistoryActions.lua:dyn
---@param actionData table {objectId, oldTransform}
function editor_api_objectHistoryActions.setObjectTransformUndo(actionData) end

--- Fonctions ajoutées à `editor` quand on appelle la fonction renvoyée par le module. Elles agissent sur editor.selection.object.
---@class editor_api_objectHistoryActions_editor
local editor_api_objectHistoryActions_editor = {}

--- Cache (hidden = "true") les objets sélectionnés, annulable.
---Source : lua/ge/extensions/editor/api/objectHistoryActions.lua:343
function editor_api_objectHistoryActions_editor.hideObjectSelectionWithUndo() end

--- Verrouille (locked = "true") les objets sélectionnés, annulable.
---Source : lua/ge/extensions/editor/api/objectHistoryActions.lua:335
function editor_api_objectHistoryActions_editor.lockObjectSelectionWithUndo() end

--- Affiche (hidden = "false") les objets sélectionnés, annulable.
---Source : lua/ge/extensions/editor/api/objectHistoryActions.lua:347
function editor_api_objectHistoryActions_editor.showObjectSelectionWithUndo() end

--- Déverrouille (locked = "false") les objets sélectionnés, annulable.
---Source : lua/ge/extensions/editor/api/objectHistoryActions.lua:339
function editor_api_objectHistoryActions_editor.unlockObjectSelectionWithUndo() end

