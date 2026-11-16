---@meta
-- tim19Atlas stub generated from lua/common/jbeam/slotSystem.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- jbeam slot system: from the vehicle configuration (chosen parts), it recursively walks the slots (slots / slots2 sections) of the main part, picks for each slot the user's part, otherwise the slot's default part, checks type compatibility (slotType) and builds the tree of chosen parts, the state tables and a merge 'journal'. unifyPartJournal replays this journal to merge all parts into a single vehicle (unifyParts). Used by the jbeam loader; a modder does not normally call it, but its rules describe how parts fit together.
--- Access: `require("jbeam/slotSystem")`
---@class jbeam_slotSystem
local jbeam_slotSystem = {}

--- Recursively chooses the parts of all slots starting from the main part vehicleConfig.mainPartName. Returns the root part, the merge journal (parts in child-before-parent order), the 'C' merge journal (parent-before-child order), the tree of chosen parts, the slot->part table, the active parts data (deep copy) and the part path -> name table.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/jbeam/slotSystem.lua:441
---@param ioCtx table context of the jbeam/io module (access to parts and slots)
---@param vehicleConfig table vehicle configuration: mainPartName, mainPartPath, parts or partsTree
---@return table|nil  rootPart (main part)
---@return table  unifyJournal: list {partParent, partChild, level, slotOptions, partPath, slotDef}
---@return table  unifyJournalC
---@return table  chosenPartsTree (tree: id, path, suitablePartNames, unsuitablePartNames, chosenPartName, partPath, children, decisionMethod)
---@return table<string, string>  slotPartMap: slot path -> part name ('' = empty)
---@return table<string, table>  activePartsData: part name -> data
---@return table<string, string>  activeParts: part path -> name
function jbeam_slotSystem.findParts(ioCtx, vehicleConfig) end

--- Determines whether a part can go in a slot. Version 1: compares part.slotType (string or array) to slot.type. Version 2: slot.allowTypes (whitelist) and slot.denyTypes (blacklist), part.slotType string or array. Returns a boolean and an optional error message.
---Source: lua/common/jbeam/slotSystem.lua:182
---@param part table jbeam part (slotType field: string or list of strings)
---@param slot table slot definition (type for v1, allowTypes / denyTypes for v2)
---@return boolean  the part fits
---@return string|nil  reason for rejection ('Part type does not match slot type', 'Part type not in allowed types', 'No matching allowed types found', 'Part type is in deny list', 'Invalid slot configuration')
function jbeam_slotSystem.partFitsSlot(part, slot) end

--- Replays the merge journal: for each entry calls unifyParts(parent, child, level, slotOptions, path) to merge the sections of each child part into its parent part, until a single root part remains. ioCtx is not used.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/jbeam/slotSystem.lua:513
---@param ioCtx table io context (not used)
---@param unifyJournal table[] journal returned by findParts (second result)
---@return boolean  always true
function jbeam_slotSystem.unifyPartJournal(ioCtx, unifyJournal) end

return jbeam_slotSystem
