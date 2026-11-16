# `connector`

*File: `lua/common/libs/luamqtt/mqtt/luasocket.lua` · VM: Common (GE + vehicle) · 53 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** global `connector`

Default luamqtt network connector, based on luasocket. It manipulates a connection table 'conn' (host, port, sock, timeout) created by the MQTT client. Each function takes conn as its first argument; errors are returned as false, 'text'.

## Notes

- Uses require('socket') (the luasocket module by bare name).

## Functions

| Function | Description | Line |
|---|---|---|
| `connector.connect(conn)` | Opens a TCP connection to conn.host:conn.port via socket.connect and stores the socket in conn.sock. | 11 |
| `connector.receive(conn, size)` | Receives exactly size bytes (conn.sock:receive). | 33 |
| `connector.send(conn, data, i, j)` | Sends data (conn.sock:send). | 26 |
| `connector.settimeout(conn, timeout)` | Stores conn.timeout and sets the socket's total timeout (mode 't'). | 44 |
| `connector.shutdown(conn)` | Closes the connection with conn.sock:shutdown(). | 21 |

### Parameter details

#### `connector.connect(conn)`

Opens a TCP connection to conn.host:conn.port via socket.connect and stores the socket in conn.sock.

- `conn` (*table*) : Connection table (host, port).
- **returns**: boolean true if connected, false otherwise.
- **returns**: string|nil Error message.

#### `connector.receive(conn, size)`

Receives exactly size bytes (conn.sock:receive).

- `conn` (*table*) : Connection.
- `size` (*integer*) : Bytes to read.
- **returns**: string|nil Data.
- **returns**: string|nil Error, e.g. 'timeout' or 'closed'.

#### `connector.send(conn, data, i, j)`

Sends data (conn.sock:send).

- `conn` (*table*) : Connection.
- `data` (*string*) : Data.
- `i` (*integer|nil*) : Substring start.
- `j` (*integer|nil*) : Substring end.
- **returns**: integer|nil Index of the last byte sent.
- **returns**: string|nil Error.

#### `connector.settimeout(conn, timeout)`

Stores conn.timeout and sets the socket's total timeout (mode 't').

- `conn` (*table*) : Connection.
- `timeout` (*number|nil*) : Seconds.

#### `connector.shutdown(conn)`

Closes the connection with conn.sock:shutdown().

- `conn` (*table*) : Connection.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/libs/luamqtt/mqtt/luasocket.lua`.*
