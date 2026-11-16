---@meta
-- tim19Atlas stub generated from lua/common/libs/lua-websockets/websocket/frame.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Encoding and decoding of WebSocket frames (RFC 6455) for lua-websockets: 7/16/64-bit length headers, client-side XOR masking, close frames (code + reason). Used by sync, ev_common and the client/server backends. Also exports the opcode constants.
--- Access: `require("libs/lua-websockets/websocket/frame")`
---@class libs_lua_websockets_websocket_frame
---@field BINARY integer 2.
---@field CLOSE integer 8.
---@field CONTINUATION integer 0.
---@field PING integer 9.
---@field PONG integer 10.
---@field TEXT integer 1.
local libs_lua_websockets_websocket_frame = {}

--- Decodes a frame from a buffer. If the data is incomplete, returns nil and the number of missing bytes.
---Source: lua/common/libs/lua-websockets/websocket/frame.lua:106
---@param encoded string Bytes received (may contain several frames).
---@return string|nil  Unmasked payload, or nil if incomplete.
---@return boolean|integer  fin (FIN bit), or missing bytes if incomplete.
---@return integer  opcode.
---@return string  Bytes remaining after the frame.
---@return boolean  true if the frame was masked.
function libs_lua_websockets_websocket_frame.decode(encoded) end

--- Extracts code and reason from the payload of a CLOSE frame.
---Source: lua/common/libs/lua-websockets/websocket/frame.lua:186
---@param data string|nil Payload.
---@return integer|nil  Code.
---@return string|nil  Reason.
function libs_lua_websockets_websocket_frame.decode_close(data) end

--- Builds a complete WebSocket frame: header, length, optional random mask (math.random) and masked data.
---Source: lua/common/libs/lua-websockets/websocket/frame.lua:69
---@param data string Payload.
---@param opcode integer Opcode (1 = TEXT by default).
---@param masked boolean true to mask (required on the client side).
---@param fin boolean|nil FIN bit; nil or true = final frame.
---@return string  Frame bytes.
function libs_lua_websockets_websocket_frame.encode(data, opcode, masked, fin) end

--- Builds the payload of a CLOSE frame: 2-byte code followed by the reason. Returns an empty string if code is nil.
---Source: lua/common/libs/lua-websockets/websocket/frame.lua:175
---@param code integer|nil Close code (e.g. 1000).
---@param reason string|nil Reason.
---@return string  Payload.
function libs_lua_websockets_websocket_frame.encode_close(code, reason) end

--- Header with a 64-bit length (two 32-bit integers).
---Source: lua/common/libs/lua-websockets/websocket/frame.lua:65
---@param header integer First byte.
---@param payload integer Second byte.
---@param high integer High 32 bits.
---@param low integer Low 32 bits.
---@return string  Header.
function libs_lua_websockets_websocket_frame.encode_header_big(header, payload, high, low) end

--- Header with a 16-bit length (126..65535).
---Source: lua/common/libs/lua-websockets/websocket/frame.lua:61
---@param header integer First byte.
---@param payload integer Second byte.
---@param len integer Length.
---@return string  Header.
function libs_lua_websockets_websocket_frame.encode_header_medium(header, payload, len) end

--- Two header bytes (length < 126).
---Source: lua/common/libs/lua-websockets/websocket/frame.lua:57
---@param header integer First byte (FIN + opcode).
---@param payload integer Second byte (mask bit + length).
---@return string  Header.
function libs_lua_websockets_websocket_frame.encode_header_small(header, payload) end

return libs_lua_websockets_websocket_frame
