---@meta
-- tim19Atlas stub generated from lua/common/libs/xlsxlib/xlsxlib.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- BeamNG library (Thomas Fischer, 2024) for reading Excel .xlsx workbooks. It opens the ZIP archive with the engine object `ZipArchive`, reads the relationships, the sheet list and the shared strings, then extracts a sheet's cells (values, not formulas) into Lua tables. Used to import spreadsheet data (e.g. content parameters); relies on libs/slaxml/slaxdom.
--- Access: `require("libs/xlsxlib/xlsxlib")`
---@class libs_xlsxlib_xlsxlib
local libs_xlsxlib_xlsxlib = {}

--- Reads the data of a sheet of a loaded workbook. Without `range`, returns the whole sheet as an array of rows (trimmed of empty edges). With `range`, returns the requested portion (value alone for a cell, list for a column or a row, array of rows for a block).
---Source: lua/common/libs/xlsxlib/xlsxlib.lua:467
---@param xlsx table Result of loadFileXLSX.
---@param sheetName string|nil Sheet name (case-insensitive); nil = first sheet found.
---@param range string|nil Range in Excel format (see notes).
---@return table|string|number|boolean|nil  Extracted data; values are numbers, strings or booleans, and empty cells are nil.
function libs_xlsxlib_xlsxlib.getSheetData(xlsx, sheetName, range) end

--- Loads an .xlsx file: opens the archive, reads _rels/.rels and the workbook relationships, the sheet list (name -> internal path) and the shared strings. Closes the archive before returning.
---Source: lua/common/libs/xlsxlib/xlsxlib.lua:402
---@param filepath string Path of the .xlsx file (opened by ZipArchive:openArchiveName for reading).
---@return table  {filepath = string, sharedStrings = string[], sheets = table<string, string>}.
function libs_xlsxlib_xlsxlib.loadFileXLSX(filepath) end

return libs_xlsxlib_xlsxlib
