---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/gridSelectorRouteLifecycleCallbacks.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Lifecycle callbacks of the UI routes for grid selector screens. On route entry or mount, it computes a snapshot (ui_gridSelector.getSelectorSnapshot) from the route's `meta.gridSelector` config and adds it to `data.gridSelector` (and `data.vehicleSelector` for the vehicleSelector backend). It also relays the onPauseEnter/onPauseMount/onPauseLeave hooks to `ui_pause_routeLifecycleCallbacks` when the route is a pause route.
--- Access: extension `ui_gridSelectorRouteLifecycleCallbacks`: `extensions.load("ui_gridSelectorRouteLifecycleCallbacks")`, then the global `ui_gridSelectorRouteLifecycleCallbacks`
---@class ui_gridSelectorRouteLifecycleCallbacks
---@field dependencies table<integer, string> Loads ui_gridSelector before this module.
ui_gridSelectorRouteLifecycleCallbacks = {}

--- Called by the UI router when entering a route. Relays onPauseEnter if it is a pause route, then attaches the selector snapshot to `data`.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/gridSelectorRouteLifecycleCallbacks.lua:163
---@param context any Router context.
---@param toRoute table Target route (name, params, meta).
---@param fromRoute table|nil Route being left.
---@param data table Route data table, enriched with gridSelector.
function ui_gridSelectorRouteLifecycleCallbacks.onRouteEnter(context, toRoute, fromRoute, data) end

--- Called by the UI router when leaving a route. Only relays onPauseLeave for pause routes.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/gridSelectorRouteLifecycleCallbacks.lua:173
---@param context any Router context.
---@param toRoute table|nil Target route.
---@param fromRoute table Route being left.
---@param data table|nil Route data.
function ui_gridSelectorRouteLifecycleCallbacks.onRouteLeave(context, toRoute, fromRoute, data) end

--- Called by the UI router when the route is mounted. Relays onPauseMount if it is a pause route, then attaches the selector snapshot to `data`.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/gridSelectorRouteLifecycleCallbacks.lua:168
---@param context any Router context.
---@param toRoute table Target route.
---@param fromRoute table|nil Route being left.
---@param data table Route data.
function ui_gridSelectorRouteLifecycleCallbacks.onRouteMount(context, toRoute, fromRoute, data) end

