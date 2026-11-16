---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/braking/compressionBrake.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Auxiliary compression engine brake controller (truck "Jake brake"). It maintains a coefficient from 0 to 1 and preset levels, passes `setCompressionBrakeCoef` to the engine when the throttle is released, and publishes four electrics (setting, actual value, enabled, level index). It also forces the main controller's driving aggression to 1 while the brake is active.
--- Access: controller `braking/compressionBrake` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_braking_compressionBrake
---@field type string "auxiliary".
local controller_braking_compressionBrake = {}

--- Goes up or down by a number of levels (clamped) and applies the level's coefficient.
---Source: lua/vehicle/controller/braking/compressionBrake.lua:33
---@param indexChange integer Index change (+1, -1...).
function controller_braking_compressionBrake.changeCompressionBrakeLevel(indexChange) end

--- Returns the coefficient and the level index for the state save.
---Source: lua/vehicle/controller/braking/compressionBrake.lua:79
---@return table  State table (keys `<name>Coef`, `<name>LevelIndex`).
function controller_braking_compressionBrake.getState() end

--- Finds the controlled engine, the electrics names and the levels from the jbeam.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/braking/compressionBrake.lua:106
---@param jbeamData table Controller jbeam data.
function controller_braking_compressionBrake.init(jbeamData) end

--- Forces the next transmission of the coefficient to the engine.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/braking/compressionBrake.lua:74
---@param jbeamData table Jbeam data.
function controller_braking_compressionBrake.reset(jbeamData) end

--- Directly sets the engine brake coefficient (clamped to 0..1) and displays a UI message unless silent.
---Source: lua/vehicle/controller/braking/compressionBrake.lua:26
---@param coef number Coefficient 0 to 1.
---@param silent boolean|nil true to not display a message.
function controller_braking_compressionBrake.setCompressionBrakeCoef(coef, silent) end

--- Chooses a level by its index (clamped to 1..number of levels) and applies its coefficient.
---Source: lua/vehicle/controller/braking/compressionBrake.lua:38
---@param level integer Level index (1 = first).
---@param silent boolean|nil true to not display a message.
function controller_braking_compressionBrake.setCompressionBrakeLevel(level, silent) end

--- Restores the level index and the coefficient (validated values, silently).
---Source: lua/vehicle/controller/braking/compressionBrake.lua:87
---@param data table|nil State table.
function controller_braking_compressionBrake.setState(data) end

--- Turns the brake off if it is active, otherwise activates it at the stored level.
---Source: lua/vehicle/controller/braking/compressionBrake.lua:43
function controller_braking_compressionBrake.toggleCompressionBrakeState() end

--- Every frame: computes the actual coefficient, passes it to the engine when it changes, handles the main controller's aggression override and updates the electrics.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/braking/compressionBrake.lua:51
---@param dt number Time step in seconds.
function controller_braking_compressionBrake.updateGFX(dt) end

return controller_braking_compressionBrake
