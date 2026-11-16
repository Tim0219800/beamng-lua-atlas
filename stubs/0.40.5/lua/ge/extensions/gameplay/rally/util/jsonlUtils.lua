---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/util/jsonlUtils.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Utilities for reading JSONL files (one JSON object per line), used to load the rally recce recordings (driveline, cuts, transcriptions). Empty lines and those starting with `//` are ignored by parseJsonlFile.
--- Access: extension `gameplay_rally_util_jsonlUtils`: `extensions.load("gameplay_rally_util_jsonlUtils")`, then the global `gameplay_rally_util_jsonlUtils`
---@class gameplay_rally_util_jsonlUtils
gameplay_rally_util_jsonlUtils = {}

--- Reads a JSONL file, decodes each non-empty, non-comment line, optionally applies processLine to the object and accumulates the non-nil results.
---Source: lua/ge/extensions/gameplay/rally/util/jsonlUtils.lua:39
---@param fname string File path.
---@param processLine function|nil Receives the decoded object, returns the object to keep or nil to ignore it.
---@param rallyUtil table Rally util module (provides trimString).
---@return table|nil  List of objects, or nil on error.
---@return string|nil  Error message: "file not found" or "failed to read file".
function gameplay_rally_util_jsonlUtils.parseJsonlFile(fname, processLine, rallyUtil) end

--- Reads a whole file into memory with io.open.
---Source: lua/ge/extensions/gameplay/rally/util/jsonlUtils.lua:17
---@param fname string File path.
---@return string|nil  Content, or nil if opening fails.
function gameplay_rally_util_jsonlUtils.readFileToMemory(fname) end

--- Simple reader based on io.lines (compatibility). Calls callback(obj) for each decoded line.
---Source: lua/ge/extensions/gameplay/rally/util/jsonlUtils.lua:70
---@param fname string File path.
---@param callback function|nil Called with the decoded object of each line.
---@return boolean  false if the file does not exist, otherwise true.
function gameplay_rally_util_jsonlUtils.readJsonlLines(fname, callback) end

--- Splits a text into lines on \r and \n; empty lines disappear.
---Source: lua/ge/extensions/gameplay/rally/util/jsonlUtils.lua:27
---@param content string Text to split.
---@return string[]  List of non-empty lines.
function gameplay_rally_util_jsonlUtils.splitIntoLines(content) end

--- Tests whether the line starts with `//` (comment marker).
---Source: lua/ge/extensions/gameplay/rally/util/jsonlUtils.lua:11
---@param line string Line to test.
---@return boolean  true if the line starts with //.
function gameplay_rally_util_jsonlUtils.startsWithDoubleSlash(line) end

