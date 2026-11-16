---@meta
-- tim19Atlas stub generated from lua/vehicle/extensions/core/booster.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Experimental 'boost' extension: simulates a force on the vehicle by placing very distant negative-mass 'planets' (obj:setPlanets), which pushes the vehicle in a given direction for a limited time. A call to boost(force, dt) adds a push that lasts dt seconds.
--- Access: extension `core_booster`: `extensions.load (vehicle VM)("core_booster")`, then the global `core_booster`
---@class core_booster
core_booster = {}

--- Adds a push: the direction/force is given by a vector, dt is its duration.
---Source: lua/vehicle/extensions/core/booster.lua:35
---@param force vec3|table Push vector (converted to vec3); it is multiplied by 1000 to place the planet.
---@param dt number Push duration in seconds.
function core_booster.boost(force, dt) end

--- Called every frame: updates lifetimes, builds the planet list and applies it with obj:setPlanets.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/core/booster.lua:9
---@param dtSim number Simulation time step in seconds.
function core_booster.updateGFX(dtSim) end

