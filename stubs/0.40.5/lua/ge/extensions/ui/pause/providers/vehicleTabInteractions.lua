---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/pause/providers/vehicleTabInteractions.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Data and action provider for the "Vehicle" tab (and vehicle management) of the pause menu. It lists the spawned vehicles (excluding the on-foot "unicycle" character, inactive vehicles or vehicles the player cannot use), their controller (player, AI, multiplayer), their AI mode (polled every 8 s via core_vehicleBridge), and builds the action buttons for each vehicle (switch vehicle, exit, AI modes, repair, reset, clone, delete, delete all but this one, open details) taking into account multiplayer permissions and the first-drive state. It also highlights in orange the hovered or selected vehicle with the debugDrawer. Payloads are sent to the UI either by direct call or by stream (guihooks.triggerStream) for asynchronous hydration.
--- Access: extension `ui_pause_providers_vehicleTabInteractions`: `extensions.load("ui_pause_providers_vehicleTabInteractions")`, then the global `ui_pause_providers_vehicleTabInteractions`
---@class ui_pause_providers_vehicleTabInteractions
---@field dependencies string[] {'core_vehicleBridge', 'core_locales'}
ui_pause_providers_vehicleTabInteractions = {}

--- Executes the action button identified by buttonId (buttonId field of the action entries returned in the payloads), with an optional payload.
---Source: lua/ge/extensions/ui/pause/providers/vehicleTabInteractions.lua:1607
---@param buttonId any Button identifier provided by buttonModule (inferred from code)
---@param payload any Data passed to the button callback (inferred from code)
---@return boolean  false if buttonId is missing, otherwise the button execution result
function ui_pause_providers_vehicleTabInteractions.executeVehicleTabInteractionAction(buttonId, payload) end

--- Returns the current asynchronous hydration debug delay, in seconds.
---Source: lua/ge/extensions/ui/pause/providers/vehicleTabInteractions.lua:1650
---@return number  Delay in seconds (0 = disabled)
function ui_pause_providers_vehicleTabInteractions.getAsyncHydrationDebugDelay() end

--- Details of the selected vehicle: vehicleId, label, rawName, vehicle (list entry) and groups (action groups). The selection comes from the route's vehicleId parameter, otherwise the last chosen vehicle, otherwise the player's vehicle, otherwise the first in the list.
---Source: lua/ge/extensions/ui/pause/providers/vehicleTabInteractions.lua:1662
---@param context table|nil Pause context
---@return table  {vehicleId, label, rawName, vehicle, groups}
function ui_pause_providers_vehicleTabInteractions.getSpawnedSelectedVehicleData(context) end

--- Skeleton of the selected vehicle's details (label, disabled action groups, loading = true), without full computation.
---Source: lua/ge/extensions/ui/pause/providers/vehicleTabInteractions.lua:1629
---@param context table|nil Pause context
---@return table  Loading payload
function ui_pause_providers_vehicleTabInteractions.getSpawnedSelectedVehicleShellData(context) end

--- Full payload of the spawned vehicles: mode, summary {currentVehicleName, totalCount, aiControlledCount}, selectedVehicleId, aiOtherVehiclesMode, aiModeOptions, vehicles (id, vehicleId, index, displayNumber, label, rawName, isCurrent, controllerType, aiMode, aiControlled, cardActions...), actions (global actions) and lowPerformance. Side effects: resets the state and restarts AI mode polling.
---Source: lua/ge/extensions/ui/pause/providers/vehicleTabInteractions.lua:1612
---@param context table|nil Pause context; only context.mode is read (default "freeroam")
---@return table  Vehicles payload
function ui_pause_providers_vehicleTabInteractions.getSpawnedVehiclesData(context) end

--- "Skeleton" version of the payload, without querying the vehicles: asyncHydration and loading are true, empty list, actions disabled. Used to display the screen immediately before hydration.
---Source: lua/ge/extensions/ui/pause/providers/vehicleTabInteractions.lua:1616
---@param context table|nil Pause context (mode)
---@return table  Loading payload
function ui_pause_providers_vehicleTabInteractions.getSpawnedVehiclesShellData(context) end

--- Returns only summary and vehicles from the spawned vehicles payload.
---Source: lua/ge/extensions/ui/pause/providers/vehicleTabInteractions.lua:1654
---@param context table|nil Pause context
---@return table  {summary, vehicles}
function ui_pause_providers_vehicleTabInteractions.getSpawnedVehiclesSummaryData(context) end

--- Hook called by routeLifecycleCallbacks on entering and leaving a pause route, with the target route name. Enables or disables tracking (hover, AI polling) and resets vehicle numbering when leaving the pause family.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/pause/providers/vehicleTabInteractions.lua:1666
---@param routeName string|nil Target route name
function ui_pause_providers_vehicleTabInteractions.onPauseRouteLifecycle(routeName) end

--- Hook called every frame. When tracking is active on a vehicle route: processes deferred requests, restarts AI mode polling every 8 s of simulation time and draws a pulsing white-orange frame (12 edges of the bounding box, thickness 3) around the hovered or detailed vehicle, via debugDrawer.drawLineInstance. Without a box, draws a 2 m vertical line.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/pause/providers/vehicleTabInteractions.lua:1697
---@param dtReal number Real time (s)
---@param dtSim number Simulation time (s)
---@param dtRaw number Raw time (s)
function ui_pause_providers_vehicleTabInteractions.onUpdate(dtReal, dtSim, dtRaw) end

--- Hook called when a vehicle is destroyed: recomputes the vehicle state for the UI if tracking is active.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/pause/providers/vehicleTabInteractions.lua:1685
function ui_pause_providers_vehicleTabInteractions.onVehicleDestroyed() end

--- Called by the UI when the cursor leaves the card: removes the highlight if it is that vehicle (or if vehicleId is nil).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/pause/providers/vehicleTabInteractions.lua:1693
---@param vehicleId number|nil Vehicle id
function ui_pause_providers_vehicleTabInteractions.onVehicleHoverEnd(vehicleId) end

--- Called by the UI when the cursor hovers a vehicle's card: that vehicle will be highlighted in the world.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/pause/providers/vehicleTabInteractions.lua:1689
---@param vehicleId number ID of the hovered vehicle
function ui_pause_providers_vehicleTabInteractions.onVehicleHoverStart(vehicleId) end

--- Hook called when a vehicle spawns: recomputes the state if the route requires it and triggers the UI event VehicleTabSpawnFinished.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/pause/providers/vehicleTabInteractions.lua:1680
function ui_pause_providers_vehicleTabInteractions.onVehicleSpawned() end

--- Hook emitted after a vehicle switch requested by the user from the menu: same handling as onVehicleSwitched.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/pause/providers/vehicleTabInteractions.lua:1675
function ui_pause_providers_vehicleTabInteractions.onVehicleSwitchPerformendByUser() end

--- Hook called when the player's vehicle changes: re-emits the vehicle state to the UI and resets the AI polling timer.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/pause/providers/vehicleTabInteractions.lua:1670
function ui_pause_providers_vehicleTabInteractions.onVehicleSwitched() end

--- Asynchronous version of the selected vehicle's details: emits the result on the ui_pause_vehicleTabInteractions_spawned_selected_payload stream.
---Source: lua/ge/extensions/ui/pause/providers/vehicleTabInteractions.lua:1633
---@param payload table|nil {requestId, context}
---@return table  Emitted payload, or loading acknowledgment in debug delay mode
function ui_pause_providers_vehicleTabInteractions.requestSpawnedSelectedVehiclePayload(payload) end

--- Requests asynchronous hydration: computes the payload and sends it on the ui_pause_vehicleTabInteractions_spawned_payload stream (with asyncHydration, loading = false, requestId). If a debug delay is active, the response is queued and a loading acknowledgment is returned.
---Source: lua/ge/extensions/ui/pause/providers/vehicleTabInteractions.lua:1620
---@param payload table|nil {requestId, context}
---@return table  Emitted payload, or loading acknowledgment in debug delay mode
function ui_pause_providers_vehicleTabInteractions.requestSpawnedVehiclesPayload(payload) end

--- Sets an artificial delay (seconds, minimum 0) before responding to asynchronous requests; 0 disables it and empties the queue.
---Source: lua/ge/extensions/ui/pause/providers/vehicleTabInteractions.lua:1642
---@param delaySec number Delay in seconds
---@return number  Delay actually applied
function ui_pause_providers_vehicleTabInteractions.setAsyncHydrationDebugDelay(delaySec) end

