---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/bypassDampers.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Auxiliary controller for bypass-channel shock absorbers (bypass shocks, off-road/Trophy truck type): a beam's damping changes depending on its travel along successive zones. At each physics step it measures the damper beam's displacement relative to its rest length and applies via `obj:setBoundedBeamDamp` the coefficients of the corresponding zone. It also plays a valve sound when the direction of movement reverses. Call order: `defaultOrder = 80`.
--- Access: controller `bypassDampers` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_bypassDampers
---@field defaultOrder number 80: default call rank.
---@field type string "auxiliary".
local controller_bypassDampers = {}

--- Finds the damper beams by name and builds the sorted list of damping zones.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/bypassDampers.lua:138
---@param jbeamData table Controller jbeam data.
function controller_bypassDampers.init(jbeamData) end

--- Empty.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/bypassDampers.lua:203
function controller_bypassDampers.initLastStage() end

--- Reads the valve sound settings from the jbeam.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/bypassDampers.lua:127
---@param jbeamData table Controller jbeam data.
function controller_bypassDampers.initSounds(jbeamData) end

--- Empty (nothing to reset).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/bypassDampers.lua:124
function controller_bypassDampers.reset() end

--- Physics step: for each damper, computes displacement and velocity, detects the direction reversal (valve sound), finds the current zone and applies its damping coefficients if it changed.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/bypassDampers.lua:36
---@param dt number Physics step in seconds.
function controller_bypassDampers.update(dt) end

--- Every frame: plays the valve sounds queued by update.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/bypassDampers.lua:105
---@param dt number Time step in seconds (unused).
function controller_bypassDampers.updateGFX(dt) end

return controller_bypassDampers
