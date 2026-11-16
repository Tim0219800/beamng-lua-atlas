---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/vehicleController/shiftLogic/automaticGearbox.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Automatic gearbox logic (modes P R N D S 1-9 M, torque converter with partial lockup). Loaded by vehicleController when the "gearbox" device is of type automaticGearbox. Depending on the gearbox mode (arcade or realistic), it decides the target gear from the shift points (aggression, slip), handles throttle/brake (automatic inversion in reverse in arcade, auto brake at standstill) and converter lockup (electrics.values.lockupClutchRatio).
--- Access: controller `vehicleController/shiftLogic/automaticGearbox` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_vehicleController_shiftLogic_automaticGearbox
---@field brake number Decided brake (0..1); in arcade, at least arcadeAutoBrakeAmount at standstill without throttle.
---@field checkEngine boolean True if the engine is disabled.
---@field clutchRatio number Always 1 (automatic gearbox, no driven clutch).
---@field currentGearIndex integer Gear index targeted by the logic.
---@field energyStorages table<integer, string> Tanks of the main engine.
---@field engineLoad number Engine load.
---@field engineThrottle number Throttle actually applied to the engine.
---@field engineTorque number Combustion torque.
---@field flywheelTorque number Engine output torque.
---@field gearboxHandling table|nil Injected by vehicleController.
---@field gearboxTorque number Gearbox output torque.
---@field idleRPM number Idle RPM.
---@field ignition boolean ignitionLevel > 1.
---@field inputValues table|nil Injected.
---@field isArcadeSwitched boolean True when throttle and brake are swapped (arcade, reverse).
---@field isEngineRunning number 1 if the engine is running, 0 otherwise.
---@field isManualModeActive boolean True in M1..Mn modes.
---@field isSportModeActive boolean True in S mode.
---@field maxGearIndex integer Highest forward gear.
---@field maxRPM number Maximum RPM.
---@field minGearIndex integer Smallest gear index (reverse); see notes on the sign.
---@field oilTemp number Engine oil temperature.
---@field rpm number Engine speed in RPM.
---@field shiftBehavior table|nil Injected (shiftUpAV / shiftDownAV in rad/s).
---@field shiftPreventionData table|nil Injected.
---@field shiftingAggression number Copy of smoothedValues.drivingAggression.
---@field smoothedAvgAVInput number Gearbox output angular velocity (rad/s), used by vehicleController.
---@field smoothedValues table|nil Injected.
---@field throttle number Decided throttle (0..1), possibly inverted in arcade reverse or limited during a shift.
---@field timer table|nil Injected.
---@field timerConstants table|nil Injected.
---@field updateGearboxGFX function Current decision loop: nop, then inGear/whileShifting of the active gearbox mode.
---@field waterTemp number Coolant temperature.
local controller_vehicleController_shiftLogic_automaticGearbox = {}

--- True if not in arcade and in manual M mode.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/vehicleController/shiftLogic/automaticGearbox.lua:95
---@return boolean  Use RPM LEDs?
function controller_vehicleController_shiftLogic_automaticGearbox.areShiftLEDsInUse() end

--- Called by vehicleController on an arcade/realistic change: chooses the matching logic and, in arcade, resets the mode (default forward mode, R or N depending on the gear).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/vehicleController/shiftLogic/automaticGearbox.lua:159
---@param behavior string "arcade" or "realistic".
function controller_vehicleController_shiftLogic_automaticGearbox.gearboxBehaviorChanged(behavior) end

--- Displayed gear name: P/R/N/D, "S<n>" in S mode, "M<n>" in manual, otherwise the mode name.
---Source: lua/vehicle/controller/vehicleController/shiftLogic/automaticGearbox.lua:99
---@return string  Displayed name.
function controller_vehicleController_shiftLogic_automaticGearbox.getGearName() end

--- Lever position for animation: (index-1)/(number of modes-1) and mode index.
---Source: lua/vehicle/controller/vehicleController/shiftLogic/automaticGearbox.lua:109
---@return number  Normalized position 0..1.
---@return integer  Mode index.
function controller_vehicleController_shiftLogic_automaticGearbox.getGearPosition() end

--- Saveable state: {grb_mde = current mode}.
---Source: lua/vehicle/controller/vehicleController/shiftLogic/automaticGearbox.lua:723
---@return table|nil  State table.
function controller_vehicleController_shiftLogic_automaticGearbox.getState() end

--- Reads the devices (mainEngine, gearbox, torqueConverter), builds the mode list, the H-shifter table, the lockup parameters and applies the default mode. Called by vehicleController (init and reset).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/vehicleController/shiftLogic/automaticGearbox.lua:594
---@param jbeamData table jbeam data (see notes).
---@param sharedFunctionTable table sharedFunctions of vehicleController.
function controller_vehicleController_shiftLogic_automaticGearbox.init(jbeamData, sharedFunctionTable) end

--- Asks the engine to send its torque curves to the UI.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/vehicleController/shiftLogic/automaticGearbox.lua:588
function controller_vehicleController_shiftLogic_automaticGearbox.sendTorqueData() end

--- Sets the default "forward" mode (D, S, M1...) and applies it if already driving forward.
---Source: lua/vehicle/controller/vehicleController/shiftLogic/automaticGearbox.lua:182
---@param mode string Mode name ("M1" switches to manual on the current gear).
function controller_vehicleController_shiftLogic_automaticGearbox.setDefaultForwardMode(mode) end

--- Restores the current mode from data.grb_mde.
---Source: lua/vehicle/controller/vehicleController/shiftLogic/automaticGearbox.lua:729
---@param data table Table produced by getState.
function controller_vehicleController_shiftLogic_automaticGearbox.setState(data) end

--- Realistic mode: goes back one step in the mode list. With gearboxSafety, refuses to downshift below M1 above 2 m/s or a gear that would over-rev.
---Source: lua/vehicle/controller/vehicleController/shiftLogic/automaticGearbox.lua:239
function controller_vehicleController_shiftLogic_automaticGearbox.shiftDown() end

--- Realistic mode: selects the mode matching the H-shifter lever position (hShifterModePositions); nonexistent mode -> message and N.
---Source: lua/vehicle/controller/vehicleController/shiftLogic/automaticGearbox.lua:283
---@param index integer Lever position (-1 R, 0 N, 1.. according to the table).
function controller_vehicleController_shiftLogic_automaticGearbox.shiftToGearIndex(index) end

--- Realistic mode: advances one step in the mode list (P->R->N->D...). With gearboxSafety, refuses a manual gear that would make the engine exceed maxAV.
---Source: lua/vehicle/controller/vehicleController/shiftLogic/automaticGearbox.lua:196
function controller_vehicleController_shiftLogic_automaticGearbox.shiftUp() end

return controller_vehicleController_shiftLogic_automaticGearbox
