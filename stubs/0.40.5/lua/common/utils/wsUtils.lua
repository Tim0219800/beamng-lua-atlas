---@meta
-- tim19Atlas stub generated from lua/common/utils/wsUtils.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Tools for the engine's WebSockets (BNGWebWSServer / BNGWSClient). Provides createOrGetWS, which creates (or retrieves) a WebSocket server and chooses the IP address to give to clients, by testing with a real round trip which network cards are reachable. Loaded with require('utils/wsUtils'). Used by extensions that expose data to external tools.
--- Access: `require("utils/wsUtils")`
---@class utils_wsUtils
local utils_wsUtils = {}

--- Creates or retrieves a WebSocket server (BNGWebWSServer.getOrCreate), determines the address clients must use, and optionally enables data streams (server:enableDataStreams).
---Source: lua/common/utils/wsUtils.lua:92
---@param listenAddr string Listen address: '0.0.0.0'/'any' (local network) or 'localhost'/127.0.0.1
---@param port integer Server port
---@param path string WebSocket path
---@param protocolName string WebSocket protocol name
---@param redirPage string|nil Page to redirect plain HTTP requests to (passed to the engine)
---@param enableDataStreams boolean|nil true by default (nil): enables enableDataStreams on the server
---@param useTLS boolean|nil Only true enables TLS
---@return userdata  BNGWebWSServer server
---@return string  Recommended address for clients
function utils_wsUtils.createOrGetWS(listenAddr, port, path, protocolName, redirPage, enableDataStreams, useTLS) end

return utils_wsUtils
