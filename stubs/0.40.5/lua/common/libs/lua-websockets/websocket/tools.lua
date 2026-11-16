---@meta
-- tim19Atlas stub generated from lua/common/libs/lua-websockets/websocket/tools.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Utilities of lua-websockets: reading/writing 8/16/32-bit big-endian integers, SHA-1 (via the 'crypto' library if present, otherwise a Lua implementation), base64 (via the luasocket 'mime' module), parsing ws:// URLs and generating the Sec-WebSocket-Key.
--- Access: `require("libs/lua-websockets/websocket/tools")`
---@class libs_lua_websockets_websocket_tools
---@field base64 table Table with encode(data) -> base64 string (mime.b64).
---@field sha1 function SHA-1 function: crypto.digest if available, otherwise the in-house implementation; returns 20 raw bytes.
---@field write_int8 function Alias of string.char: writes one or more bytes.
local libs_lua_websockets_websocket_tools = {}

--- Generates a Sec-WebSocket-Key: 16 random bytes (math.random) in base64.
---Source: lua/common/libs/lua-websockets/websocket/tools.lua:180
---@return string  Key.
function libs_lua_websockets_websocket_tools.generate_key() end

--- Splits a ws:// or wss:// URL. Default port 80 (ws) or 443 (wss); uri defaults to '/'. Raises an error if the URL is invalid.
---Source: lua/common/libs/lua-websockets/websocket/tools.lua:167
---@param url string URL.
---@return string  Protocol in lowercase.
---@return string  Host.
---@return integer  Port.
---@return string  URI.
function libs_lua_websockets_websocket_tools.parse_url(url) end

--- Reads a big-endian 16-bit integer.
---Source: lua/common/libs/lua-websockets/websocket/tools.lua:27
---@param str string Source.
---@param pos integer|nil Position.
---@return integer  New position.
---@return integer  Value.
function libs_lua_websockets_websocket_tools.read_int16(str, pos) end

--- Reads a big-endian 32-bit integer.
---Source: lua/common/libs/lua-websockets/websocket/tools.lua:32
---@param str string Source.
---@param pos integer|nil Position.
---@return integer  New position.
---@return integer  Value.
function libs_lua_websockets_websocket_tools.read_int32(str, pos) end

--- Reads a byte.
---Source: lua/common/libs/lua-websockets/websocket/tools.lua:23
---@param str string Source.
---@param pos integer|nil Position (default 1).
---@return integer  New position.
---@return integer  Value.
function libs_lua_websockets_websocket_tools.read_int8(str, pos) end

--- Writes a big-endian 16-bit integer as 2 bytes.
---Source: lua/common/libs/lua-websockets/websocket/tools.lua:45
---@param v integer Value.
---@return string  2 bytes.
function libs_lua_websockets_websocket_tools.write_int16(v) end

--- Writes a big-endian 32-bit integer as 4 bytes.
---Source: lua/common/libs/lua-websockets/websocket/tools.lua:49
---@param v integer Value.
---@return string  4 bytes.
function libs_lua_websockets_websocket_tools.write_int32(v) end

return libs_lua_websockets_websocket_tools
