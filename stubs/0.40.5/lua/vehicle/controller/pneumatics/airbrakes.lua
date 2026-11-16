---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/pneumatics/airbrakes.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Auxiliary controller for pneumatic brakes (heavy trucks). Simulates the pressure of the service brake cylinders and spring (parking) brakes fed by an air tank (energyStorage), converts the pressure into brake torque via jbeam curves and replaces the brake update of the wheels listed in brakedWheels (with or without ABS). Automatically applies the parking brake if the supply pressure drops below a threshold. Plays a purge sound on release. Publishes the cylinder pressure in electrics.values.<name>_pressure_service and <name>_pressure_parking.
--- Access: controller `pneumatics/airbrakes` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_pneumatics_airbrakes
---@field type string "auxiliary".
local controller_pneumatics_airbrakes = {}

--- Reads the jbeam keys, builds the pressure -> torque coefficient curves, computes the circuit volumes/cross-sections, installs the brake functions on the listed wheels and initializes the sound.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/pneumatics/airbrakes.lua:328
---@param jbeamData table Controller jbeam data.
function controller_pneumatics_airbrakes.init(jbeamData) end

--- Brings the pressures back to ambient pressure, reinstalls the wheels' brake functions and resets the sound states to zero.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/pneumatics/airbrakes.lua:303
function controller_pneumatics_airbrakes.reset() end

--- Physics step: updates the pressure of the service cylinders (according to electrics brake and the regulator) and of the spring brakes (according to parkingbrake and the supply pressure), draws energy from the tank.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/pneumatics/airbrakes.lua:286
---@param dt number Physics step in seconds.
function controller_pneumatics_airbrakes.updateFixedStep(dt) end

--- Every frame: detects a rapid release of the service or parking brake and plays the purge sound.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/pneumatics/airbrakes.lua:291
---@param dt number Time step in seconds.
function controller_pneumatics_airbrakes.updateGFX(dt) end

return controller_pneumatics_airbrakes
