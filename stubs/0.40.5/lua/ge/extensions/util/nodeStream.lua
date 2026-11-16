---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/nodeStream.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Local WebSocket server (127.0.0.1:8088, name "nodestream") that broadcasts the player vehicle's structure live to an external client (3D viewer, debugging tool). The client can request: the initial node positions, the flexbody mapping data, starting/stopping the stream of current positions (every 0.1 s), or loading an extension. Other JSON messages are relayed to extensions via the onWebSocketHandlerMessage hook.
--- Access: extension `util_nodeStream`: `extensions.load("util_nodeStream")`, then the global `util_nodeStream`
---@class util_nodeStream
util_nodeStream = {}

--- Called on load: creates (or retrieves) the WebSocket server via wsUtils.createOrGetWS on 127.0.0.1:8088.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/nodeStream.lua:214
function util_nodeStream.onExtensionLoaded() end

--- Called on unload: destroys the WebSocket server (BNGWebWSServer.destroy).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/nodeStream.lua:225
function util_nodeStream.onExtensionUnloaded() end

--- Hook called every frame: broadcasts node positions if the stream is active (0.1 s interval), handles client events (connection C, disconnection DC, data D), then updates the server.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/nodeStream.lua:234
---@param dt number Time delta in seconds
function util_nodeStream.onUpdate(dt) end

