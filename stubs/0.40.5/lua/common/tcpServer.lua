---@meta
-- tim19Atlas stub generated from lua/common/tcpServer.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Non-blocking TCP server used by external tools (editing toolchain, scripts). Uses ASIO via createNetworkServer if available, otherwise LuaSocket. Messages are JSON payloads preceded by a fixed 8-byte header. A modder uses it to talk to an external program: you create a server then call receiveData() every frame.
--- Access: `require("tcpServer")`
---@class tcpServer
local tcpServer = {}

--- Internal: accumulates the bytes received from a connection in a buffer, extracts complete messages (valid header, length, null terminator), decodes the JSON (jsonDecode) and adds {connection, data} to res.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/tcpServer.lua:141
---@param self any
---@param connection table connection
---@param dataRaw string bytes received
---@param res table list of results to complete
function tcpServer._onDataRaw(self, connection, dataRaw, res) end

--- Closes all connections and the server socket (LuaSocket) or destroys the ASIO server (destroyNetworkServer), and empties the buffers.
---Source: lua/common/tcpServer.lua:251
---@param self any
function tcpServer.destroy(self) end

--- Creates a TCP server listening on the given port (call `TCPServer:new(host, port)`). Picks ASIO if createNetworkServer exists, otherwise non-blocking LuaSocket. Returns false if LuaSocket cannot bind.
---Source: lua/common/tcpServer.lua:88
---@param self any
---@param listenHost string listening address (LuaSocket), e.g. 'localhost'
---@param port integer TCP port
---@return table|boolean  server object, or false on failure
function tcpServer.new(self, listenHost, port) end

--- To be called regularly. Accepts new connections, reads the available data, extracts complete messages. Returns a list of {connection, message} entries.
---Source: lua/common/tcpServer.lua:186
---@param self any
---@return table[]  list of {connection, message | 'disconnect'[, error]}
function tcpServer.receiveData(self) end

--- Sends a JSON message (BN01 header + size + JSON + '\0') on a connection. If recData.context exists, it is copied into sendData.context for the response (then removed from sendData).
---Source: lua/common/tcpServer.lua:123
---@param self any
---@param connection table connection (first element of a receiveData entry)
---@param sendData table message to encode as JSON
---@param recData table|nil received message being answered (to copy context)
function tcpServer.send(self, connection, sendData, recData) end

return tcpServer
