# `utils_httpJsonServer`

*File: `lua/common/utils/httpJsonServer.lua` · VM: Common (GE + vehicle) · 163 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("utils/httpJsonServer")`

Non-blocking mini HTTP server that replies in JSON, to quickly set up a local REST API (external tools, editors). Loaded with require('utils/httpJsonServer'); init() opens the port, then update() must be called regularly (every frame). Only GET requests are handled.

## Example

```lua
local srv = require('utils/httpJsonServer')
local function handle(request)
  if request.uri and request.uri.path == 'v1/ping' then return {ok = true} end
  -- returning nil gives a {ok=false, error=500} response
end
srv.init('localhost', 23512, handle)
-- then, every frame: srv.update()
```

## Notes

- The callback receives {uri = (url.parse table), headers = {lowercaseName = value}}. uri.path does not start with '/' (the pattern captures what follows 'GET /').
- The callback must return a JSON-serializable table; nil produces {ok=false, error=500} (the actual HTTP code remains that of the server's response, the 500 is in the JSON body).
- If bind fails, an error is logged but the code continues (settimeout/listen are still called).
- Closed connections are not removed from the client lists (TODO FIXME in the code): possible leak.
- Uses non-blocking socket.select, a 0.1 s timeout per readable client, and ltn12 to send in blocks of 4096 bytes.

## Functions

| Function | Description | Line |
|---|---|---|
| `utils_httpJsonServer.init(_bindhost, _bindport, _callback)` | Creates the TCP socket, binds it to the host/port, puts it in non-blocking listen mode and stores the request-handling callback. | 52 |
| `utils_httpJsonServer.update()` | To be called regularly: accepts new clients, reads ready GET requests, calls the callback and sends the JSON responses (then closes the connection). Does nothing before init(). | 105 |

### Parameter details

#### `utils_httpJsonServer.init(_bindhost, _bindport, _callback)`

Creates the TCP socket, binds it to the host/port, puts it in non-blocking listen mode and stores the request-handling callback.

- `_bindhost` (*string*) : Listen address, e.g. 'localhost'
- `_bindport` (*integer*) : TCP port, e.g. 23512
- `_callback` (*function*) : function(request) -> table|nil: builds the JSON response

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/utils/httpJsonServer.lua`.*
