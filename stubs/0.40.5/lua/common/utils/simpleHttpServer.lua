---@meta
-- tim19Atlas stub generated from lua/common/utils/simpleHttpServer.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Non-blocking mini HTTP server that serves static files from a folder (with MIME type detection by extension and libs/resty/template templates for .htmlt/.jst) and Lua handlers by URL pattern. Loaded with require('utils/simpleHttpServer'). Intended only for safe environments (the file says so): slow, small files, insecure.
--- Access: global `ws`
---@class ws
ws = {}

--- Creates the TCP socket, binds it to the host/port and puts it in non-blocking listen mode. If bind fails, logs an error, closes the socket and gives up.
---Source: lua/common/utils/simpleHttpServer.lua:68
---@param _bindhost string Listen address, e.g. '127.0.0.1'
---@param _bindport integer TCP port
---@param _fileroot string Root folder of the served files (concatenated to the URL path)
---@param _handlers table|nil List of {pattern, function} (see notes), empty by default
---@param _argsCallback function|nil function(req, path) -> table: variables passed to the .htmlt/.jst templates
function ws.start(_bindhost, _bindport, _fileroot, _handlers, _argsCallback) end

--- Closes the listening socket and logs the closure.
---Source: lua/common/utils/simpleHttpServer.lua:90
function ws.stop() end

--- To be called every frame: accepts new clients, reads ready GET requests, builds the response (handler or file) and pumps it to the client (closing at the end). Does nothing if the server is not started.
---Source: lua/common/utils/simpleHttpServer.lua:235
function ws.update() end

