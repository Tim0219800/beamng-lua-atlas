---@meta
-- tim19Atlas stub generated from lua/common/libs/lua-websockets/websocket/frame.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Following Websocket RFC: http://tools.ietf.org/html/rfc6455
--- Accès : `require("libs/lua-websockets/websocket/frame")`
---@class libs_lua_websockets_websocket_frame
---@field BINARY number
---@field CLOSE number
---@field CONTINUATION number
---@field PING number
---@field PONG number
---@field TEXT number
local libs_lua_websockets_websocket_frame = {}

---Source : lua/common/libs/lua-websockets/websocket/frame.lua:106
---@param encoded any
function libs_lua_websockets_websocket_frame.decode(encoded) end

---Source : lua/common/libs/lua-websockets/websocket/frame.lua:186
---@param data any
function libs_lua_websockets_websocket_frame.decode_close(data) end

---Source : lua/common/libs/lua-websockets/websocket/frame.lua:69
---@param data any
---@param opcode any
---@param masked any
---@param fin any
function libs_lua_websockets_websocket_frame.encode(data, opcode, masked, fin) end

---Source : lua/common/libs/lua-websockets/websocket/frame.lua:175
---@param code any
---@param reason any
function libs_lua_websockets_websocket_frame.encode_close(code, reason) end

---Source : lua/common/libs/lua-websockets/websocket/frame.lua:65
---@param header any
---@param payload any
---@param high any
---@param low any
function libs_lua_websockets_websocket_frame.encode_header_big(header, payload, high, low) end

---Source : lua/common/libs/lua-websockets/websocket/frame.lua:61
---@param header any
---@param payload any
---@param len any
function libs_lua_websockets_websocket_frame.encode_header_medium(header, payload, len) end

---Source : lua/common/libs/lua-websockets/websocket/frame.lua:57
---@param header any
---@param payload any
function libs_lua_websockets_websocket_frame.encode_header_small(header, payload) end

return libs_lua_websockets_websocket_frame
