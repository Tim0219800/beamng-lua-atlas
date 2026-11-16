# `jbeam_tableSchema`

*File: `lua/common/jbeam/tableSchema.lua` · VM: Common (GE + vehicle) · 298 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("jbeam/tableSchema")`

Interprets the jbeam tabular format: a section is a list whose first row is the column header and whose following rows are the data (e.g. ["id","posX","posY","posZ"], ["n1", 0, 0, 0]). The module turns each row into a {column = value} table, merging into it the local options (dictionaries inserted between rows or at the end of a row), special values (FLT_MAX, |NORMAL|NM_ASPHALT...) and included CSV rows. process() applies this to all the sections of a vehicle.

## Example

```lua
local tableSchema = require('jbeam/tableSchema')
local rowsCount = tableSchema.processTableWithSchemaDestructive(section, newList, vehicle.options)
-- or, for a whole vehicle:
tableSchema.process(vehicle, true, true)
```

## Notes

- Row rules: (1) a dictionary alone on a row sets local options for the following rows; (2) a dictionary placed in the last cell of a row is added to the options of THIS row; (3) a row longer than the header + 1 is rejected (warning, returns -1); (4) options `disable = true` (or variables.disable = true) skip the row; (5) if the id column exists, it becomes the row's key in the result list and the name field (the id field is removed), otherwise the key is the row index (starting at 1, after the header is removed).
- The vehicle's global options (non-table fields at the root) are first moved into vehicle.options then copied into the local options of each section: they become the default values of each row.
- Special values (strings): 'FLT_MAX' -> +infinity, 'MINUS_FLT_MAX' -> -infinity; string starting with '|': binary combination (bit.bor) of names such as NORMAL, HYDRO, ANISOTROPIC/TIRESIDE, BOUNDED, PRESSURED, SUPPORT, LBEAM, FIXED, NONCOLLIDABLE, SIGNAL_LEFT(1), SIGNAL_RIGHT(2), HEADLIGHT(4), BRAKELIGHT(8), RUNNINGLIGHT(16), REVERSELIGHT(32); an 'NM_<name>' element is replaced by the id of the particle material <name> (particles.getMaterialIDByName) and OVERWRITES the value accumulated before it (not an OR): put NM_ first.
- CSV include: a dictionary row containing include (path) and delimiter reads a csvlib file whose first row must be identical to the section header; the file's rows are processed as normal rows. Errors are logged and the row is dropped.
- Minor BUG: the error message for an inconsistent CSV header uses an undefined variable `headerCsv` (displays nil).
- The function is DESTRUCTIVE: it removes the header (table.remove) from jbeamTable and modifies the rows (removal of the options cell). Section names must match ^[a-zA-Z_][a-zA-Z0-9_]*$ otherwise process() logs an error and returns false.
- The 'slots' and 'slots2' sections are not processed by process when processSlotsTable is false (already prepared by the io module); the vehicle.validTables table remembers the sections already processed so they are not processed twice.

## Functions

| Function | Description | Line |
|---|---|---|
| `jbeam_tableSchema.process(vehicle, processSlotsTable, omitWarnings)` | Processes an entire jbeam vehicle (or file): initializes vehicle.maxIDs, vehicle.validTables, vehicle.beams and vehicle.options, moves the non-table values at the root into options, then replaces each tabular section (non-empty list) with its key/value version using processTableWithSchemaDestructive. *(internal)* | 225 |
| `jbeam_tableSchema.processTableWithSchemaDestructive(jbeamTable, newList, inputOptions, omitWarnings)` | Processes a jbeam tabular section: removes the header (first row), converts each row into a key/value table and stores it in newList. Returns the number of rows created, or -1 if the header is invalid (missing, or a dictionary instead of a list). | 184 |

### Parameter details

#### `jbeam_tableSchema.process(vehicle, processSlotsTable, omitWarnings)`

Processes an entire jbeam vehicle (or file): initializes vehicle.maxIDs, vehicle.validTables, vehicle.beams and vehicle.options, moves the non-table values at the root into options, then replaces each tabular section (non-empty list) with its key/value version using processTableWithSchemaDestructive.

- `vehicle` (*table*) : jbeam data (modified in place)
- `processSlotsTable` (*boolean|nil*) : also process the slots/slots2 sections (false = left to the io module)
- `omitWarnings` (*boolean|nil*) : suppress warnings
- **returns**: boolean false if a section name is invalid, otherwise true

#### `jbeam_tableSchema.processTableWithSchemaDestructive(jbeamTable, newList, inputOptions, omitWarnings)`

Processes a jbeam tabular section: removes the header (first row), converts each row into a key/value table and stores it in newList. Returns the number of rows created, or -1 if the header is invalid (missing, or a dictionary instead of a list).

- `jbeamTable` (*table*) : jbeam section (list); modified (header removed, options cells removed)
- `newList` (*table*) : filled output table (key = row id or index, value = row table; newList.__astNodeIdx = jbeamTable.__astNodeIdx)
- `inputOptions` (*table|nil*) : default options copied into each row (deep copy, special values replaced)
- `omitWarnings` (*boolean|nil*) : suppresses invalid header/row warnings
- **returns**: integer number of rows created, or -1 if the header is invalid

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/jbeam/tableSchema.lua`.*
