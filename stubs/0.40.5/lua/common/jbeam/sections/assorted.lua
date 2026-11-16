---@meta
-- tim19Atlas stub generated from lua/common/jbeam/sections/assorted.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Post-processing of two miscellaneous jbeam sections. (1) Engine section: builds engine.waterDamage.nodes by concatenating the node lists coming from the group links _group_nodes and _engineGroup_nodes of waterDamage (nodes whose drowning damages the engine). (2) Soundscape section: transforms the list of entries into a dictionary indexed by their name field. Called by the loader after the group link resolution.
--- Access: `require("jbeam/sections/assorted")`
---@class jbeam_sections_assorted
local jbeam_sections_assorted = {}

--- Applies the two post-processings (engine.waterDamage.nodes and soundscape) in place on the vehicle data.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/jbeam/sections/assorted.lua:10
---@param vehicle table Vehicle jbeam data.
function jbeam_sections_assorted.process(vehicle) end

return jbeam_sections_assorted
