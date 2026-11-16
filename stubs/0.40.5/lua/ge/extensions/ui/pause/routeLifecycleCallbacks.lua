---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/pause/routeLifecycleCallbacks.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Lifecycle callbacks of the "pause.*" routes of the new pause menu (Vue UI router). The router calls these hooks when the user enters, mounts, or leaves a pause, vehicle configuration, big map or photo mode route. The module builds the layout data (top tabs, title, breadcrumb, main/side content/panels, rail) by delegating to the ui_pause_providers_routeData_* providers, handles the simulation pause request, the pause camera (ui_pause_camera) and photo mode sessions.
--- Access: extension `ui_pause_routeLifecycleCallbacks`: `extensions.load("ui_pause_routeLifecycleCallbacks")`, then the global `ui_pause_routeLifecycleCallbacks`
---@class ui_pause_routeLifecycleCallbacks
---@field dependencies string[] Extensions loaded before this module: ui_pause_actions, routeData providers (system, home, career, vehicle, environment, multiplayer, gamemodes, photomode), ui_pause_providers_trafficControls, ui_pause_providers_vehicleTabInteractions, ui_pause_photomode, ui_pause_vehicleConfigurationOccupants.
ui_pause_routeLifecycleCallbacks = {}

--- Exit of the big map route: closes the map (freeroam_vueBigMap.exitBigMap, otherwise freeroam_bigMapMode.exitBigMap(true)) then calls onPauseLeave.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/pause/routeLifecycleCallbacks.lua:655
---@param context table Pause context
---@param toRoute table Target route
---@param fromRoute table Route being left
---@param data table Navigation data
function ui_pause_routeLifecycleCallbacks.onPauseBigmapLeave(context, toRoute, fromRoute, data) end

--- Entry hook for a pause.* route. Ignores non-pause routes. Notifies vehicleTabInteractions, fills data.layoutMenu and data.pause without route content, updates the simulation pause request, and starts ui_pause_camera on the root "pause" route.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/pause/routeLifecycleCallbacks.lua:573
---@param context table Pause context (mode, isFirstDriveActive, isMultiseatActive...)
---@param toRoute table Target route (name, params)
---@param fromRoute table|nil Route being left
---@param data table Data table to fill for the UI
function ui_pause_routeLifecycleCallbacks.onPauseEnter(context, toRoute, fromRoute, data) end

--- Exit hook of a pause route. Notifies vehicleTabInteractions, adjusts the pause request according to the target route, stops ui_pause_camera if leaving "pause", and ends the camera session (endPauseSession) if leaving the pause routes entirely.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/pause/routeLifecycleCallbacks.lua:606
---@param context table Pause context
---@param toRoute table Target route
---@param fromRoute table Route being left
---@param data table Navigation data
function ui_pause_routeLifecycleCallbacks.onPauseLeave(context, toRoute, fromRoute, data) end

--- Hook called when the route component is mounted. Fills data.layoutMenu with the full route content, updates the simulation pause and calls ui_pause_camera.beginPauseSession().
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/pause/routeLifecycleCallbacks.lua:595
---@param context table Pause context
---@param toRoute table Mounted route
---@param fromRoute table|nil Previous route
---@param data table Data table to fill
function ui_pause_routeLifecycleCallbacks.onPauseMount(context, toRoute, fromRoute, data) end

--- Entry into a pause.photomode route: calls onPauseEnter, ui_pause_photomode.beginPhotomodeSession(), attaches the photo mode data (data.photomode) then ui_pause_photomode.onPhotomodeRouteEnter(routeName).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/pause/routeLifecycleCallbacks.lua:665
---@param context table Pause context
---@param toRoute table Target route
---@param fromRoute table|nil Previous route
---@param data table Data to fill
function ui_pause_routeLifecycleCallbacks.onPhotomodeEnter(context, toRoute, fromRoute, data) end

--- Exit of a photo mode route. If the target is still a pause.photomode.* route, only calls onPauseLeave. Otherwise notifies ui_pause_photomode.onPhotomodeRouteLeave, ends the session (endPhotomodeSession) then calls onPauseLeave.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/pause/routeLifecycleCallbacks.lua:689
---@param context table Pause context
---@param toRoute table Target route
---@param fromRoute table Route being left
---@param data table Navigation data
function ui_pause_routeLifecycleCallbacks.onPhotomodeLeave(context, toRoute, fromRoute, data) end

--- Mounting of a photo mode route: calls onPauseMount then copies the photomode data to data.photomode.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/pause/routeLifecycleCallbacks.lua:681
---@param context table Pause context
---@param toRoute table Mounted route
---@param fromRoute table|nil Previous route
---@param data table Data to fill
function ui_pause_routeLifecycleCallbacks.onPhotomodeMount(context, toRoute, fromRoute, data) end

--- Hook emitted when the configuration target changes. Does something only if the target disappears (current nil) with the reason "vehicleDestroyed": closes the solo view and, if the current route is a configuration route, returns to the return route (previous.returnRoute or "pause.vehicle").
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/pause/routeLifecycleCallbacks.lua:641
---@param current table|nil New target
---@param previous table|nil Previous target (returnRoute)
---@param reason string Reason for the change, for example vehicleDestroyed
function ui_pause_routeLifecycleCallbacks.onVehicleConfigTargetChanged(current, previous, reason) end

--- Exit of a vehicle configuration route: calls onPauseLeave; if the target route is not itself a configuration route, ends the ui_pause_vehicleConfigurationOccupants session, the render_splitScreen solo view and clears core_vehicle_configTarget (reason "routeLeave").
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/pause/routeLifecycleCallbacks.lua:626
---@param context table Pause context
---@param toRoute table Target route
---@param fromRoute table Route being left
---@param data table Navigation data
function ui_pause_routeLifecycleCallbacks.onVehicleConfigurationLeave(context, toRoute, fromRoute, data) end

