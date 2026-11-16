---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/guards/default.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Three "default" navigation guards of the router: navigation logging, blocking if the transition timeout is reached, blocking if a transition is already in progress (unless context.settings.force). Each receives (lifecycleName, context) and returns {result=boolean, context=...}.
--- Access: extension `ui_router_guards_default`: `extensions.load("ui_router_guards_default")`, then the global `ui_router_guards_default`
---@class ui_router_guards_default
ui_router_guards_default = {}

--- Blocks the navigation if TransitionManager.isTimeoutReached() is true (context.reason = "timeout_reached").
---Source: lua/ge/extensions/ui/router/guards/default.lua:16
---@param lifecycleName string Step name (unused).
---@param context table Navigation context, modified (reason).
---@return table  {result=false|true, context=context}.
function ui_router_guards_default.handleTimeoutGuard(lifecycleName, context) end

--- Allows if no transition is in progress or if context.settings.force is true; otherwise blocks with context.reason = "transition_in_progress".
---Source: lua/ge/extensions/ui/router/guards/default.lua:34
---@param lifecycleName string Step name (unused).
---@param context table Context with context.settings.force.
---@return table  {result=boolean, context=context}.
function ui_router_guards_default.handleTransitionStateGuard(lifecycleName, context) end

--- Logs (debug level) "Navigation: <context.to.name>" and always allows.
---Source: lua/ge/extensions/ui/router/guards/default.lua:8
---@param lifecycleName string Name of the lifecycle step (unused).
---@param context table Navigation context with context.to.name.
---@return table  {result=true, context=context}.
function ui_router_guards_default.logNavigationGuard(lifecycleName, context) end

