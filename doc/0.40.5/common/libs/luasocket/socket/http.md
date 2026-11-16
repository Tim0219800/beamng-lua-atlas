# `libs_luasocket_socket_http`

*File: `lua/common/libs/luasocket/socket/http.lua` · VM: Common (GE + vehicle) · 354 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("libs/luasocket/socket/http")`

LuaSocket HTTP/1.1 client (Diego Nehab): GET/POST requests, streamed bodies via LTN12, chunked transfer, redirects (up to 5), Basic authentication, proxy. High-level API with http.request (simple URL or parameters table) and low-level API with http.open. The module also registers itself in socket.http. Blocking calls: a modder must launch them with care (TIMEOUT delay of 60 s).

## Example

```lua
local http = require('libs/luasocket/socket/http')
local corps, code, entetes, statut = http.request('http://example.com/')

local t = {}
local ok, code = http.request{url = 'http://example.com/api', method = 'POST', source = ltn12.source.string('a=1'),
  headers = {['content-length'] = 3, ['content-type'] = 'application/x-www-form-urlencoded'}, sink = ltn12.sink.table(t)}
```

## Notes

- request is wrapped by socket.protect: on error it returns nil, message instead of raising.
- String form: request(url [, body]) returns body (string), code, headers, status; with a body, it is an x-www-form-urlencoded POST. Table form: request{...} returns 1, code, headers, status (the body goes to reqt.sink).
- Request table fields: url, host, port, path, params, query, fragment, scheme, user, password, method, headers, source, sink, step, proxy, redirect (false to disable), create, uri. If the body is sent without a content-length header, it is sent with chunked transfer.
- Redirects (301, 302, 303, 307) are followed only for GET/HEAD, if no body was sent and up to 5 times; the location header is returned to indicate a redirect.
- No HTTPS: this module only handles plain HTTP (TCP socket).
- http.PROXY (module global, not defined by default) forces the use of a proxy.
- Minor bug in the original code: in receiveheaders, the unfolding loop does 'line = sock:receive()' without updating err, then tests err.
- The file requires 'socket.socket', 'socket.url', 'ltn12', 'mime' and 'socket.headers' by short name; these names must be resolvable by the game's search path.

## Functions

| Function | Description | Line |
|---|---|---|
| `libs_luasocket_socket_http.open(host, port, create)` | Low-level API: creates the socket (socket.tcp or create), sets the timeout and connects. Returns an object with the methods sendrequestline, sendheaders, sendbody, receivestatusline, receiveheaders, receivebody, receive09body and close. Raises an error on failure (socket.try). | 109 |

### Parameter details

#### `libs_luasocket_socket_http.open(host, port, create)`

Low-level API: creates the socket (socket.tcp or create), sets the timeout and connects. Returns an object with the methods sendrequestline, sendheaders, sendbody, receivestatusline, receiveheaders, receivebody, receive09body and close. Raises an error on failure (socket.try).

- `host` (*string*) : Host.
- `port` (*integer|nil*) : Port (default 80).
- `create` (*function|nil*) : Alternative socket factory.
- **returns**: table HTTP connection object.

## Fields

| Field | Type | Description |
|---|---|---|
| `PORT` | integer | Default HTTP port: 80. |
| `TIMEOUT` | number | Connection timeout in seconds: 60. |
| `USERAGENT` | string | Value of the user-agent header: socket._VERSION. |
| `request` | function | http.request(url [, body]) or http.request(table). See notes. Protected by socket.protect. |

## Class `connection`

Object returned by open (fields c = socket, try = error-checking function that closes the connection).

| Method | Description | Line |
|---|---|---|
| `connection:close()` | Closes the socket. | dyn |
| `connection:receive09body(status, sink, step)` | Reads an HTTP/0.9 response body. | dyn |
| `connection:receivebody(headers, sink, step)` | Reads the body (chunked, by length or until close) into an LTN12 sink. | dyn |
| `connection:receiveheaders()` | Reads the response headers (lowercase names). | dyn |
| `connection:receivestatusline()` | Reads the status line; returns the code, or nil and the first 5 bytes if the response is of the HTTP/0.9 type. | dyn |
| `connection:sendbody(headers, source, step)` | Sends the body from an LTN12 source (chunked unless content-length is known). | dyn |
| `connection:sendheaders(tosend)` | Sends the headers (names in canonical form) followed by the empty line. | dyn |
| `connection:sendrequestline(method, uri)` | Sends the request line 'METHOD uri HTTP/1.1'. | dyn |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/libs/luasocket/socket/http.lua`.*
