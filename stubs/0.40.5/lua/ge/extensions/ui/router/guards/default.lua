---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/guards/default.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Trois gardes de navigation « par défaut » du routeur : journalisation de la navigation, blocage si le délai de transition est atteint, blocage si une transition est déjà en cours (sauf context.settings.force). Chacune reçoit (lifecycleName, context) et renvoie {result=boolean, context=...}.
--- Accès : extension `ui_router_guards_default` : `extensions.load("ui_router_guards_default")`, puis la globale `ui_router_guards_default`
---@class ui_router_guards_default
ui_router_guards_default = {}

--- Bloque la navigation si TransitionManager.isTimeoutReached() est vrai (context.reason = "timeout_reached").
---Source : lua/ge/extensions/ui/router/guards/default.lua:16
---@param lifecycleName string Nom de l'étape (inutilisé).
---@param context table Contexte de navigation, modifié (reason).
---@return table  {result=false|true, context=context}.
function ui_router_guards_default.handleTimeoutGuard(lifecycleName, context) end

--- Autorise si aucune transition n'est en cours ou si context.settings.force est vrai ; sinon bloque avec context.reason = "transition_in_progress".
---Source : lua/ge/extensions/ui/router/guards/default.lua:34
---@param lifecycleName string Nom de l'étape (inutilisé).
---@param context table Contexte avec context.settings.force.
---@return table  {result=boolean, context=context}.
function ui_router_guards_default.handleTransitionStateGuard(lifecycleName, context) end

--- Journalise (niveau debug) « Navigation: <context.to.name> » et autorise toujours.
---Source : lua/ge/extensions/ui/router/guards/default.lua:8
---@param lifecycleName string Nom de l'étape de cycle de vie (inutilisé).
---@param context table Contexte de navigation avec context.to.name.
---@return table  {result=true, context=context}.
function ui_router_guards_default.logNavigationGuard(lifecycleName, context) end

