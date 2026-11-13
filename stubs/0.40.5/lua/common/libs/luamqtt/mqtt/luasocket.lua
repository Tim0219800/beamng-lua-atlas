---@meta
-- tim19Atlas stub generated from lua/common/libs/luamqtt/mqtt/luasocket.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- DOC: http://w3.impa.br/~diego/software/luasocket/tcp.html
---  module table
--- Accès : globale `connector`
---@class connector
connector = {}

--- Open network connection to .host and .port in conn table
---  Store opened socket to conn table
---  Returns true on success, or false and error text on failure
---Source : lua/common/libs/luamqtt/mqtt/luasocket.lua:11
---@param conn any
function connector.connect(conn) end

--- Receive given amount of data from network connection
---Source : lua/common/libs/luamqtt/mqtt/luasocket.lua:33
---@param conn any
---@param size any
function connector.receive(conn, size) end

--- Send data to network connection
---Source : lua/common/libs/luamqtt/mqtt/luasocket.lua:26
---@param conn any
---@param data any
---@param i any
---@param j any
function connector.send(conn, data, i, j) end

--- Set connection's socket to non-blocking mode and set a timeout for it
---Source : lua/common/libs/luamqtt/mqtt/luasocket.lua:44
---@param conn any
---@param timeout any
function connector.settimeout(conn, timeout) end

--- Shutdown network connection
---Source : lua/common/libs/luamqtt/mqtt/luasocket.lua:21
---@param conn any
function connector.shutdown(conn) end

