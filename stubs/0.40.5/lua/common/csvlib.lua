---@meta
-- tim19Atlas stub generated from lua/common/csvlib.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Library for writing and reading CSV/TSV files. newCSV/newTSV create a writer (csvWriter) to which rows are added with add, then the file is written with write (timestamped name) or the text is retrieved with dump. readFileCSV and decode read a CSV (RFC 4180) back into an array of rows. Useful for recording telemetry or curves from a mod.
--- Access: global `csvFile`, `csvLog`, `csvfile`, `dataToCSV`, `trajectoryToCSV2`
---@class csvFile
csvFile = {}

--- Decodes CSV text (RFC 4180) into an array of rows of cells.
---Source: lua/common/csvlib.lua:99
---@param s string|nil CSV content.
---@param sep string|nil Separator (default ',').
---@return table[]|nil  Rows of cells (numbers or strings); nil if s is nil.
function csvFile.decode(s, sep) end

--- Creates a CSV writer (comma separator). Any arguments form the header row.
---Source: lua/common/csvlib.lua:38
---@param ... any Column names (optional).
---@return table  csvWriter object.
function csvFile.newCSV(...) end

--- Creates a TSV writer (tab separator). Any arguments form the header row.
---Source: lua/common/csvlib.lua:42
---@param ... any Column names (optional).
---@return table  csvWriter object.
function csvFile.newTSV(...) end

--- Reads a file via readFile then decodes it with decode.
---Source: lua/common/csvlib.lua:163
---@param filename string File path.
---@param sep string|nil Separator (first character used, default ',').
---@return table[]|nil  Array of rows, each row being an array of values; nil if the file is unreadable.
function csvFile.readFileCSV(filename, sep) end

--- Object returned by newCSV/newTSV. Accumulates the text in a string.buffer.
---@class csvFile_csvWriter
local csvFile_csvWriter = {}

--- Adds a row of cells (numbers, booleans, strings or nil).
---Source: lua/common/csvlib.lua:46
---@param ... number|string|boolean|nil Row values.
---@return table  The writer itself (chainable).
function csvFile_csvWriter:add(...) end

--- Returns all the accumulated content as text.
---Source: lua/common/csvlib.lua:84
---@return string  CSV/TSV text.
function csvFile_csvWriter:dump() end

--- Writes the content to a file (see notes for naming).
---Source: lua/common/csvlib.lua:88
---@param filename string|nil Name or path; by default derived from the headers.
---@return string  File name actually used.
function csvFile_csvWriter:write(filename) end

