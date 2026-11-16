---@meta
-- tim19Atlas stub generated from lua/common/utils/httpJsonServer.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Non-blocking mini HTTP server that replies in JSON, to quickly set up a local REST API (external tools, editors). Loaded with require('utils/httpJsonServer'); init() opens the port, then update() must be called regularly (every frame). Only GET requests are handled.
--- Access: `require("utils/httpJsonServer")`
---@class utils_httpJsonServer
local utils_httpJsonServer = {}

--- Creates the TCP socket, binds it to the host/port, puts it in non-blocking listen mode and stores the request-handling callback.
---Source: lua/common/utils/httpJsonServer.lua:52
---@param _bindhost string Listen address, e.g. 'localhost'
---@param _bindport integer TCP port, e.g. 23512
---@param _callback function function(request) -> table|nil: builds the JSON response
function utils_httpJsonServer.init(_bindhost, _bindport, _callback) end

--- To be called regularly: accepts new clients, reads ready GET requests, calls the callback and sends the JSON responses (then closes the connection). Does nothing before init().
---Source: lua/common/utils/httpJsonServer.lua:105
function utils_httpJsonServer.update() end

return utils_httpJsonServer
