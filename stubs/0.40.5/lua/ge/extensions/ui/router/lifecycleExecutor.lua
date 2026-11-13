---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/lifecycleExecutor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Exécute les hooks de cycle de vie d'une route (onEnter, onMount, onLeave…) pour le routeur. Il résout la référence de fonction déclarée sur le nœud de route (via ui/router/utils), appelle le hook sous pcall avec (context, toRoute, fromRoute, data) et journalise les erreurs sans interrompre le routeur.
--- Accès : extension `ui_router_lifecycleExecutor` : `extensions.load("ui_router_lifecycleExecutor")`, puis la globale `ui_router_lifecycleExecutor`
---@class ui_router_lifecycleExecutor
ui_router_lifecycleExecutor = {}

--- Résout la fonction du hook hookName sur le nœud de route (via Utils.resolveFunctionReference, avec un libellé « Lifecycle hook X on route Y »). Renvoie nil, nil, nil si la route ou le hook est absent.
---Source : lua/ge/extensions/ui/router/lifecycleExecutor.lua:15
---@param route table|nil Nœud de route portant les hooks.
---@param hookName string Nom du hook : onEnter, onMount, onLeave…
---@return function|nil  La fonction résolue.
---@return string|nil  Message d'erreur de résolution.
---@return boolean|nil  true si l'erreur de résolution est dure.
function ui_router_lifecycleExecutor.resolveHook(route, hookName) end

--- Exécute le hook sous pcall avec (context, toRoute, fromRoute, data) ; journalise les erreurs au niveau E.
---Source : lua/ge/extensions/ui/router/lifecycleExecutor.lua:30
---@param route table|nil Nœud de route portant le hook.
---@param hookName string Nom du hook.
---@param context table Contexte de navigation.
---@param toRoute table|nil Route de destination.
---@param fromRoute table|nil Route d'origine.
---@param data table Données de route partagées entre hooks.
---@return boolean  true si le hook est absent ou a réussi.
---@return string|nil  Message d'erreur.
---@return boolean  true si l'erreur est dure (résolution invalide).
function ui_router_lifecycleExecutor.runLifecycleHook(route, hookName, context, toRoute, fromRoute, data) end

--- Renvoie l'erreur si c'est une chaîne non vide, sinon "unknown_error".
---Source : lua/ge/extensions/ui/router/lifecycleExecutor.lua:8
---@param err any Erreur brute.
---@return string  Message d'erreur exploitable.
function ui_router_lifecycleExecutor.sanitizeError(err) end

