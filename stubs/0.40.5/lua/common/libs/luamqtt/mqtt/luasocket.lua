---@meta
-- tim19Atlas stub generated from lua/common/libs/luamqtt/mqtt/luasocket.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Default luamqtt network connector, based on luasocket. It manipulates a connection table 'conn' (host, port, sock, timeout) created by the MQTT client. Each function takes conn as its first argument; errors are returned as false, 'text'.
--- Access: global `connector`
---@class connector
connector = {}

--- Opens a TCP connection to conn.host:conn.port via socket.connect and stores the socket in conn.sock.
---Source: lua/common/libs/luamqtt/mqtt/luasocket.lua:11
---@param conn table Connection table (host, port).
---@return boolean  true if connected, false otherwise.
---@return string|nil  Error message.
function connector.connect(conn) end

--- Receives exactly size bytes (conn.sock:receive).
---Source: lua/common/libs/luamqtt/mqtt/luasocket.lua:33
---@param conn table Connection.
---@param size integer Bytes to read.
---@return string|nil  Data.
---@return string|nil  Error, e.g. 'timeout' or 'closed'.
function connector.receive(conn, size) end

--- Sends data (conn.sock:send).
---Source: lua/common/libs/luamqtt/mqtt/luasocket.lua:26
---@param conn table Connection.
---@param data string Data.
---@param i integer|nil Substring start.
---@param j integer|nil Substring end.
---@return integer|nil  Index of the last byte sent.
---@return string|nil  Error.
function connector.send(conn, data, i, j) end

--- Stores conn.timeout and sets the socket's total timeout (mode 't').
---Source: lua/common/libs/luamqtt/mqtt/luasocket.lua:44
---@param conn table Connection.
---@param timeout number|nil Seconds.
function connector.settimeout(conn, timeout) end

--- Closes the connection with conn.sock:shutdown().
---Source: lua/common/libs/luamqtt/mqtt/luasocket.lua:21
---@param conn table Connection.
function connector.shutdown(conn) end

