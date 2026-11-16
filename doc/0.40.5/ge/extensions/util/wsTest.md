# `util_wsTest`

*File: `lua/ge/extensions/util/wsTest.lua` · VM: Game Engine (GE) · 103 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `util_wsTest`: `extensions.load("util_wsTest")`, then the global `util_wsTest`

Development tool: starts a web/WebSocket server (port 8083, "bng-test" protocol, page ./ui/entrypoints/util_wsTest/) listening on all addresses. A remote client can run GE Lua code, reload Lua, reload the CEF UI, open the CEF developer console and measure bandwidth. Used for testing external tools.

## Example

```lua
extensions.load('util_wsTest')
```

## Notes

- Security: the execGELua command evaluates arbitrary Lua sent by any connected client, on all network interfaces. Use only in a trusted local environment.
- Recognized JSON commands (field type): execGELua (cmd), reloadGELua, reloadCEF, toggleCEFDevConsole, bandwidthDown, bandwidthUpStart (size). The text message "ping" answers "pong".
- Minor bug: if JSON decoding fails, the error message uses the variable `e`, which is undefined (nil), instead of evt.msg.
- The result of execGELua is returned as is in jsonEncode({result = ...}); an error gives an "Error: ..." string.

## Functions

| Function | Description | Line |
|---|---|---|
| `util_wsTest.onExtensionLoaded()` | Creates (or retrieves) the WebSocket server via utils/wsUtils on port 8083 and prints its address in the console. *(internal)* *(hook)* | 17 |
| `util_wsTest.onExtensionUnloaded()` | Destroys the WebSocket server (BNGWebWSServer.destroy) if it exists. *(internal)* *(hook)* | 23 |
| `util_wsTest.onUpdate()` | Each frame: reads the clients' events, answers ping, decodes the JSON commands and processes them, then updates the server. *(internal)* *(hook)* | 73 |

## Calls into the engine (C++)

- `Lua:` `requestReload`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/util/wsTest.lua`.*
