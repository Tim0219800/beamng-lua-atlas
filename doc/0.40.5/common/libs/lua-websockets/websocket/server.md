# `server`

*File: `lua/common/libs/lua-websockets/websocket/server.lua` · VM: Common (GE + vehicle) · 7 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** global `server`

WebSocket server backend selector of lua-websockets. Returns a table whose __index loads 'websocket/server_copas' or 'websocket/server_ev' on demand according to the requested name (server.copas, server.ev); any other name returns nil.

## Example

```lua
local server = require('libs/lua-websockets/websocket.server')
server.copas.listen({port = 8080, default = function(client) end})
```

## Notes

- The backend is cached in the table after the first access.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/libs/lua-websockets/websocket/server.lua`.*
