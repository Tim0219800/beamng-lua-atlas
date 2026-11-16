---@meta
-- tim19Atlas stub generated from lua/common/libs/luasocket/socket/ftp.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- LuaSocket FTP client (Diego Nehab), built on socket.tp and LTN12. Offers a high-level API (get, put, command) accepting an ftp:// URL or a parameters table, and a low-level API (open then greet, login, pasv, send, receive...). The module also registers itself in socket.ftp.
--- Access: `require("libs/luasocket/socket/ftp")`
---@class libs_luasocket_socket_ftp
---@field PASSWORD string Default anonymous password: 'anonymous@anonymous.org' (to be replaced by an e-mail address).
---@field PORT integer Default FTP port: 21.
---@field TIMEOUT number Timeout in seconds before giving up on a connection: 60.
---@field USER string Default anonymous user: 'ftp'.
---@field command function ftp.command(cmdt): sends an FTP command (fields host, command, argument, check, user, password...) and closes the connection. Returns 1 or nil, error.
---@field get function ftp.get(url|table): downloads a file. With a URL, returns the content (string); with a table, uses the provided sink.
---@field put function ftp.put(url, body) or ftp.put(table): uploads a file; returns the number of bytes sent.
local libs_luasocket_socket_ftp = {}

--- Opens a control connection to an FTP server and returns a low-level object with the methods greet, login, pasv, port, send, receive, cwd, type, quit, close. Raises an error (socket.try) on failure.
---Source: lua/common/libs/luasocket/socket/ftp.lua:37
---@param server string Host.
---@param port integer|nil Port (default 21).
---@param create function|nil Alternative socket factory (default socket.tcp).
---@return table  FTP connection object.
function libs_luasocket_socket_ftp.open(server, port, create) end

--- Object returned by open (fields tp = control channel, data, server, pasvt, try).
---@class libs_luasocket_socket_ftp_connection
local libs_luasocket_socket_ftp_connection = {}

--- Closes the data, server and control connections.
---Source: lua/common/libs/luasocket/socket/ftp.lua:dyn
function libs_luasocket_socket_ftp_connection:close() end

--- Changes the remote directory.
---Source: lua/common/libs/luasocket/socket/ftp.lua:dyn
---@param dir string Directory.
function libs_luasocket_socket_ftp_connection:cwd(dir) end

--- Reads the server's welcome message.
---Source: lua/common/libs/luasocket/socket/ftp.lua:dyn
function libs_luasocket_socket_ftp_connection:greet() end

--- Authenticates with USER/PASS (anonymous values by default).
---Source: lua/common/libs/luasocket/socket/ftp.lua:dyn
---@param user string|nil User.
---@param password string|nil Password.
function libs_luasocket_socket_ftp_connection:login(user, password) end

--- Switches to passive mode and stores the data IP and port; returns ip, port.
---Source: lua/common/libs/luasocket/socket/ftp.lua:dyn
function libs_luasocket_socket_ftp_connection:pasv() end

--- Opens the data connection in passive mode.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/libs/luasocket/socket/ftp.lua:dyn
function libs_luasocket_socket_ftp_connection:pasvconnect() end

--- Switches to active mode: announces a local port to the server (opens a server socket if ip is nil). Uses math.mod (see notes).
---Source: lua/common/libs/luasocket/socket/ftp.lua:dyn
---@param ip string|nil IP to announce.
---@param port integer|nil Port.
function libs_luasocket_socket_ftp_connection:port(ip, port) end

--- Accepts the data connection in active mode.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/libs/luasocket/socket/ftp.lua:dyn
function libs_luasocket_socket_ftp_connection:portconnect() end

--- Sends QUIT.
---Source: lua/common/libs/luasocket/socket/ftp.lua:dyn
function libs_luasocket_socket_ftp_connection:quit() end

--- Receives data (RETR command by default) into the provided sink; requires pasv or port beforehand.
---Source: lua/common/libs/luasocket/socket/ftp.lua:dyn
---@param recvt table sink, path or argument, command, step.
---@return integer  1.
function libs_luasocket_socket_ftp_connection:receive(recvt) end

--- Sends data (STOR command by default); requires pasv or port beforehand. Returns the number of bytes sent.
---Source: lua/common/libs/luasocket/socket/ftp.lua:dyn
---@param sendt table source, path or argument, command, step.
---@return integer  Bytes sent.
function libs_luasocket_socket_ftp_connection:send(sendt) end

--- Selects the transfer mode ('a' text, 'i' binary).
---Source: lua/common/libs/luasocket/socket/ftp.lua:dyn
---@param type string 'a' or 'i'.
function libs_luasocket_socket_ftp_connection:type(type) end

return libs_luasocket_socket_ftp
