---@meta
-- tim19Atlas stub generated from lua/common/libs/luasocket/socket/tp.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Third-party LuaSocket library (Diego Nehab): common subsystem of the SMTP/FTP text protocols ("Telnet-like Protocol"). `connect` opens a TCP connection and returns an object whose methods read the server's three-digit numeric-code responses (multiline responses included) and send commands. Used by socket.smtp.
--- Access: `require("libs/luasocket/socket/tp")`
---@class libs_luasocket_socket_tp
---@field TIMEOUT number Default timeout of network operations in seconds (60).
local libs_luasocket_socket_tp = {}

--- Creates a socket (create or socket.tcp), sets the timeout, connects and returns the control object. On failure, closes the socket and returns nil and the error.
---Source: lua/common/libs/luasocket/socket/tp.lua:114
---@param host string Server host.
---@param port integer Server port.
---@param timeout number|nil Timeout in seconds; default TIMEOUT.
---@param create function|nil Socket factory; default socket.tcp.
---@return table|nil  Protocol control object, or nil.
---@return string|nil  Error message.
function libs_luasocket_socket_tp.connect(host, port, timeout, create) end

return libs_luasocket_socket_tp
