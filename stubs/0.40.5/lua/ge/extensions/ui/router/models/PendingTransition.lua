---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/models/PendingTransition.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Modèle de données « PendingTransition » : représente une transition de navigation en cours {transitionId, action, toRoute, fromRoute, options}. Fournit un constructeur, une validation et des prédicats sur l'action (retour, avant, mise à jour de l'historique, effacement de la pile avant).
--- Accès : extension `ui_router_models_PendingTransition` : `extensions.load("ui_router_models_PendingTransition")`, puis la globale `ui_router_models_PendingTransition`
---@class ui_router_models_PendingTransition
ui_router_models_PendingTransition = {}

--- Crée une PendingTransition. Renvoie nil (erreur journalisée) si toRoute est absent.
---Source : lua/ge/extensions/ui/router/models/PendingTransition.lua:53
---@param action string push, replace, back ou forward.
---@param toRoute table ResolvedRoute de destination.
---@param fromRoute table|nil Entrée d'historique d'origine.
---@param options table|nil Options de navigation ({} par défaut).
---@return table|nil  {transitionId, action, toRoute, fromRoute, options}.
function ui_router_models_PendingTransition.create(action, toRoute, fromRoute, options) end

--- Indique si l'action est « back ».
---Source : lua/ge/extensions/ui/router/models/PendingTransition.lua:115
---@param transition table|nil Transition.
---@return boolean|nil  true si action == back (nil/false si transition nil).
function ui_router_models_PendingTransition.isBackward(transition) end

--- Indique si l'action est « forward ».
---Source : lua/ge/extensions/ui/router/models/PendingTransition.lua:125
---@param transition table|nil Transition.
---@return boolean|nil  true si action == forward.
function ui_router_models_PendingTransition.isForward(transition) end

--- Indique si la navigation efface la pile « avant » (push et replace).
---Source : lua/ge/extensions/ui/router/models/PendingTransition.lua:152
---@param transition table|nil Transition.
---@return boolean  true pour push et replace.
function ui_router_models_PendingTransition.shouldClearForward(transition) end

--- Indique si la navigation ajoute une entrée à l'historique (uniquement push).
---Source : lua/ge/extensions/ui/router/models/PendingTransition.lua:135
---@param transition table|nil Transition.
---@return boolean  true pour push.
function ui_router_models_PendingTransition.shouldUpdateHistory(transition) end

--- Vérifie la présence de transitionId, action et toRoute.
---Source : lua/ge/extensions/ui/router/models/PendingTransition.lua:86
---@param transition table|nil Transition à valider.
---@return boolean  true si valide.
---@return string[]  Liste des erreurs.
function ui_router_models_PendingTransition.validate(transition) end

