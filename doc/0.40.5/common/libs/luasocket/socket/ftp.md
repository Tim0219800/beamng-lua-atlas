# `libs_luasocket_socket_ftp`

*File: `lua/common/libs/luasocket/socket/ftp.lua` · VM: Common (GE + vehicle) · 285 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("libs/luasocket/socket/ftp")`

LuaSocket FTP client (Diego Nehab), built on socket.tp and LTN12. Offers a high-level API (get, put, command) accepting an ftp:// URL or a parameters table, and a low-level API (open then greet, login, pasv, send, receive...). The module also registers itself in socket.ftp.

## Example

```lua
local ftp = require('libs/luasocket/socket/ftp')
local contenu, err = ftp.get('ftp://anonymous:mdp@serveur/chemin/fichier.txt;type=i')
ftp.put('ftp://user:mdp@serveur/dest.txt', 'données')
```

## Notes

- The high-level functions are wrapped by socket.protect: on error they return nil, message instead of raising an exception.
- Bug: metat.__index:port uses math.mod, absent from LuaJIT/standard Lua 5.1 (replaced by math.fmod): the active mode (PORT) will fail; the passive mode (pasv, used by get/put) is not affected.
- Bug: in send, readyt[tp] indexes with the tp module instead of the control socket (so the status check during the transfer is never true).
- The file requires 'socket.socket', 'socket.url', 'socket.tp' and 'ltn12' by short name: these names must be resolvable by the game's module search path.
- In a request table, the recognized fields: host, port, user, password, type ('a' or 'i'), path, command, argument, source, sink, step, url, create. An explicit field overrides the one from the URL.

## Functions

| Function | Description | Line |
|---|---|---|
| `libs_luasocket_socket_ftp.open(server, port, create)` | Opens a control connection to an FTP server and returns a low-level object with the methods greet, login, pasv, port, send, receive, cwd, type, quit, close. Raises an error (socket.try) on failure. | 37 |

### Parameter details

#### `libs_luasocket_socket_ftp.open(server, port, create)`

Opens a control connection to an FTP server and returns a low-level object with the methods greet, login, pasv, port, send, receive, cwd, type, quit, close. Raises an error (socket.try) on failure.

- `server` (*string*) : Host.
- `port` (*integer|nil*) : Port (default 21).
- `create` (*function|nil*) : Alternative socket factory (default socket.tcp).
- **returns**: table FTP connection object.

## Fields

| Field | Type | Description |
|---|---|---|
| `PASSWORD` | string | Default anonymous password: 'anonymous@anonymous.org' (to be replaced by an e-mail address). |
| `PORT` | integer | Default FTP port: 21. |
| `TIMEOUT` | number | Timeout in seconds before giving up on a connection: 60. |
| `USER` | string | Default anonymous user: 'ftp'. |
| `command` | function | ftp.command(cmdt): sends an FTP command (fields host, command, argument, check, user, password...) and closes the connection. Returns 1 or nil, error. |
| `get` | function | ftp.get(url\|table): downloads a file. With a URL, returns the content (string); with a table, uses the provided sink. |
| `put` | function | ftp.put(url, body) or ftp.put(table): uploads a file; returns the number of bytes sent. |

## Class `connection`

Object returned by open (fields tp = control channel, data, server, pasvt, try).

| Method | Description | Line |
|---|---|---|
| `connection:close()` | Closes the data, server and control connections. | dyn |
| `connection:cwd(dir)` | Changes the remote directory. | dyn |
| `connection:greet()` | Reads the server's welcome message. | dyn |
| `connection:login(user, password)` | Authenticates with USER/PASS (anonymous values by default). | dyn |
| `connection:pasv()` | Switches to passive mode and stores the data IP and port; returns ip, port. | dyn |
| `connection:pasvconnect()` | Opens the data connection in passive mode. | dyn |
| `connection:port(ip, port)` | Switches to active mode: announces a local port to the server (opens a server socket if ip is nil). Uses math.mod (see notes). | dyn |
| `connection:portconnect()` | Accepts the data connection in active mode. | dyn |
| `connection:quit()` | Sends QUIT. | dyn |
| `connection:receive(recvt)` | Receives data (RETR command by default) into the provided sink; requires pasv or port beforehand. | dyn |
| `connection:send(sendt)` | Sends data (STOR command by default); requires pasv or port beforehand. Returns the number of bytes sent. | dyn |
| `connection:type(type)` | Selects the transfer mode ('a' text, 'i' binary). | dyn |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/libs/luasocket/socket/ftp.lua`.*
