---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/garageMode.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Garage mode: loads the garage_v2 level (or uses the current location in career), freezes the vehicle at its spawn point, switches the camera to orbit, blocks certain input actions (map, vehicle menus, AI, walking, reset...), automatically hides ceiling and pillars depending on the camera position, manages lighting by groups and allows testing the vehicle in the gridmap_v2 level. A modder uses it to enter/exit the garage (start/stop) or adjust camera and lighting.
--- Access: extension `gameplay_garageMode`: `extensions.load("gameplay_garageMode")`, then the global `gameplay_garageMode`
---@class gameplay_garageMode
---@field dependencies string[] core_jobsystem and core_vehicle_manager.
gameplay_garageMode = {}

--- Chained initialization step: launches career_saveSystem.saveCurrent(); the end of the save calls initStepFinished.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/garageMode.lua:372
function gameplay_garageMode.garageModeStartStep() end

--- Returns the stored garage menu.
---Source: lua/ge/extensions/gameplay/garageMode.lua:65
---@return string|nil  Menu name.
function gameplay_garageMode.getGarageMenuState() end

--- ID of the last owned vehicle entered, or the current one in career.
---Source: lua/ge/extensions/gameplay/garageMode.lua:541
---@return integer|nil  Vehicle ID.
function gameplay_garageMode.getLastOwnedVehicleId() end

--- Returns the state of the three lighting groups.
---Source: lua/ge/extensions/gameplay/garageMode.lua:450
---@return boolean[]  {west, middle, east}.
function gameplay_garageMode.getLighting() end

--- Moves to the next initialization step (next extension of garageInitModules) or ends the chain.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/garageMode.lua:362
function gameplay_garageMode.initStepFinished() end

--- Returns whether garage mode is active.
---Source: lua/ge/extensions/gameplay/garageMode.lua:485
---@return boolean  true if active.
function gameplay_garageMode.isActive() end

--- Returns whether automatic hiding is active.
---Source: lua/ge/extensions/gameplay/garageMode.lua:493
---@return boolean  Current state.
function gameplay_garageMode.isObjectsAutohide() end

--- Hook before a level starts: activates garage mode if requested at load (unloads/reloads extensions), otherwise ends garage mode if it was active.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/garageMode.lua:461
---@param levelPath string Level path.
function gameplay_garageMode.onClientPreStartMission(levelPath) end

--- Hook at level start: replaces the vehicle with vehicleToLoad if it exists (never assigned in this file).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/garageMode.lua:454
---@param levelPath string Level path.
function gameplay_garageMode.onClientStartMission(levelPath) end

--- Extension reload hook: restores the active state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/garageMode.lua:481
---@param v table Data from onSerialize.
function gameplay_garageMode.onDeserialized(v) end

--- Hook: stores the entered vehicle as the last owned vehicle.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/garageMode.lua:69
---@param vehicleId integer|nil Vehicle ID.
function gameplay_garageMode.onEnterVehicleFinished(vehicleId) end

--- UI navigation hook: fills data.layoutMenu (top bar with Garage/Tuning tabs, header, rails) and data.garage for the garage route.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/garageMode.lua:146
---@param context table|nil Navigation context.
---@param toRoute table|nil Destination route (field name).
---@param fromRoute table|nil Origin route (unused).
---@param data table Route data table, modified in place.
function gameplay_garageMode.onGarageEnter(context, toRoute, fromRoute, data) end

--- Hook at the end of the loading screen: after testVehicle, navigates to the UI route "play".
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/garageMode.lua:545
function gameplay_garageMode.onLoadingScreenFadeout() end

--- Extension reload hook: saves {active}.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/garageMode.lua:475
---@return table  {active = boolean}.
function gameplay_garageMode.onSerialize() end

--- Spawn hook: requests that the vehicle spawns with the engine off (spawnWithEngineRunning = false).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/garageMode.lua:121
---@param vehicleId integer Vehicle ID.
function gameplay_garageMode.onSpawnCCallback(vehicleId) end

--- Thumbnail capture hook: in garage_v2, exits garage mode and hides the east pillars (shows west/ceiling) during the capture, then re-enables the mode; shows/removes the GarageModeBlackscreen black screen.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/garageMode.lua:497
---@param active boolean true at the start of the capture, false at the end.
function gameplay_garageMode.onThumbnailTriggered(active) end

--- Hook: if the garage initialization is waiting for the save, moves to the next step.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/garageMode.lua:377
function gameplay_garageMode.onVehicleSaveFinished() end

--- Hook called when a vehicle spawns; in garage mode, teleports it to the garage level's spawn point and schedules the freeze.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/garageMode.lua:114
---@param vehicleId integer Vehicle ID.
function gameplay_garageMode.onVehicleSpawned(vehicleId) end

--- Starts a job that switches to orbit camera and applies a predefined default rotation.
---Source: lua/ge/extensions/gameplay/garageMode.lua:84
---@param preset string|nil default, front, back, side, left, right or top (default if nil).
function gameplay_garageMode.setCamera(preset) end

--- Stores the open garage menu; the "paint" state marks the vehicle as modified.
---Source: lua/ge/extensions/gameplay/garageMode.lua:56
---@param state string|nil Menu name.
function gameplay_garageMode.setGarageMenuState(state) end

--- Turns the garage's three lighting groups on/off (west, middle, east).
---Source: lua/ge/extensions/gameplay/garageMode.lua:318
---@param state boolean[]|nil Array of 3 booleans; nil turns everything back on.
function gameplay_garageMode.setLighting(state) end

--- Enables or disables the automatic hiding of the ceiling and pillars.
---Source: lua/ge/extensions/gameplay/garageMode.lua:489
---@param v boolean true to hide automatically.
function gameplay_garageMode.setObjectsAutohide(v) end

--- Intended to signal a modified vehicle in career; the guihook trigger is currently commented out, so the function does nothing observable.
---Source: lua/ge/extensions/gameplay/garageMode.lua:50
---@param vehicleDirty boolean Modified state.
---@param switchedToNewVehicle boolean|nil Vehicle change.
function gameplay_garageMode.setVehicleDirty(vehicleDirty, switchedToNewVehicle) end

--- Enters garage mode. With useCurrentLocation true, stays on the current map (career: checks that there are vehicles in the inventory, calls career_modules_inventory.onBeforeGarage, switches to orbit camera, sets ignition to 0); otherwise loads the garage_v2 level with the current vehicle.
---Source: lua/ge/extensions/gameplay/garageMode.lua:385
---@param _useCurrentLocation boolean|nil true to use the current location instead of loading garage_v2.
---@param skipInventoryStep boolean|nil In career, skips the call to career_modules_inventory.onBeforeGarage.
function gameplay_garageMode.start(_useCurrentLocation, skipInventoryStep) end

--- Exits garage mode: sets ignition back to level 3, unfreezes the vehicle, restores the camera and the freeroam state, then emits onEndGarageMode.
---Source: lua/ge/extensions/gameplay/garageMode.lua:445
function gameplay_garageMode.stop() end

--- Starts a job that makes the vehicle leave the garage (ai to the garageExit waypoint), fades to black then loads gridmap_v2 in freeroam with the current vehicle.
---Source: lua/ge/extensions/gameplay/garageMode.lua:537
function gameplay_garageMode.testVehicle() end

--- Returns "Brand Name" of the given model, or of the active vehicle if none is provided.
---Source: lua/ge/extensions/gameplay/garageMode.lua:191
---@param vehicleId string|nil Model key (jbeam folder name), despite its name.
---@return string|nil  "Brand Name" text or nil.
function gameplay_garageMode.vehicleByIdOrActive(vehicleId) end

--- Zooms the camera progressively (limited acceleration); no effect outside garage mode. The zoom stops by itself after a short delay.
---Source: lua/ge/extensions/gameplay/garageMode.lua:211
---@param value number Direction and intensity (positive or negative); 0 does nothing.
function gameplay_garageMode.zoom(value) end

