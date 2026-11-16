---@meta
-- tim19Atlas stub generated from lua/common/libs/luasocket/socket/http.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- LuaSocket HTTP/1.1 client (Diego Nehab): GET/POST requests, streamed bodies via LTN12, chunked transfer, redirects (up to 5), Basic authentication, proxy. High-level API with http.request (simple URL or parameters table) and low-level API with http.open. The module also registers itself in socket.http. Blocking calls: a modder must launch them with care (TIMEOUT delay of 60 s).
--- Access: `require("libs/luasocket/socket/http")`
---@class libs_luasocket_socket_http
---@field PORT integer Default HTTP port: 80.
---@field TIMEOUT number Connection timeout in seconds: 60.
---@field USERAGENT string Value of the user-agent header: socket._VERSION.
---@field request function http.request(url [, body]) or http.request(table). See notes. Protected by socket.protect.
local libs_luasocket_socket_http = {}

--- Low-level API: creates the socket (socket.tcp or create), sets the timeout and connects. Returns an object with the methods sendrequestline, sendheaders, sendbody, receivestatusline, receiveheaders, receivebody, receive09body and close. Raises an error on failure (socket.try).
---Source: lua/common/libs/luasocket/socket/http.lua:109
---@param host string Host.
---@param port integer|nil Port (default 80).
---@param create function|nil Alternative socket factory.
---@return table  HTTP connection object.
function libs_luasocket_socket_http.open(host, port, create) end

--- Object returned by open (fields c = socket, try = error-checking function that closes the connection).
---@class libs_luasocket_socket_http_connection
local libs_luasocket_socket_http_connection = {}

--- Closes the socket.
---Source: lua/common/libs/luasocket/socket/http.lua:dyn
function libs_luasocket_socket_http_connection:close() end

--- Reads an HTTP/0.9 response body.
---Source: lua/common/libs/luasocket/socket/http.lua:dyn
---@param status string Bytes already read.
---@param sink function Sink.
---@param step function|nil Step function.
function libs_luasocket_socket_http_connection:receive09body(status, sink, step) end

--- Reads the body (chunked, by length or until close) into an LTN12 sink.
---Source: lua/common/libs/luasocket/socket/http.lua:dyn
---@param headers table Headers received.
---@param sink function|nil Sink (default: null sink).
---@param step function|nil Step function.
function libs_luasocket_socket_http_connection:receivebody(headers, sink, step) end

--- Reads the response headers (lowercase names).
---Source: lua/common/libs/luasocket/socket/http.lua:dyn
---@return table<string, string>  Headers.
function libs_luasocket_socket_http_connection:receiveheaders() end

--- Reads the status line; returns the code, or nil and the first 5 bytes if the response is of the HTTP/0.9 type.
---Source: lua/common/libs/luasocket/socket/http.lua:dyn
---@return integer|nil  HTTP code.
---@return string  Status line.
function libs_luasocket_socket_http_connection:receivestatusline() end

--- Sends the body from an LTN12 source (chunked unless content-length is known).
---Source: lua/common/libs/luasocket/socket/http.lua:dyn
---@param headers table Headers.
---@param source function|nil Source.
---@param step function|nil Step function.
function libs_luasocket_socket_http_connection:sendbody(headers, source, step) end

--- Sends the headers (names in canonical form) followed by the empty line.
---Source: lua/common/libs/luasocket/socket/http.lua:dyn
---@param tosend table<string, string> Headers.
function libs_luasocket_socket_http_connection:sendheaders(tosend) end

--- Sends the request line 'METHOD uri HTTP/1.1'.
---Source: lua/common/libs/luasocket/socket/http.lua:dyn
---@param method string|nil Method (default GET).
---@param uri string URI.
function libs_luasocket_socket_http_connection:sendrequestline(method, uri) end

return libs_luasocket_socket_http
