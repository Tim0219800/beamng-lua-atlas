---@meta
-- tim19Atlas stub generated from lua/common/jbeam/sections/vropes.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Processes the jbeam "vropes" section (simulated visual ropes, without physical beams). For each entry that has anchorAProp and anchorBProp (vehicle prop names), creates an engine-side visual rope (createRopeVisual/getRopeVisual), attaches it to both props (vehiclePropIdA/B) and applies its properties with default values, then calls rope:rebuild(). The list of created ids is stored in vehicleObj.ropeIds for automatic rendering.
--- Access: `require("jbeam/sections/vropes")`
---@class jbeam_sections_vropes
local jbeam_sections_vropes = {}

--- Creates the visual ropes described by vehicle.vropes and stores their ids in vehicleObj.ropeIds.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/jbeam/sections/vropes.lua:117
---@param objID integer Vehicle identifier (unused).
---@param vehicleObj userdata Engine vehicle object.
---@param vehicle table jbeam data (vropes, props).
function jbeam_sections_vropes.process(objID, vehicleObj, vehicle) end

return jbeam_sections_vropes
