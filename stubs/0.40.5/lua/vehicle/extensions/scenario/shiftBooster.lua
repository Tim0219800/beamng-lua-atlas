---@meta
-- tim19Atlas stub generated from lua/vehicle/extensions/scenario/shiftBooster.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Demo scenario extension: gives the vehicle a boost by applying a constant wind directed along its forward axis via obj:setWind. Can be triggered on each upshift (listenToShift) or manually (manualBoost). The boost lasts `boostTime` seconds, counted down in updateGFX.
--- Access: extension `scenario_shiftBooster`: `extensions.load (vehicle VM)("scenario_shiftBooster")`, then the global `scenario_shiftBooster`
---@class scenario_shiftBooster
scenario_shiftBooster = {}

--- Wraps drivetrain.shiftUp: after the actual gear change, sets boostTime to 0.4 s, shows a UI message "Boooooost!" (5 s) and applies a boost with the default force.
---Source: lua/vehicle/extensions/scenario/shiftBooster.lua:27
function scenario_shiftBooster.listenToShift() end

--- Starts a manual boost: sets boostTime to the given duration and applies the boost immediately.
---Source: lua/vehicle/extensions/scenario/shiftBooster.lua:68
---@param duration number Boost duration in seconds.
---@param strength number|nil Intensity multiplied by the direction vector; 300 if nil.
function scenario_shiftBooster.manualBoost(duration, strength) end

--- Debug draw hook: if a boost is active, draws a sphere of radius boostTime 2 m above the vehicle, with a varying color.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/scenario/shiftBooster.lua:58
---@param focusPos vec3 Camera focus position (unused).
function scenario_shiftBooster.onDebugDraw(focusPos) end

--- Scenario configuration hook; empty body, no data is read.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/scenario/shiftBooster.lua:65
---@param data table Scenario data (ignored).
function scenario_shiftBooster.onVehicleScenarioData(data) end

--- Called every graphics frame by the main loop (extensions.hook('updateGFX')). While boostTime > 0.01: decrements it by dt and reapplies the boost; otherwise resets the wind to zero.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/scenario/shiftBooster.lua:46
---@param dt number Simulation time step in seconds.
function scenario_shiftBooster.updateGFX(dt) end

