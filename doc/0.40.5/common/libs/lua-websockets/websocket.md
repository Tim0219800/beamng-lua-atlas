# `libs_lua_websockets_websocket`

*File: `lua/common/libs/lua-websockets/websocket.lua` · VM: Common (GE + vehicle) · 34 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("libs/lua-websockets/websocket")`

Entry point of the third-party lua-websockets library (Gerhard Lipp, MIT license), a pure-Lua WebSocket (RFC 6455) implementation. This module groups the client and server submodules (loaded on demand) and the frame opcode constants. It is loaded via require('libs/lua-websockets/websocket').

## Example

```lua
local ws = require('libs/lua-websockets/websocket')
local c = ws.client.new({timeout = 2})
local ok, err = c:connect('ws://127.0.0.1:8080', 'echo')
if ok then c:send('hello', ws.TEXT) end
```

## Notes

- The internal requires use the path 'libs/lua-websockets/websocket.frame' (with a dot); this is Lua's require convention, equivalent to a slash.
- The 'ev' backends (client_ev, server_ev) require the 'ev' library (lua-ev) and the 'copas' backends require 'libs/copas/copas'; without these dependencies, the require fails.

## Fields

| Field | Type | Description |
|---|---|---|
| `BINARY` | integer | Opcode 2: binary message. |
| `CLOSE` | integer | Opcode 8: connection close. |
| `CONTINUATION` | integer | Opcode 0: continuation frame of a fragmented message. |
| `PING` | integer | Opcode 9: ping. |
| `PONG` | integer | Opcode 10: pong. |
| `TEXT` | integer | Opcode 1: text message. |
| `client` | table | Lazy table (see websocket/client.lua): client.new / client.sync (synchronous backend), client.copas, client.ev. |
| `server` | table | Lazy table (see websocket/server.lua): server.copas, server.ev. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/libs/lua-websockets/websocket.lua`.*
