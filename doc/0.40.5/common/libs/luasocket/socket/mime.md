# `libs_luasocket_socket_mime`

*File: `lua/common/libs/luasocket/socket/mime.lua` · VM: Common (GE + vehicle) · 90 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("libs/luasocket/socket/mime")`

Lua layer of the LuaSocket MIME module (Diego Nehab, RFC 2045-2049): base64 and quoted-printable encoding and decoding, line wrapping, line-ending normalization, dot-stuffing (SMTP). Builds LTN12 filters on top of the native functions of the 'mime.core' module (b64, unb64, qp, unqp, wrp, qpwrp, eol, dot).

## Example

```lua
local mime = require('mime')
local b64 = mime.b64('texte')           -- native (mime.core)
local f = mime.encode('base64')         -- ltn12 filter
local out = f('texte') .. (f(nil) or '')
```

## Notes

- The module does require('mime.core') (native part) and require('ltn12') (bare name): the file depends on them. The returned table is that of mime.core, extended by this file, so it also contains the native functions (b64, unb64, qp, unqp...).
- encode, decode and wrap accept either an algorithm name or directly their options: if the first argument is not a string, the name 'default' is used. An unknown name raises the error 'unknown key (...)'.
- Algorithms: encodet = base64, quoted-printable; decodet = base64, quoted-printable; wrapt = text, base64, default (length 76 by default), quoted-printable.

## Functions

| Function | Description | Line |
|---|---|---|
| `libs_luasocket_socket_mime.normalize(marker)` | Creates a filter that normalizes line endings to the given marker (via mime.eol). | 81 |
| `libs_luasocket_socket_mime.stuff()` | Creates a 'dot-stuffing' filter (doubles the dots at the start of a line, for SMTP) via mime.dot. | 86 |

### Parameter details

#### `libs_luasocket_socket_mime.normalize(marker)`

Creates a filter that normalizes line endings to the given marker (via mime.eol).

- `marker` (*string|nil*) : Desired line ending (e.g. '\r\n').
- **returns**: function LTN12 filter.

#### `libs_luasocket_socket_mime.stuff()`

Creates a 'dot-stuffing' filter (doubles the dots at the start of a line, for SMTP) via mime.dot.

- **returns**: function LTN12 filter.

## Fields

| Field | Type | Description |
|---|---|---|
| `decode` | function | decode(name, opt1, opt2) -> ltn12 decoding filter chosen from decodet. |
| `decodet` | table<string, function> | Decoding filter factories ('base64', 'quoted-printable'). |
| `encode` | function | encode(name, opt1, opt2) -> ltn12 encoding filter chosen from encodet. |
| `encodet` | table<string, function> | Encoding filter factories ('base64', 'quoted-printable'; in 'binary' mode qp uses =0D=0A). |
| `wrap` | function | wrap(name, length) -> ltn12 line-wrapping filter chosen from wrapt. |
| `wrapt` | table<string, function> | Line-wrapping filter factories ('text', 'base64', 'default', 'quoted-printable'). |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/libs/luasocket/socket/mime.lua`.*
