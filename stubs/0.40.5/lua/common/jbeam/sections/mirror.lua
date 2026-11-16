---@meta
-- tim19Atlas stub generated from lua/common/jbeam/sections/mirror.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Processes the jbeam "mirrors" section. For each entry with a mesh field, registers the mirror in the engine (addMirror with mesh, idRef, id1, id2) and gets the resulting id in v.id, then configures the mirror object: offset (refBaseTranslation or offset), normal (deduced from baseRotationGlobal in degrees or from normal) and offsetNormal (deprecated fields). Entries without mesh are considered old data.
--- Access: `require("jbeam/sections/mirror")`
---@class jbeam_sections_mirror
local jbeam_sections_mirror = {}

--- Creates and configures the mirrors declared in vehicle.mirrors.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/jbeam/sections/mirror.lua:11
---@param objID integer Vehicle identifier (unused).
---@param vehicleObj userdata Engine vehicle object (addMirror, getMirror).
---@param vehicle table Jbeam data (mirrors section).
function jbeam_sections_mirror.process(objID, vehicleObj, vehicle) end

return jbeam_sections_mirror
