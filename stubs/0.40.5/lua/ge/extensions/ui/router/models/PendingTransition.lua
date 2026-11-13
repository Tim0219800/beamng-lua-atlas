---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/models/PendingTransition.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `ui_router_models_PendingTransition` : `extensions.load("ui_router_models_PendingTransition")`, puis la globale `ui_router_models_PendingTransition`
---@class ui_router_models_PendingTransition
ui_router_models_PendingTransition = {}

--- Create a new PendingTransition.
---
---   @param action - Navigation action ("push"|"replace"|"back"|"forward")
---   @param toRoute - ResolvedRoute we're navigating to
---   @param fromRoute - HistoryEntry we're navigating from (optional)
---   @param options - Navigation options (optional)
---   @return PendingTransition
---Source : lua/ge/extensions/ui/router/models/PendingTransition.lua:53
---@param action any
---@param toRoute any
---@param fromRoute any
---@param options any
function ui_router_models_PendingTransition.create(action, toRoute, fromRoute, options) end

--- Check if this is a backward navigation.
---
---   @param transition - The PendingTransition
---   @return boolean
---Source : lua/ge/extensions/ui/router/models/PendingTransition.lua:115
---@param transition any
function ui_router_models_PendingTransition.isBackward(transition) end

--- Check if this is a forward navigation.
---
---   @param transition - The PendingTransition
---   @return boolean
---Source : lua/ge/extensions/ui/router/models/PendingTransition.lua:125
---@param transition any
function ui_router_models_PendingTransition.isForward(transition) end

--- Check if this navigation should clear forward stack.
---
---   @param transition - The PendingTransition
---   @return boolean
---Source : lua/ge/extensions/ui/router/models/PendingTransition.lua:152
---@param transition any
function ui_router_models_PendingTransition.shouldClearForward(transition) end

--- Check if this navigation should update history.
---
---   @param transition - The PendingTransition
---   @return boolean
---Source : lua/ge/extensions/ui/router/models/PendingTransition.lua:135
---@param transition any
function ui_router_models_PendingTransition.shouldUpdateHistory(transition) end

--- Check if a PendingTransition is valid.
---
---   @param transition - The PendingTransition to validate
---   @return isValid, errors
---Source : lua/ge/extensions/ui/router/models/PendingTransition.lua:86
---@param transition any
function ui_router_models_PendingTransition.validate(transition) end

