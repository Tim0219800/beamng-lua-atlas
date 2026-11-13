---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/managers/frameworkManager.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `ui_router_managers_frameworkManager` : `extensions.load("ui_router_managers_frameworkManager")`, puis la globale `ui_router_managers_frameworkManager`
---@class ui_router_managers_frameworkManager
ui_router_managers_frameworkManager = {}

--- Emit a route-change event to the UI frameworks.
---
---   @param data - Route-change payload (a NavigationEntry). Treated as immutable.
---   @param transitionId - Optional active transition id to attach to the payload.
---
---   When a transition id is supplied, a shallow copy of the payload is emitted with
---   transitionId added, so the immutable NavigationEntry table is never mutated.
---   Existing top-level fields (request, resolved, origin, toRoute, fromRoute, routeNode)
---   are preserved so current UI handlers keep reading data.resolved / data.request.
---Source : lua/ge/extensions/ui/router/managers/frameworkManager.lua:31
---@param data any
---@param transitionId any
function ui_router_managers_frameworkManager.sendRouteChange(data, transitionId) end

--- Emit a route-change-cancelled event to the UI frameworks.
---
---   @param data - The cancelled route (toRoute), treated as immutable.
---   @param extras - Optional identity payload, e.g. { transitionId = <cancelledId>, reason = <reason> }.
---
---   When identity extras are supplied a shallow copy of the route is emitted with the
---   cancelled transition id (and reason) attached, so the UI can clear only the handoff
---   that matches the cancelled transition instead of blindly dropping the active one.
---Source : lua/ge/extensions/ui/router/managers/frameworkManager.lua:57
---@param data any
---@param extras any
function ui_router_managers_frameworkManager.sendRouteChangeCancelled(data, extras) end

---Source : lua/ge/extensions/ui/router/managers/frameworkManager.lua:43
---@param data any
function ui_router_managers_frameworkManager.sendRouteChangeComplete(data) end

