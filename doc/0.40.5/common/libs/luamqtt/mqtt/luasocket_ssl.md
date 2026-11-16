# `connector`

*File: `lua/common/libs/luamqtt/mqtt/luasocket_ssl.lua` · VM: Common (GE + vehicle) · 57 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** global `connector`

luamqtt network connector for TLS connections: opens a TCP socket through the luasocket connector, then wraps it with ssl.wrap (luasec module or compatible, named conn.ssl_module, 'ssl' by default) and performs the handshake. send, receive and settimeout are those of luasocket.

## Notes

- Requires the 'ssl' module (luasec), probably absent from the game: require('ssl') would fail.
- connect requires conn.secure_params (table), filled in by the client from the secure argument.

## Functions

| Function | Description | Line |
|---|---|---|
| `connector.connect(conn)` | TCP + TLS connection. Replaces conn.sock with the secure socket. | 13 |
| `connector.receive(conn, size)` | Same as luasocket.receive. (dynamically assigned) | dyn |
| `connector.send(conn, data, i, j)` | Same as luasocket.send. (dynamically assigned) | dyn |
| `connector.settimeout(conn, timeout)` | Same as luasocket.settimeout. (dynamically assigned) | dyn |
| `connector.shutdown(conn)` | Closes the connection with conn.sock:close(). | 44 |

### Parameter details

#### `connector.connect(conn)`

TCP + TLS connection. Replaces conn.sock with the secure socket.

- `conn` (*table*) : host, port, secure_params, ssl_module.
- **returns**: boolean Success.
- **returns**: string|nil Error.

#### `connector.receive(conn, size)`

Same as luasocket.receive. (dynamically assigned)

- `conn` (*table*) : Connection.
- `size` (*integer*) : Bytes.

#### `connector.send(conn, data, i, j)`

Same as luasocket.send. (dynamically assigned)

- `conn` (*table*) : Connection.
- `data` (*string*) : Data.
- `i` (*integer|nil*) : Start.
- `j` (*integer|nil*) : End.

#### `connector.settimeout(conn, timeout)`

Same as luasocket.settimeout. (dynamically assigned)

- `conn` (*table*) : Connection.
- `timeout` (*number|nil*) : Seconds.

#### `connector.shutdown(conn)`

Closes the connection with conn.sock:close().

- `conn` (*table*) : Connection.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/libs/luamqtt/mqtt/luasocket_ssl.lua`.*
