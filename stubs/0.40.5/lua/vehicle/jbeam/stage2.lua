---@meta
-- tim19Atlas stub generated from lua/vehicle/jbeam/stage2.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Second step of vehicle loading, on the vehicle VM side: takes the jbeam data already assembled by the game (stage 1, in the game VM) and "pushes" it into the C++ physics by calling obj:setNode, obj:setBeam, obj:setWheel, obj:addRail, obj:addSlidenode, obj:setTorsionbar, obj:setTriangle, obj:setReferenceNodes then obj:finishLoading. main.lua loads it as the global `v` (v = require('jbeam/stage2')): after loadVehicleStage2, `v.data` contains the vehicle data (nodes, beams, wheels, hydros, powertrain, refNodes, input, information…), and `v.config` the configuration (parts, paints, additionalVehicleData…). It is therefore the source of all jbeam reads by the other modules.
--- Access: global `v`
---@class v
v = {}

--- Sends the jbeam data to the physics (nodes, beams, wheels, rails, slidenodes, torsions, triangles, reference nodes) then publishes v.data and v.config. Called once by main.lua:init with the decoded spawn data.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/jbeam/stage2.lua:590
---@param vdataStage1 table Spawn table {vdata = assembled jbeam data, config = vehicle configuration}.
---@return table|nil  vdata (the vehicle data) on success; nil if vdata is not a table.
function v.loadVehicleStage2(vdataStage1) end

