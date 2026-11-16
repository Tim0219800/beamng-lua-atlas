---@meta
-- tim19Atlas stub generated from lua/common/jbeam/groups.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Jbeam loading post-processing step for the "group" column/field of rows (nodes, beams, etc.). Converts each list group = {"a","b"} into a table indexed by a global group number and assigns the row firstGroup (number of the first non-empty group). Produces vehicle.groups, the table group name to number (numbering starting at 0).
--- Access: `require("jbeam/groups")`
---@class jbeam_groups
local jbeam_groups = {}

--- Numbers the vehicle's jbeam groups: fills vehicle.groups (name -> number) and transforms the group fields of the rows.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/jbeam/groups.lua:10
---@param vehicle table Merged jbeam data of the vehicle (modified in place).
function jbeam_groups.process(vehicle) end

return jbeam_groups
