---@meta
-- tim19Atlas stub generated from lua/common/libs/luamqtt/mqtt/ngxsocket.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- luamqtt network connector for OpenResty/nginx (ngx.socket.tcp). Unusable in BeamNG: the file reads the global ngx at load time, which does not exist in the game. Same interface as the other connectors.
--- Access: `require("libs/luamqtt/mqtt/ngxsocket")`
---@class libs_luamqtt_mqtt_ngxsocket
local libs_luamqtt_mqtt_ngxsocket = {}

--- Opens an ngx socket, connects to conn.host:conn.port (very long timeout), performs sslhandshake if conn.secure, stores it in conn.sock.
---Source: lua/common/libs/luamqtt/mqtt/ngxsocket.lua:12
---@param conn table host, port, secure.
---@return boolean  Success.
---@return string|nil  Error.
function libs_luamqtt_mqtt_ngxsocket.connect(conn) end

--- Receives size bytes.
---Source: lua/common/libs/luamqtt/mqtt/ngxsocket.lua:41
---@param conn table Connection.
---@param size integer Bytes.
function libs_luamqtt_mqtt_ngxsocket.receive(conn, size) end

--- Sends the data (substring i..j if i is given).
---Source: lua/common/libs/luamqtt/mqtt/ngxsocket.lua:32
---@param conn table Connection.
---@param data string Data.
---@param i integer|nil Start.
---@param j integer|nil End.
function libs_luamqtt_mqtt_ngxsocket.send(conn, data, i, j) end

--- Sets the socket timeout.
---Source: lua/common/libs/luamqtt/mqtt/ngxsocket.lua:46
---@param conn table Connection.
---@param timeout number|nil Seconds.
function libs_luamqtt_mqtt_ngxsocket.settimeout(conn, timeout) end

--- Closes the socket.
---Source: lua/common/libs/luamqtt/mqtt/ngxsocket.lua:27
---@param conn table Connection.
function libs_luamqtt_mqtt_ngxsocket.shutdown(conn) end

return libs_luamqtt_mqtt_ngxsocket
