---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/dummy.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Minimal main controller (type "main") for vehicles without an engine (trailers, objects). It provides the mandatory main controller API (gear changes, starter, etc., all nop) and writes neutral electrics values every frame: throttle, brake, clutch from the inputs, gear "N", gearIndex 0, rpm/fuel/temperatures at 0, ignition false, gearboxMode "none".
--- Access: controller `dummy` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_dummy
---@field brake number 0.
---@field clutchRatio number 0.
---@field cycleGearboxModes function nop.
---@field drivingAggression number 0.
---@field engineInfo table Engine info array of 21 static values (see notes).
---@field fireEngineTemperature number 0.
---@field init function nop.
---@field sendTorqueData function nop.
---@field setEngineIgnition function nop.
---@field setFreeze function nop.
---@field setGearboxMode function nop.
---@field setStarter function nop.
---@field shiftDown function nop.
---@field shiftToGearIndex function nop.
---@field shiftUp function nop.
---@field shiftingAggression number 0.
---@field throttle number 0.
---@field type string "main".
---@field vehicleActivated function nop.
local controller_dummy = {}

--- Every frame: copies the throttle/brake/clutch inputs (bounded 0..1) into electrics.values and forces the other values to their neutral state.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/dummy.lua:42
---@param dt number Time step (s).
function controller_dummy.updateGFX(dt) end

return controller_dummy
