---@meta
-- tim19Atlas stub generated from lua/common/libs/luamqtt/mqtt/ngxsocket.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- module table
---  thanks to @irimiab: https://github.com/xHasKx/luamqtt/issues/13
--- Accès : `require("libs/luamqtt/mqtt/ngxsocket")`
---@class libs_luamqtt_mqtt_ngxsocket
local libs_luamqtt_mqtt_ngxsocket = {}

--- Open network connection to .host and .port in conn table
---  Store opened socket to conn table
---  Returns true on success, or false and error text on failure
---Source : lua/common/libs/luamqtt/mqtt/ngxsocket.lua:12
---@param conn any
function libs_luamqtt_mqtt_ngxsocket.connect(conn) end

--- Receive given amount of data from network connection
---Source : lua/common/libs/luamqtt/mqtt/ngxsocket.lua:41
---@param conn any
---@param size any
function libs_luamqtt_mqtt_ngxsocket.receive(conn, size) end

--- Send data to network connection
---Source : lua/common/libs/luamqtt/mqtt/ngxsocket.lua:32
---@param conn any
---@param data any
---@param i any
---@param j any
function libs_luamqtt_mqtt_ngxsocket.send(conn, data, i, j) end

--- Set connection's socket to non-blocking mode and set a timeout for it
---Source : lua/common/libs/luamqtt/mqtt/ngxsocket.lua:46
---@param conn any
---@param timeout any
function libs_luamqtt_mqtt_ngxsocket.settimeout(conn, timeout) end

--- Shutdown network connection
---Source : lua/common/libs/luamqtt/mqtt/ngxsocket.lua:27
---@param conn any
function libs_luamqtt_mqtt_ngxsocket.shutdown(conn) end

return libs_luamqtt_mqtt_ngxsocket
