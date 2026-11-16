---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/vehicleController/vehicleController.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Main controller (type "main", defaultOrder 500) of the vehicle. It reads the driver inputs (input.throttle/brake/clutch, or the electrics overrides), loads the gearbox logic module (shiftLogic/ folder, chosen by the type of the "gearbox" device or by the jbeam key shiftLogicName), manages the arcade/realistic gearbox mode, the driving aggression computation, shift prevention on slip/jump, the smart parking brake, the speed limit, and publishes more than 30 values in electrics.values (throttle, brake, clutch, gear, rpm, fuel, engineRunning...). A modder uses it through controller.mainController to change gear, change gearbox mode, cut the ignition or limit the speed.
--- Access: controller `vehicleController/vehicleController` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_vehicleController_vehicleController
---@field brake number Final brake (0..1) decided by the gearbox logic (forced to 1 if the vehicle is frozen).
---@field clutchRatio number Clutch ratio (1 = engaged, 0 = disengaged) provided by the gearbox logic. electrics.values.clutch equals 1 - clutchRatio.
---@field defaultOrder number Default execution order of the controller (500).
---@field drivingAggression number Smoothed driving aggression (0..1) that interpolates the low/high shift points; can be forced by setAggressionOverride.
---@field engineInfo table Array of 21 values sent to the "engineInfo" stream: [1] idle RPM, [2] max RPM, [5] rpm, [6] gear name, [7] maxGearIndex, [8] minGearIndex, [9] flywheel torque, [10] gearbox torque, [11] ground speed, [12] fuel volume, [13] capacity, [14] "manual", [15] object id, [17] gearIndex, [18] engine running, [19] load, [20] wheel torque, [21] wheel power in hp (x0.001x1.35962), [22] engine power in hp.
---@field fireEngineTemperature number Engine exhaust temperature (engine.thermals.exhaustTemperature) or ambient temperature if there is no thermal model. Updated every frame.
---@field gearboxBehavior string|nil Current gearbox mode, "arcade" or "realistic"; nil before the first setGearboxBehavior.
---@field isArcadeSwitched boolean True when arcade mode has swapped the throttle/brake roles (automatic reverse). Reported from the gearbox logic.
---@field setDefaultForwardMode function|nil Delegated to the function of the same name in the gearbox module (changes the default forward direction). Is `nop` or nil if the module does not provide it.
---@field shiftingAggression number Gear shift aggression reported by the gearbox module (0 if absent).
---@field throttle number Final throttle (0..1) decided by the gearbox logic, after the speed limit.
---@field type string Always "main": mandatory main controller of the vehicle.
---@field updateGFX function Graphics loop, replaced by updateGFXGeneric(dt) at init (nop before).
local controller_vehicleController_vehicleController = {}

--- Adds a value to the temporary limit (nil counts as 0).
---Source: lua/vehicle/controller/vehicleController/vehicleController.lua:163
---@param change number Change in m/s.
function controller_vehicleController_vehicleController.changeTopSpeedLimitTemporary(change) end

--- Switches to the next gearbox mode in the list {"arcade", "realistic"} (wrapping around) and displays a message.
---Source: lua/vehicle/controller/vehicleController/vehicleController.lua:670
function controller_vehicleController_vehicleController.cycleGearboxModes() end

--- Returns the compact controller state for synchronization: grb_bhv (gearbox mode), frzn (frozen), merged with the gearbox module's getState.
---Source: lua/vehicle/controller/vehicleController/vehicleController.lua:1202
---@return table|nil  State table, nil if empty.
function controller_vehicleController_vehicleController.getState() end

--- Initializes the controller: reads the jbeam keys, creates the smoothers, computes the shift points, loads and initializes the shiftLogic module, registers the "gearbox mode" quick menu and sets the initial gearbox mode (previous, defaultGearboxBehavior setting, otherwise arcade). Called by the engine at vehicle load.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/vehicleController/vehicleController.lua:957
---@param jbeamData table Controller jbeam data (see notes for the keys).
function controller_vehicleController_vehicleController.init(jbeamData) end

--- Called after the init of all controllers: applies the parking brake at spawn if allowed.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/vehicleController/vehicleController.lua:1169
function controller_vehicleController_vehicleController.initLastStage() end

--- Load hook: restores the gearbox mode, the gearbox module data, then reapplies the parking brake.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/vehicleController/vehicleController.lua:1181
---@param data table Table produced by onSerialize.
function controller_vehicleController_vehicleController.onDeserialize(data) end

--- Save hook: returns {previousGearboxBehavior, controlLogicModuleData} (gearbox module data if it has onSerialize).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/vehicleController/vehicleController.lua:1191
---@return table  Data to serialize.
function controller_vehicleController_vehicleController.onSerialize() end

--- Resets timers, smoothers, PID, parking brake state and reinitializes the gearbox module; reapplies the gearbox mode. Called at vehicle reset.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/vehicleController/vehicleController.lua:863
---@param jbeamData table Controller jbeam data.
function controller_vehicleController_vehicleController.reset(jbeamData) end

--- Called last at reset: reapplies the spawn parking brake and cancels the automatic start.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/vehicleController/vehicleController.lua:951
---@param jbeamData table Jbeam data.
function controller_vehicleController_vehicleController.resetLastStage(jbeamData) end

--- Asks the gearbox module to send the torque curves to the UI; ignored if no main player is seated.
---Source: lua/vehicle/controller/vehicleController/vehicleController.lua:719
function controller_vehicleController_vehicleController.sendTorqueData() end

--- Forces the driving aggression (0..1) used by the shift points; nil gives control back to the automatic computation.
---Source: lua/vehicle/controller/vehicleController/vehicleController.lua:175
---@param aggression number|nil Forced value or nil.
function controller_vehicleController_vehicleController.setAggressionOverride(aggression) end

--- Cuts or turns on the engine ignition (engine:setIgnition 1/0) or, without an engine, calls the gearbox module's setIgnition.
---Source: lua/vehicle/controller/vehicleController/vehicleController.lua:711
---@param enabled boolean Ignition active?
function controller_vehicleController_vehicleController.setEngineIgnition(enabled) end

--- Freezes the vehicle: brake forced to 1 and gearbox locked if mode == 1.
---Source: lua/vehicle/controller/vehicleController/vehicleController.lua:704
---@param mode integer 1 to freeze, any other value to release.
function controller_vehicleController_vehicleController.setFreeze(mode) end

--- Sets the gearbox mode. Unknown: error log and no effect. Displays a message, then notifies the module (gearboxBehaviorChanged).
---Source: lua/vehicle/controller/vehicleController/vehicleController.lua:189
---@param behavior string "arcade" or "realistic".
function controller_vehicleController_vehicleController.setGearboxMode(behavior) end

--- Engages or cuts the main engine's starter; only activates if the speed is below 80% of starterMaxAV.
---Source: lua/vehicle/controller/vehicleController/vehicleController.lua:694
---@param enabled boolean Starter active?
function controller_vehicleController_vehicleController.setStarter(enabled) end

--- Applies a state produced by getState (gearbox mode, freeze, then the gearbox module state).
---Source: lua/vehicle/controller/vehicleController/vehicleController.lua:1211
---@param data table Table with grb_bhv, frzn and gearbox module keys.
function controller_vehicleController_vehicleController.setState(data) end

--- Sets the temporary speed limit. It only acts if setTopSpeedLimitTemporaryActive(true).
---Source: lua/vehicle/controller/vehicleController/vehicleController.lua:159
---@param speedLimit number|nil Limit in m/s.
function controller_vehicleController_vehicleController.setTopSpeedLimitTemporary(speedLimit) end

--- Enables or disables the temporary speed limit (reset to false at reset).
---Source: lua/vehicle/controller/vehicleController/vehicleController.lua:167
---@param active boolean Enable?
function controller_vehicleController_vehicleController.setTopSpeedLimitTemporaryActive(active) end

--- Hook called when user settings change: rereads autoClutch, autoThrottle, gearboxSafety and defaultGearboxBehavior (applies the latter to the player's vehicle).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/vehicleController/vehicleController.lua:773
function controller_vehicleController_vehicleController.settingsChanged() end

--- Downshifts on key press: the module's shiftDownOnDown, otherwise shiftDown.
---Source: lua/vehicle/controller/vehicleController/vehicleController.lua:652
function controller_vehicleController_vehicleController.shiftDownOnDown() end

--- Downshift key release: the module's shiftDownOnUp if it exists. Required API of the main controller.
---Source: lua/vehicle/controller/vehicleController/vehicleController.lua:660
function controller_vehicleController_vehicleController.shiftDownOnUp() end

--- Shifts directly to the gear of the given index (negative = reverse, 0 = neutral) by delegating to the gearbox module.
---Source: lua/vehicle/controller/vehicleController/vehicleController.lua:666
---@param index integer Gear index.
function controller_vehicleController_vehicleController.shiftToGearIndex(index) end

--- Shifts up on key press: calls the gearbox module's shiftUpOnDown, otherwise shiftUp.
---Source: lua/vehicle/controller/vehicleController/vehicleController.lua:639
function controller_vehicleController_vehicleController.shiftUpOnDown() end

--- Shift up key release: calls the module's shiftUpOnUp if it exists.
---Source: lua/vehicle/controller/vehicleController/vehicleController.lua:646
function controller_vehicleController_vehicleController.shiftUpOnUp() end

--- "Smart" handbrake input: if the vehicle is moving (> 2.8 m/s), skidding (cumulative slip > 10000) or if the input is an axis, relays the parkingbrake event as is (temporary brake); otherwise, at standstill, a press toggles the parking brake, and a release with the brake applied enables the smartParkingBrakeActive mode (released as soon as you accelerate).
---Source: lua/vehicle/controller/vehicleController/vehicleController.lua:432
---@param ivalue number Input value (0..1).
---@param filter integer|nil Input filter (FILTER_*), FILTER_DIRECT by default.
---@param isAxisOverride boolean|nil Forces handling as an axis (true) or a key (false), e.g. for air brakes.
function controller_vehicleController_vehicleController.smartParkingBrake(ivalue, filter, isAxisOverride) end

--- Toggles the activation of the temporary limit.
---Source: lua/vehicle/controller/vehicleController/vehicleController.lua:171
function controller_vehicleController_vehicleController.toggleTopSpeedLimitTemporaryActive() end

--- Hook called when the vehicle becomes active: sends the shift point data back to the UI (ShiftPointDebugDataChanged) if a player is seated.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/vehicleController/vehicleController.lua:1173
function controller_vehicleController_vehicleController.vehicleActivated() end

--- Utility table passed as the second argument to the shiftLogic module's init (controlLogicModule.init(jbeamData, sharedFunctions)). Not exposed in M.
---@class controller_vehicleController_vehicleController_sharedFunctions
local controller_vehicleController_vehicleController_sharedFunctions = {}

--- Lists the tank names of the engines whose energy type matches requiredEnergyType.
---Source: lua/vehicle/controller/vehicleController/vehicleController.lua:274
---@param engines table List of engine devices.
---@return table<integer, string>  Energy storage names.
function controller_vehicleController_vehicleController_sharedFunctions.getEnergyStorages(engines) end

--- Returns the shift points table by gear index (lowShiftDownAV, highShiftDownAV, lowShiftUpAV, highShiftUpAV in rad/s).
---Source: lua/vehicle/controller/vehicleController/vehicleController.lua:225
---@return table  Shift points.
function controller_vehicleController_vehicleController_sharedFunctions.getShiftPoints() end

--- Chooses the up/down shift speeds (rad/s) of the gear by interpolating between the low and high values according to the square of the normalized aggression; writes shiftBehavior.shiftUpAV/shiftDownAV and provides it to the module.
---Source: lua/vehicle/controller/vehicleController/vehicleController.lua:215
---@param gearIndex integer Gear for which to read shiftPoints.
function controller_vehicleController_vehicleController_sharedFunctions.selectShiftPoints(gearIndex) end

--- Displays the "using the H-shifter" message, switches to realistic mode and selects the requested gear.
---Source: lua/vehicle/controller/vehicleController/vehicleController.lua:229
---@param gearIndex integer Gear to engage.
function controller_vehicleController_vehicleController_sharedFunctions.switchToRealisticBehavior(gearIndex) end

--- Average of the outputAV1 of all devices of a category. Same division by zero pitfall.
---Source: lua/vehicle/controller/vehicleController/vehicleController.lua:264
---@param deviceCategory string Device category.
---@return number  Average speed in rad/s.
function controller_vehicleController_vehicleController_sharedFunctions.updateAvgAVDeviceCategory(deviceCategory) end

--- Average of the outputAV1 of all devices of a type. Pitfall: division by zero (NaN) if there is no device.
---Source: lua/vehicle/controller/vehicleController/vehicleController.lua:254
---@param deviceType string Device type.
---@return number  Average speed in rad/s.
function controller_vehicleController_vehicleController_sharedFunctions.updateAvgAVDeviceType(deviceType) end

--- Returns an angular velocity of a powertrain device (0 if absent).
---Source: lua/vehicle/controller/vehicleController/vehicleController.lua:248
---@param deviceName string Device name.
---@param deviceProperty string|nil Property read, "outputAV1" by default.
---@return number  Speed in rad/s.
function controller_vehicleController_vehicleController_sharedFunctions.updateAvgAVSingleDevice(deviceName, deviceProperty) end

--- Sends the UI a "cannot shift to sequential" message with an action to switch the gearbox mode.
---Source: lua/vehicle/controller/vehicleController/vehicleController.lua:235
function controller_vehicleController_vehicleController_sharedFunctions.warnCannotShiftSequential() end

return controller_vehicleController_vehicleController
