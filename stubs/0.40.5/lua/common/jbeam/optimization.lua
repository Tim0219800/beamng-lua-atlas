---@meta
-- tim19Atlas stub generated from lua/common/jbeam/optimization.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Finalization steps of the jbeam data before sending to the physics. assignCIDs numbers each row of the "valid" sections with a continuous cid (0, 1, 2...) in a deterministic order (sorted keys) and computes vehicle.maxIDs. process reorders the beams' nodes (id1 < id2), removes fields not needed at runtime, replaces object references with cids (hydros, wheels), removes disabled sections (disableSection) then deletes vehicle.validTables.
--- Access: `require("jbeam/optimization")`
---@class jbeam_optimization
local jbeam_optimization = {}

--- Assigns a continuous cid to each row of the sections listed in vehicle.validTables and records the number of rows per section in vehicle.maxIDs.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/jbeam/optimization.lua:53
---@param vehicle table Vehicle jbeam data (with validTables), modified in place.
---@return boolean  Always true.
function jbeam_optimization.assignCIDs(vehicle) end

--- Optimizes and cleans the vehicle data: beams id1<id2, default value cleanup, dereferencing to cids, removal of disabled sections and validTables.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/jbeam/optimization.lua:218
---@param vehicle table Vehicle jbeam data.
---@param debugEnabled boolean|nil If true, keeps the group and engineGroup fields.
---@return boolean  Always true.
function jbeam_optimization.process(vehicle, debugEnabled) end

return jbeam_optimization
