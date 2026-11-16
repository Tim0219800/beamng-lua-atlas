---@meta
-- tim19Atlas stub generated from lua/common/jbeamWriter.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Variant of the 'pretty' JSON encoder that only indents (multi-line formatting) down to a certain depth, to write readable jbeam files. It is not merged with the main encoder for performance reasons. A modder uses it to save a Lua table to a .jbeam file.
--- Access: `require("jbeamWriter")`
---@class jbeamWriter
local jbeamWriter = {}

--- Writes the table obj to filename in depth-limited pretty JSON format. Returns true on success; if opening fails, logs an error and returns false.
---Source: lua/common/jbeamWriter.lua:93
---@param filename string path of the file to write (overwritten)
---@param obj table data to write
---@return boolean  success
function jbeamWriter.writeFile(filename, obj) end

return jbeamWriter
