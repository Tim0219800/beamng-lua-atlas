---@meta
-- tim19Atlas stub generated from lua/vehicle/drivetrain.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Backward compatibility layer: reproduces the old `drivetrain` API by reading the devices of the new `powertrain` system ('mainEngine' and 'gearbox') every frame. An old mod or script that reads drivetrain.rpm, drivetrain.gear, drivetrain.torque... keeps working. New developments should use powertrain directly.
--- Access: global `drivetrain`
---@class drivetrain
---@field avgAV number Never updated.
---@field brake number Never updated (stays at 0).
---@field engineAV number|nil Engine angular velocity (rad/s) or nil without a main engine.
---@field engineDisabled boolean isDisabled of the main engine.
---@field engineLoad number engineLoad of the main engine.
---@field esc table Fake compatibility ESC object: update, updateGFX, toggleESCMode, getCarData are nop, escPulse = 0.
---@field fuel number Default value 100, never updated.
---@field fuelCapacity number Default value 100, never updated.
---@field fuelLeakRate number Fuel leak rate (L/s); never updated.
---@field fuelUsage number Never updated.
---@field gear integer Gear index of the gearbox ('gearbox').
---@field rpm number Engine speed in RPM.
---@field shifterMode integer Always 2 (arcade) after updateGFX.
---@field shifterPosition number Never updated.
---@field throttle number Copy of electrics.values.throttle.
---@field torque number Main engine output torque (outputTorque1, N·m).
---@field torqueTransmission number Gearbox output torque (N·m).
---@field wheelCount integer Never updated.
drivetrain = {}

--- Called at init and reset: assigns M.wheels and resets rpm, engineDisabled, gear, torqueTransmission and engineLoad to zero.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/drivetrain.lua:66
function drivetrain.init() end

--- Same as init.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/drivetrain.lua:66
function drivetrain.reset() end

--- Sets the gearbox mode: mode 2 gives 'arcade', any other value 'realistic' (controller.mainController.setGearboxMode).
---Source: lua/vehicle/drivetrain.lua:49
---@param v integer 0 manual, 1 manual with auto clutch, 2 arcade, 3 realistic automatic (code comment).
function drivetrain.setShifterMode(v) end

--- Requests a gear via controller.mainController.shiftToGearIndex.
---Source: lua/vehicle/drivetrain.lua:62
---@param gear integer Wanted gear index.
function drivetrain.shiftToGear(gear) end

--- Called every frame (updateProxy): copies the state of the main engine and gearbox into the drivetrain fields.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/drivetrain.lua:31
function drivetrain.updateGFX() end

