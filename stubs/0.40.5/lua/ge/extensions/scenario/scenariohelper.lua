---@meta
-- tim19Atlas stub generated from lua/ge/extensions/scenario/scenariohelper.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Scenario toolbox (GE extension scenario_scenariohelper). It wraps sending Lua commands to a vehicle by its name in the scenetree, AI control (mode, aggression, route, target, avoidance), breaking beam groups, and two interface messages. It is the API used by modders' scenarios. Each AI function sends a textual ai.xxx(...) command to the vehicle VM, then, if scenario_scenarios is loaded, stores the state via scenario_scenarios.updateVehicleAiState so it can be replayed after a reset.
--- Access: extension `scenario_scenariohelper`: `extensions.load("scenario_scenariohelper")`, then the global `scenario_scenariohelper`
---@class scenario_scenariohelper
scenario_scenariohelper = {}

--- Breaks a break group (breakGroup) of the vehicle by executing beamstate.breakBreakGroup(group) in its VM.
---Source: lua/ge/extensions/scenario/scenariohelper.lua:29
---@param vehicleName string Vehicle name. Must exist, otherwise error.
---@param group string Name of the breakGroup defined in the jbeam.
function scenario_scenariohelper.breakBreakGroup(vehicleName, group) end

--- Displays a flash message on screen via guihooks.trigger('ScenarioFlashMessage', {{msg, duration, 0, useBiggerText}}).
---Source: lua/ge/extensions/scenario/scenariohelper.lua:178
---@param msg string Text to display.
---@param duration number Display duration (seconds, inferred from code).
---@param useBiggerText boolean|nil true for larger text; any other value is treated as false.
function scenario_scenariohelper.flashUiMessage(msg, duration, useBiggerText) end

--- Computes the distance between the positions of two scenetree objects.
---Source: lua/ge/extensions/scenario/scenariohelper.lua:189
---@param sceneObjectName1 string Name of the first object.
---@param sceneObjectName2 string Name of the second object.
---@return number  Distance in meters, or -1 if either object is not found.
function scenario_scenariohelper.getDistanceBetweenSceneObjects(sceneObjectName1, sceneObjectName2) end

--- Returns the scenetree object with this name (scenetree.findObject), typically a vehicle.
---Source: lua/ge/extensions/scenario/scenariohelper.lua:14
---@param name string Object name in the scenetree.
---@return table|nil  The object, or nil if it does not exist.
function scenario_scenariohelper.getVehicleByName(name) end

--- Sends a string of Lua code to be executed in the given vehicle's VM (calls vehicle:queueLuaCommand). No check on vehicle.
---Source: lua/ge/extensions/scenario/scenariohelper.lua:9
---@param vehicle table Already resolved vehicle object (BeamObject), for example returned by getVehicleByName.
---@param command string Lua code to execute on the vehicle side.
function scenario_scenariohelper.queueLuaCommand(vehicle, command) end

--- Sends a Lua command to a vehicle found by its name. If the vehicle does not exist, writes an error to the log (tag scenarioHelper) and does nothing else.
---Source: lua/ge/extensions/scenario/scenariohelper.lua:19
---@param vehicleName string Vehicle name in the scenetree.
---@param command string Lua code to execute on the vehicle side.
function scenario_scenariohelper.queueLuaCommandByName(vehicleName, command) end

--- Updates the scenario's real-time display via guihooks.trigger('ScenarioRealtimeDisplay', {msg = msg}).
---Source: lua/ge/extensions/scenario/scenariohelper.lua:185
---@param msg any Content passed to the UI in the msg field.
function scenario_scenariohelper.realTimeUiDisplay(msg) end

--- Sets the AI aggression (ai.setAggression) and stores it in the scenario state.
---Source: lua/ge/extensions/scenario/scenariohelper.lua:58
---@param vehicleName string Vehicle name.
---@param aggression number Aggression, inserted as is in the command (the setAiPath comment states a maximum of 2).
function scenario_scenariohelper.setAiAggression(vehicleName, aggression) end

--- Chooses the AI's dynamic aggression mode in manual mode (ai.setAggressionMode). With 'rubberBand', the aggression varies with the distance to the opponent: the closer the AI, the less aggressive.
---Source: lua/ge/extensions/scenario/scenariohelper.lua:67
---@param vehicleName string Vehicle name.
---@param aggrMode string Currently 'rubberBand' (only value mentioned in the code).
function scenario_scenariohelper.setAiAggressionMode(vehicleName, aggrMode) end

--- Enables or disables the AI's avoidance of other cars (ai.setAvoidCars).
---Source: lua/ge/extensions/scenario/scenariohelper.lua:81
---@param vehicleName string Vehicle name.
---@param value string 'on' or 'off'.
function scenario_scenariohelper.setAiAvoidCars(vehicleName, value) end

--- Sets the vehicle's AI mode via ai.setState({mode=...}). If targetVehicleName is provided, that vehicle's ID is passed as targetObjectID (useful for modes that target another vehicle, for example chase or flee). Stores the mode in the scenario state.
---Source: lua/ge/extensions/scenario/scenariohelper.lua:44
---@param vehicleName string Name of the vehicle driven by the AI.
---@param mode string AI mode (values from the vehicle's ai.lua, for example 'manual', 'chase', 'flee', 'stop', 'disabled': inferred from code, not verified here).
---@param targetVehicleName string|nil Target vehicle name, optional. Must exist if provided.
function scenario_scenariohelper.setAiMode(vehicleName, mode, targetVehicleName) end

--- Makes an AI vehicle follow a route between waypoints (ai.driveUsingPath) with many options. The AI computes the shortest path between consecutive waypoints. The arg table is also saved (core_checkpoints.saveAIPath and scenario_scenarios.updateVehicleAiState) to be reapplied on reset.
---Source: lua/ge/extensions/scenario/scenariohelper.lua:104
---@param arg table Options table. Only vehicleName and waypoints are required.
function scenario_scenariohelper.setAiPath(arg) end

--- Enables the AI's automatic progression along a list of waypoints (ai.driveUsingPath with wpTargetList). The AI mode must be manual or flee. Simple version of setAiPath, without speed or lap options.
---Source: lua/ge/extensions/scenario/scenariohelper.lua:90
---@param vehicleName string Vehicle name.
---@param waypoints string[] List of waypoint names, serialized with serialize().
function scenario_scenariohelper.setAiRoute(vehicleName, waypoints) end

--- Sets the AI target (ai.setTarget) and stores it in the scenario state.
---Source: lua/ge/extensions/scenario/scenariohelper.lua:74
---@param vehicleName string Name of the vehicle driven by the AI.
---@param target string Target passed to ai.setTarget (name, in quotes in the command).
function scenario_scenariohelper.setAiTarget(vehicleName, target) end

--- Sets the AI's cut-off drivability threshold (ai.setCutOffDrivability), used to discard roads of too low drivability.
---Source: lua/ge/extensions/scenario/scenariohelper.lua:97
---@param vehicleName string Vehicle name.
---@param drivability number Drivability value, inserted as is in the command.
function scenario_scenariohelper.setCutOffDrivability(vehicleName, drivability) end

--- Enables map tracking of the vehicle (mapmgr.enableTracking) under a custom tracking name.
---Source: lua/ge/extensions/scenario/scenariohelper.lua:39
---@param vehicleName string Vehicle name in the scenetree.
---@param trackingName string Tracking name to use.
function scenario_scenariohelper.trackVehicle(vehicleName, trackingName) end

--- Triggers a deform group (beamstate.triggerDeformGroup): switches to a broken material, for example to shatter a window.
---Source: lua/ge/extensions/scenario/scenariohelper.lua:34
---@param vehicleName string Vehicle name. Must exist, otherwise error.
---@param group string Name of the deformGroup defined in the jbeam.
function scenario_scenariohelper.triggerDeformGroup(vehicleName, group) end

