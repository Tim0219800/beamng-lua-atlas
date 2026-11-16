---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/vehicleController/shiftLogic/manualGearbox.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Manual gearbox logic (H-shifter or up/down keys) with automatic or manual clutch. Loaded by vehicleController when the "gearbox" device is of type manualGearbox. In arcade, the gearbox chooses the gear by itself (shift points, automatic reverse) and drives the clutch at launch; in realistic, the driver chooses the gear, the state machine handles clutch, neutral, synchronization (rev-match) and engagement.
--- Access: controller `vehicleController/shiftLogic/manualGearbox` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_vehicleController_shiftLogic_manualGearbox
---@field brake number Decided brake (0..1).
---@field checkEngine boolean Engine disabled.
---@field clutchRatio number Clutch ratio (1 = engaged).
---@field currentGearIndex integer Current gearbox gear.
---@field energyStorages table<integer, string> Engine tanks.
---@field engineLoad number Engine load.
---@field engineThrottle number Throttle applied to the engine.
---@field engineTorque number Combustion torque.
---@field flywheelTorque number Engine flywheel torque.
---@field gearboxHandling table|nil Injected by vehicleController.
---@field gearboxTorque number Gearbox output torque.
---@field idleRPM number Idle RPM.
---@field ignition boolean ignitionLevel > 1.
---@field inputValues table|nil Injected.
---@field isArcadeSwitched boolean Throttle/brake swapped (arcade reverse).
---@field isEngineRunning number 1 if the engine is running.
---@field isShifting boolean True during a gear change (excluding waiting for the driver).
---@field isSportModeActive boolean Always false.
---@field maxGearIndex integer Highest forward gear.
---@field maxRPM number Maximum RPM.
---@field minGearIndex integer Smallest index (reverse).
---@field oilTemp number Oil temperature.
---@field rpm number Engine speed (RPM).
---@field shiftBehavior table|nil Injected.
---@field shiftPreventionData table|nil Injected.
---@field shiftingAggression number Shift speed coefficient 0.3..1 computed by calculateShiftAggression.
---@field smoothedAvgAVInput number Gearbox output angular velocity (rad/s).
---@field smoothedValues table|nil Injected.
---@field throttle number Decided throttle (0..1), zero during a gear change beyond the 1st except rev-match.
---@field timer table|nil Injected.
---@field timerConstants table|nil Injected.
---@field updateGearboxGFX function nop then inGear/whileShifting of the active mode.
---@field waterTemp number Coolant temperature.
local controller_vehicleController_shiftLogic_manualGearbox = {}

--- True outside arcade.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/vehicleController/shiftLogic/manualGearbox.lua:82
---@return boolean  Shift LEDs used?
function controller_vehicleController_shiftLogic_manualGearbox.areShiftLEDsInUse() end

--- Selects the mode logic (arcade/realistic) and reassigns the shift functions.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/vehicleController/shiftLogic/manualGearbox.lua:94
---@param behavior string "arcade" or "realistic".
function controller_vehicleController_shiftLogic_manualGearbox.gearboxBehaviorChanged(behavior) end

--- Returns the gearbox's numeric gear index (not a string).
---Source: lua/vehicle/controller/vehicleController/shiftLogic/manualGearbox.lua:86
---@return integer  gearbox.gearIndex
function controller_vehicleController_shiftLogic_manualGearbox.getGearName() end

--- Always 0, 0 (unused for manual and sequential gearboxes).
---Source: lua/vehicle/controller/vehicleController/shiftLogic/manualGearbox.lua:90
---@return number  0
---@return number  0
function controller_vehicleController_shiftLogic_manualGearbox.getGearPosition() end

--- Saveable state: {grb_idx = current gear}.
---Source: lua/vehicle/controller/vehicleController/shiftLogic/manualGearbox.lua:683
---@return table|nil  State.
function controller_vehicleController_shiftLogic_manualGearbox.getState() end

--- Gets mainEngine and gearbox, builds the arcade/realistic logics, reads the clutch parameters (see notes). Called by vehicleController at init and reset.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/vehicleController/shiftLogic/manualGearbox.lua:605
---@param jbeamData table Jbeam data.
---@param sharedFunctionTable table sharedFunctions.
function controller_vehicleController_shiftLogic_manualGearbox.init(jbeamData, sharedFunctionTable) end

--- Asks the engine to send its torque curves to the UI.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/vehicleController/shiftLogic/manualGearbox.lua:599
function controller_vehicleController_shiftLogic_manualGearbox.sendTorqueData() end

--- Restores the gear via shiftToGearIndex(data.grb_idx).
---Source: lua/vehicle/controller/vehicleController/shiftLogic/manualGearbox.lua:689
---@param data table Table produced by getState.
function controller_vehicleController_shiftLogic_manualGearbox.setState(data) end

--- Shift down press: requests the lower gear and starts the sequence.
---Source: lua/vehicle/controller/vehicleController/shiftLogic/manualGearbox.lua:152
function controller_vehicleController_shiftLogic_manualGearbox.shiftDownOnDown() end

--- Shift down release, same logic as shiftUpOnUp.
---Source: lua/vehicle/controller/vehicleController/shiftLogic/manualGearbox.lua:176
function controller_vehicleController_shiftLogic_manualGearbox.shiftDownOnUp() end

--- Directly requests a gear (bounded, over-rev safety); direct shift (H-shifter). Index 0 from gearGrind puts the gearbox back in neutral.
---Source: lua/vehicle/controller/vehicleController/shiftLogic/manualGearbox.lua:185
---@param index integer Wanted gear.
function controller_vehicleController_shiftLogic_manualGearbox.shiftToGearIndex(index) end

--- Shift up press: requests the next gear (bounded min/max, over-rev safety) and starts the shift sequence.
---Source: lua/vehicle/controller/vehicleController/shiftLogic/manualGearbox.lua:119
function controller_vehicleController_shiftLogic_manualGearbox.shiftUpOnDown() end

--- Shift up release: when waiting for shift, triggers engagement; otherwise records that the input is finished.
---Source: lua/vehicle/controller/vehicleController/shiftLogic/manualGearbox.lua:143
function controller_vehicleController_shiftLogic_manualGearbox.shiftUpOnUp() end

return controller_vehicleController_shiftLogic_manualGearbox
