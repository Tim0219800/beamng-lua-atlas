# `util_nodeStream`

*File: `lua/ge/extensions/util/nodeStream.lua` · VM: Game Engine (GE) · 281 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `util_nodeStream`: `extensions.load("util_nodeStream")`, then the global `util_nodeStream`

Local WebSocket server (127.0.0.1:8088, name "nodestream") that broadcasts the player vehicle's structure live to an external client (3D viewer, debugging tool). The client can request: the initial node positions, the flexbody mapping data, starting/stopping the stream of current positions (every 0.1 s), or loading an extension. Other JSON messages are relayed to extensions via the onWebSocketHandlerMessage hook.

## Example

```lua
extensions.load('util_nodeStream')
-- WebSocket client: {"type":"startNodeStream"}
```

## Notes

- Protocol: text messages; "ping" receives "pong"; otherwise JSON with a type field: loadExtension (extensionName), startNodeStream, stopNodeStream, getInitialNodePositions, getFlexbodyMappingData. Responses have type info, error, vehicleNodes, initialNodePositions or flexbodyMappingData.
- Coordinates sent are converted to {x, z, -y} (vertical Y axis on the client side). Current positions (vehicleNodes) are those from getNodePosition, relative to the reference node; initial positions are offset by those of the reference node.
- Security: any locally connected client can make the game load an arbitrary extension (loadExtension).
- In getInitialNodePositions, if getRefNodeId() returns nil, refNodePos stays nil and indexing refNodePos.x would cause an error.
- In broadcastVehicleNodes, refNodePos is computed but never used; the initialNodes field of the message stays an empty table.

## Functions

| Function | Description | Line |
|---|---|---|
| `util_nodeStream.onExtensionLoaded()` | Called on load: creates (or retrieves) the WebSocket server via wsUtils.createOrGetWS on 127.0.0.1:8088. *(internal)* *(hook)* | 214 |
| `util_nodeStream.onExtensionUnloaded()` | Called on unload: destroys the WebSocket server (BNGWebWSServer.destroy). *(internal)* *(hook)* | 225 |
| `util_nodeStream.onUpdate(dt)` | Hook called every frame: broadcasts node positions if the stream is active (0.1 s interval), handles client events (connection C, disconnection DC, data D), then updates the server. *(internal)* *(hook)* | 234 |

### Parameter details

#### `util_nodeStream.onUpdate(dt)`

Hook called every frame: broadcasts node positions if the stream is active (0.1 s interval), handles client events (connection C, disconnection DC, data D), then updates the server.

- `dt` (*number*) : Time delta in seconds

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onWebSocketHandlerMessage`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/util/nodeStream.lua`.*
