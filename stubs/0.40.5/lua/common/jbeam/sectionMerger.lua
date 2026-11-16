---@meta
-- tim19Atlas stub generated from lua/common/jbeam/sectionMerger.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Merges jbeam sections together for backward compatibility: the triggers2 section is poured into triggers and rails2 into rails. The merged rows receive originSection (name of the original section), the source section is removed so it is not processed further, and sectionRenames is updated (triggers2 -> triggers, rails2 -> rails).
--- Access: `require("jbeam/sectionMerger")`
---@class jbeam_sectionMerger
local jbeam_sectionMerger = {}

--- Merges triggers2 into triggers and rails2 into rails, and records these renames in sectionRenames.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/jbeam/sectionMerger.lua:70
---@param vehicle table Vehicle jbeam data (modified in place).
---@param sectionRenames table<string, string> Table old name to new name, completed by the function.
---@return boolean  Always true.
function jbeam_sectionMerger.process(vehicle, sectionRenames) end

return jbeam_sectionMerger
