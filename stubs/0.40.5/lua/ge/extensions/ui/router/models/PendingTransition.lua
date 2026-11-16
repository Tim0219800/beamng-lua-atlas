---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/models/PendingTransition.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "PendingTransition" data model: represents a navigation transition in progress {transitionId, action, toRoute, fromRoute, options}. Provides a constructor, validation and predicates on the action (back, forward, history update, forward stack clearing).
--- Access: extension `ui_router_models_PendingTransition`: `extensions.load("ui_router_models_PendingTransition")`, then the global `ui_router_models_PendingTransition`
---@class ui_router_models_PendingTransition
ui_router_models_PendingTransition = {}

--- Creates a PendingTransition. Returns nil (error logged) if toRoute is missing.
---Source: lua/ge/extensions/ui/router/models/PendingTransition.lua:53
---@param action string push, replace, back or forward.
---@param toRoute table Destination ResolvedRoute.
---@param fromRoute table|nil Origin history entry.
---@param options table|nil Navigation options ({} by default).
---@return table|nil  {transitionId, action, toRoute, fromRoute, options}.
function ui_router_models_PendingTransition.create(action, toRoute, fromRoute, options) end

--- Indicates whether the action is "back".
---Source: lua/ge/extensions/ui/router/models/PendingTransition.lua:115
---@param transition table|nil Transition.
---@return boolean|nil  true if action == back (nil/false if transition is nil).
function ui_router_models_PendingTransition.isBackward(transition) end

--- Indicates whether the action is "forward".
---Source: lua/ge/extensions/ui/router/models/PendingTransition.lua:125
---@param transition table|nil Transition.
---@return boolean|nil  true if action == forward.
function ui_router_models_PendingTransition.isForward(transition) end

--- Indicates whether the navigation clears the "forward" stack (push and replace).
---Source: lua/ge/extensions/ui/router/models/PendingTransition.lua:152
---@param transition table|nil Transition.
---@return boolean  true for push and replace.
function ui_router_models_PendingTransition.shouldClearForward(transition) end

--- Indicates whether the navigation adds an entry to the history (push only).
---Source: lua/ge/extensions/ui/router/models/PendingTransition.lua:135
---@param transition table|nil Transition.
---@return boolean  true for push.
function ui_router_models_PendingTransition.shouldUpdateHistory(transition) end

--- Checks the presence of transitionId, action and toRoute.
---Source: lua/ge/extensions/ui/router/models/PendingTransition.lua:86
---@param transition table|nil Transition to validate.
---@return boolean  true if valid.
---@return string[]  List of errors.
function ui_router_models_PendingTransition.validate(transition) end

