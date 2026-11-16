---@meta
-- tim19Atlas stub generated from lua/common/libs/lua-websockets/websocket/sync.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Synchronous core of lua-websockets: extend(obj) adds to an object having sock_send, sock_receive, sock_close (and sock_connect on the client side) the methods connect, send, receive and close. Handles the handshake, reassembly of fragmented messages, automatic reply to PINGs (client) and clean closing. Used by client_sync, client_copas and server_copas.
--- Access: `require("libs/lua-websockets/websocket/sync")`
---@class libs_lua_websockets_websocket_sync
local libs_lua_websockets_websocket_sync = {}

--- Adds the WebSocket methods to obj and initializes obj.state to 'CLOSED' if absent.
---Source: lua/common/libs/lua-websockets/websocket/sync.lua:186
---@param obj table Object with sock_send, sock_receive, sock_close (and sock_connect if it is not a server).
---@return table  The same object, extended.
function libs_lua_websockets_websocket_sync.extend(obj) end

--- Object extended by extend. Fields: state ('CLOSED', 'OPEN'), is_server, is_closing, optional on_close callback.
---@class libs_lua_websockets_websocket_sync_obj
local libs_lua_websockets_websocket_sync_obj = {}

--- Sends a CLOSE frame, waits for the reply, closes the socket, calls on_close if it exists and sets state to 'CLOSED'. Returns false if the state is not 'OPEN'.
---Source: lua/common/libs/lua-websockets/websocket/sync.lua:95
---@param code integer Code (default 1000).
---@param reason string Reason.
---@return boolean  was_clean.
---@return integer  Code.
---@return string  Reason.
function libs_lua_websockets_websocket_sync_obj:close(code, reason) end

--- Client connection: parses the URL, connects the socket, performs the HTTP handshake and checks Sec-WebSocket-Accept. Sets state to 'OPEN' on success.
---Source: lua/common/libs/lua-websockets/websocket/sync.lua:126
---@param ws_url string ws:// or wss:// URL.
---@param ws_protocol string|string[]|nil Requested subprotocol(s).
---@param options table|nil ssl_params and extra_http_headers.
---@return boolean|nil  true if open, nil otherwise.
---@return string|nil  Accepted subprotocol, or error message.
---@return table|nil  Response headers.
function libs_lua_websockets_websocket_sync_obj:connect(ws_url, ws_protocol, options) end

--- Blocks until a complete message is received. Reassembles fragments, replies to PINGs on the client side, replies to CLOSE with an echo.
---Source: lua/common/libs/lua-websockets/websocket/sync.lua:8
---@return string|nil  Message.
---@return integer|nil  Opcode.
---@return boolean  was_clean (on close).
---@return integer  Close code.
---@return string  Reason.
function libs_lua_websockets_websocket_sync_obj:receive() end

--- Sends a message (masked if the object is not a server). Closes the connection if the send fails.
---Source: lua/common/libs/lua-websockets/websocket/sync.lua:83
---@param data string Data.
---@param opcode integer Opcode (TEXT by default).
---@return boolean|nil  true if sent; nil, was_clean, code, reason otherwise.
function libs_lua_websockets_websocket_sync_obj:send(data, opcode) end

return libs_lua_websockets_websocket_sync
