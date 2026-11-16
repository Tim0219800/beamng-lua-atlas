---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/freeformDelivery/freeformDelivery.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Main module of the freeform delivery mode. It orchestrates the lifecycle of a delivery described by a delivery.delivery.json file: load (loading via the loader, vehicle setup, routes, odometer, action filter), start (goals, markers, tasklist, hints, timer), finish (stopping the UI, freezing vehicles, "finished" state), reset (back to the loaded state) and teardown (removing vehicles and unloading). Every frame it updates all submodules (goals, markers, tasklist, hints, routes, odometer, vehicleSleep), displays the timer and registers a radial menu (quickAccess) to finish the delivery or choose a route.
--- Access: extension `gameplay_freeformDelivery_freeformDelivery`: `extensions.load("gameplay_freeformDelivery_freeformDelivery")`, then the global `gameplay_freeformDelivery_freeformDelivery`
---@class gameplay_freeformDelivery_freeformDelivery
---@field debug table Debug configuration read by the submodules: {enabled = false, targetAreas = {location, zone, parkingSpot = true}, p = nil (LuaProfiler)}.
---@field dependencies string[] Extensions loaded beforehand: core_vehicles, core_gamestate, gameplay_sites_sitesManager, core_flowgraphManager, core_quickAccess, gameplay_freeformDelivery_{utils, loader, setup, goals, tasklist, markers, endScreen, hints, routes, debug, odometer, vehicleSleep}, core_groundMarkers, core_input_actionFilter, ui_apps_genericMissionData.
gameplay_freeformDelivery_freeformDelivery = {}

--- Old cleanup function, kept for compatibility: calls teardown() without arguments.
---Source: lua/ge/extensions/gameplay/freeformDelivery/freeformDelivery.lua:666
function gameplay_freeformDelivery_freeformDelivery.cleanup() end

--- Finishes the active delivery (successful or failed): records the elapsed time in currentDelivery.elapsedTime, hides markers, tasklist, hints, routes and odometer, freezes vehicles, clears the timer and switches to the finished state (isFinished). Goals remain evaluable.
---Source: lua/ge/extensions/gameplay/freeformDelivery/freeformDelivery.lua:235
---@param failed boolean|nil true if the delivery is a failure.
---@param reason string|nil Failure reason, kept in getFailReason.
---@return boolean  true if finished, false if there was no active delivery.
function gameplay_freeformDelivery_freeformDelivery.finish(failed, reason) end

--- Returns the current delivery table (loader data, plus elapsedTime after finish).
---Source: lua/ge/extensions/gameplay/freeformDelivery/freeformDelivery.lua:174
---@return table|nil  Delivery, nil if none.
function gameplay_freeformDelivery_freeformDelivery.getCurrentDelivery() end

--- Returns the failure reason passed to finish.
---Source: lua/ge/extensions/gameplay/freeformDelivery/freeformDelivery.lua:112
---@return string|nil  Reason, nil otherwise.
function gameplay_freeformDelivery_freeformDelivery.getFailReason() end

--- Returns the goal progress (gameplay_freeformDelivery_goals.getProgress) when the delivery is active or finished.
---Source: lua/ge/extensions/gameplay/freeformDelivery/freeformDelivery.lua:296
---@return table|nil  {total, completed, required, requiredCompleted, allRequiredComplete}, nil if only loaded.
function gameplay_freeformDelivery_freeformDelivery.getProgress() end

--- Returns the end statistics (gameplay_freeformDelivery_endScreen.collectStatistics) when the delivery is active or finished and has started.
---Source: lua/ge/extensions/gameplay/freeformDelivery/freeformDelivery.lua:305
---@return table|nil  Statistics (time, goals, damage) or nil.
function gameplay_freeformDelivery_freeformDelivery.getResults() end

--- Returns whether the asynchronous setup is still in progress.
---Source: lua/ge/extensions/gameplay/freeformDelivery/freeformDelivery.lua:183
---@return boolean  true as long as the setup is not finished.
function gameplay_freeformDelivery_freeformDelivery.getSetupPending() end

--- Returns the start time (os.clock()), 0 if not started.
---Source: lua/ge/extensions/gameplay/freeformDelivery/freeformDelivery.lua:178
---@return number  Time in seconds.
function gameplay_freeformDelivery_freeformDelivery.getStartTime() end

--- Returns whether the delivery is in progress (goals and timer active). Used by quickAccess.
---Source: lua/ge/extensions/gameplay/freeformDelivery/freeformDelivery.lua:97
---@return boolean  true if active.
function gameplay_freeformDelivery_freeformDelivery.isActive() end

--- Returns whether the delivery ended in failure.
---Source: lua/ge/extensions/gameplay/freeformDelivery/freeformDelivery.lua:107
---@return boolean  true if failed.
function gameplay_freeformDelivery_freeformDelivery.isFailed() end

--- Returns whether the delivery is finished (successful or failed) but not yet torn down.
---Source: lua/ge/extensions/gameplay/freeformDelivery/freeformDelivery.lua:102
---@return boolean  true if finished.
function gameplay_freeformDelivery_freeformDelivery.isFinished() end

--- Returns whether loading and setup are complete (ready to start).
---Source: lua/ge/extensions/gameplay/freeformDelivery/freeformDelivery.lua:170
---@return boolean  true if ready.
function gameplay_freeformDelivery_freeformDelivery.isLoaded() end

--- Loads a delivery: reads the file via gameplay_freeformDelivery_loader.load, installs vehicles and player (setup), prepares routes, odometer and vehicleSleep, blocks some actions and calls the debug window toggle. The setup finishes later (see isLoaded).
---Source: lua/ge/extensions/gameplay/freeformDelivery/freeformDelivery.lua:117
---@param path string Path of the delivery.delivery.json file.
---@return boolean  true if loading started, false if a delivery is already in place or if the file/setup failed.
function gameplay_freeformDelivery_freeformDelivery.load(path) end

--- Hook: when the radial menu opens, registers the delivery's quickAccess entries (finish, routes).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/freeformDelivery/freeformDelivery.lua:505
function gameplay_freeformDelivery_freeformDelivery.onBeforeRadialOpened() end

--- Hook: level end; calls teardown().
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/freeformDelivery/freeformDelivery.lua:674
function gameplay_freeformDelivery_freeformDelivery.onClientEndMission() end

--- Hook: extension unload; calls teardown().
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/freeformDelivery/freeformDelivery.lua:670
function gameplay_freeformDelivery_freeformDelivery.onExtensionUnloaded() end

--- Hook: quickAccess reloaded; allows the entries to be registered again.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/freeformDelivery/freeformDelivery.lua:509
function gameplay_freeformDelivery_freeformDelivery.onQuickAccessLoaded() end

--- Called every frame: monitors the end of setup (and its 20 s timeout), then if the delivery is active updates the vehicle cache, goals, markers, tasklist, hints, routes, odometer and vehicleSleep, displays the timer via ui_apps_genericMissionData and finishes the delivery when the goal completion timer expires.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/freeformDelivery/freeformDelivery.lua:538
---@param dtReal number Real-time delta.
---@param dtSim number Simulated time delta.
---@param dtRaw number Raw time delta.
function gameplay_freeformDelivery_freeformDelivery.onUpdate(dtReal, dtSim, dtRaw) end

--- Returns an active or finished delivery to the loaded state: cleans all submodules, unfreezes vehicles, restores their positions and redoes the player placement. start() must be called again afterwards.
---Source: lua/ge/extensions/gameplay/freeformDelivery/freeformDelivery.lua:315
---@return boolean  true if reset, false if there is nothing to reset.
function gameplay_freeformDelivery_freeformDelivery.reset() end

--- Starts the loaded delivery: reconfigures routes, odometer and vehicleSleep, then activates goals, markers, tasklist and hints, and starts the timer. Requires isLoaded to be true and the delivery not to be already active.
---Source: lua/ge/extensions/gameplay/freeformDelivery/freeformDelivery.lua:187
---@return boolean  true if started.
function gameplay_freeformDelivery_freeformDelivery.start() end

--- Completely tears down the delivery: unblocks actions, cleans submodules, unfreezes then removes the vehicles and the prefab (unless keepVehicles), clears raw POIs, removes the quickAccess menu and resets all states. No effect if nothing is loaded.
---Source: lua/ge/extensions/gameplay/freeformDelivery/freeformDelivery.lua:624
---@param keepVehicles boolean|nil true to keep the spawned vehicles (false by default).
function gameplay_freeformDelivery_freeformDelivery.teardown(keepVehicles) end

