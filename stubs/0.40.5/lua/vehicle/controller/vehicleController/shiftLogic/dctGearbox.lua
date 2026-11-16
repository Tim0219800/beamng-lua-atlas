---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/vehicleController/shiftLogic/dctGearbox.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Dual-clutch gearbox (DCT) logic with automatic modes P R N D S 1 2 M. Loaded by vehicleController when the "gearbox" device is of type dctGearbox. Two shafts (access1/access2: gearIndex1/2, clutchRatio1/2, setGearIndex1/2) alternate: the primary shaft is engaged, the secondary pre-selects the next gear (dctPredictNextGear) and the change crosses the two clutches. Handles rev-match on downshift, launch and the arcade/realistic modes.
--- Access: controller `vehicleController/shiftLogic/dctGearbox` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_vehicleController_shiftLogic_dctGearbox
---@field brake number Decided brake (0..1).
---@field checkEngine boolean Engine disabled.
---@field clutchRatio number Overall clutch ratio (per-shaft ratios are in electrics clutchRatio1/2).
---@field currentGearIndex integer Current gear or target gear during a change.
---@field energyStorages table<integer, string> Engine tanks.
---@field engineLoad number Engine load.
---@field engineThrottle number Throttle applied to the engine.
---@field engineTorque number Combustion torque.
---@field flywheelTorque number Engine torque.
---@field gearboxHandling table|nil Injected by vehicleController.
---@field gearboxTorque number Gearbox output torque.
---@field idleRPM number Idle.
---@field ignition boolean ignitionLevel > 1.
---@field inputValues table|nil Injected.
---@field isArcadeSwitched boolean Throttle/brake swapped.
---@field isEngineRunning number 1 if the engine is running.
---@field isManualModeActive boolean True in M modes.
---@field isSportModeActive boolean True in S mode.
---@field maxGearIndex integer Highest forward gear.
---@field maxRPM number Max RPM.
---@field minGearIndex integer Smallest index (reverse).
---@field oilTemp number Oil temperature.
---@field rpm number Engine speed (RPM).
---@field shiftBehavior table|nil Injected.
---@field shiftPreventionData table|nil Injected.
---@field shiftingAggression number Gear shift aggression.
---@field smoothedAvgAVInput number Gearbox output angular velocity (rad/s).
---@field smoothedValues table|nil Injected.
---@field throttle number Decided throttle (0..1); kept on upshift, cut on downshift except rev-match.
---@field timer table|nil Injected.
---@field timerConstants table|nil Injected.
---@field updateGearboxGFX function nop then inGear/whileShifting of the active mode.
---@field waterTemp number Coolant temperature.
local controller_vehicleController_shiftLogic_dctGearbox = {}

--- True outside arcade in manual M mode.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/vehicleController/shiftLogic/dctGearbox.lua:98
---@return boolean  LEDs used?
function controller_vehicleController_shiftLogic_dctGearbox.areShiftLEDsInUse() end

--- Selects the arcade/realistic logic.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/vehicleController/shiftLogic/dctGearbox.lua:142
---@param behavior string "arcade" or "realistic".
function controller_vehicleController_shiftLogic_dctGearbox.gearboxBehaviorChanged(behavior) end

--- Displayed gear name (mode, or S/M + gear).
---Source: lua/vehicle/controller/vehicleController/shiftLogic/dctGearbox.lua:102
---@return string  Displayed name.
function controller_vehicleController_shiftLogic_dctGearbox.getGearName() end

--- Normalized lever position and mode index.
---Source: lua/vehicle/controller/vehicleController/shiftLogic/dctGearbox.lua:116
---@return number  Position 0..1.
---@return integer  Mode index.
function controller_vehicleController_shiftLogic_dctGearbox.getGearPosition() end

--- Saveable state {grb_mde = mode}.
---Source: lua/vehicle/controller/vehicleController/shiftLogic/dctGearbox.lua:866
---@return table|nil  State.
function controller_vehicleController_shiftLogic_dctGearbox.getState() end

--- Gets mainEngine and gearbox, builds modes, arcade/realistic logics, clutch and DCT parameters, applies the default forward mode then the current mode. Called by vehicleController (init and reset).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/vehicleController/shiftLogic/dctGearbox.lua:750
---@param jbeamData table Jbeam data.
---@param sharedFunctionTable table sharedFunctions.
function controller_vehicleController_shiftLogic_dctGearbox.init(jbeamData, sharedFunctionTable) end

--- Asks the engine to send its torque curves to the UI.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/vehicleController/shiftLogic/dctGearbox.lua:744
function controller_vehicleController_shiftLogic_dctGearbox.sendTorqueData() end

--- Sets the default forward mode (D, S, M1...) and applies it if already moving forward.
---Source: lua/vehicle/controller/vehicleController/shiftLogic/dctGearbox.lua:197
---@param mode string Mode name.
function controller_vehicleController_shiftLogic_dctGearbox.setDefaultForwardMode(mode) end

--- Restores the mode from data.grb_mde.
---Source: lua/vehicle/controller/vehicleController/shiftLogic/dctGearbox.lua:872
---@param data table Table produced by getState.
function controller_vehicleController_shiftLogic_dctGearbox.setState(data) end

--- Realistic: previous mode / lower gear in M.
---Source: lua/vehicle/controller/vehicleController/shiftLogic/dctGearbox.lua:244
function controller_vehicleController_shiftLogic_dctGearbox.shiftDown() end

--- Realistic: selects the mode matching the lever position.
---Source: lua/vehicle/controller/vehicleController/shiftLogic/dctGearbox.lua:278
---@param index integer Lever position.
function controller_vehicleController_shiftLogic_dctGearbox.shiftToGearIndex(index) end

--- Realistic: next mode in the list; in manual M shifts up one gear (with over-rev safety if gearboxSafety).
---Source: lua/vehicle/controller/vehicleController/shiftLogic/dctGearbox.lua:211
function controller_vehicleController_shiftLogic_dctGearbox.shiftUp() end

return controller_vehicleController_shiftLogic_dctGearbox
