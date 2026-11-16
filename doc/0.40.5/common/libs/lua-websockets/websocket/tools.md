# `libs_lua_websockets_websocket_tools`

*File: `lua/common/libs/lua-websockets/websocket/tools.lua` · VM: Common (GE + vehicle) · 204 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("libs/lua-websockets/websocket/tools")`

Utilities of lua-websockets: reading/writing 8/16/32-bit big-endian integers, SHA-1 (via the 'crypto' library if present, otherwise a Lua implementation), base64 (via the luasocket 'mime' module), parsing ws:// URLs and generating the Sec-WebSocket-Key.

## Notes

- The module calls math.randomseed(os.time()) at load: this resets the global random seed (side effect on math.random for the rest of the VM).
- Uses require'mime' (bare name, not a libs/ path); this module must be findable.

## Functions

| Function | Description | Line |
|---|---|---|
| `libs_lua_websockets_websocket_tools.generate_key()` | Generates a Sec-WebSocket-Key: 16 random bytes (math.random) in base64. | 180 |
| `libs_lua_websockets_websocket_tools.parse_url(url)` | Splits a ws:// or wss:// URL. Default port 80 (ws) or 443 (wss); uri defaults to '/'. Raises an error if the URL is invalid. | 167 |
| `libs_lua_websockets_websocket_tools.read_int16(str, pos)` | Reads a big-endian 16-bit integer. | 27 |
| `libs_lua_websockets_websocket_tools.read_int32(str, pos)` | Reads a big-endian 32-bit integer. | 32 |
| `libs_lua_websockets_websocket_tools.read_int8(str, pos)` | Reads a byte. | 23 |
| `libs_lua_websockets_websocket_tools.write_int16(v)` | Writes a big-endian 16-bit integer as 2 bytes. | 45 |
| `libs_lua_websockets_websocket_tools.write_int32(v)` | Writes a big-endian 32-bit integer as 4 bytes. | 49 |

### Parameter details

#### `libs_lua_websockets_websocket_tools.generate_key()`

Generates a Sec-WebSocket-Key: 16 random bytes (math.random) in base64.

- **returns**: string Key.

#### `libs_lua_websockets_websocket_tools.parse_url(url)`

Splits a ws:// or wss:// URL. Default port 80 (ws) or 443 (wss); uri defaults to '/'. Raises an error if the URL is invalid.

- `url` (*string*) : URL.
- **returns**: string Protocol in lowercase.
- **returns**: string Host.
- **returns**: integer Port.
- **returns**: string URI.

#### `libs_lua_websockets_websocket_tools.read_int16(str, pos)`

Reads a big-endian 16-bit integer.

- `str` (*string*) : Source.
- `pos` (*integer|nil*) : Position.
- **returns**: integer New position.
- **returns**: integer Value.

#### `libs_lua_websockets_websocket_tools.read_int32(str, pos)`

Reads a big-endian 32-bit integer.

- `str` (*string*) : Source.
- `pos` (*integer|nil*) : Position.
- **returns**: integer New position.
- **returns**: integer Value.

#### `libs_lua_websockets_websocket_tools.read_int8(str, pos)`

Reads a byte.

- `str` (*string*) : Source.
- `pos` (*integer|nil*) : Position (default 1).
- **returns**: integer New position.
- **returns**: integer Value.

#### `libs_lua_websockets_websocket_tools.write_int16(v)`

Writes a big-endian 16-bit integer as 2 bytes.

- `v` (*integer*) : Value.
- **returns**: string 2 bytes.

#### `libs_lua_websockets_websocket_tools.write_int32(v)`

Writes a big-endian 32-bit integer as 4 bytes.

- `v` (*integer*) : Value.
- **returns**: string 4 bytes.

## Fields

| Field | Type | Description |
|---|---|---|
| `base64` | table | Table with encode(data) -> base64 string (mime.b64). |
| `sha1` | function | SHA-1 function: crypto.digest if available, otherwise the in-house implementation; returns 20 raw bytes. |
| `write_int8` | function | Alias of string.char: writes one or more bytes. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/libs/lua-websockets/websocket/tools.lua`.*
