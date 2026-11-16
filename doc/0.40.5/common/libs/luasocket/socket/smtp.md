# `libs_luasocket_socket_smtp`

*File: `lua/common/libs/luasocket/socket/smtp.lua` · VM: Common (GE + vehicle) · 256 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("libs/luasocket/socket/smtp")`

Third-party LuaSocket library (author Diego Nehab): SMTP client for sending e-mails. It attaches to the `socket` table as `socket.smtp`. It provides the high-level API `send` (connection, EHLO, LOGIN/PLAIN authentication, sending, QUIT) and the low-level API `open` (object with methods greet/mail/rcpt/data/quit/login/plain/auth/send/close), as well as `message` to build a MIME message source (simple or multipart). It is not used by gameplay: it is code bundled with LuaSocket.

## Example

```lua
local smtp = require('socket.smtp')
local ok, err = smtp.send{ from = '<a@b.c>', rcpt = {'<d@e.f>'}, source = smtp.message{ headers = {subject = 'Hello'}, body = 'texte' }, server = 'localhost', port = 25 }
```

## Notes

- The file does `require('socket.socket')`, `require('socket.tp')`, `require('ltn12')`, `require('socket.headers')` and `require('mime')`: these modules must be resolvable (the atlas path `libs/luasocket/socket/smtp` is that of the file, not the internal require name).
- TIMEOUT = 60 s, SERVER = 'localhost', PORT = 25, ZONE = '-0000' by default; DOMAIN equals the environment variable SERVER_NAME or 'localhost'.
- `send` is wrapped by `socket.protect`: errors are returned as `nil, message` instead of being raised.
- Message bodies without a content-type get 'text/plain; charset="iso-8859-1"'. The mime-version header is always forced to '1.0'.

## Functions

| Function | Description | Line |
|---|---|---|
| `libs_luasocket_socket_smtp.message(mesgt)` | Builds a source (chunk iterator function, LTN12-compatible) for a message. mesgt = {headers, body}; body can be a string, a source function or a table (multipart, with preamble/epilogue). Adds the date, x-mailer and mime-version headers. | 233 |
| `libs_luasocket_socket_smtp.open(server, port, create)` | Opens an SMTP connection and returns a low-level object (methods greet, mail, rcpt, data, quit, close, login, plain, auth, send). Raises an error (via socket.try) if the connection fails. | 116 |

### Parameter details

#### `libs_luasocket_socket_smtp.message(mesgt)`

Builds a source (chunk iterator function, LTN12-compatible) for a message. mesgt = {headers, body}; body can be a string, a source function or a table (multipart, with preamble/epilogue). Adds the date, x-mailer and mime-version headers.

- `mesgt` (*table*) : Message description; its `headers` key is replaced by the normalized version (modified in place).
- **returns**: function Source: each call returns the next chunk, or nil then an error.

#### `libs_luasocket_socket_smtp.open(server, port, create)`

Opens an SMTP connection and returns a low-level object (methods greet, mail, rcpt, data, quit, close, login, plain, auth, send). Raises an error (via socket.try) if the connection fails.

- `server` (*string|nil*) : Server host; default SERVER.
- `port` (*integer|nil*) : Port; default PORT.
- `create` (*function|nil*) : TCP socket factory; default socket.tcp.
- **returns**: table SMTP object whose methods raise an error on an unexpected server response.

## Fields

| Field | Type | Description |
|---|---|---|
| `DOMAIN` | string | Domain used in the EHLO command; environment variable SERVER_NAME or "localhost". |
| `PORT` | number | Default SMTP port (25). |
| `SERVER` | string | Default SMTP server ("localhost"). |
| `TIMEOUT` | number | Connection timeout in seconds (60). |
| `ZONE` | string | Default time zone of the Date header ("-0000" = unknown). |
| `send` | function | High-level API: takes a table {server, port, domain, user, password, from, rcpt, source, step, create}, opens the connection, does greet, auth, send, quit then close. Returns 1 on success, otherwise nil and an error message. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/libs/luasocket/socket/smtp.lua`.*
