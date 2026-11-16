# `libs_luasocket_socket_url`

*File: `lua/common/libs/luasocket/socket/url.lua` · VM: Common (GE + vehicle) · 308 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("libs/luasocket/socket/url")`

Third-party LuaSocket library (Diego Nehab), version "URL 1.0.3": parsing, building and resolving relative URLs according to RFC 2396. Useful for splitting a URL into scheme/authority/userinfo/host/port/path/params/query/fragment, rebuilding it, encoding/decoding reserved characters (%XX) and handling path segments.

## Example

```lua
local url = require('socket.url')
local p = url.parse('http://user:pw@example.com:8080/a/b;p?x=1#frag')
print(p.host, p.port, p.path, p.query)  -- example.com 8080 /a/b x=1
print(url.absolute('http://example.com/a/b', '../c'))
```

## Notes

- The module is declared locally (`_M`); the file is loaded via `require` from the code that needs it.
- `parse` returns nil and "invalid url" for an empty string; the IPv6 authority in brackets is recognized (host without the brackets).
- The comment of `unescape` in the source is a copy of that of `escape`: `unescape` does decode the %XX sequences.

## Functions

| Function | Description | Line |
|---|---|---|
| `libs_luasocket_socket_url.absolute(base_url, relative_url)` | Builds an absolute URL from a base URL and a relative URL (RFC 2396). | 221 |
| `libs_luasocket_socket_url.build(parsed)` | Rebuilds a URL from a table of the type returned by parse; components containing reserved characters are protected. | 185 |
| `libs_luasocket_socket_url.build_path(parsed, unsafe)` | Rebuilds a path from its segments, escaping protected characters. | 281 |
| `libs_luasocket_socket_url.escape(s)` | Encodes a binary string by replacing each non-alphanumeric byte with its %XX representation. | 30 |
| `libs_luasocket_socket_url.parse(url, default)` | Splits a URL into a table with the fields scheme, authority, userinfo, user, password, host, port, path, params, query, fragment (only those present are filled). The leading '/' of the path is part of path. | 126 |
| `libs_luasocket_socket_url.parse_path(path)` | Splits a path into (decoded) segments; a path starting with '/' gives an is_absolute field. | 260 |
| `libs_luasocket_socket_url.unescape(s)` | Decodes the %XX sequences of a string into bytes. | 73 |

### Parameter details

#### `libs_luasocket_socket_url.absolute(base_url, relative_url)`

Builds an absolute URL from a base URL and a relative URL (RFC 2396).

- `base_url` (*string|table*) : Base URL (string or table from parse).
- `relative_url` (*string|table*) : Relative URL (string or table from parse).
- **returns**: string Corresponding absolute URL.

#### `libs_luasocket_socket_url.build(parsed)`

Rebuilds a URL from a table of the type returned by parse; components containing reserved characters are protected.

- `parsed` (*table*) : URL parts.
- **returns**: string Built URL.

#### `libs_luasocket_socket_url.build_path(parsed, unsafe)`

Rebuilds a path from its segments, escaping protected characters.

- `parsed` (*table*) : Path segments (as returned by parse_path).
- `unsafe` (*boolean|nil*) : If true, the segments are not protected before building.
- **returns**: string Built path.

#### `libs_luasocket_socket_url.escape(s)`

Encodes a binary string by replacing each non-alphanumeric byte with its %XX representation.

- `s` (*string*) : String to encode.
- **returns**: string Escaped string.

#### `libs_luasocket_socket_url.parse(url, default)`

Splits a URL into a table with the fields scheme, authority, userinfo, user, password, host, port, path, params, query, fragment (only those present are filled). The leading '/' of the path is part of path.

- `url` (*string*) : URL to parse.
- `default` (*table|nil*) : Default values copied into the result before parsing.
- **returns**: table|nil URL parts, or nil and "invalid url".

#### `libs_luasocket_socket_url.parse_path(path)`

Splits a path into (decoded) segments; a path starting with '/' gives an is_absolute field.

- `path` (*string*) : URL path.
- **returns**: table List of segments (one per entry).

#### `libs_luasocket_socket_url.unescape(s)`

Decodes the %XX sequences of a string into bytes.

- `s` (*string*) : Escaped string.
- **returns**: string Decoded string.

## Fields

| Field | Type | Description |
|---|---|---|
| `_VERSION` | string | Module version: "URL 1.0.3". |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/libs/luasocket/socket/url.lua`.*
