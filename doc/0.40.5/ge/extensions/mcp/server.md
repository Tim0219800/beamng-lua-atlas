# `mcp_server`

*File: `lua/ge/extensions/mcp/server.lua` · VM: Game Engine (GE) · 184 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `mcp_server`: `extensions.load("mcp_server")`, then the global `mcp_server`

MCP (Model Context Protocol) server built into the game. It opens a small local HTTP server (via the C++ server BNGWebWSServer) at http://127.0.0.1:29292/mcp and speaks JSON-RPC 2.0 there over the "Streamable HTTP" transport (POST only). An MCP client (Cursor, Claude, etc.) can thus list and call the tools exposed by the mcp_tools extension (run Lua in the game, read logs, capture the screen, drive vehicles, camera, editor, UI...). This module only contains the protocol plumbing; the tools themselves are in mcp_tools and mcp/tools/*.lua.

## Example

```lua
-- activation: user setting enableMcp (default false), or command-line argument -enablemcp
-- command-line options: -mcpport 30000 (base port), -mcpremote (listen on all interfaces)
-- manual loading possible:
extensions.load('mcp_server')
-- endpoint: POST http://127.0.0.1:29292/mcp
-- {"jsonrpc":"2.0","id":1,"method":"tools/list"}
```

## Notes

- Activation: the `enableMcp` setting (default `false`, "local" type in settings/defaults.json) is read in core/settings: if true and the command line does not contain `-nowebservers`, the `mcp_server` extension is loaded; otherwise it is unloaded. The `-enablemcp` argument (handled in ge/main.lua) forces `enableMcp = true`. The engine is informed of the state by Engine.setMcpPort: 0 = loading in progress, -1 = disabled, otherwise the actual port.
- Transport: only POST on the `/mcp` route is handled; any other HTTP method (including GET, so no SSE stream or server notifications) gets 405. No session id. Single JSON-RPC requests and batches (arrays) are accepted; a notification (without id) or a batch with no request gets an empty 202 response. Invalid JSON: error -32700 with HTTP status 200.
- JSON-RPC methods handled: `initialize`, `tools/list`, `tools/call`, `ping`. Any other returns error -32601. `initialize` replies with the requested version if it is one of 2025-03-26 / 2025-06-18 / 2025-11-25, otherwise with 2025-11-25; serverInfo = {name='beamng-game', version='1.0.0'}; capabilities: only `tools` (listChanged=false). No resources or prompts.
- Tools: any function field of the `mcp_tools` extension whose name does not start with `on` + uppercase letter is a tool. `inputSchema` and `description` come from `mcp_tools.schemas[name]` (default `{type='object'}` and empty description). A tool receives the `arguments` table and returns `(text, isError)`. A table `{data=<base64>, mimeType=...}` is returned as `image` content, everything else as `text` (tostring). A tool that crashes is caught by pcall: `isError=true` and text "tool crashed: …".
- After each tool call the hook `onMcpToolCalled(toolName, isError)` is emitted; only the telemetry tracker (telemetry/trackers/mcp.lua) listens to it and records only the name and the error flag, not the arguments or the result.
- Network and security: listens on 127.0.0.1 only by default; `-mcpremote` sets the host to "any" (all interfaces). No authentication or origin check is done in this code, even though the tools allow running arbitrary Lua (run_lua, load_file) and reading/writing files (read_file, write_file, delete_file…). Reserve for a trusted machine, especially with -mcpremote.
- Port: `-mcpport N` sets the base port (default 29292). If the port is busy or if the listener goes down, a watchdog (checked every 2 s in onUpdate) destroys the server and tries the next port, looping over 20 consecutive ports (BASE_PORT … BASE_PORT+19). The port actually bound is published to the engine (Engine.setMcpPort) and logged "MCP listening on http://…/mcp"; a client may therefore need to find the port (supervisor's "?info" request on the C++ side).
- Lifecycle: onInit sets the extension to manual unload mode (`setExtensionUnloadMode(M, 'manual')`): it survives level and game mode changes. onSerialize/onDeserialize restart the server after a Lua reload (Ctrl+L). The `mcp_tools` dependency is loaded first.
- HTTP requests are handled in onUpdate (so on the main GE thread, once per frame): a slow tool blocks the game; a request is therefore only served if the game is running. "Asynchronous" tools (get_ai, get_electrics, screenshot_image, ui_eval…) return the result of the previous call or a "call again" message: the client must call them again.

## Functions

| Function | Description | Line |
|---|---|---|
| `mcp_server.isReady()` | Returns whether the server is really listening: the published port matches the current port, the server exists and `server:isListening()` is true. Used by ge/main.lua (tryCompleteLuaReload) to wait for the server to restart before finishing a Lua reload. | 171 |
| `mcp_server.onDeserialize(data)` | Called after a Lua VM reload: restarts the server if `data.active` was true. *(internal)* *(hook)* | 169 |
| `mcp_server.onExtensionLoaded()` | Hook called when the extension is loaded: starts the HTTP server (BNGWebWSServer.getOrCreate on the current host/port, route /mcp). *(internal)* *(hook)* | 161 |
| `mcp_server.onExtensionUnloaded()` | Hook called on unload: destroys the HTTP server if it exists. *(internal)* *(hook)* | 163 |
| `mcp_server.onInit()` | Extension hook called on load: sets the extension to manual unload mode so that it is not unloaded on level or game mode changes. *(internal)* *(hook)* | 159 |
| `mcp_server.onSerialize()` | Called before a Lua VM reload (Ctrl+L): remembers whether the server was active. *(internal)* *(hook)* | 168 |
| `mcp_server.onUpdate(dtReal)` | Hook called every frame: publishes the port once binding succeeds, runs the watchdog (every 2 s, changes port if the listener went down), then reads pending HTTP requests (getHttpRequests): POST -> handleRpc and JSON response, other method -> 405. *(internal)* *(hook)* | 121 |

### Parameter details

#### `mcp_server.isReady()`

Returns whether the server is really listening: the published port matches the current port, the server exists and `server:isListening()` is true. Used by ge/main.lua (tryCompleteLuaReload) to wait for the server to restart before finishing a Lua reload.

- **returns**: boolean true if the HTTP listener is ready.

#### `mcp_server.onDeserialize(data)`

Called after a Lua VM reload: restarts the server if `data.active` was true.

- `data` (*table|nil*) : Table returned by onSerialize.

#### `mcp_server.onSerialize()`

Called before a Lua VM reload (Ctrl+L): remembers whether the server was active.

- **returns**: table {active = boolean}

#### `mcp_server.onUpdate(dtReal)`

Hook called every frame: publishes the port once binding succeeds, runs the watchdog (every 2 s, changes port if the listener went down), then reads pending HTTP requests (getHttpRequests): POST -> handleRpc and JSON response, other method -> 405.

- `dtReal` (*number*) : Actual frame duration in seconds.

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onMcpToolCalled` — listened to by 1 module(s)

## Calls into the engine (C++)

- `Engine.` `getStartingArgs`, `setMcpPort`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/mcp/server.lua`.*
