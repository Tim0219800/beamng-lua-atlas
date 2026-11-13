---@meta
-- tim19Atlas stub generated from lua/common/libs/lua-websockets/websocket/tools.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : `require("libs/lua-websockets/websocket/tools")`
---@class libs_lua_websockets_websocket_tools
---@field base64 table
---@field sha1 any
---@field write_int8 any
local libs_lua_websockets_websocket_tools = {}

---Source : lua/common/libs/lua-websockets/websocket/tools.lua:180
function libs_lua_websockets_websocket_tools.generate_key() end

---Source : lua/common/libs/lua-websockets/websocket/tools.lua:167
---@param url any
function libs_lua_websockets_websocket_tools.parse_url(url) end

---Source : lua/common/libs/lua-websockets/websocket/tools.lua:27
---@param str any
---@param pos any
function libs_lua_websockets_websocket_tools.read_int16(str, pos) end

---Source : lua/common/libs/lua-websockets/websocket/tools.lua:32
---@param str any
---@param pos any
function libs_lua_websockets_websocket_tools.read_int32(str, pos) end

---Source : lua/common/libs/lua-websockets/websocket/tools.lua:23
---@param str any
---@param pos any
function libs_lua_websockets_websocket_tools.read_int8(str, pos) end

---Source : lua/common/libs/lua-websockets/websocket/tools.lua:45
---@param v any
function libs_lua_websockets_websocket_tools.write_int16(v) end

---Source : lua/common/libs/lua-websockets/websocket/tools.lua:49
---@param v any
function libs_lua_websockets_websocket_tools.write_int32(v) end

return libs_lua_websockets_websocket_tools
