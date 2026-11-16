---@meta
-- tim19Atlas stub generated from lua/ge/extensions/mcp/server.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- MCP (Model Context Protocol) server built into the game. It opens a small local HTTP server (via the C++ server BNGWebWSServer) at http://127.0.0.1:29292/mcp and speaks JSON-RPC 2.0 there over the "Streamable HTTP" transport (POST only). An MCP client (Cursor, Claude, etc.) can thus list and call the tools exposed by the mcp_tools extension (run Lua in the game, read logs, capture the screen, drive vehicles, camera, editor, UI...). This module only contains the protocol plumbing; the tools themselves are in mcp_tools and mcp/tools/*.lua.
--- Access: extension `mcp_server`: `extensions.load("mcp_server")`, then the global `mcp_server`
---@class mcp_server
mcp_server = {}

--- Returns whether the server is really listening: the published port matches the current port, the server exists and `server:isListening()` is true. Used by ge/main.lua (tryCompleteLuaReload) to wait for the server to restart before finishing a Lua reload.
---Source: lua/ge/extensions/mcp/server.lua:171
---@return boolean  true if the HTTP listener is ready.
function mcp_server.isReady() end

--- Called after a Lua VM reload: restarts the server if `data.active` was true.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/mcp/server.lua:169
---@param data table|nil Table returned by onSerialize.
function mcp_server.onDeserialize(data) end

--- Hook called when the extension is loaded: starts the HTTP server (BNGWebWSServer.getOrCreate on the current host/port, route /mcp).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/mcp/server.lua:161
function mcp_server.onExtensionLoaded() end

--- Hook called on unload: destroys the HTTP server if it exists.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/mcp/server.lua:163
function mcp_server.onExtensionUnloaded() end

--- Extension hook called on load: sets the extension to manual unload mode so that it is not unloaded on level or game mode changes.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/mcp/server.lua:159
function mcp_server.onInit() end

--- Called before a Lua VM reload (Ctrl+L): remembers whether the server was active.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/mcp/server.lua:168
---@return table  {active = boolean}
function mcp_server.onSerialize() end

--- Hook called every frame: publishes the port once binding succeeds, runs the watchdog (every 2 s, changes port if the listener went down), then reads pending HTTP requests (getHttpRequests): POST -> handleRpc and JSON response, other method -> 405.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/mcp/server.lua:121
---@param dtReal number Actual frame duration in seconds.
function mcp_server.onUpdate(dtReal) end

