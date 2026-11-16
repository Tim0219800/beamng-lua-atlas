---@meta
-- tim19Atlas stub generated from lua/common/libs/luasocket/socket/socket.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Third-party LuaSocket library (Diego Nehab): helper module on top of the native `socket` core. It adds connect4/connect6 (connection forced to IPv4/IPv6), bind (TCP server with address family choice), choose (variant selector) and the LTN12 sources/sinks on socket (sink: close-when-done, keep-open; source: by-length, until-closed). It modifies and returns the `socket` table itself.
--- Access: `require("libs/luasocket/socket/socket")`
---@class libs_luasocket_socket_socket
---@field BLOCKSIZE integer Size of the blocks read by socket sources (2048).
---@field sink function socket.sink(name, sock): picks a sink from sinkt (name omitted = "default").
---@field sinkt table<string, function> LTN12 sink factories: "close-when-done", "keep-open", "default" (= keep-open).
---@field source function socket.source(name, sock, length?): picks a source from sourcet (name omitted = "default").
---@field sourcet table<string, function> LTN12 source factories: "by-length", "until-closed", "default" (= until-closed).
---@field try function Result of socket.newtry(): raises an error if its first argument is nil/false, otherwise returns the arguments.
local libs_luasocket_socket_socket = {}

--- Creates a server TCP socket: resolves `host`, binds the port, then listens.
---Source: lua/common/libs/luasocket/socket/socket.lua:27
---@param host string Host or "*" for all IPv4 interfaces.
---@param port integer Listening port.
---@param backlog integer|nil Length of the listen queue.
---@return table|nil  Listening server socket, or nil followed by an error.
function libs_luasocket_socket_socket.bind(host, port, backlog) end

--- Returns a function _anon(name, opt1, opt2) that calls table[name](opt1, opt2). If the first argument is not a string, the name "default" is used. Raises an "unknown key" error if the name is unknown.
---Source: lua/common/libs/luasocket/socket/socket.lua:59
---@param table table<string, function> Variant table.
---@return function  Selector.
function libs_luasocket_socket_socket.choose(table) end

--- Connects to an address forcing the IPv4 family (calls socket.connect with "inet").
---Source: lua/common/libs/luasocket/socket/socket.lua:19
---@param address string Remote address or host name.
---@param port integer Remote port.
---@param laddress string|nil Local address to bind.
---@param lport integer|nil Local port to bind.
---@return table|nil  Connected socket, or nil followed by an error message.
function libs_luasocket_socket_socket.connect4(address, port, laddress, lport) end

--- Like connect4 but with IPv6 ("inet6").
---Source: lua/common/libs/luasocket/socket/socket.lua:23
---@param address string Remote address or host name.
---@param port integer Remote port.
---@param laddress string|nil Local address to bind.
---@param lport integer|nil Local port to bind.
---@return table|nil  Connected socket, or nil followed by an error message.
function libs_luasocket_socket_socket.connect6(address, port, laddress, lport) end

return libs_luasocket_socket_socket
