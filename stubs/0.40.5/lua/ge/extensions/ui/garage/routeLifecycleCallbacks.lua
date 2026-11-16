---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/garage/routeLifecycleCallbacks.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Lifecycle callbacks for the garage photo mode UI routes. For the "garage.photomode" routes (and "garage.photomode.*"), opens a photomode session with the "garage" profile on entry, attaches the route data provided by ui_pause_providers_routeData_photomode, and closes the session on exit. Other routes are ignored.
--- Access: extension `ui_garage_routeLifecycleCallbacks`: `extensions.load("ui_garage_routeLifecycleCallbacks")`, then the global `ui_garage_routeLifecycleCallbacks`
---@class ui_garage_routeLifecycleCallbacks
---@field dependencies string[] Extensions loaded before: ui_pause_providers_routeData_photomode, ui_pause_photomode.
ui_garage_routeLifecycleCallbacks = {}

--- Hook called when the UI enters a photomode route. If the route is garage.photomode[.*]: starts the photomode session ("garage" profile), adds data.photomode and notifies onPhotomodeRouteEnter.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/garage/routeLifecycleCallbacks.lua:35
---@param context table Route change context (unused).
---@param toRoute table Target route; only the name field is read.
---@param fromRoute table|nil Previous route (unused).
---@param data table Route data, enriched with photomode.
function ui_garage_routeLifecycleCallbacks.onPhotomodeEnter(context, toRoute, fromRoute, data) end

--- Hook called when leaving the route: notifies onPhotomodeRouteLeave then ends the photomode session (endPhotomodeSession).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/garage/routeLifecycleCallbacks.lua:57
---@param context table Route change context (unused).
---@param toRoute table|nil Destination route; name passed to onPhotomodeRouteLeave.
---@param fromRoute table|nil Route being left (used for the log).
---@param data table Route data (not used).
function ui_garage_routeLifecycleCallbacks.onPhotomodeLeave(context, toRoute, fromRoute, data) end

--- Hook called when the route is mounted: adds data.photomode if the route is garage.photomode[.*].
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/garage/routeLifecycleCallbacks.lua:52
---@param context table Route change context (unused).
---@param toRoute table Target route; only name is read.
---@param fromRoute table|nil Previous route (unused).
---@param data table Route data, enriched with photomode.
function ui_garage_routeLifecycleCallbacks.onPhotomodeMount(context, toRoute, fromRoute, data) end

