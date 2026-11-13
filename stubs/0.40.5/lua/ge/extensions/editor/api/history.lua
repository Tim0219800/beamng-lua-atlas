---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/api/history.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Objet d'historique. Champs : maxUndoLevels, undoStack, redoStack, currentTransaction.
---@class editor_api_history
local editor_api_history = {}

--- Démarre un groupe d'actions annulables d'un seul coup. Les redo ne sont exécutés qu'à endTransaction.
---Source : lua/ge/extensions/editor/api/history.lua:76
---@param name string|nil nom de la transaction (optionnel)
---@return table|boolean  la transaction créée, ou false si une transaction est déjà en cours
function editor_api_history:beginTransaction(name) end

--- Abandonne la transaction en cours sans rien exécuter ni empiler (utile si une action a échoué).
---Source : lua/ge/extensions/editor/api/history.lua:88
function editor_api_history:cancelTransaction() end

--- Vide les piles d'undo et de redo (nouveau document).
---Source : lua/ge/extensions/editor/api/history.lua:173
function editor_api_history:clear() end

--- Enregistre une action undo/redo et exécute son redo. Dans une transaction, l'action est seulement ajoutée au groupe.
---Source : lua/ge/extensions/editor/api/history.lua:122
---@param name string nom de l'action, sans suffixe "Action" (ex. "MyCreateWhatever")
---@param data table données partagées par undoFunc et redoFunc
---@param undoFunc function function(actionData) qui annule l'action
---@param redoFunc function function(actionData) qui fait/refait l'action
---@param dontCallRedoNow boolean|nil true = ne pas appeler redoFunc maintenant
---@return any  voir notes : résultat de redoFunc, action, nil (doublon) ou false
function editor_api_history:commitAction(name, data, undoFunc, redoFunc, dontCallRedoNow) end

--- Restaure les piles depuis `data.history` s'il existe et annule la transaction en cours.
---Source : lua/ge/extensions/editor/api/history.lua:212
---@param data table table contenant history
function editor_api_history:deserialize(data) end

--- Termine la transaction : l'empile et exécute les redo de toutes ses actions (sauf dontCallRedoNow), puis vide la pile de redo.
---Source : lua/ge/extensions/editor/api/history.lua:94
---@param dontCallRedoNow boolean|nil true = ne pas exécuter les redo maintenant
---@return boolean  toujours true
function editor_api_history:endTransaction(dontCallRedoNow) end

--- Initialise les piles vides, maxUndoLevels = 1000, aucune transaction en cours. Appelé par le constructeur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/api/history.lua:31
function editor_api_history:init() end

--- Rétablit `steps` transactions : appelle redo de chaque action dans l'ordre, puis les remet sur la pile d'undo.
---Source : lua/ge/extensions/editor/api/history.lua:58
---@param steps integer|nil nombre de transactions à rétablir, 1 par défaut
function editor_api_history:redo(steps) end

--- Écrit `data.history = { undoStack, redoStack }` (références, pas de copie).
---Source : lua/ge/extensions/editor/api/history.lua:205
---@param data table table à remplir
function editor_api_history:serialize(data) end

--- Annule `steps` transactions : appelle undo de chaque action en ordre inverse, puis déplace la transaction sur la pile de redo. S'arrête si la pile est vide.
---Source : lua/ge/extensions/editor/api/history.lua:40
---@param steps integer|nil nombre de transactions à annuler, 1 par défaut
function editor_api_history:undo(steps) end

--- Dans les actions de la pile de redo, remplace `data.objectId` et les éléments de `data.objectIds` égaux à oldObjectId par newObjectId (utile quand un objet est recréé avec un autre id).
---Source : lua/ge/extensions/editor/api/history.lua:181
---@param oldObjectId integer ancien id
---@param newObjectId integer nouvel id
function editor_api_history:updateRedoStackObjectId(oldObjectId, newObjectId) end

