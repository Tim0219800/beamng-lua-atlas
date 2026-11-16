---@meta
-- tim19Atlas stub generated from lua/common/jbeam/sections/licenseplatesSkins.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Processes two families of active parts: license plates and skins. A part with a slotType containing '_licenseplate' (or having licenseplateFormat) activates the plate; the formats used are collected (default '30-15'). A plate design part (slotType containing 'licenseplate_design') provides licenseplate_path. A skin part (slotType containing 'skin_' or equal to 'paint_design') calls vehicleObj:setSkin("<slot>.<skin name>") and can impose default colors. At the end, if a plate is used, core_vehicles.setPlateText is called.
--- Access: `require("jbeam/sections/licenseplatesSkins")`
---@class jbeam_sections_licenseplatesSkins
local jbeam_sections_licenseplatesSkins = {}

--- Walks the active parts to configure the vehicle's license plate and skins.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/jbeam/sections/licenseplatesSkins.lua:11
---@param objID integer Vehicle identifier.
---@param vehicleObj userdata Engine vehicle object.
---@param config table|nil Vehicle configuration (licenseName).
---@param activePartsData table<string, table>|nil Active parts (name -> part data).
function jbeam_sections_licenseplatesSkins.process(objID, vehicleObj, config, activePartsData) end

return jbeam_sections_licenseplatesSkins
