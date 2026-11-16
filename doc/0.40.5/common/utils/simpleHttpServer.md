# `ws`

*File: `lua/common/utils/simpleHttpServer.lua` · VM: Common (GE + vehicle) · 309 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** global `ws`

Non-blocking mini HTTP server that serves static files from a folder (with MIME type detection by extension and libs/resty/template templates for .htmlt/.jst) and Lua handlers by URL pattern. Loaded with require('utils/simpleHttpServer'). Intended only for safe environments (the file says so): slow, small files, insecure.

## Example

```lua
local ws = require('utils/simpleHttpServer')
ws.start('127.0.0.1', 8080, '/ui/mon/dossier', {
  {'/hello/(%d+)', function(req, res) return 'hello ' .. res[1] end},
  {'/api/info', function() return {v = beamng_version} end},
}, function(req, path) return {titre = 'x'} end)
-- then every frame: ws.update()
-- ws.stop()
```

## Notes

- Handlers: list of {Lua pattern, function(req, captures)}. The first pattern that captures at least one value wins; if the function returns a table, it is served as JSON, otherwise the returned text is sent as is (complete raw HTTP response).
- A pattern without a capture (e.g. '/api/getInfo/') also works: string.match then returns the whole match, so the #res > 0 test passes.
- Only GET requests are accepted; '/' is redirected to /index.html.
- Bug: the anti '..' protection uses the pattern "\\.\\." which, as a Lua pattern, looks for a backslash followed by any character: the '..' are NOT removed, directory traversal remains possible. Do not expose on a network.
- Bug: in serve_file, `ext == 'htmlt' or ext == 'jst' and argsCallback` has an operator precedence problem: an .htmlt file is rendered with argsCallback even if it is nil (error).
- Inconsistency: stop() closes the socket but does not reset tcp_socket to nil: update() keeps trying to use the closed socket.
- Inconsistency: error responses use non-standard line endings and format (no Content-Length, concatenation `.. message or 'File not found'` with doubtful precedence).
- Closed connections are not removed from the client list (TODO FIXME in the code).

## Functions

| Function | Description | Line |
|---|---|---|
| `ws.start(_bindhost, _bindport, _fileroot, _handlers, _argsCallback)` | Creates the TCP socket, binds it to the host/port and puts it in non-blocking listen mode. If bind fails, logs an error, closes the socket and gives up. | 68 |
| `ws.stop()` | Closes the listening socket and logs the closure. | 90 |
| `ws.update()` | To be called every frame: accepts new clients, reads ready GET requests, builds the response (handler or file) and pumps it to the client (closing at the end). Does nothing if the server is not started. | 235 |

### Parameter details

#### `ws.start(_bindhost, _bindport, _fileroot, _handlers, _argsCallback)`

Creates the TCP socket, binds it to the host/port and puts it in non-blocking listen mode. If bind fails, logs an error, closes the socket and gives up.

- `_bindhost` (*string*) : Listen address, e.g. '127.0.0.1'
- `_bindport` (*integer*) : TCP port
- `_fileroot` (*string*) : Root folder of the served files (concatenated to the URL path)
- `_handlers` (*table|nil*) : List of {pattern, function} (see notes), empty by default
- `_argsCallback` (*function|nil*) : function(req, path) -> table: variables passed to the .htmlt/.jst templates

## Calls into the engine (C++)

- `FS:` `fileExists`, `stat`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/utils/simpleHttpServer.lua`.*
