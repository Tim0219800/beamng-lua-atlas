---@meta
-- tim19Atlas stub generated from lua/common/ljson.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Old SJSON parser written in pure Lua (Lua 5.1), kept when json.lua switched to LuaJIT's string.buffer. It decodes Autodesk's SJSON format (extended JSON) used by jbeam and configuration files. Rarely useful to a modder (prefer json.decode, which is faster), but it tolerates the same extensions and produces errors with line numbers.
--- Access: `require("ljson")`
---@class ljson
local ljson = {}

--- Decodes SJSON/JSON text into a Lua table. Returns nil if si is nil. Raises an error with a line number if the text is invalid.
---Source: lua/common/ljson.lua:233
---@param si string|nil SJSON text
---@return table|nil  decoded value
function ljson.decode(si) end

return ljson
