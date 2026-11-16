---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/lifecycleExecutor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Runs the lifecycle hooks of a route (onEnter, onMount, onLeave...) for the router. It resolves the function reference declared on the route node (via ui/router/utils), calls the hook under pcall with (context, toRoute, fromRoute, data) and logs errors without interrupting the router.
--- Access: extension `ui_router_lifecycleExecutor`: `extensions.load("ui_router_lifecycleExecutor")`, then the global `ui_router_lifecycleExecutor`
---@class ui_router_lifecycleExecutor
ui_router_lifecycleExecutor = {}

--- Resolves the hook function hookName on the route node (via Utils.resolveFunctionReference, with a label "Lifecycle hook X on route Y"). Returns nil, nil, nil if the route or the hook is absent.
---Source: lua/ge/extensions/ui/router/lifecycleExecutor.lua:15
---@param route table|nil Route node carrying the hooks.
---@param hookName string Hook name: onEnter, onMount, onLeave...
---@return function|nil  The resolved function.
---@return string|nil  Resolution error message.
---@return boolean|nil  true if the resolution error is hard.
function ui_router_lifecycleExecutor.resolveHook(route, hookName) end

--- Runs the hook under pcall with (context, toRoute, fromRoute, data); logs errors at level E.
---Source: lua/ge/extensions/ui/router/lifecycleExecutor.lua:30
---@param route table|nil Route node carrying the hook.
---@param hookName string Hook name.
---@param context table Navigation context.
---@param toRoute table|nil Destination route.
---@param fromRoute table|nil Origin route.
---@param data table Route data shared between hooks.
---@return boolean  true if the hook is absent or succeeded.
---@return string|nil  Error message.
---@return boolean  true if the error is hard (invalid resolution).
function ui_router_lifecycleExecutor.runLifecycleHook(route, hookName, context, toRoute, fromRoute, data) end

--- Returns the error if it is a non-empty string, otherwise "unknown_error".
---Source: lua/ge/extensions/ui/router/lifecycleExecutor.lua:8
---@param err any Raw error.
---@return string  Usable error message.
function ui_router_lifecycleExecutor.sanitizeError(err) end

