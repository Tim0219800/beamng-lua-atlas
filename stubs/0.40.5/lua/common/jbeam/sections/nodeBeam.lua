---@meta
-- tim19Atlas stub generated from lua/common/jbeam/sections/nodeBeam.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Processes the jbeam sections of the physical structure: nodes (computes the final position pos as a vec3 after the component's rotation/translation, then removes posX/posY/posZ), hydros (adds the hydraulic beam and applies the default values for speed, limits, input source and factor), ropes (physical ropes: split into node segments and anisotropic beams), quads (each quad becomes two triangles). Also checks that the reference nodes exist.
--- Access: `require("jbeam/sections/nodeBeam")`
---@class jbeam_sections_nodeBeam
local jbeam_sections_nodeBeam = {}

--- Processes nodes, hydros, ropes, quads and ensures refNodes[0] is present.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/jbeam/sections/nodeBeam.lua:149
---@param vehicle table Vehicle jbeam data (modified in place).
function jbeam_sections_nodeBeam.process(vehicle) end

return jbeam_sections_nodeBeam
