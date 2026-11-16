---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/jato.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Auxiliary controller for JATO thrusters (booster rockets, type "auxiliary", defaultOrder 1100). When electrics.values.jatoInput > 0, or when the throttle is fully pressed in gamepad/direct mode and moving forward, it consumes fuel, emits particles at the thruster nodes and plays a loop sound. Writes electrics.values.jato (0..1) and jatofuel (remaining fuel, ratio 0..1). A "JATO" button is added to the powertrain simplified control panel.
--- Access: controller `jato` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_jato
---@field defaultOrder number 1100.
---@field fuelCoef number Fuel consumption coefficient (1 normal, 0 = infinite).
---@field type string "auxiliary".
local controller_jato = {}

--- Returns fuel and fuelCoef for saving.
---Source: lua/vehicle/controller/jato.lua:148
---@return table  State table (reused).
function controller_jato.getState() end

--- Reads fuel and the thruster nodes, initializes electrics.values.jatoInput/jato and registers the secret code.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/jato.lua:114
---@param jbeamData table Controller jbeam data.
function controller_jato.init(jbeamData) end

--- Called by inputAnalyzer when the secret code is entered: toggles fuelCoef between 1 and 0.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/jato.lua:34
---@param string string Entered string.
function controller_jato.inputStringCallback(string) end

--- Resets the fuel to the initial level, stops the sounds and sets jatoInput/jato back to 0.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/jato.lua:100
function controller_jato.reset() end

--- Restores fuel (bounded 0..initial fuel) and fuelCoef (0..1).
---Source: lua/vehicle/controller/jato.lua:154
---@param data table|nil State table.
function controller_jato.setState(data) end

--- Consumes fuel, emits particles and sounds, writes electrics.values.jato and jatofuel.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/jato.lua:45
---@param dt number Time step (s).
function controller_jato.updateGFX(dt) end

--- (Re)creates the "JATO" button of the simplified panel with the remaining fuel ratio.
---Source: lua/vehicle/controller/jato.lua:41
function controller_jato.updateSimpleControlButtons() end

return controller_jato
