---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/tutorial/setup.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Tutorial scene setup: prefabs, sites (parking zones), tutorial vehicle (sunburst2, config apmTutorial_sunburst), placing the player on foot, blocking input actions, and "out of bounds" reset with screen fade. Used by gameplay_tutorial_runtime and by the steps; it only keeps the vehicle id, not the object.
--- Access: extension `gameplay_tutorial_setup`: `extensions.load("gameplay_tutorial_setup")`, then the global `gameplay_tutorial_setup`
---@class gameplay_tutorial_setup
---@field blockedActions table<string, boolean> Individually blocked input actions (gear1..8, gearN, gearR, shiftUp, shiftDown, setShifterMode: all true by default).
---@field blockedActionsTemplates table<string, boolean> Action groups (aiControls, bigMap, freeCam, resetPhysics, walkingMode, vehicleSwitching...) blocked when the value is true.
---@field loadingScreenFadeoutComplete boolean true after onLoadingScreenFadeout.
---@field outOfBoundsSystemActive boolean true after activateOutOfBoundsSystem().
---@field tutorialSites table|nil Loaded sites (parkingSpots, etc.); nil until loadTutorialSites has succeeded.
---@field tutorialVehicleId integer|nil Tutorial vehicle id (nil before spawn and after cleanup). Steps use getObjectByID on it.
---@field vehicleSetupComplete boolean true when the vehicle is ready and the player placed (end of setupPlayer).
gameplay_tutorial_setup = {}

--- Enables the zone bounds system (outOfBoundsSystemActive = true).
---Source: lua/ge/extensions/gameplay/tutorial/setup.lua:39
function gameplay_tutorial_setup.activateOutOfBoundsSystem() end

--- Resets everything: flags, reset handlers, created prefabs (deleted, collision reloaded) and tutorialVehicleId.
---Source: lua/ge/extensions/gameplay/tutorial/setup.lua:115
function gameplay_tutorial_setup.cleanup() end

--- Indicates whether the out-of-bounds reset is allowed.
---Source: lua/ge/extensions/gameplay/tutorial/setup.lua:31
---@return boolean
function gameplay_tutorial_setup.isOutOfBoundsResetAllowed() end

--- Loads the tutorial sites file via gameplay_sites_sitesManager.loadSites and stores it in tutorialSites.
---Source: lua/ge/extensions/gameplay/tutorial/setup.lua:144
---@return table|nil  Loaded sites, nil on failure.
function gameplay_tutorial_setup.loadTutorialSites() end

--- Hook called at the end of the loading screen fade; sets loadingScreenFadeoutComplete to true.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/tutorial/setup.lua:195
function gameplay_tutorial_setup.onLoadingScreenFadeout() end

--- Hook called on screen fade state changes; at state 2 and if a reset is pending, runs the callback, stops the fade and displays the warning.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/tutorial/setup.lua:339
---@param state integer Fade state (2 = screen fully blackened, inferred from code).
function gameplay_tutorial_setup.onScreenFadeState(state) end

--- Puts the player on foot and teleports them to the dragPlayerStart site (or 6 m behind dragCarStart), facing forward.
---Source: lua/ge/extensions/gameplay/tutorial/setup.lua:353
function gameplay_tutorial_setup.placePlayerAtDragStart() end

--- Puts the player back in the tutorial vehicle if they are walking or driving something else.
---Source: lua/ge/extensions/gameplay/tutorial/setup.lua:376
function gameplay_tutorial_setup.placePlayerBackInTutorialVehicle() end

--- Teleports the player: on foot, to the playerWalkingStart site; in a vehicle, the tutorial vehicle to tutorialCarStart, and puts the player in it if they are not in it.
---Source: lua/ge/extensions/gameplay/tutorial/setup.lua:288
function gameplay_tutorial_setup.placePlayerBackToParkingStart() end

--- Starts the out-of-bounds reset with the current step's handler, otherwise with the placement at the start point.
---Source: lua/ge/extensions/gameplay/tutorial/setup.lua:322
function gameplay_tutorial_setup.runCurrentStepOutOfBoundsReset() end

--- Starts a 0.3 s screen fade; the callback will be executed at fade state 2. Ignored if a reset is already pending.
---Source: lua/ge/extensions/gameplay/tutorial/setup.lua:315
---@param resetCallback function|nil Reset callback; placePlayerBackToParkingStart if nil.
function gameplay_tutorial_setup.runOutOfBoundsResetWithFade(resetCallback) end

--- Enables or disables prefabs of gameplay/tutorials/ according to an id -> boolean table; only touches those whose state changes. Reloads collision if something changed.
---Source: lua/ge/extensions/gameplay/tutorial/setup.lua:69
---@param prefabStates table<string, boolean> Prefab id -> active or not.
function gameplay_tutorial_setup.setActivePrefabs(prefabStates) end

--- Allows or not the out-of-bounds reset (to allow once the welcome pop-ups are closed).
---Source: lua/ge/extensions/gameplay/tutorial/setup.lua:27
---@param allowed boolean true to allow.
function gameplay_tutorial_setup.setOutOfBoundsResetAllowed(allowed) end

--- Sets the reset callback specific to the current step (otherwise placePlayerBackToParkingStart is used).
---Source: lua/ge/extensions/gameplay/tutorial/setup.lua:35
---@param resetCallback function|nil Function with no argument.
function gameplay_tutorial_setup.setOutOfBoundsResetHandler(resetCallback) end

--- Builds the blocked actions list (group templates set to true + individual actions set to true) and registers it as the tutorialBlockedActions group of player 0's action filter.
---Source: lua/ge/extensions/gameplay/tutorial/setup.lua:390
function gameplay_tutorial_setup.setupBlockedActions() end

--- Puts the player in walking mode at the playerWalkingStart position (or a hardcoded default position) then places them back at the start point; sets vehicleSetupComplete to true.
---Source: lua/ge/extensions/gameplay/tutorial/setup.lua:199
function gameplay_tutorial_setup.setupPlayer() end

--- Resets the setup flags to false, then spawns the tutorial vehicle and calls setupPlayer once ready.
---Source: lua/ge/extensions/gameplay/tutorial/setup.lua:189
function gameplay_tutorial_setup.setupVehicles() end

--- Displays for 3 s a message task "Please stay inside of the evaluation zone." in the UI task list (SetTasklistTask then DiscardTasklistItem).
---Source: lua/ge/extensions/gameplay/tutorial/setup.lua:331
function gameplay_tutorial_setup.showOutOfBoundsWarning() end

--- Spawns a prefab in MissionGroup (canSave = false) and stores it for cleanup.
---Source: lua/ge/extensions/gameplay/tutorial/setup.lua:43
---@param prefabPath string Prefab file path.
---@param pos vec3 Position.
---@param rot quat Rotation.
---@param name string|nil Object name; generated (tutorial_prefab_...) if absent.
---@return userdata|nil  Prefab object, nil on failure.
function gameplay_tutorial_setup.spawnPrefab(prefabPath, pos, rot, name) end

--- Spawns the tutorial's sunburst2 at the tutorialCarStart site (without entering it), stores its id, sets the gearbox to realistic, freezes the vehicle and turns the ignition off, then calls thenFunction.
---Source: lua/ge/extensions/gameplay/tutorial/setup.lua:223
---@param thenFunction function|nil Called when the vehicle has responded to the mainController/gearboxMode request.
---@return userdata|nil  Vehicle object, nil if spawning failed.
function gameplay_tutorial_setup.spawnTutorialVehicle(thenFunction) end

--- Sets all gear actions of blockedActions to false and reapplies the filter.
---Source: lua/ge/extensions/gameplay/tutorial/setup.lua:281
function gameplay_tutorial_setup.unblockGearActions() end

