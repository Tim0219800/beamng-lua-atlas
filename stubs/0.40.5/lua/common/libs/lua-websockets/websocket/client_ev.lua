---@meta
-- tim19Atlas stub generated from lua/common/libs/lua-websockets/websocket/client_ev.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Asynchronous WebSocket client backend of lua-websockets for the lua-ev event loop ('ev' module, not provided by the game). The module returns a constructor function; the object works through callbacks (on_open, on_message, on_error, on_close) and handles non-blocking connection, handshake and close with a timeout.
--- Access: `require("libs/lua-websockets/websocket/client_ev")`
---@class libs_lua_websockets_websocket_client_ev
local libs_lua_websockets_websocket_client_ev = {}

--- Object returned by the constructor new(ws). ws is an optional options table (loop: ev loop, default ev.Loop.default). self.state is 'CLOSED', 'CONNECTING', 'OPEN' or 'CLOSING'.
---@class libs_lua_websockets_websocket_client_ev_client
local libs_lua_websockets_websocket_client_ev_client = {}

--- Closes the connection: cancels the connection in progress or sends a CLOSE frame then waits for the echo until the timeout (3 s by default), otherwise closes with code 1006 'timeout'.
---Source: lua/common/libs/lua-websockets/websocket/client_ev.lua:dyn
---@param code integer Code (default 1000).
---@param reason string Reason.
---@param timeout number Timeout in seconds.
function libs_lua_websockets_websocket_client_ev_client:close(code, reason, timeout) end

--- Starts an asynchronous connection, then the WebSocket handshake.
---Source: lua/common/libs/lua-websockets/websocket/client_ev.lua:dyn
---@param url string ws:// or wss:// URL.
---@param ws_protocol string|string[] Requested subprotocol(s).
---@param options table Options (e.g. extra_http_headers, ssl_params) — inferred from code.
function libs_lua_websockets_websocket_client_ev_client:connect(url, ws_protocol, options) end

--- Sets the close callback.
---Source: lua/common/libs/lua-websockets/websocket/client_ev.lua:dyn
---@param f function Callback.
function libs_lua_websockets_websocket_client_ev_client:on_close(f) end

--- Sets the error callback.
---Source: lua/common/libs/lua-websockets/websocket/client_ev.lua:dyn
---@param f function Callback.
function libs_lua_websockets_websocket_client_ev_client:on_error(f) end

--- Sets the receive callback.
---Source: lua/common/libs/lua-websockets/websocket/client_ev.lua:dyn
---@param f function function(client, message, opcode).
function libs_lua_websockets_websocket_client_ev_client:on_message(f) end

--- Sets the callback called when the connection is open.
---Source: lua/common/libs/lua-websockets/websocket/client_ev.lua:dyn
---@param f function Callback.
function libs_lua_websockets_websocket_client_ev_client:on_open(f) end

--- Sends a message (frame masked on the client side).
---Source: lua/common/libs/lua-websockets/websocket/client_ev.lua:dyn
---@param message string Data.
---@param opcode integer Opcode (TEXT by default).
function libs_lua_websockets_websocket_client_ev_client:send(message, opcode) end

