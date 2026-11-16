---@meta
-- tim19Atlas stub generated from lua/common/libs/luasocket/socket/smtp.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Third-party LuaSocket library (author Diego Nehab): SMTP client for sending e-mails. It attaches to the `socket` table as `socket.smtp`. It provides the high-level API `send` (connection, EHLO, LOGIN/PLAIN authentication, sending, QUIT) and the low-level API `open` (object with methods greet/mail/rcpt/data/quit/login/plain/auth/send/close), as well as `message` to build a MIME message source (simple or multipart). It is not used by gameplay: it is code bundled with LuaSocket.
--- Access: `require("libs/luasocket/socket/smtp")`
---@class libs_luasocket_socket_smtp
---@field DOMAIN string Domain used in the EHLO command; environment variable SERVER_NAME or "localhost".
---@field PORT number Default SMTP port (25).
---@field SERVER string Default SMTP server ("localhost").
---@field TIMEOUT number Connection timeout in seconds (60).
---@field ZONE string Default time zone of the Date header ("-0000" = unknown).
---@field send function High-level API: takes a table {server, port, domain, user, password, from, rcpt, source, step, create}, opens the connection, does greet, auth, send, quit then close. Returns 1 on success, otherwise nil and an error message.
local libs_luasocket_socket_smtp = {}

--- Builds a source (chunk iterator function, LTN12-compatible) for a message. mesgt = {headers, body}; body can be a string, a source function or a table (multipart, with preamble/epilogue). Adds the date, x-mailer and mime-version headers.
---Source: lua/common/libs/luasocket/socket/smtp.lua:233
---@param mesgt table Message description; its `headers` key is replaced by the normalized version (modified in place).
---@return function  Source: each call returns the next chunk, or nil then an error.
function libs_luasocket_socket_smtp.message(mesgt) end

--- Opens an SMTP connection and returns a low-level object (methods greet, mail, rcpt, data, quit, close, login, plain, auth, send). Raises an error (via socket.try) if the connection fails.
---Source: lua/common/libs/luasocket/socket/smtp.lua:116
---@param server string|nil Server host; default SERVER.
---@param port integer|nil Port; default PORT.
---@param create function|nil TCP socket factory; default socket.tcp.
---@return table  SMTP object whose methods raise an error on an unexpected server response.
function libs_luasocket_socket_smtp.open(server, port, create) end

return libs_luasocket_socket_smtp
