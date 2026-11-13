---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/util/jsonlUtils.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `gameplay_rally_util_jsonlUtils` : `extensions.load("gameplay_rally_util_jsonlUtils")`, puis la globale `gameplay_rally_util_jsonlUtils`
---@class gameplay_rally_util_jsonlUtils
gameplay_rally_util_jsonlUtils = {}

--- Parse a JSONL file, calling processLine for each valid JSON line
---  Returns array of parsed objects, or nil on error
---  processLine(obj) should return the processed object or nil to skip
---Source : lua/ge/extensions/gameplay/rally/util/jsonlUtils.lua:39
---@param fname any
---@param processLine any
---@param rallyUtil any
function gameplay_rally_util_jsonlUtils.parseJsonlFile(fname, processLine, rallyUtil) end

--- Read entire file into memory
---Source : lua/ge/extensions/gameplay/rally/util/jsonlUtils.lua:17
---@param fname any
function gameplay_rally_util_jsonlUtils.readFileToMemory(fname) end

--- Simple JSONL file reader using io.lines (for backward compatibility)
---  Calls callback(obj) for each line
---Source : lua/ge/extensions/gameplay/rally/util/jsonlUtils.lua:70
---@param fname any
---@param callback any
function gameplay_rally_util_jsonlUtils.readJsonlLines(fname, callback) end

--- Split content into lines
---Source : lua/ge/extensions/gameplay/rally/util/jsonlUtils.lua:27
---@param content any
function gameplay_rally_util_jsonlUtils.splitIntoLines(content) end

--- Check if a line starts with a comment marker
---Source : lua/ge/extensions/gameplay/rally/util/jsonlUtils.lua:11
---@param line any
function gameplay_rally_util_jsonlUtils.startsWithDoubleSlash(line) end

