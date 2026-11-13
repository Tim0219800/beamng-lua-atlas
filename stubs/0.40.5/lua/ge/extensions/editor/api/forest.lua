---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/api/forest.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- API de l'éditeur pour manipuler les éléments de forêt (arbres, rochers… instanciés via ForestData). initialize(editor) ajoute sur editor des fonctions pour ajouter, retirer, mettre à jour, tourner et sélectionner des ForestItem. Les fonctions qui modifient la forêt mettent editor.forestDirty = true et appellent editor.setDirty().
--- Accès : extension `editor_api_forest` : `extensions.load("editor_api_forest")`, puis la globale `editor_api_forest`
---@class editor_api_forest
editor_api_forest = {}

--- Installe les fonctions de ce module sur l'objet editor.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/api/forest.lua:104
---@param editorInstance table Objet editor
function editor_api_forest.initialize(editorInstance) end

--- Fonctions ajoutées à l'objet editor par initialize.
---@class editor_api_forest_editor
local editor_api_forest_editor = {}

--- Ajoute un ForestItem existant à la forêt.
---Source : lua/ge/extensions/editor/api/forest.lua:47
---@param forestData userdata ForestData
---@param item userdata ForestItem à ajouter
function editor_api_forest_editor.addForestItem(forestData, item) end

--- Crée un nouvel item en prenant un item existant comme modèle, avec une transformation et une échelle.
---Source : lua/ge/extensions/editor/api/forest.lua:68
---@param forestData userdata ForestData
---@param itemData userdata Données stockées d'un ForestItem existant
---@param transform MatrixF Nouvelle transformation
---@param scale number Nouvelle échelle
---@return userdata  Le ForestItem créé
function editor_api_forest_editor.createForestItem(forestData, itemData, transform, scale) end

--- Retire un ForestItem de la forêt.
---Source : lua/ge/extensions/editor/api/forest.lua:56
---@param forestData userdata ForestData
---@param item userdata ForestItem à retirer
function editor_api_forest_editor.removeForestItem(forestData, item) end

--- Applique une rotation delta aux items de forêt sélectionnés à partir de leurs transformations d'origine.
---Source : lua/ge/extensions/editor/api/forest.lua:16
---@param forestData userdata ForestData (C++) contenant les items
---@param deltaEulerRotation vec3 Rotation d'Euler à ajouter
---@param centerPoint vec3 Centre de rotation (sélection multiple)
---@param originalTransforms table<integer, MatrixF> Transformations avant rotation, dans l'ordre de la sélection
function editor_api_forest_editor.rotateForestSelection(forestData, deltaEulerRotation, centerPoint, originalTransforms) end

--- Définit la donnée personnalisée opaque d'un item.
---Source : lua/ge/extensions/editor/api/forest.lua:94
---@param forestData userdata ForestData
---@param key any Clé de l'item
---@param customData number Valeur empaquetée (-1 = aucune)
---@return userdata  Le ForestItem
function editor_api_forest_editor.setForestItemCustomData(forestData, key, customData) end

--- Marque un item comme sélectionné ou non (ne marque pas la forêt modifiée).
---Source : lua/ge/extensions/editor/api/forest.lua:100
---@param forestData userdata ForestData
---@param key any Clé de l'item
---@param selected boolean État de sélection (déduit du code)
---@return any  Résultat de forestData:setItemSelected
function editor_api_forest_editor.setForestItemSelected(forestData, key, selected) end

--- Met à jour les informations d'une instance (données, transformation, échelle, uid).
---Source : lua/ge/extensions/editor/api/forest.lua:83
---@param forestData userdata ForestData
---@param key any Clé de l'item
---@param keyPos vec3 Position d'origine de l'item
---@param newData userdata Données stockées de l'item
---@param newTrans MatrixF Nouvelle transformation
---@param newScale number Nouvelle échelle
---@param newUid any Identifiant unique
---@return userdata  Le ForestItem mis à jour
function editor_api_forest_editor.updateForestItem(forestData, key, keyPos, newData, newTrans, newScale, newUid) end

