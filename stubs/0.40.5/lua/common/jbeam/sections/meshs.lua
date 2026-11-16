---@meta
-- tim19Atlas stub generated from lua/common/jbeam/sections/meshs.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Processes the jbeam sections that concern the vehicle's 3D meshes: triangles (physical collision triangles), props (rigid meshes attached to three reference nodes, including SPOTLIGHT/POINTLIGHT lights) and flexbodies (deformable meshes linked to node groups). First applies the component's rotations/translations to the flexbodies' positions/rotations, asks the engine to load the meshes in a group, creates the physical triangles, the props and the flexmeshes with their transformations, then validates (meshCommit).
--- Access: `require("jbeam/sections/meshs")`
---@class jbeam_sections_meshs
local jbeam_sections_meshs = {}

--- Loads and configures the vehicle's triangles, props and flexbodies in the engine.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/jbeam/sections/meshs.lua:322
---@param objID integer Vehicle identifier (unused).
---@param vehicleObj userdata|nil Engine vehicle object.
---@param vehicle table Vehicle jbeam data (modified in place: pid, fid, mesh, rotation...).
function jbeam_sections_meshs.process(objID, vehicleObj, vehicle) end

return jbeam_sections_meshs
