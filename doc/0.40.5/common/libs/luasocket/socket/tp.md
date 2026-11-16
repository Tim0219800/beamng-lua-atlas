# `libs_luasocket_socket_tp`

*File: `lua/common/libs/luasocket/socket/tp.lua` · VM: Common (GE + vehicle) · 126 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("libs/luasocket/socket/tp")`

Third-party LuaSocket library (Diego Nehab): common subsystem of the SMTP/FTP text protocols ("Telnet-like Protocol"). `connect` opens a TCP connection and returns an object whose methods read the server's three-digit numeric-code responses (multiline responses included) and send commands. Used by socket.smtp.

## Notes

- The object returned by connect exposes: check(ok), command(cmd, arg), send(data), receive(pat), source(source, step), sink(snk, pat), getfd, dirty, getcontrol and close.
- `check(ok)` accepts a Lua pattern (e.g. "2.."), a list of patterns, or a function (code, response); returns the numeric code and the text, or nil and the response if the code does not match.
- Code bug: the `sink` method uses an undefined variable `c` (it should use self.c); it fails if called.
- Default TIMEOUT: 60 s.

## Functions

| Function | Description | Line |
|---|---|---|
| `libs_luasocket_socket_tp.connect(host, port, timeout, create)` | Creates a socket (create or socket.tcp), sets the timeout, connects and returns the control object. On failure, closes the socket and returns nil and the error. | 114 |

### Parameter details

#### `libs_luasocket_socket_tp.connect(host, port, timeout, create)`

Creates a socket (create or socket.tcp), sets the timeout, connects and returns the control object. On failure, closes the socket and returns nil and the error.

- `host` (*string*) : Server host.
- `port` (*integer*) : Server port.
- `timeout` (*number|nil*) : Timeout in seconds; default TIMEOUT.
- `create` (*function|nil*) : Socket factory; default socket.tcp.
- **returns**: table|nil Protocol control object, or nil.
- **returns**: string|nil Error message.

## Fields

| Field | Type | Description |
|---|---|---|
| `TIMEOUT` | number | Default timeout of network operations in seconds (60). |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/libs/luasocket/socket/tp.lua`.*
