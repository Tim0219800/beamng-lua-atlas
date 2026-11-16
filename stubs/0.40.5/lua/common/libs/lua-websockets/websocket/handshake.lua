---@meta
-- tim19Atlas stub generated from lua/common/libs/lua-websockets/websocket/handshake.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- WebSocket HTTP/1.1 handshake (upgrade) for lua-websockets: building the client request, parsing headers, server-side validation and computing Sec-WebSocket-Accept (SHA-1 of the key + RFC 6455 GUID, base64-encoded). Used by websocket/sync and the server backends.
--- Access: `require("libs/lua-websockets/websocket/handshake")`
---@class libs_lua_websockets_websocket_handshake
local libs_lua_websockets_websocket_handshake = {}

--- Server side: checks that a request is a valid WebSocket upgrade (Upgrade: websocket, Connection containing upgrade, key present, version 13) and builds the '101 Switching Protocols' response. Picks the first requested subprotocol that is in the supported list.
---Source: lua/common/libs/lua-websockets/websocket/handshake.lua:67
---@param request string Raw HTTP request.
---@param protocols string[] Subprotocols supported by the server.
---@return string|nil  HTTP 101 response, or nil if the request is invalid.
---@return string|nil  Selected subprotocol; on refusal, 'HTTP/1.1 400 Bad Request' as the second value.
function libs_lua_websockets_websocket_handshake.accept_upgrade(request, protocols) end

--- Parses a plain-text HTTP/1.1 request/response. If the first line does not end with HTTP/1.1, returns an empty table.
---Source: lua/common/libs/lua-websockets/websocket/handshake.lua:14
---@param request string Plain text with CRLF-terminated lines.
---@return table<string, string>  Lowercase headers; duplicates are joined by a comma.
---@return string|nil  Body after the blank line, if any.
function libs_lua_websockets_websocket_handshake.http_headers(request) end

--- Computes the Sec-WebSocket-Accept value: SHA-1 of (key .. GUID 258EAFA5-E914-47DA-95CA-C5AB0DC85B11) then base64.
---Source: lua/common/libs/lua-websockets/websocket/handshake.lua:7
---@param sec_websocket_key string Value of the Sec-WebSocket-Key header sent by the client.
---@return string  Value to put in Sec-WebSocket-Accept.
function libs_lua_websockets_websocket_handshake.sec_websocket_accept(sec_websocket_key) end

--- Client side: builds the text of the WebSocket upgrade GET request (version 13) with Host, key, and optional subprotocols, extra headers and Origin.
---Source: lua/common/libs/lua-websockets/websocket/handshake.lua:40
---@param req table Fields: uri, host, port (appended to Host if it is something other than 80), key, protocols (list of strings), extra_headers (name->value table), origin.
---@return string  Complete HTTP request.
function libs_lua_websockets_websocket_handshake.upgrade_request(req) end

return libs_lua_websockets_websocket_handshake
