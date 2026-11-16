# `libs_lua_websockets_websocket_handshake`

*File: `lua/common/libs/lua-websockets/websocket/handshake.lua` · VM: Common (GE + vehicle) · 109 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("libs/lua-websockets/websocket/handshake")`

WebSocket HTTP/1.1 handshake (upgrade) for lua-websockets: building the client request, parsing headers, server-side validation and computing Sec-WebSocket-Accept (SHA-1 of the key + RFC 6455 GUID, base64-encoded). Used by websocket/sync and the server backends.

## Notes

- http_headers lowercases the header names; the values too, except for headers containing 'sec-websocket' (key and accept keep their case).
- Assertions fail (assert(false, line)) if a header line is malformed.

## Functions

| Function | Description | Line |
|---|---|---|
| `libs_lua_websockets_websocket_handshake.accept_upgrade(request, protocols)` | Server side: checks that a request is a valid WebSocket upgrade (Upgrade: websocket, Connection containing upgrade, key present, version 13) and builds the '101 Switching Protocols' response. Picks the first requested subprotocol that is in the supported list. | 67 |
| `libs_lua_websockets_websocket_handshake.http_headers(request)` | Parses a plain-text HTTP/1.1 request/response. If the first line does not end with HTTP/1.1, returns an empty table. | 14 |
| `libs_lua_websockets_websocket_handshake.sec_websocket_accept(sec_websocket_key)` | Computes the Sec-WebSocket-Accept value: SHA-1 of (key .. GUID 258EAFA5-E914-47DA-95CA-C5AB0DC85B11) then base64. | 7 |
| `libs_lua_websockets_websocket_handshake.upgrade_request(req)` | Client side: builds the text of the WebSocket upgrade GET request (version 13) with Host, key, and optional subprotocols, extra headers and Origin. | 40 |

### Parameter details

#### `libs_lua_websockets_websocket_handshake.accept_upgrade(request, protocols)`

Server side: checks that a request is a valid WebSocket upgrade (Upgrade: websocket, Connection containing upgrade, key present, version 13) and builds the '101 Switching Protocols' response. Picks the first requested subprotocol that is in the supported list.

- `request` (*string*) : Raw HTTP request.
- `protocols` (*string[]*) : Subprotocols supported by the server.
- **returns**: string|nil HTTP 101 response, or nil if the request is invalid.
- **returns**: string|nil Selected subprotocol; on refusal, 'HTTP/1.1 400 Bad Request' as the second value.

#### `libs_lua_websockets_websocket_handshake.http_headers(request)`

Parses a plain-text HTTP/1.1 request/response. If the first line does not end with HTTP/1.1, returns an empty table.

- `request` (*string*) : Plain text with CRLF-terminated lines.
- **returns**: table<string, string> Lowercase headers; duplicates are joined by a comma.
- **returns**: string|nil Body after the blank line, if any.

#### `libs_lua_websockets_websocket_handshake.sec_websocket_accept(sec_websocket_key)`

Computes the Sec-WebSocket-Accept value: SHA-1 of (key .. GUID 258EAFA5-E914-47DA-95CA-C5AB0DC85B11) then base64.

- `sec_websocket_key` (*string*) : Value of the Sec-WebSocket-Key header sent by the client.
- **returns**: string Value to put in Sec-WebSocket-Accept.

#### `libs_lua_websockets_websocket_handshake.upgrade_request(req)`

Client side: builds the text of the WebSocket upgrade GET request (version 13) with Host, key, and optional subprotocols, extra headers and Origin.

- `req` (*table*) : Fields: uri, host, port (appended to Host if it is something other than 80), key, protocols (list of strings), extra_headers (name->value table), origin.
- **returns**: string Complete HTTP request.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/libs/lua-websockets/websocket/handshake.lua`.*
