# `libs_luasocket_socket_socket`

*File: `lua/common/libs/luasocket/socket/socket.lua` · VM: Common (GE + vehicle) · 151 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("libs/luasocket/socket/socket")`

Third-party LuaSocket library (Diego Nehab): helper module on top of the native `socket` core. It adds connect4/connect6 (connection forced to IPv4/IPv6), bind (TCP server with address family choice), choose (variant selector) and the LTN12 sources/sinks on socket (sink: close-when-done, keep-open; source: by-length, until-closed). It modifies and returns the `socket` table itself.

## Notes

- The module returns `socket` (the native core) extended: `require('socket.socket')` and `require('socket')` give the same table.
- `bind` enables tcp-nodelay and reuseaddr, accepts host == '*' (becomes 0.0.0.0), tries each address returned by socket.dns.getaddrinfo and returns the first socket that succeeded at bind + listen.
- BLOCKSIZE is 2048 bytes (size of source reads).

## Functions

| Function | Description | Line |
|---|---|---|
| `libs_luasocket_socket_socket.bind(host, port, backlog)` | Creates a server TCP socket: resolves `host`, binds the port, then listens. | 27 |
| `libs_luasocket_socket_socket.choose(table)` | Returns a function (name, opt1, opt2) that calls table[name](opt1, opt2). If the first argument is not a string, the name "default" is used. Raises an "unknown key" error if the name is unknown. | 59 |
| `libs_luasocket_socket_socket.connect4(address, port, laddress, lport)` | Connects to an address forcing the IPv4 family (calls socket.connect with "inet"). | 19 |
| `libs_luasocket_socket_socket.connect6(address, port, laddress, lport)` | Like connect4 but with IPv6 ("inet6"). | 23 |

### Parameter details

#### `libs_luasocket_socket_socket.bind(host, port, backlog)`

Creates a server TCP socket: resolves `host`, binds the port, then listens.

- `host` (*string*) : Host or "*" for all IPv4 interfaces.
- `port` (*integer*) : Listening port.
- `backlog` (*integer|nil*) : Length of the listen queue.
- **returns**: table|nil Listening server socket, or nil followed by an error.

#### `libs_luasocket_socket_socket.choose(table)`

Returns a function (name, opt1, opt2) that calls table[name](opt1, opt2). If the first argument is not a string, the name "default" is used. Raises an "unknown key" error if the name is unknown.

- `table` (*table<string, function>*) : Variant table.
- **returns**: function Selector.

#### `libs_luasocket_socket_socket.connect4(address, port, laddress, lport)`

Connects to an address forcing the IPv4 family (calls socket.connect with "inet").

- `address` (*string*) : Remote address or host name.
- `port` (*integer*) : Remote port.
- `laddress` (*string|nil*) : Local address to bind.
- `lport` (*integer|nil*) : Local port to bind.
- **returns**: table|nil Connected socket, or nil followed by an error message.

#### `libs_luasocket_socket_socket.connect6(address, port, laddress, lport)`

Like connect4 but with IPv6 ("inet6").

- `address` (*string*) : Remote address or host name.
- `port` (*integer*) : Remote port.
- `laddress` (*string|nil*) : Local address to bind.
- `lport` (*integer|nil*) : Local port to bind.
- **returns**: table|nil Connected socket, or nil followed by an error message.

## Fields

| Field | Type | Description |
|---|---|---|
| `BLOCKSIZE` | integer | Size of the blocks read by socket sources (2048). |
| `sink` | function | socket.sink(name, sock): picks a sink from sinkt (name omitted = "default"). |
| `sinkt` | table<string, function> | LTN12 sink factories: "close-when-done", "keep-open", "default" (= keep-open). |
| `source` | function | socket.source(name, sock, length?): picks a source from sourcet (name omitted = "default"). |
| `sourcet` | table<string, function> | LTN12 source factories: "by-length", "until-closed", "default" (= until-closed). |
| `try` | function | Result of socket.newtry(): raises an error if its first argument is nil/false, otherwise returns the arguments. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/libs/luasocket/socket/socket.lua`.*
