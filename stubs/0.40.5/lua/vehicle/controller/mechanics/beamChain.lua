---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/mechanics/beamChain.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Mechanics controller (type "auxiliary") that links two beams in series: at each physics step, if the sum of their lengths exceeds their initial combined length, the excess is removed equally from both (obj:setBeamLength). Useful to simulate a chain or a cable with two sections. If one of the beams breaks, the other is broken too and the system disables itself.
--- Access: controller `mechanics/beamChain` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_mechanics_beamChain
---@field type string "auxiliary".
local controller_mechanics_beamChain = {}

--- Hook: called when a beam breaks; if it is one of the two, breaks the other and disables the chain.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/mechanics/beamChain.lua:34
---@param id integer Identifier (cid) of the broken beam.
---@param energy number Break energy.
function controller_mechanics_beamChain.beamBroken(id, energy) end

--- Finds the two beams of the tag and stores their combined length.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/mechanics/beamChain.lua:48
---@param jbeamData table Controller jbeam data.
function controller_mechanics_beamChain.init(jbeamData) end

--- Reactivates the chain.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/mechanics/beamChain.lua:44
---@param jbeamData table Controller jbeam data.
function controller_mechanics_beamChain.reset(jbeamData) end

--- Every physics step: removes the excess length equally from the two beams. (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/mechanics/beamChain.lua:dyn
---@param dt number Time step (s).
function controller_mechanics_beamChain.update(dt) end

--- Does nothing. (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/mechanics/beamChain.lua:dyn
---@param dt number Time step (s).
function controller_mechanics_beamChain.updateGFX(dt) end

return controller_mechanics_beamChain
