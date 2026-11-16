---@meta
-- tim19Atlas stub generated from lua/common/libs/luamqtt/mqtt/luasocket_ssl.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- luamqtt network connector for TLS connections: opens a TCP socket through the luasocket connector, then wraps it with ssl.wrap (luasec module or compatible, named conn.ssl_module, 'ssl' by default) and performs the handshake. send, receive and settimeout are those of luasocket.
--- Access: global `connector`
---@class connector
connector = {}

--- TCP + TLS connection. Replaces conn.sock with the secure socket.
---Source: lua/common/libs/luamqtt/mqtt/luasocket_ssl.lua:13
---@param conn table host, port, secure_params, ssl_module.
---@return boolean  Success.
---@return string|nil  Error.
function connector.connect(conn) end

--- Same as luasocket.receive. (dynamically assigned)
---Source: lua/common/libs/luamqtt/mqtt/luasocket_ssl.lua:dyn
---@param conn table Connection.
---@param size integer Bytes.
function connector.receive(conn, size) end

--- Same as luasocket.send. (dynamically assigned)
---Source: lua/common/libs/luamqtt/mqtt/luasocket_ssl.lua:dyn
---@param conn table Connection.
---@param data string Data.
---@param i integer|nil Start.
---@param j integer|nil End.
function connector.send(conn, data, i, j) end

--- Same as luasocket.settimeout. (dynamically assigned)
---Source: lua/common/libs/luamqtt/mqtt/luasocket_ssl.lua:dyn
---@param conn table Connection.
---@param timeout number|nil Seconds.
function connector.settimeout(conn, timeout) end

--- Closes the connection with conn.sock:close().
---Source: lua/common/libs/luamqtt/mqtt/luasocket_ssl.lua:44
---@param conn table Connection.
function connector.shutdown(conn) end

