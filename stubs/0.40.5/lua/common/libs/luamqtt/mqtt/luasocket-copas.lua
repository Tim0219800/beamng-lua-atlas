---@meta
-- tim19Atlas stub generated from lua/common/libs/luamqtt/mqtt/luasocket-copas.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- luamqtt network connector for luasocket combined with copas (cooperative I/O in coroutines). Same interface as the luasocket connector (connect, shutdown, send, receive, settimeout) but send and receive go through copas.send/copas.receive. To be passed in the connector argument of the MQTT client.
--- Access: `require("libs/luamqtt/mqtt/luasocket-copas")`
---@class libs_luamqtt_mqtt_luasocket_copas
local libs_luamqtt_mqtt_luasocket_copas = {}

--- Opens the TCP connection via socket.connect and stores it in conn.sock.
---Source: lua/common/libs/luamqtt/mqtt/luasocket-copas.lua:13
---@param conn table host, port.
---@return boolean  Success.
---@return string|nil  Error.
function libs_luamqtt_mqtt_luasocket_copas.connect(conn) end

--- Receives size bytes via copas.receive.
---Source: lua/common/libs/luamqtt/mqtt/luasocket-copas.lua:34
---@param conn table Connection.
---@param size integer Bytes.
function libs_luamqtt_mqtt_luasocket_copas.receive(conn, size) end

--- Sends via copas.send.
---Source: lua/common/libs/luamqtt/mqtt/luasocket-copas.lua:28
---@param conn table Connection.
---@param data string Data.
---@param i integer|nil Start.
---@param j integer|nil End.
function libs_luamqtt_mqtt_luasocket_copas.send(conn, data, i, j) end

--- Stores the timeout in conn.timeout and sets the socket to non-blocking.
---Source: lua/common/libs/luamqtt/mqtt/luasocket-copas.lua:40
---@param conn table Connection.
---@param timeout number Seconds.
function libs_luamqtt_mqtt_luasocket_copas.settimeout(conn, timeout) end

--- Calls conn.sock:shutdown().
---Source: lua/common/libs/luamqtt/mqtt/luasocket-copas.lua:23
---@param conn table Connection.
function libs_luamqtt_mqtt_luasocket_copas.shutdown(conn) end

return libs_luamqtt_mqtt_luasocket_copas
