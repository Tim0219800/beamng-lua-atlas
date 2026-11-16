---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/mechanics/beamLengthTrigger.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Mechanics controller (type "auxiliary") that sets an electrics value to a trigger value when the length of one or more beams (by tag) becomes shorter or longer than a threshold, otherwise to 0.
--- Access: controller `mechanics/beamLengthTrigger` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_mechanics_beamLengthTrigger
---@field type string "auxiliary".
local controller_mechanics_beamLengthTrigger = {}

--- Reads the configuration, finds the beams and chooses the comparison and aggregation functions.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/mechanics/beamLengthTrigger.lua:71
---@param jbeamData table Controller jbeam data.
function controller_mechanics_beamLengthTrigger.init(jbeamData) end

--- Resets the electrics value to 0.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/mechanics/beamLengthTrigger.lua:65
---@param jbeamData table Controller jbeam data.
function controller_mechanics_beamLengthTrigger.reset(jbeamData) end

--- Writes the electrics value according to the measured length. (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/mechanics/beamLengthTrigger.lua:dyn
---@param dt number Time step (s).
function controller_mechanics_beamLengthTrigger.updateGFX(dt) end

return controller_mechanics_beamLengthTrigger
