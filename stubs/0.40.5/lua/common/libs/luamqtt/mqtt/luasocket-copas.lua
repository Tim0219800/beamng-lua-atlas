---@meta
-- tim19Atlas stub generated from lua/common/libs/luamqtt/mqtt/luasocket-copas.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- DOC: https://keplerproject.github.io/copas/
---  NOTE: you will need to install copas like this: luarocks install copas
---  module table
--- Accès : `require("libs/luamqtt/mqtt/luasocket-copas")`
---@class libs_luamqtt_mqtt_luasocket_copas
local libs_luamqtt_mqtt_luasocket_copas = {}

--- Open network connection to .host and .port in conn table
---  Store opened socket to conn table
---  Returns true on success, or false and error text on failure
---Source : lua/common/libs/luamqtt/mqtt/luasocket-copas.lua:13
---@param conn any
function libs_luamqtt_mqtt_luasocket_copas.connect(conn) end

--- Receive given amount of data from network connection
---Source : lua/common/libs/luamqtt/mqtt/luasocket-copas.lua:34
---@param conn any
---@param size any
function libs_luamqtt_mqtt_luasocket_copas.receive(conn, size) end

--- Send data to network connection
---Source : lua/common/libs/luamqtt/mqtt/luasocket-copas.lua:28
---@param conn any
---@param data any
---@param i any
---@param j any
function libs_luamqtt_mqtt_luasocket_copas.send(conn, data, i, j) end

--- Set connection's socket to non-blocking mode and set a timeout for it
---Source : lua/common/libs/luamqtt/mqtt/luasocket-copas.lua:40
---@param conn any
---@param timeout any
function libs_luamqtt_mqtt_luasocket_copas.settimeout(conn, timeout) end

--- Shutdown network connection
---Source : lua/common/libs/luamqtt/mqtt/luasocket-copas.lua:23
---@param conn any
function libs_luamqtt_mqtt_luasocket_copas.shutdown(conn) end

return libs_luamqtt_mqtt_luasocket_copas
