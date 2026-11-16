---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/braking/hydraulicPumpBrake.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Auxiliary controller for hydraulic braking powered by the engine's pump (heavy or old vehicles). The front and rear brakes (`brakeF`, `brakeR`) only work with the engine running; without pressure or if damage beams are broken, the parking brake is applied automatically. Offers a hill assist (residual rear brake without throttle) and a front brake lockout. Call order: `defaultOrder = 50` (early).
--- Access: controller `braking/hydraulicPumpBrake` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_braking_hydraulicPumpBrake
---@field defaultOrder number 50: default call rank, early in the sorted list.
---@field type string "auxiliary".
local controller_braking_hydraulicPumpBrake = {}

--- Beam break hook: if the beam is in the front or rear damage tags, disables the corresponding brake until reset.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/braking/hydraulicPumpBrake.lua:75
---@param id integer cid of the beam.
---@param energy number Break energy (unused).
function controller_braking_hydraulicPumpBrake.beamBroken(id, energy) end

--- Adds a change to the hill assist coefficient.
---Source: lua/vehicle/controller/braking/hydraulicPumpBrake.lua:111
---@param change number Change (can be negative).
function controller_braking_hydraulicPumpBrake.changeHillAssistCoef(change) end

--- Returns the hill assist and the front lockout for the state save.
---Source: lua/vehicle/controller/braking/hydraulicPumpBrake.lua:159
---@return table  Keys `<name>_hillAssistCoef` and `<name>_frontLockOutEnabled`.
function controller_braking_hydraulicPumpBrake.getState() end

--- Finds the engine and the damage beam lists (via the jbeam tags).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/braking/hydraulicPumpBrake.lua:140
---@param jbeamData table Controller jbeam data.
function controller_braking_hydraulicPumpBrake.init(jbeamData) end

--- Reinitializes the engine smoother, the damage coefficients and the automatic parking brake.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/braking/hydraulicPumpBrake.lua:133
---@param jbeamData table Jbeam data.
function controller_braking_hydraulicPumpBrake.reset(jbeamData) end

--- Enables or disables the front brake lockout (the front brake is cut when active).
---Source: lua/vehicle/controller/braking/hydraulicPumpBrake.lua:115
---@param enabled boolean true to cut the front brake.
---@param silent boolean|nil true to not display a message.
function controller_braking_hydraulicPumpBrake.setFrontLockOutEnabled(enabled, silent) end

--- Sets the hill assist coefficient (0 to 1, reset to 0 if <= 0.01) and displays a UI message unless silent.
---Source: lua/vehicle/controller/braking/hydraulicPumpBrake.lua:94
---@param coef number Coefficient 0 to 1.
---@param silent boolean|nil true to not display a message.
function controller_braking_hydraulicPumpBrake.setHillAssistCoef(coef, silent) end

--- Restores these two values (silently).
---Source: lua/vehicle/controller/braking/hydraulicPumpBrake.lua:165
---@param data table|nil State table.
function controller_braking_hydraulicPumpBrake.setState(data) end

--- Toggles the front brake lockout state.
---Source: lua/vehicle/controller/braking/hydraulicPumpBrake.lua:129
function controller_braking_hydraulicPumpBrake.toggleFrontLockOutEnabled() end

--- Every frame: computes brakeF/brakeR taking into account the running engine, hill assist, front lockout and broken beams; handles the automatic parking brake and publishes the electrics.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/braking/hydraulicPumpBrake.lua:31
---@param dt number Time step in seconds.
function controller_braking_hydraulicPumpBrake.updateGFX(dt) end

return controller_braking_hydraulicPumpBrake
