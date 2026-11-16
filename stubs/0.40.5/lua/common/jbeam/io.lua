---@meta
-- tim19Atlas stub generated from lua/common/jbeam/io.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Reading and caching of vehicles' .jbeam files. For each requested folder, parses each *.jbeam (JSON), normalizes the slots/slots2 sections to the slots2 format (name, allowTypes, denyTypes, default, description), stores each encoded part in a cache and builds indexes (part -> file, slotType -> parts, part -> description). It then allows retrieving a part (getPart), listing the available parts and those compatible with a slot. A modder uses it to query a vehicle's parts/slots from a GE extension.
--- Access: `require("jbeam/io")`
---@class jbeam_io
local jbeam_io = {}

--- Does nothing (the body is commented out); exists for symmetry with startLoading.
---Source: lua/common/jbeam/io.lua:297
function jbeam_io.finishLoading() end

--- Lists the part names whose slotType is slotType (does not handle slots2).
---Source: lua/common/jbeam/io.lua:351
---@param ioCtx table Context returned by startLoading.
---@param slotType string Slot type.
---@return string[]  Part names ({} if none).
function jbeam_io.getAvailablePartNamesForSlot(ioCtx, slotType) end

--- Lists all the parts of the context's folders with their description (description, authors, isAuxiliary, slotInfoUi, modName if any). Reloads if the indexes are missing; logs an error in case of duplicate names.
---Source: lua/common/jbeam/io.lua:301
---@param ioCtx table Context returned by startLoading.
---@return table<string, table>|nil  Table partName -> description; nil if the context is invalid.
function jbeam_io.getAvailableParts(ioCtx) end

--- Obsolete. Returns for each slotType the list of parts that fit it (according to the part's slotType).
---Source: lua/common/jbeam/io.lua:324
---@param ioCtx table Context returned by startLoading.
---@return table<string, string[]>|nil  slotType -> part names; nil if invalid context.
function jbeam_io.getAvailableSlotNameMap(ioCtx) end

--- Parts compatible with a slot. For a v1 slot (field type) returns the parts of that type. For a v2 slot, keeps the parts with a slotType in allowTypes and none of whose types is in denyTypes; the others are returned with the reason 'Part type is in deny list'.
---Source: lua/common/jbeam/io.lua:361
---@param ioCtx table Context returned by startLoading.
---@param slotDef table Slot definition (element of part.slots2 or part.slots).
---@param slotMap table|nil Result of getAvailableSlotNameMap, to provide if calling several times (optimization).
---@return string[]  Compatible part names.
---@return table[]  Rejected parts: {partName, reason}.
function jbeam_io.getCompatiblePartNamesForSlot(ioCtx, slotDef, slotMap) end

--- Statistics of the last startLoading: total number of files and number served by the cache.
---Source: lua/common/jbeam/io.lua:480
---@return table  {total = integer, cachedHits = integer}.
function jbeam_io.getLastStartLoadingStats() end

--- Name of the first part declared with the slotType 'main' in the context's folders.
---Source: lua/common/jbeam/io.lua:288
---@param ioCtx table Context returned by startLoading.
---@return string|nil  Name of the main part.
function jbeam_io.getMainPartName(ioCtx) end

--- Returns the full definition of a part (decoded jbeam table, with partName) and the source file.
---Source: lua/common/jbeam/io.lua:267
---@param ioCtx table Context returned by startLoading.
---@param partName string|nil Part name.
---@return table|nil  Decoded part; nil if not found or name is nil.
---@return string|nil  .jbeam file name.
function jbeam_io.getPart(ioCtx, partName) end

--- Hook called when the extension loads: gets extensions.core_modmanager to associate parts with their mod.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/jbeam/io.lua:484
function jbeam_io.onExtensionLoaded() end

--- Hook called when a file changes on disk: for a .jbeam, deletes its cache and forces a new scan of the folders.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/jbeam/io.lua:466
---@param filename string Modified file.
---@param type string Change type (used in the log).
function jbeam_io.onFileChanged(filename, type) end

--- Parses (or fetches from cache) all the *.jbeam of the given folders, rebuilds the global indexes if a file changed and records statistics (total/cachedHits).
---Source: lua/common/jbeam/io.lua:230
---@param directories string[] List of jbeam folders (e.g. '/vehicles/pickup/').
---@return table  Context ioCtx {preloadedDirs = directories}.
function jbeam_io.startLoading(directories) end

return jbeam_io
