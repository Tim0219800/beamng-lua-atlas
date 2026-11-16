---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/wsTest.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Development tool: starts a web/WebSocket server (port 8083, "bng-test" protocol, page ./ui/entrypoints/util_wsTest/) listening on all addresses. A remote client can run GE Lua code, reload Lua, reload the CEF UI, open the CEF developer console and measure bandwidth. Used for testing external tools.
--- Access: extension `util_wsTest`: `extensions.load("util_wsTest")`, then the global `util_wsTest`
---@class util_wsTest
util_wsTest = {}

--- Creates (or retrieves) the WebSocket server via utils/wsUtils on port 8083 and prints its address in the console.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/wsTest.lua:17
function util_wsTest.onExtensionLoaded() end

--- Destroys the WebSocket server (BNGWebWSServer.destroy) if it exists.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/wsTest.lua:23
function util_wsTest.onExtensionUnloaded() end

--- Each frame: reads the clients' events, answers ping, decodes the JSON commands and processes them, then updates the server.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/wsTest.lua:73
function util_wsTest.onUpdate() end

