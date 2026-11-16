---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/tutorial/damageTracker.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Tracks the vehicle's damage during the career tutorial (and the time trial). It relies on gameplay_util_crashDetection to detect the end of a crash, waits for the vehicle to slow down (or a maximum delay), then displays an information window (career_modules_tutorialPopups) and a "repair" or "restart" task in the task list. The task disappears when the vehicle is repaired or reset.
--- Access: extension `gameplay_tutorial_damageTracker`: `extensions.load("gameplay_tutorial_damageTracker")`, then the global `gameplay_tutorial_damageTracker`
---@class gameplay_tutorial_damageTracker
---@field dependencies string[] Extensions loaded before this one: { 'gameplay_util_crashDetection' }.
gameplay_tutorial_damageTracker = {}

--- Marks a crash as already handled by the caller: the next damage window will be skipped, but the repair task will remain due.
---Source: lua/ge/extensions/gameplay/tutorial/damageTracker.lua:162
function gameplay_tutorial_damageTracker.claimNextDamagePopup() end

--- Disables tracking and resets the whole module state (configured vehicle, task, handler, already-displayed window flags).
---Source: lua/ge/extensions/gameplay/tutorial/damageTracker.lua:202
function gameplay_tutorial_damageTracker.cleanup() end

--- Simulates a crash (debug): sets hadCrash and triggers the wait for the damage window.
---Source: lua/ge/extensions/gameplay/tutorial/damageTracker.lua:195
function gameplay_tutorial_damageTracker.debugTriggerCrash() end

--- Indicates whether a crash has been detected since the last reset.
---Source: lua/ge/extensions/gameplay/tutorial/damageTracker.lua:388
---@return boolean  true if a crash occurred.
function gameplay_tutorial_damageTracker.getHadCrash() end

--- Hook called when returning within bounds: outside time trial, if the tracked vehicle has damage, displays the repair task again.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/tutorial/damageTracker.lua:315
function gameplay_tutorial_damageTracker.onCareerTutorialOutOfBoundsEnded() end

--- Hook called when the player goes out of bounds: ignores damage for 8 s, cancels the pending crash and the repair task.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/tutorial/damageTracker.lua:307
function gameplay_tutorial_damageTracker.onCareerTutorialOutOfBoundsStarted() end

--- Mission start hook: ensures the tracked vehicle is up to date if tracking is active.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/tutorial/damageTracker.lua:347
---@param levelPath string Level path (unused).
function gameplay_tutorial_damageTracker.onClientStartMission(levelPath) end

--- Recovery window hook: if the 'restartMission' button is pressed in time trial after a crash, marks as repaired and removes the tasks.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/tutorial/damageTracker.lua:368
---@param buttonId string Identifier of the button pressed.
function gameplay_tutorial_damageTracker.onRecoveryPromptButtonPressed(buttonId) end

--- Hook called when the player chooses to repair on the spot: marks the vehicle as repaired and removes the tasks.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/tutorial/damageTracker.lua:353
---@param invVehId integer Inventory vehicle id (not used).
function gameplay_tutorial_damageTracker.onRecoveryPromptRepairHereUsed(invVehId) end

--- Update hook: ensures the right vehicle is tracked, then, if a damage window is pending, displays it when the vehicle is almost stopped or after the maximum delay.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/tutorial/damageTracker.lua:278
---@param dtReal number Real-time delta.
---@param dtSim number Simulation time delta.
---@param dtRaw number Raw delta time (used for the wait delay).
function gameplay_tutorial_damageTracker.onUpdate(dtReal, dtSim, dtRaw) end

--- crashDetection hook called at the end of a crash. If the tracked vehicle is concerned (and damage is not suppressed), schedules the display of the damage window.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/tutorial/damageTracker.lua:294
---@param crashData table Crash data; crashData.vehId = vehicle concerned.
function gameplay_tutorial_damageTracker.onVehicleCrashEnded(crashData) end

--- Hook called after a vehicle is repaired: if a crash had occurred, removes the repair tasks.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/tutorial/damageTracker.lua:360
---@param invVehId integer Inventory vehicle id (not used).
function gameplay_tutorial_damageTracker.onVehicleRepaired(invVehId) end

--- Hook called when a vehicle is reset: if it is the tracked vehicle and tracking is active, marks as repaired and removes the tasks. (Effective definition: the file's second one, which overwrites the first.)
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/tutorial/damageTracker.lua:379
---@param vehicleId integer Id of the reset vehicle.
function gameplay_tutorial_damageTracker.onVehicleResetted(vehicleId) end

--- Replaces the opening of the career damage window with a custom handler, called with the window id. A non-function value removes the handler.
---Source: lua/ge/extensions/gameplay/tutorial/damageTracker.lua:86
---@param handler function|nil function(popupId) called instead of career_modules_tutorialPopups.introPopup.
function gameplay_tutorial_damageTracker.setDamagePopupHandler(handler) end

--- Restores the default repair task (id 'tutorial_repairVehicleGoal', action toggleRadialMenuMulti).
---Source: lua/ge/extensions/gameplay/tutorial/damageTracker.lua:85
function gameplay_tutorial_damageTracker.setDefaultRepairGoal() end

--- Enables or disables damage tracking. On disabling: stops tracking the vehicle and removes all tasks; on enabling: tracks the vehicle and displays the task if needed.
---Source: lua/ge/extensions/gameplay/tutorial/damageTracker.lua:181
---@param value boolean true to enable.
function gameplay_tutorial_damageTracker.setEnabled(value) end

--- Sets the "repair" task displayed after a crash (task table for the task list). nil restores the default task.
---Source: lua/ge/extensions/gameplay/tutorial/damageTracker.lua:84
---@param goal table|nil Task table ({id, type, label, subtext, actionItems, done}).
function gameplay_tutorial_damageTracker.setRepairGoal(goal) end

--- Sets the id of the vehicle to track (taken into account at the next ensureTrackedVehicle, for example in onUpdate).
---Source: lua/ge/extensions/gameplay/tutorial/damageTracker.lua:158
---@param vehicleId integer|nil Vehicle id, nil to track nothing.
function gameplay_tutorial_damageTracker.setTrackedVehicleId(vehicleId) end

--- Displays the repair task (or restart task in time trial) if tracking is active, a crash occurred and the vehicle has not been repaired yet.
---Source: lua/ge/extensions/gameplay/tutorial/damageTracker.lua:169
function gameplay_tutorial_damageTracker.showRepairTask() end

