# `libs_lua_websockets_websocket_frame`

*File: `lua/common/libs/lua-websockets/websocket/frame.lua` · VM: Common (GE + vehicle) · 214 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("libs/lua-websockets/websocket/frame")`

Encoding and decoding of WebSocket frames (RFC 6455) for lua-websockets: 7/16/64-bit length headers, client-side XOR masking, close frames (code + reason). Used by sync, ev_common and the client/server backends. Also exports the opcode constants.

## Notes

- Decoding a 64-bit length fails via assert if the length is less than 0xffff or greater than 2^53.
- xor_mask is marked 'TODO: improve performance' in the code: masking is done byte by byte in Lua.

## Functions

| Function | Description | Line |
|---|---|---|
| `libs_lua_websockets_websocket_frame.decode(encoded)` | Decodes a frame from a buffer. If the data is incomplete, returns nil and the number of missing bytes. | 106 |
| `libs_lua_websockets_websocket_frame.decode_close(data)` | Extracts code and reason from the payload of a CLOSE frame. | 186 |
| `libs_lua_websockets_websocket_frame.encode(data, opcode, masked, fin)` | Builds a complete WebSocket frame: header, length, optional random mask (math.random) and masked data. | 69 |
| `libs_lua_websockets_websocket_frame.encode_close(code, reason)` | Builds the payload of a CLOSE frame: 2-byte code followed by the reason. Returns an empty string if code is nil. | 175 |
| `libs_lua_websockets_websocket_frame.encode_header_big(header, payload, high, low)` | Header with a 64-bit length (two 32-bit integers). | 65 |
| `libs_lua_websockets_websocket_frame.encode_header_medium(header, payload, len)` | Header with a 16-bit length (126..65535). | 61 |
| `libs_lua_websockets_websocket_frame.encode_header_small(header, payload)` | Two header bytes (length < 126). | 57 |

### Parameter details

#### `libs_lua_websockets_websocket_frame.decode(encoded)`

Decodes a frame from a buffer. If the data is incomplete, returns nil and the number of missing bytes.

- `encoded` (*string*) : Bytes received (may contain several frames).
- **returns**: string|nil Unmasked payload, or nil if incomplete.
- **returns**: boolean|integer fin (FIN bit), or missing bytes if incomplete.
- **returns**: integer opcode.
- **returns**: string Bytes remaining after the frame.
- **returns**: boolean true if the frame was masked.

#### `libs_lua_websockets_websocket_frame.decode_close(data)`

Extracts code and reason from the payload of a CLOSE frame.

- `data` (*string|nil*) : Payload.
- **returns**: integer|nil Code.
- **returns**: string|nil Reason.

#### `libs_lua_websockets_websocket_frame.encode(data, opcode, masked, fin)`

Builds a complete WebSocket frame: header, length, optional random mask (math.random) and masked data.

- `data` (*string*) : Payload.
- `opcode` (*integer*) : Opcode (1 = TEXT by default).
- `masked` (*boolean*) : true to mask (required on the client side).
- `fin` (*boolean|nil*) : FIN bit; nil or true = final frame.
- **returns**: string Frame bytes.

#### `libs_lua_websockets_websocket_frame.encode_close(code, reason)`

Builds the payload of a CLOSE frame: 2-byte code followed by the reason. Returns an empty string if code is nil.

- `code` (*integer|nil*) : Close code (e.g. 1000).
- `reason` (*string|nil*) : Reason.
- **returns**: string Payload.

#### `libs_lua_websockets_websocket_frame.encode_header_big(header, payload, high, low)`

Header with a 64-bit length (two 32-bit integers).

- `header` (*integer*) : First byte.
- `payload` (*integer*) : Second byte.
- `high` (*integer*) : High 32 bits.
- `low` (*integer*) : Low 32 bits.
- **returns**: string Header.

#### `libs_lua_websockets_websocket_frame.encode_header_medium(header, payload, len)`

Header with a 16-bit length (126..65535).

- `header` (*integer*) : First byte.
- `payload` (*integer*) : Second byte.
- `len` (*integer*) : Length.
- **returns**: string Header.

#### `libs_lua_websockets_websocket_frame.encode_header_small(header, payload)`

Two header bytes (length < 126).

- `header` (*integer*) : First byte (FIN + opcode).
- `payload` (*integer*) : Second byte (mask bit + length).
- **returns**: string Header.

## Fields

| Field | Type | Description |
|---|---|---|
| `BINARY` | integer | 2. |
| `CLOSE` | integer | 8. |
| `CONTINUATION` | integer | 0. |
| `PING` | integer | 9. |
| `PONG` | integer | 10. |
| `TEXT` | integer | 1. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/libs/lua-websockets/websocket/frame.lua`.*
