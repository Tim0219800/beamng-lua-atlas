# `utils_wsUtils`

*File: `lua/common/utils/wsUtils.lua` · VM: Common (GE + vehicle) · 108 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("utils/wsUtils")`

Tools for the engine's WebSockets (BNGWebWSServer / BNGWSClient). Provides createOrGetWS, which creates (or retrieves) a WebSocket server and chooses the IP address to give to clients, by testing with a real round trip which network cards are reachable. Loaded with require('utils/wsUtils'). Used by extensions that expose data to external tools.

## Example

```lua
local ws = require('utils/wsUtils')
local server, address = ws.createOrGetWS('0.0.0.0', 8081, '/', 'myProtocol', nil, true)
```

## Notes

- If listenAddr is neither '0.0.0.0' nor 'any', the returned address is always 'localhost'.
- If the network sandbox (Engine.Sandbox.Network) is active, the returned address is 'localhost' without testing.
- Otherwise, each IPv4 network card (excluding descriptions containing virtualbox/vmware) is tested by testWSConnection (sending a random string, echo, 20 attempts in each direction); the first one that responds is kept, otherwise the first real IPv4, otherwise 'localhost'.
- The server is managed by its own thread on the engine side: the test only pumps the client and reads the server's event queue, never server:update().

## Functions

| Function | Description | Line |
|---|---|---|
| `utils_wsUtils.createOrGetWS(listenAddr, port, path, protocolName, redirPage, enableDataStreams, useTLS)` | Creates or retrieves a WebSocket server (BNGWebWSServer.getOrCreate), determines the address clients must use, and optionally enables data streams (server:enableDataStreams). | 92 |

### Parameter details

#### `utils_wsUtils.createOrGetWS(listenAddr, port, path, protocolName, redirPage, enableDataStreams, useTLS)`

Creates or retrieves a WebSocket server (BNGWebWSServer.getOrCreate), determines the address clients must use, and optionally enables data streams (server:enableDataStreams).

- `listenAddr` (*string*) : Listen address: '0.0.0.0'/'any' (local network) or 'localhost'/127.0.0.1
- `port` (*integer*) : Server port
- `path` (*string*) : WebSocket path
- `protocolName` (*string*) : WebSocket protocol name
- `redirPage` (*string|nil*) : Page to redirect plain HTTP requests to (passed to the engine)
- `enableDataStreams` (*boolean|nil*) : true by default (nil): enables enableDataStreams on the server
- `useTLS` (*boolean|nil*) : Only true enables TLS
- **returns**: userdata BNGWebWSServer server
- **returns**: string Recommended address for clients

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/utils/wsUtils.lua`.*
