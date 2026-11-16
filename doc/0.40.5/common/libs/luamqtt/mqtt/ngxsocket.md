# `libs_luamqtt_mqtt_ngxsocket`

*File: `lua/common/libs/luamqtt/mqtt/ngxsocket.lua` · VM: Common (GE + vehicle) · 56 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("libs/luamqtt/mqtt/ngxsocket")`

luamqtt network connector for OpenResty/nginx (ngx.socket.tcp). Unusable in BeamNG: the file reads the global ngx at load time, which does not exist in the game. Same interface as the other connectors.

## Notes

- Loading the module raises an error outside OpenResty (ngx is nil: ngx.socket.tcp).
- settimeout converts seconds to milliseconds; without a timeout, it uses 0x7FFFFFFF.

## Functions

| Function | Description | Line |
|---|---|---|
| `libs_luamqtt_mqtt_ngxsocket.connect(conn)` | Opens an ngx socket, connects to conn.host:conn.port (very long timeout), performs sslhandshake if conn.secure, stores it in conn.sock. | 12 |
| `libs_luamqtt_mqtt_ngxsocket.receive(conn, size)` | Receives size bytes. | 41 |
| `libs_luamqtt_mqtt_ngxsocket.send(conn, data, i, j)` | Sends the data (substring i..j if i is given). | 32 |
| `libs_luamqtt_mqtt_ngxsocket.settimeout(conn, timeout)` | Sets the socket timeout. | 46 |
| `libs_luamqtt_mqtt_ngxsocket.shutdown(conn)` | Closes the socket. | 27 |

### Parameter details

#### `libs_luamqtt_mqtt_ngxsocket.connect(conn)`

Opens an ngx socket, connects to conn.host:conn.port (very long timeout), performs sslhandshake if conn.secure, stores it in conn.sock.

- `conn` (*table*) : host, port, secure.
- **returns**: boolean Success.
- **returns**: string|nil Error.

#### `libs_luamqtt_mqtt_ngxsocket.receive(conn, size)`

Receives size bytes.

- `conn` (*table*) : Connection.
- `size` (*integer*) : Bytes.

#### `libs_luamqtt_mqtt_ngxsocket.send(conn, data, i, j)`

Sends the data (substring i..j if i is given).

- `conn` (*table*) : Connection.
- `data` (*string*) : Data.
- `i` (*integer|nil*) : Start.
- `j` (*integer|nil*) : End.

#### `libs_luamqtt_mqtt_ngxsocket.settimeout(conn, timeout)`

Sets the socket timeout.

- `conn` (*table*) : Connection.
- `timeout` (*number|nil*) : Seconds.

#### `libs_luamqtt_mqtt_ngxsocket.shutdown(conn)`

Closes the socket.

- `conn` (*table*) : Connection.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/libs/luamqtt/mqtt/ngxsocket.lua`.*
