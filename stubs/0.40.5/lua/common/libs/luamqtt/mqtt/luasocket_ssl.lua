---@meta
-- tim19Atlas stub generated from lua/common/libs/luamqtt/mqtt/luasocket_ssl.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- DOC: http://w3.impa.br/~diego/software/luasocket/tcp.html
---  module table
--- Accès : globale `connector`
---@class connector
---@field receive any
---@field send any
---@field settimeout any
connector = {}

--- Open network connection to .host and .port in conn table
---  Store opened socket to conn table
---  Returns true on success, or false and error text on failure
---Source : lua/common/libs/luamqtt/mqtt/luasocket_ssl.lua:13
---@param conn any
function connector.connect(conn) end

--- Shutdown network connection
---Source : lua/common/libs/luamqtt/mqtt/luasocket_ssl.lua:44
---@param conn any
function connector.shutdown(conn) end

