---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/managers/frameworkManager.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Outgoing bridge from the Lua router to the UI frameworks (Vue, Angular) via guihooks. It emits the route change events (start, end, cancellation) and keeps no state: transition state, progress, timeouts and acknowledgment validation are in transitionManager.lua and router.lua.
--- Access: extension `ui_router_managers_frameworkManager`: `extensions.load("ui_router_managers_frameworkManager")`, then the global `ui_router_managers_frameworkManager`
---@class ui_router_managers_frameworkManager
ui_router_managers_frameworkManager = {}

--- Emits the GUI event ui_router_routeChange to ask the framework to display the route.
---Source: lua/ge/extensions/ui/router/managers/frameworkManager.lua:31
---@param data table Navigation entry (treated as immutable).
---@param transitionId string|nil Transition identifier to attach to the payload (copy).
function ui_router_managers_frameworkManager.sendRouteChange(data, transitionId) end

--- Emits the GUI event ui_router_routeChangeCancelled. If extras contains transitionId or reason, a copy of the route is emitted with these fields so that the UI clears only the matching handoff.
---Source: lua/ge/extensions/ui/router/managers/frameworkManager.lua:57
---@param data table|nil Cancelled route (toRoute), treated as immutable.
---@param extras table|nil {transitionId?, reason?}.
function ui_router_managers_frameworkManager.sendRouteChangeCancelled(data, extras) end

--- Emits the GUI event ui_router_afterRouteChange with the committed navigation entry.
---Source: lua/ge/extensions/ui/router/managers/frameworkManager.lua:43
---@param data table Current committed entry.
function ui_router_managers_frameworkManager.sendRouteChangeComplete(data) end

