# `client`

*File: `lua/common/libs/lua-websockets/websocket/client.lua` · VM: Common (GE + vehicle) · 9 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** global `client`

WebSocket client backend selector of lua-websockets. Returns an empty table whose __index loads the module 'websocket/client_<name>' on demand for the names 'sync', 'copas', 'ev' and 'new' (alias of 'sync'). Any other name returns nil without loading anything.

## Example

```lua
local client = require('libs/lua-websockets/websocket.client')
local ws = client.new({timeout = 1})   -- synchronous backend
local wsCopas = client.copas()         -- copas backend
```

## Notes

- The loaded backend is cached in the table (client.sync, client.copas...); client.new is the same object as client.sync.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/libs/lua-websockets/websocket/client.lua`.*
