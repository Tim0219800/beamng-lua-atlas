---@meta
-- tim19Atlas stub generated from lua/common/jbeam/sections/occupantFaces.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Handles occupant faces (character heads). Loads, once, the parts of the 'skin_character_face' slot of the /vehicles/unicycle/ vehicle to build the list of available faces and the material associated with each (base 'character_display'). Provides utilities for the UI and random picking, and a process step that registers all the face materials on each 'character_head' prop of a vehicle whose occupant system is enabled.
--- Access: `require("jbeam/sections/occupantFaces")`
---@class jbeam_sections_occupantFaces
local jbeam_sections_occupantFaces = {}

--- Material to use for a face (base material if the part is unknown).
---Source: lua/common/jbeam/sections/occupantFaces.lua:43
---@param partName string Face part name.
---@return string  Material name.
function jbeam_sections_occupantFaces.getFaceMaterial(partName) end

--- List of faces {value = part name, label = display name}, sorted by label. Shared table, do not modify.
---Source: lua/common/jbeam/sections/occupantFaces.lua:33
---@return table[]  Face options.
function jbeam_sections_occupantFaces.getFaceOptions() end

--- Name of a randomly picked face part.
---Source: lua/common/jbeam/sections/occupantFaces.lua:38
---@return string  Part name.
function jbeam_sections_occupantFaces.getRandomFacePart() end

--- Tells whether the part name is a known face.
---Source: lua/common/jbeam/sections/occupantFaces.lua:27
---@param partName string Part name.
---@return boolean  true if it is a face.
function jbeam_sections_occupantFaces.isFacePart(partName) end

--- Registers all face materials on the vehicle's occupant heads.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/jbeam/sections/occupantFaces.lua:49
---@param vehicleObj userdata Engine vehicle object.
---@param vehicle table jbeam data (occupantSystem, props).
function jbeam_sections_occupantFaces.process(vehicleObj, vehicle) end

return jbeam_sections_occupantFaces
