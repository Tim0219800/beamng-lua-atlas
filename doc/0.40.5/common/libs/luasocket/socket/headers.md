# `libs_luasocket_socket_headers`

*File: `lua/common/libs/luasocket/socket/headers.lua` · VM: Common (GE + vehicle) · 104 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("libs/luasocket/socket/headers")`

Canonical formatting table for header names (MIME/HTTP) of LuaSocket: maps a lowercase name to its usual form (e.g. 'content-type' -> 'Content-Type'). The module also registers itself in socket.headers. Used by socket.http when sending request headers.

## Example

```lua
local headers = require('libs/luasocket/socket/headers')
print(headers.canonic['content-type'])  -- 'Content-Type'
```

## Notes

- The module does require('socket.socket') (and not libs/luasocket/socket/socket), which assumes that this module name is resolvable by the game's search path.

## Fields

| Field | Type | Description |
|---|---|---|
| `canonic` | table<string, string> | Lowercase header names to their canonical capitalization; a name absent from the table is sent as is. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/libs/luasocket/socket/headers.lua`.*
