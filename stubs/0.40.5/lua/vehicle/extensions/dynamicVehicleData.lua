---@meta
-- tim19Atlas stub generated from lua/vehicle/extensions/dynamicVehicleData.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Internal tool for automatically generating vehicle performance sheets (files vehicles/<model>/info_<config>.json), driven from the GE by util_saveDynamicData. A coroutine runs static measurements (weight, power, torque, peak RPMs, engine type, induction, fuel, transmission, layout, bounding box) then dynamic ones (accelerations, braking, off-road score) by repositioning the vehicle, then updates the info file by recursive merge.
--- Access: extension `dynamicVehicleData`: `extensions.load (vehicle VM)("dynamicVehicleData")`, then the global `dynamicVehicleData`
---@class dynamicVehicleData
dynamicVehicleData = {}

--- Determines the vehicle's transmission layout from the driven wheels (text value, 'Other' if undetermined).
---Source: lua/vehicle/extensions/dynamicVehicleData.lua:499
---@return string  Layout: 'FWD', 'RWD', 'AWD', '4WD', 'NxM' (wheels x driven wheels) or 'Other'.
function dynamicVehicleData.getPowertrainLayout() end

--- Initialization hook; empty.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/dynamicVehicleData.lua:86
function dynamicVehicleData.onInit() end

--- Same function as onInit.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/dynamicVehicleData.lua:86
function dynamicVehicleData.onReset() end

--- Launches the complete sequence (static data then dynamic tests) in a coroutine for the indicated model and configuration.
---Source: lua/vehicle/extensions/dynamicVehicleData.lua:1071
---@param _model_key string Model name (vehicles/ folder).
---@param _config_key string Configuration name.
function dynamicVehicleData.performTests(_model_key, _config_key) end

--- Called every frame: increments the internal timer, resumes the test coroutine and sends the heartbeat/killswitch to the GE.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/dynamicVehicleData.lua:1053
---@param dt number Time step in seconds.
function dynamicVehicleData.updateGFX(dt) end

