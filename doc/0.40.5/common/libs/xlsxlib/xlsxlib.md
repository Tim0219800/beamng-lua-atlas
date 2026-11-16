# `libs_xlsxlib_xlsxlib`

*File: `lua/common/libs/xlsxlib/xlsxlib.lua` · VM: Common (GE + vehicle) · 514 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("libs/xlsxlib/xlsxlib")`

BeamNG library (Thomas Fischer, 2024) for reading Excel .xlsx workbooks. It opens the ZIP archive with the engine object `ZipArchive`, reads the relationships, the sheet list and the shared strings, then extracts a sheet's cells (values, not formulas) into Lua tables. Used to import spreadsheet data (e.g. content parameters); relies on libs/slaxml/slaxdom.

## Example

```lua
local xlsx = require('libs/xlsxlib/xlsxlib')
local book = xlsx.loadFileXLSX('lua/common/libs/xlsxlib/tests/test_input_1.xlsx')
local tout = xlsx.getSheetData(book, 'Sheet1')
local bloc = xlsx.getSheetData(book, 'Sheet1', 'A1:C3')
local cell = xlsx.getSheetData(book, 'Sheet1', 'B2')
```

## Notes

- Range syntax (parseRange): "B2" (a single cell, returns the value alone), "A1:C3", single column "B" (list), column range "C:E", single row "2" (list), row range "2:5". Absolute references $A$1 are accepted for cells. Uppercase columns only.
- General ranges (cells or combined columns/rows) are trimmed: empty rows/columns at the edges are removed before extraction, so the returned position is not necessarily the requested one.
- Cell types: shared string (t='s'), boolean (t='b'), string/inlineStr, otherwise number if convertible. Formulas are not evaluated (cell ignored) and empty cells are omitted.
- Errors raised via error(): file cannot be opened, empty archive, workbook relationship not found, sheet not found ("Sheet not found: ..."), invalid range, invalid cell reference.
- The sheet name is searched case-insensitively; if `sheetName` is nil, the first sheet returned by next() (order not guaranteed) is used.
- getSheetData reopens the archive on each call (the path is kept in xlsx.filepath).

## Functions

| Function | Description | Line |
|---|---|---|
| `libs_xlsxlib_xlsxlib.getSheetData(xlsx, sheetName, range)` | Reads the data of a sheet of a loaded workbook. Without `range`, returns the whole sheet as an array of rows (trimmed of empty edges). With `range`, returns the requested portion (value alone for a cell, list for a column or a row, array of rows for a block). | 467 |
| `libs_xlsxlib_xlsxlib.loadFileXLSX(filepath)` | Loads an .xlsx file: opens the archive, reads _rels/.rels and the workbook relationships, the sheet list (name -> internal path) and the shared strings. Closes the archive before returning. | 402 |

### Parameter details

#### `libs_xlsxlib_xlsxlib.getSheetData(xlsx, sheetName, range)`

Reads the data of a sheet of a loaded workbook. Without `range`, returns the whole sheet as an array of rows (trimmed of empty edges). With `range`, returns the requested portion (value alone for a cell, list for a column or a row, array of rows for a block).

- `xlsx` (*table*) : Result of loadFileXLSX.
- `sheetName` (*string|nil*) : Sheet name (case-insensitive); nil = first sheet found.
- `range` (*string|nil*) : Range in Excel format (see notes).
- **returns**: table|string|number|boolean|nil Extracted data; values are numbers, strings or booleans, and empty cells are nil.

#### `libs_xlsxlib_xlsxlib.loadFileXLSX(filepath)`

Loads an .xlsx file: opens the archive, reads _rels/.rels and the workbook relationships, the sheet list (name -> internal path) and the shared strings. Closes the archive before returning.

- `filepath` (*string*) : Path of the .xlsx file (opened by ZipArchive:openArchiveName for reading).
- **returns**: table {filepath = string, sharedStrings = string[], sheets = table<string, string>}.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/libs/xlsxlib/xlsxlib.lua`.*
