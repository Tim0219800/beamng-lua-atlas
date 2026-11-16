---@meta
-- tim19Atlas stub generated from lua/common/json.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Thin wrapper around LuaJIT's string.buffer to read and write JSON/SJSON (https://github.com/Autodesk/sjson). `json.decode` reads text or a buffer; `json.encode` is directly buffer.jsonencode. The old pure-Lua SJSON parser was moved to ljson.lua.
--- Access: global `json`
---@class json
---@field encode function string.buffer.jsonencode: serializes a Lua value (table, number, string, boolean) to JSON text.
json = {}

--- Decodes JSON/SJSON. Accepts a string or a string.buffer object (which must have a jsondecode method). Returns nil if the argument is nil.
---Source: lua/common/json.lua:25
---@param si string|table|nil JSON text or string.buffer
---@return any  decoded Lua value (table, number, string, boolean...); error raised if the JSON is invalid (string.buffer behavior)
function json.decode(si) end

