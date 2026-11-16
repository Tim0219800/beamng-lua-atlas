# `tcpServer`

*File: `lua/common/tcpServer.lua` · VM: Common (GE + vehicle) · 273 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("tcpServer")`

Non-blocking TCP server used by external tools (editing toolchain, scripts). Uses ASIO via createNetworkServer if available, otherwise LuaSocket. Messages are JSON payloads preceded by a fixed 8-byte header. A modder uses it to talk to an external program: you create a server then call receiveData() every frame.

## Example

```lua
local TCPServer = require('tcpServer')
local server = TCPServer:new('localhost', 12345)
-- on every update:
local received = server:receiveData()
for _, entry in ipairs(received) do
  local connection, message = unpack(entry)
  if message == 'disconnect' then ... else server:send(connection, {cmd = 'pong'}, message) end
end
server:destroy()
```

## Notes

- Protocol: 4 bytes 'BN01' (identifier), 4 bytes little-endian uint32 = length of the JSON payload, null terminator included, then the JSON followed by '\0'.
- receiveData() returns a list of {connection, message} entries; message is the decoded JSON table, or the string 'disconnect' (possibly with a 3rd element = error) when a LuaSocket connection closes.
- send(connection, sendData, recData) temporarily copies recData.context into sendData.context (request/response correlation), encodes with jsonEncode then sends the header and the JSON.
- Call TCPServer:new(...) with a colon. If the LuaSocket bind fails, new returns false (not an object).
- BUG: in _onDataRaw, when JSON decoding fails, the code calls self:sendData(...) which does not exist (the method is called send): a Lua error will be raised instead of sending the error response.
- BUG/PITFALL: new() stores serverLuasocket/serverASIO and headerBuffer on the CLASS (self = TCPServer) and not on newObj; several servers therefore share these fields. If the 'BN01' identifier is invalid, _onDataRaw returns without emptying the buffer: the connection stays stuck on these bytes.
- The ASIO version has no disconnection detection ('disconnect'): it only relays the received data. Listening port: listenHost is only used by LuaSocket; with ASIO only the port is passed.

## Functions

| Function | Description | Line |
|---|---|---|
| `tcpServer._onDataRaw(self, connection, dataRaw, res)` | Internal: accumulates the bytes received from a connection in a buffer, extracts complete messages (valid header, length, null terminator), decodes the JSON (jsonDecode) and adds {connection, data} to res. *(internal)* | 141 |
| `tcpServer.destroy(self)` | Closes all connections and the server socket (LuaSocket) or destroys the ASIO server (destroyNetworkServer), and empties the buffers. | 251 |
| `tcpServer.new(self, listenHost, port)` | Creates a TCP server listening on the given port (call `TCPServer:new(host, port)`). Picks ASIO if createNetworkServer exists, otherwise non-blocking LuaSocket. Returns false if LuaSocket cannot bind. | 88 |
| `tcpServer.receiveData(self)` | To be called regularly. Accepts new connections, reads the available data, extracts complete messages. Returns a list of {connection, message} entries. | 186 |
| `tcpServer.send(self, connection, sendData, recData)` | Sends a JSON message (BN01 header + size + JSON + '\0') on a connection. If recData.context exists, it is copied into sendData.context for the response (then removed from sendData). | 123 |

### Parameter details

#### `tcpServer._onDataRaw(self, connection, dataRaw, res)`

Internal: accumulates the bytes received from a connection in a buffer, extracts complete messages (valid header, length, null terminator), decodes the JSON (jsonDecode) and adds {connection, data} to res.

- `self` (*any*) : 
- `connection` (*table*) : connection
- `dataRaw` (*string*) : bytes received
- `res` (*table*) : list of results to complete

#### `tcpServer.new(self, listenHost, port)`

Creates a TCP server listening on the given port (call `TCPServer:new(host, port)`). Picks ASIO if createNetworkServer exists, otherwise non-blocking LuaSocket. Returns false if LuaSocket cannot bind.

- `self` (*any*) : 
- `listenHost` (*string*) : listening address (LuaSocket), e.g. 'localhost'
- `port` (*integer*) : TCP port
- **returns**: table|boolean server object, or false on failure

#### `tcpServer.receiveData(self)`

To be called regularly. Accepts new connections, reads the available data, extracts complete messages. Returns a list of {connection, message} entries.

- `self` (*any*) : 
- **returns**: table[] list of {connection, message | 'disconnect'[, error]}

#### `tcpServer.send(self, connection, sendData, recData)`

Sends a JSON message (BN01 header + size + JSON + '\0') on a connection. If recData.context exists, it is copied into sendData.context for the response (then removed from sendData).

- `self` (*any*) : 
- `connection` (*table*) : connection (first element of a receiveData entry)
- `sendData` (*table*) : message to encode as JSON
- `recData` (*table|nil*) : received message being answered (to copy context)

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/tcpServer.lua`.*
