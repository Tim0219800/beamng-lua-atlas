---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/logStreams.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Small I/O utility to save and reread logged "streams" (vehicle data streams) in three formats in the user folder: loggedStreams.json, loggedStreams.txt (wikitable) and loggedStreams.rst. The functions only read/write these files; the content generation is done elsewhere.
--- Access: extension `util_logStreams`: `extensions.load("util_logStreams")`, then the global `util_logStreams`
---@class util_logStreams
util_logStreams = {}

--- Reads and decodes loggedStreams.json.
---Source: lua/ge/extensions/util/logStreams.lua:16
---@return table|nil  Decoded content, or nil if the file is missing
function util_logStreams.readJson() end

--- Reads loggedStreams.rst, replacing each line break with the literal sequence \n.
---Source: lua/ge/extensions/util/logStreams.lua:33
---@return string  Content with escaped \n
---@return integer  Number of replacements (second return value of gsub)
function util_logStreams.readRst() end

--- Reads loggedStreams.txt, replacing each line break with the literal sequence \n.
---Source: lua/ge/extensions/util/logStreams.lua:24
---@return string  Content with escaped \n
---@return integer  Number of replacements (second return value of gsub)
function util_logStreams.readWikitable() end

--- Writes data to loggedStreams.json (jsonWriteFile, readable format).
---Source: lua/ge/extensions/util/logStreams.lua:12
---@param data table Data to serialize
function util_logStreams.saveJson(data) end

--- Writes the given text to loggedStreams.rst.
---Source: lua/ge/extensions/util/logStreams.lua:29
---@param data string Text in reStructuredText format
function util_logStreams.saveRst(data) end

--- Writes the given text to loggedStreams.txt.
---Source: lua/ge/extensions/util/logStreams.lua:20
---@param data string Text in wikitable format
function util_logStreams.saveWikitable(data) end

