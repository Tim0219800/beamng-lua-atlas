# `libs_luamqtt_mqtt_luasocket_copas`

*File: `lua/common/libs/luamqtt/mqtt/luasocket-copas.lua` · VM: Common (GE + vehicle) · 49 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("libs/luamqtt/mqtt/luasocket-copas")`

luamqtt network connector for luasocket combined with copas (cooperative I/O in coroutines). Same interface as the luasocket connector (connect, shutdown, send, receive, settimeout) but send and receive go through copas.send/copas.receive. To be passed in the connector argument of the MQTT client.

## Notes

- Uses require('copas') by bare name and require('socket'): these modules are not necessarily resolved under that name in BeamNG (the game provides libs/copas/copas).
- settimeout puts the socket in non-blocking mode (settimeout(0)) and only stores the timeout in conn.timeout.

## Functions

| Function | Description | Line |
|---|---|---|
| `libs_luamqtt_mqtt_luasocket_copas.connect(conn)` | Opens the TCP connection via socket.connect and stores it in conn.sock. | 13 |
| `libs_luamqtt_mqtt_luasocket_copas.receive(conn, size)` | Receives size bytes via copas.receive. | 34 |
| `libs_luamqtt_mqtt_luasocket_copas.send(conn, data, i, j)` | Sends via copas.send. | 28 |
| `libs_luamqtt_mqtt_luasocket_copas.settimeout(conn, timeout)` | Stores the timeout in conn.timeout and sets the socket to non-blocking. | 40 |
| `libs_luamqtt_mqtt_luasocket_copas.shutdown(conn)` | Calls conn.sock:shutdown(). | 23 |

### Parameter details

#### `libs_luamqtt_mqtt_luasocket_copas.connect(conn)`

Opens the TCP connection via socket.connect and stores it in conn.sock.

- `conn` (*table*) : host, port.
- **returns**: boolean Success.
- **returns**: string|nil Error.

#### `libs_luamqtt_mqtt_luasocket_copas.receive(conn, size)`

Receives size bytes via copas.receive.

- `conn` (*table*) : Connection.
- `size` (*integer*) : Bytes.

#### `libs_luamqtt_mqtt_luasocket_copas.send(conn, data, i, j)`

Sends via copas.send.

- `conn` (*table*) : Connection.
- `data` (*string*) : Data.
- `i` (*integer|nil*) : Start.
- `j` (*integer|nil*) : End.

#### `libs_luamqtt_mqtt_luasocket_copas.settimeout(conn, timeout)`

Stores the timeout in conn.timeout and sets the socket to non-blocking.

- `conn` (*table*) : Connection.
- `timeout` (*number*) : Seconds.

#### `libs_luamqtt_mqtt_luasocket_copas.shutdown(conn)`

Calls conn.sock:shutdown().

- `conn` (*table*) : Connection.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/libs/luamqtt/mqtt/luasocket-copas.lua`.*
