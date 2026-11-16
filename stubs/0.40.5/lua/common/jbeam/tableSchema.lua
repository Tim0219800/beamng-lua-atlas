---@meta
-- tim19Atlas stub generated from lua/common/jbeam/tableSchema.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Interprets the jbeam tabular format: a section is a list whose first row is the column header and whose following rows are the data (e.g. ["id","posX","posY","posZ"], ["n1", 0, 0, 0]). The module turns each row into a {column = value} table, merging into it the local options (dictionaries inserted between rows or at the end of a row), special values (FLT_MAX, |NORMAL|NM_ASPHALT...) and included CSV rows. process() applies this to all the sections of a vehicle.
--- Access: `require("jbeam/tableSchema")`
---@class jbeam_tableSchema
local jbeam_tableSchema = {}

--- Processes an entire jbeam vehicle (or file): initializes vehicle.maxIDs, vehicle.validTables, vehicle.beams and vehicle.options, moves the non-table values at the root into options, then replaces each tabular section (non-empty list) with its key/value version using processTableWithSchemaDestructive.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/jbeam/tableSchema.lua:225
---@param vehicle table jbeam data (modified in place)
---@param processSlotsTable boolean|nil also process the slots/slots2 sections (false = left to the io module)
---@param omitWarnings boolean|nil suppress warnings
---@return boolean  false if a section name is invalid, otherwise true
function jbeam_tableSchema.process(vehicle, processSlotsTable, omitWarnings) end

--- Processes a jbeam tabular section: removes the header (first row), converts each row into a key/value table and stores it in newList. Returns the number of rows created, or -1 if the header is invalid (missing, or a dictionary instead of a list).
---Source: lua/common/jbeam/tableSchema.lua:184
---@param jbeamTable table jbeam section (list); modified (header removed, options cells removed)
---@param newList table filled output table (key = row id or index, value = row table; newList.__astNodeIdx = jbeamTable.__astNodeIdx)
---@param inputOptions table|nil default options copied into each row (deep copy, special values replaced)
---@param omitWarnings boolean|nil suppresses invalid header/row warnings
---@return integer  number of rows created, or -1 if the header is invalid
function jbeam_tableSchema.processTableWithSchemaDestructive(jbeamTable, newList, inputOptions, omitWarnings) end

return jbeam_tableSchema
