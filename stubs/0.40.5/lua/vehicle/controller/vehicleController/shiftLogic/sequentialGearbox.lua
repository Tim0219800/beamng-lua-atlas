---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/vehicleController/shiftLogic/sequentialGearbox.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Sequential gearbox logic (one step at a time with up/down, no H-shifter) with ignition cut on upshift and optional automatic clutch. Loaded by vehicleController when the "gearbox" device is of type sequentialGearbox. In arcade the gearbox chooses the gear by itself according to shift points; in realistic the driver shifts gears and the change is almost instantaneous (ignition cut then setGearIndex).
--- Access: controller `vehicleController/shiftLogic/sequentialGearbox` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_vehicleController_shiftLogic_sequentialGearbox
---@field brake number Decided brake (0..1).
---@field checkEngine boolean Engine disabled.
---@field clutchRatio number Clutch ratio (1 = engaged).
---@field currentGearIndex integer Current gear.
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
---@field isArcadeSwitched boolean Throttle/brake swapped (arcade, reverse).
---@field isEngineRunning number 1 if the engine is running.
---@field isSportModeActive boolean Always false.
---@field maxGearIndex integer Highest forward gear.
---@field maxRPM number Max RPM.
---@field minGearIndex integer Smallest index (reverse).
---@field oilTemp number Oil temperature.
---@field rpm number Engine speed (RPM).
---@field shiftBehavior table|nil Injected.
---@field shiftPreventionData table|nil Injected.
---@field shiftingAggression number Always 1.
---@field smoothedAvgAVInput number Gearbox output angular velocity (rad/s).
---@field smoothedValues table|nil Injected.
---@field throttle number Decided throttle (0..1).
---@field timer table|nil Injected.
---@field timerConstants table|nil Injected.
---@field updateGearboxGFX function nop then inGear/whileShifting of the active mode.
---@field waterTemp number Coolant temperature.
local controller_vehicleController_shiftLogic_sequentialGearbox = {}

--- True outside arcade.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/vehicleController/shiftLogic/sequentialGearbox.lua:74
---@return boolean  LEDs used?
function controller_vehicleController_shiftLogic_sequentialGearbox.areShiftLEDsInUse() end

--- Chooses the mode logic; switching to realistic without autoClutch with gear 1/-1 puts the gearbox back in neutral.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/vehicleController/shiftLogic/sequentialGearbox.lua:86
---@param behavior string "arcade" or "realistic".
function controller_vehicleController_shiftLogic_sequentialGearbox.gearboxBehaviorChanged(behavior) end

--- Numeric gear index of the gearbox.
---Source: lua/vehicle/controller/vehicleController/shiftLogic/sequentialGearbox.lua:78
---@return integer  gearbox.gearIndex
function controller_vehicleController_shiftLogic_sequentialGearbox.getGearName() end

--- Always 0, 0 (unused).
---Source: lua/vehicle/controller/vehicleController/shiftLogic/sequentialGearbox.lua:82
---@return number  0
---@return number  0
function controller_vehicleController_shiftLogic_sequentialGearbox.getGearPosition() end

--- Saveable state {grb_idx = current gear}.
---Source: lua/vehicle/controller/vehicleController/shiftLogic/sequentialGearbox.lua:483
---@return table|nil  State.
function controller_vehicleController_shiftLogic_sequentialGearbox.getState() end

--- Gets mainEngine and gearbox, builds the arcade/realistic logics, reads ignitionCutTime and the clutch launch parameters. Called by vehicleController (init and reset).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/vehicleController/shiftLogic/sequentialGearbox.lua:418
---@param jbeamData table Jbeam data.
---@param sharedFunctionTable table sharedFunctions.
function controller_vehicleController_shiftLogic_sequentialGearbox.init(jbeamData, sharedFunctionTable) end

--- Asks the engine to send its torque curves to the UI.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/vehicleController/shiftLogic/sequentialGearbox.lua:412
function controller_vehicleController_shiftLogic_sequentialGearbox.sendTorqueData() end

--- Restores the gear (free jump).
---Source: lua/vehicle/controller/vehicleController/shiftLogic/sequentialGearbox.lua:489
---@param data table Table produced by getState.
function controller_vehicleController_shiftLogic_sequentialGearbox.setState(data) end

--- Previous gear (bounded, over-rev safety).
---Source: lua/vehicle/controller/vehicleController/shiftLogic/sequentialGearbox.lua:116
function controller_vehicleController_shiftLogic_sequentialGearbox.shiftDown() end

--- Requests a gear (by default limited to +/-1 from the current one).
---Source: lua/vehicle/controller/vehicleController/shiftLogic/sequentialGearbox.lua:134
---@param index integer Wanted gear.
---@param ignoreSequentialBounds boolean|nil If true, allows a jump of several gears.
function controller_vehicleController_shiftLogic_sequentialGearbox.shiftToGearIndex(index, ignoreSequentialBounds) end

--- Next gear (bounded, over-rev safety); will be executed in whileShifting.
---Source: lua/vehicle/controller/vehicleController/shiftLogic/sequentialGearbox.lua:98
function controller_vehicleController_shiftLogic_sequentialGearbox.shiftUp() end

return controller_vehicleController_shiftLogic_sequentialGearbox
